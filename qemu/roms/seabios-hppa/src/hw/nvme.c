// Low level NVMe disk access
//
// Copyright 2017 Amazon.com, Inc. or its affiliates.
//
// This file may be distributed under the terms of the GNU LGPLv3 license.

#include "blockcmd.h"
#include "malloc.h" // malloc_high
#include "output.h" // dprintf
#include "pci.h"
#include "pci_ids.h" // PCI_CLASS_STORAGE_NVME
#include "pci_regs.h" // PCI_BASE_ADDRESS_0
#include "pcidevice.h" // foreachpci
#include "stacks.h" // yield
#include "std/disk.h" // DISK_RET_
#include "string.h" // memset
#include "util.h" // boot_add_hd
#include "x86.h" // readl

#include "nvme.h"
#include "nvme-int.h"

static void *
zalloc_page_aligned(struct zone_s *zone, u32 size)
{
    void *res = _malloc(zone, size, NVME_PAGE_SIZE);
    if (res) memset(res, 0, size);
    return res;
}

static void
nvme_init_queue_common(struct nvme_ctrl *ctrl, struct nvme_queue *q, u16 q_idx,
                       u16 length)
{
    memset(q, 0, sizeof(*q));
    q->dbl = (u32 *)((char *)ctrl->reg + 0x1000 + q_idx * ctrl->doorbell_stride);
    dprintf(3, " q %p q_idx %u dbl %p\n", q, q_idx, q->dbl);
    q->mask = length - 1;
}

static int
nvme_init_sq(struct nvme_ctrl *ctrl, struct nvme_sq *sq, u16 q_idx, u16 length,
             struct nvme_cq *cq)
{
    nvme_init_queue_common(ctrl, &sq->common, q_idx, length);
    sq->sqe = zalloc_page_aligned(&ZoneHigh, sizeof(*sq->sqe) * length);

    if (!sq->sqe) {
        warn_noalloc();
        return -1;
    }

    dprintf(3, "sq %p q_idx %u sqe %p\n", sq, q_idx, sq->sqe);
    sq->cq   = cq;
    sq->head = 0;
    sq->tail = 0;

    return 0;
}

static int
nvme_init_cq(struct nvme_ctrl *ctrl, struct nvme_cq *cq, u16 q_idx, u16 length)
{
    nvme_init_queue_common(ctrl, &cq->common, q_idx, length);
    cq->cqe = zalloc_page_aligned(&ZoneHigh, sizeof(*cq->cqe) * length);
    if (!cq->cqe) {
        warn_noalloc();
        return -1;
    }

    cq->head = 0;

    /* All CQE phase bits are initialized to zero. This means initially we wait
       for the host controller to set these to 1. */
    cq->phase = 1;

    return 0;
}

static int
nvme_poll_cq(struct nvme_cq *cq)
{
    u32 dw3 = readl(&cq->cqe[cq->head].dword[3]);
    return (!!(dw3 & NVME_CQE_DW3_P) == cq->phase);
}

static int
nvme_is_cqe_success(struct nvme_cqe const *cqe)
{
    return ((cqe->status >> 1) & 0xFF) == 0;
}

static struct nvme_cqe
nvme_error_cqe(void)
{
    struct nvme_cqe r;

    /* 0xFF is a vendor specific status code != success. Should be okay for
       indicating failure. */
    memset(&r, 0xFF, sizeof(r));
    return r;
}

static struct nvme_cqe
nvme_consume_cqe(struct nvme_sq *sq)
{
    struct nvme_cq *cq = sq->cq;

    if (!nvme_poll_cq(cq)) {
        /* Cannot consume a completion queue entry, if there is none ready. */
        return nvme_error_cqe();
    }

    struct nvme_cqe *cqe = &cq->cqe[cq->head];
    u16 cq_next_head = (cq->head + 1) & cq->common.mask;
    dprintf(4, "cq %p head %u -> %u\n", cq, cq->head, cq_next_head);
    if (cq_next_head < cq->head) {
        dprintf(3, "cq %p wrap\n", cq);
        cq->phase = ~cq->phase;
    }
    cq->head = cq_next_head;

    /* Update the submission queue head. */
    if (cqe->sq_head != sq->head) {
        sq->head = cqe->sq_head;
        dprintf(4, "sq %p advanced to %u\n", sq, cqe->sq_head);
    }

    /* Tell the controller that we consumed the completion. */
    writel(cq->common.dbl, cq->head);

    return *cqe;
}

static struct nvme_cqe
nvme_wait(struct nvme_sq *sq)
{
    static const unsigned nvme_timeout = 5000 /* ms */;
    u32 to = timer_calc(nvme_timeout);
    while (!nvme_poll_cq(sq->cq)) {
        yield();

        if (timer_check(to)) {
            warn_timeout();
            return nvme_error_cqe();
        }
    }

    return nvme_consume_cqe(sq);
}

/* Returns the next submission queue entry (or NULL if the queue is full). It
   also fills out Command Dword 0 and clears the rest. */
static struct nvme_sqe *
nvme_get_next_sqe(struct nvme_sq *sq, u8 opc, void *metadata, void *data)
{
    if (((sq->head + 1) & sq->common.mask) == sq->tail) {
        dprintf(3, "submission queue is full");
        return NULL;
    }

    struct nvme_sqe *sqe = &sq->sqe[sq->tail];
    dprintf(4, "sq %p next_sqe %u\n", sq, sq->tail);

    memset(sqe, 0, sizeof(*sqe));
    sqe->cdw0 = opc | (sq->tail << 16 /* CID */);
    sqe->mptr = (u32)metadata;
    sqe->dptr_prp1 = (u32)data;

    if (sqe->dptr_prp1 & (NVME_PAGE_SIZE - 1)) {
        /* Data buffer not page aligned. */
        warn_internalerror();
    }

    return sqe;
}

/* Call this after you've filled out an sqe that you've got from nvme_get_next_sqe. */
static void
nvme_commit_sqe(struct nvme_sq *sq)
{
    dprintf(4, "sq %p commit_sqe %u\n", sq, sq->tail);
    sq->tail = (sq->tail + 1) & sq->common.mask;
    writel(sq->common.dbl, sq->tail);
}

/* Perform an identify command on the admin queue and return the resulting
   buffer. This may be a NULL pointer, if something failed. This function
   cannot be used after initialization, because it uses buffers in tmp zone. */
static union nvme_identify *
nvme_admin_identify(struct nvme_ctrl *ctrl, u8 cns, u32 nsid)
{
    union nvme_identify *identify_buf = zalloc_page_aligned(&ZoneTmpHigh, 4096);
    if (!identify_buf) {
        /* Could not allocate identify buffer. */
        warn_internalerror();
        return NULL;
    }

    struct nvme_sqe *cmd_identify;
    cmd_identify = nvme_get_next_sqe(&ctrl->admin_sq,
                                     NVME_SQE_OPC_ADMIN_IDENTIFY, NULL,
                                     identify_buf);

    if (!cmd_identify) {
        warn_internalerror();
        goto error;
    }

    cmd_identify->nsid = nsid;
    cmd_identify->dword[10] = cns;

    nvme_commit_sqe(&ctrl->admin_sq);

    struct nvme_cqe cqe = nvme_wait(&ctrl->admin_sq);

    if (!nvme_is_cqe_success(&cqe)) {
        goto error;
    }

    return identify_buf;
 error:
    free(identify_buf);
    return NULL;
}

static struct nvme_identify_ctrl *
nvme_admin_identify_ctrl(struct nvme_ctrl *ctrl)
{
    return &nvme_admin_identify(ctrl, NVME_ADMIN_IDENTIFY_CNS_ID_CTRL, 0)->ctrl;
}

static struct nvme_identify_ns *
nvme_admin_identify_ns(struct nvme_ctrl *ctrl, u32 ns_id)
{
    return &nvme_admin_identify(ctrl, NVME_ADMIN_IDENTIFY_CNS_ID_NS,
                                ns_id)->ns;
}

static void
nvme_probe_ns(struct nvme_ctrl *ctrl, struct nvme_namespace *ns, u32 ns_id)
{
    ns->ctrl  = ctrl;
    ns->ns_id = ns_id;

    struct nvme_identify_ns *id = nvme_admin_identify_ns(ctrl, ns_id);
    if (!id) {
        dprintf(2, "NVMe couldn't identify namespace %u.\n", ns_id);
        goto free_buffer;
    }

    u8 current_lba_format = id->flbas & 0xF;
    if (current_lba_format > id->nlbaf) {
        dprintf(2, "NVMe NS %u: current LBA format %u is beyond what the "
                " namespace supports (%u)?\n",
                ns_id, current_lba_format, id->nlbaf + 1);
        goto free_buffer;
    }

    ns->lba_count = id->nsze;
    if (!ns->lba_count) {
        dprintf(2, "NVMe NS %u is inactive.\n", ns_id);
        goto free_buffer;
    }

    struct nvme_lba_format *fmt = &id->lbaf[current_lba_format];

    ns->block_size    = 1U << fmt->lbads;
    ns->metadata_size = fmt->ms;

    if (ns->block_size > NVME_PAGE_SIZE) {
        /* If we see devices that trigger this path, we need to increase our
           buffer size. */
        warn_internalerror();
        goto free_buffer;
    }

    ns->drive.cntl_id   = ns - ctrl->ns;
    ns->drive.removable = 0;
    ns->drive.type      = DTYPE_NVME;
    ns->drive.blksize   = ns->block_size;
    ns->drive.sectors   = ns->lba_count;

    ns->dma_buffer = zalloc_page_aligned(&ZoneHigh, NVME_PAGE_SIZE);

    char *desc = znprintf(MAXDESCSIZE, "NVMe NS %u: %llu MiB (%llu %u-byte "
                          "blocks + %u-byte metadata)\n",
                          ns_id, (ns->lba_count * ns->block_size) >> 20,
                          ns->lba_count, ns->block_size, ns->metadata_size);

    dprintf(3, "%s", desc);
    boot_add_hd(&ns->drive, desc, bootprio_find_pci_device(ctrl->pci));

free_buffer:
    free (id);
}


/* Release memory allocated for a completion queue */
static void
nvme_destroy_cq(struct nvme_cq *cq)
{
    free(cq->cqe);
    cq->cqe = NULL;
}

/* Release memory allocated for a submission queue */
static void
nvme_destroy_sq(struct nvme_sq *sq)
{
    free(sq->sqe);
    sq->sqe = NULL;
}

/* Returns 0 on success. */
static int
nvme_create_io_cq(struct nvme_ctrl *ctrl, struct nvme_cq *cq, u16 q_idx)
{
    int rc;
    struct nvme_sqe *cmd_create_cq;
    u32 length = 1 + (ctrl->reg->cap & 0xffff);
    if (length > NVME_PAGE_SIZE / sizeof(struct nvme_cqe))
        length = NVME_PAGE_SIZE / sizeof(struct nvme_cqe);

    rc = nvme_init_cq(ctrl, cq, q_idx, length);
    if (rc) {
        goto err;
    }

    cmd_create_cq = nvme_get_next_sqe(&ctrl->admin_sq,
                                      NVME_SQE_OPC_ADMIN_CREATE_IO_CQ, NULL,
                                      cq->cqe);
    if (!cmd_create_cq) {
        goto err_destroy_cq;
    }

    cmd_create_cq->dword[10] = (cq->common.mask << 16) | (q_idx >> 1);
    cmd_create_cq->dword[11] = 1 /* physically contiguous */;

    nvme_commit_sqe(&ctrl->admin_sq);

    struct nvme_cqe cqe = nvme_wait(&ctrl->admin_sq);

    if (!nvme_is_cqe_success(&cqe)) {
        dprintf(2, "create io cq failed: %08x %08x %08x %08x\n",
                cqe.dword[0], cqe.dword[1], cqe.dword[2], cqe.dword[3]);

        goto err_destroy_cq;
    }

    return 0;

err_destroy_cq:
    nvme_destroy_cq(cq);
err:
    return -1;
}

/* Returns 0 on success. */
static int
nvme_create_io_sq(struct nvme_ctrl *ctrl, struct nvme_sq *sq, u16 q_idx, struct nvme_cq *cq)
{
    int rc;
    struct nvme_sqe *cmd_create_sq;
    u32 length = 1 + (ctrl->reg->cap & 0xffff);
    if (length > NVME_PAGE_SIZE / sizeof(struct nvme_cqe))
        length = NVME_PAGE_SIZE / sizeof(struct nvme_cqe);

    rc = nvme_init_sq(ctrl, sq, q_idx, length, cq);
    if (rc) {
        goto err;
    }

    cmd_create_sq = nvme_get_next_sqe(&ctrl->admin_sq,
                                      NVME_SQE_OPC_ADMIN_CREATE_IO_SQ, NULL,
                                      sq->sqe);
    if (!cmd_create_sq) {
        goto err_destroy_sq;
    }

    cmd_create_sq->dword[10] = (sq->common.mask << 16) | (q_idx >> 1);
    cmd_create_sq->dword[11] = (q_idx >> 1) << 16 | 1 /* contiguous */;
    dprintf(3, "sq %p create dword10 %08x dword11 %08x\n", sq,
            cmd_create_sq->dword[10], cmd_create_sq->dword[11]);

    nvme_commit_sqe(&ctrl->admin_sq);

    struct nvme_cqe cqe = nvme_wait(&ctrl->admin_sq);

    if (!nvme_is_cqe_success(&cqe)) {
        dprintf(2, "create io sq failed: %08x %08x %08x %08x\n",
                cqe.dword[0], cqe.dword[1], cqe.dword[2], cqe.dword[3]);
        goto err_destroy_sq;
    }

    return 0;

err_destroy_sq:
    nvme_destroy_sq(sq);
err:
    return -1;
}

/* Reads count sectors into buf. Returns DISK_RET_*. The buffer cannot cross
   page boundaries. */
static int
nvme_io_readwrite(struct nvme_namespace *ns, u64 lba, char *buf, u16 count,
                  int write)
{
    u32 buf_addr = (u32)buf;

    if ((buf_addr & 0x3) ||
        ((buf_addr & ~(NVME_PAGE_SIZE - 1)) !=
         ((buf_addr + ns->block_size * count - 1) & ~(NVME_PAGE_SIZE - 1)))) {
        /* Buffer is misaligned or crosses page boundary */
        warn_internalerror();
        return DISK_RET_EBADTRACK;
    }

    struct nvme_sqe *io_read = nvme_get_next_sqe(&ns->ctrl->io_sq,
                                                 write ? NVME_SQE_OPC_IO_WRITE
                                                       : NVME_SQE_OPC_IO_READ,
                                                 NULL, buf);
    io_read->nsid = ns->ns_id;
    io_read->dword[10] = (u32)lba;
    io_read->dword[11] = (u32)(lba >> 32);
    io_read->dword[12] = (1U << 31 /* limited retry */) | (count - 1);

    nvme_commit_sqe(&ns->ctrl->io_sq);

    struct nvme_cqe cqe = nvme_wait(&ns->ctrl->io_sq);

    if (!nvme_is_cqe_success(&cqe)) {
        dprintf(2, "read io: %08x %08x %08x %08x\n",
                cqe.dword[0], cqe.dword[1], cqe.dword[2], cqe.dword[3]);

        return DISK_RET_EBADTRACK;
    }

    return DISK_RET_SUCCESS;
}

static int
nvme_create_io_queues(struct nvme_ctrl *ctrl)
{
    if (nvme_create_io_cq(ctrl, &ctrl->io_cq, 3))
        goto err;

    if (nvme_create_io_sq(ctrl, &ctrl->io_sq, 2, &ctrl->io_cq))
        goto err_free_cq;

    return 0;

 err_free_cq:
    nvme_destroy_cq(&ctrl->io_cq);
 err:
    return -1;
}

static void
nvme_destroy_io_queues(struct nvme_ctrl *ctrl)
{
    nvme_destroy_sq(&ctrl->io_sq);
    nvme_destroy_cq(&ctrl->io_cq);
}

/* Waits for CSTS.RDY to match rdy. Returns 0 on success. */
static int
nvme_wait_csts_rdy(struct nvme_ctrl *ctrl, unsigned rdy)
{
    u32 const max_to = 500 /* ms */ * ((ctrl->reg->cap >> 24) & 0xFFU);
    u32 to = timer_calc(max_to);
    u32 csts;

    while (rdy != ((csts = ctrl->reg->csts) & NVME_CSTS_RDY)) {
        yield();

        if (csts & NVME_CSTS_FATAL) {
            dprintf(3, "NVMe fatal error during controller shutdown\n");
            return -1;
        }

        if (timer_check(to)) {
            warn_timeout();
            return -1;
        }
    }

    return 0;
}

/* Returns 0 on success. */
static int
nvme_controller_enable(struct nvme_ctrl *ctrl)
{
    int rc;

    pci_enable_busmaster(ctrl->pci);

    /* Turn the controller off. */
    ctrl->reg->cc = 0;
    if (nvme_wait_csts_rdy(ctrl, 0)) {
        dprintf(2, "NVMe fatal error during controller shutdown\n");
        return -1;
    }

    ctrl->doorbell_stride = 4U << ((ctrl->reg->cap >> 32) & 0xF);

    rc = nvme_init_cq(ctrl, &ctrl->admin_cq, 1,
                      NVME_PAGE_SIZE / sizeof(struct nvme_cqe));
    if (rc) {
        return -1;
    }

    rc = nvme_init_sq(ctrl, &ctrl->admin_sq, 0,
                      NVME_PAGE_SIZE / sizeof(struct nvme_sqe), &ctrl->admin_cq);
    if (rc) {
        goto err_destroy_admin_cq;
    }

    ctrl->reg->aqa = ctrl->admin_cq.common.mask << 16
        | ctrl->admin_sq.common.mask;

    ctrl->reg->asq = (u32)ctrl->admin_sq.sqe;
    ctrl->reg->acq = (u32)ctrl->admin_cq.cqe;

    dprintf(3, "  admin submission queue: %p\n", ctrl->admin_sq.sqe);
    dprintf(3, "  admin completion queue: %p\n", ctrl->admin_cq.cqe);

    ctrl->reg->cc = NVME_CC_EN | (NVME_CQE_SIZE_LOG << 20)
        | (NVME_SQE_SIZE_LOG << 16 /* IOSQES */);

    if (nvme_wait_csts_rdy(ctrl, 1)) {
        dprintf(2, "NVMe fatal error while enabling controller\n");
        goto err_destroy_admin_sq;
    }

    /* The admin queue is set up and the controller is ready. Let's figure out
       what namespaces we have. */

    struct nvme_identify_ctrl *identify = nvme_admin_identify_ctrl(ctrl);

    if (!identify) {
        dprintf(2, "NVMe couldn't identify controller.\n");
        goto err_destroy_admin_sq;
    }

    dprintf(3, "NVMe has %u namespace%s.\n",
            identify->nn, (identify->nn == 1) ? "" : "s");

    ctrl->ns_count = identify->nn;
    free(identify);

    if ((ctrl->ns_count == 0) || nvme_create_io_queues(ctrl)) {
        /* No point to continue, if the controller says it doesn't have
           namespaces or we couldn't create I/O queues. */
        goto err_destroy_admin_sq;
    }

    ctrl->ns = malloc_fseg(sizeof(*ctrl->ns) * ctrl->ns_count);
    if (!ctrl->ns) {
        warn_noalloc();
        goto err_destroy_ioq;
    }
    memset(ctrl->ns, 0, sizeof(*ctrl->ns) * ctrl->ns_count);

    /* Populate namespace IDs */
    int ns_idx;
    for (ns_idx = 0; ns_idx < ctrl->ns_count; ns_idx++) {
        nvme_probe_ns(ctrl, &ctrl->ns[ns_idx], ns_idx + 1);
    }

    dprintf(3, "NVMe initialization complete!\n");
    return 0;

 err_destroy_ioq:
    nvme_destroy_io_queues(ctrl);
 err_destroy_admin_sq:
    nvme_destroy_sq(&ctrl->admin_sq);
 err_destroy_admin_cq:
    nvme_destroy_cq(&ctrl->admin_cq);
    return -1;
}

/* Initialize an NVMe controller and detect its drives. */
static void
nvme_controller_setup(void *opaque)
{
    struct pci_device *pci = opaque;

    struct nvme_reg volatile *reg = pci_enable_membar(pci, PCI_BASE_ADDRESS_0);
    if (!reg)
        return;

    u32 version = reg->vs;
    dprintf(3, "Found NVMe controller with version %u.%u.%u.\n",
            version >> 16, (version >> 8) & 0xFF, version & 0xFF);
    dprintf(3, "  Capabilities %016llx\n", reg->cap);

    if (~reg->cap & NVME_CAP_CSS_NVME) {
        dprintf(3, "Controller doesn't speak NVMe command set. Skipping.\n");
        goto err;
    }

    struct nvme_ctrl *ctrl = malloc_high(sizeof(*ctrl));
    if (!ctrl) {
        warn_noalloc();
        goto err;
    }

    memset(ctrl, 0, sizeof(*ctrl));

    ctrl->reg = reg;
    ctrl->pci = pci;

    if (nvme_controller_enable(ctrl)) {
        goto err_free_ctrl;
    }

    return;

 err_free_ctrl:
    free(ctrl);
 err:
    dprintf(2, "Failed to enable NVMe controller.\n");
}

// Locate and init NVMe controllers
static void
nvme_scan(void)
{
    // Scan PCI bus for NVMe adapters
    struct pci_device *pci;

    foreachpci(pci) {
        if (pci->class != PCI_CLASS_STORAGE_NVME)
            continue;
        if (pci->prog_if != 2 /* as of NVM 1.0e */) {
            dprintf(3, "Found incompatble NVMe: prog-if=%02x\n", pci->prog_if);
            continue;
        }

        run_thread(nvme_controller_setup, pci);
    }
}

static int
nvme_cmd_readwrite(struct nvme_namespace *ns, struct disk_op_s *op, int write)
{
    int res = DISK_RET_SUCCESS;
    u16 const max_blocks = NVME_PAGE_SIZE / ns->block_size;
    u16 i;

    for (i = 0; i < op->count && res == DISK_RET_SUCCESS;) {
        u16 blocks_remaining = op->count - i;
        u16 blocks = blocks_remaining < max_blocks ? blocks_remaining
                                                   : max_blocks;
        char *op_buf = op->buf_fl + i * ns->block_size;

        if (write) {
            memcpy(ns->dma_buffer, op_buf, blocks * ns->block_size);
        }

        res = nvme_io_readwrite(ns, op->lba + i, ns->dma_buffer, blocks, write);
        dprintf(3, "ns %u %s lba %llu+%u: %d\n", ns->ns_id, write ? "write"
                                                                  : "read",
                op->lba + i, blocks, res);

        if (!write && res == DISK_RET_SUCCESS) {
            memcpy(op_buf, ns->dma_buffer, blocks * ns->block_size);
        }

        i += blocks;
    }

    return res;
}

int
nvme_process_op(struct disk_op_s *op)
{
    if (!CONFIG_NVME)
        return DISK_RET_SUCCESS;

    struct nvme_namespace *ns = container_of(op->drive_fl, struct nvme_namespace,
                                             drive);

    switch (op->command) {
    case CMD_READ:
    case CMD_WRITE:
        return nvme_cmd_readwrite(ns, op, op->command == CMD_WRITE);
    default:
        return default_process_op(op);
    }
}

void
nvme_setup(void)
{
    ASSERT32FLAT();
    if (!CONFIG_NVME)
        return;

    dprintf(3, "init nvme\n");
    nvme_scan();
}

/* EOF */
