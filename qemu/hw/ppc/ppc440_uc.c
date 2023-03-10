/*
 * QEMU PowerPC 440 embedded processors emulation
 *
 * Copyright (c) 2012 François Revol
 * Copyright (c) 2016-2019 BALATON Zoltan
 *
 * This work is licensed under the GNU GPL license version 2 or later.
 *
 */

#include "qemu/osdep.h"
#include "qemu/units.h"
#include "qemu/error-report.h"
#include "qapi/error.h"
#include "qemu/log.h"
#include "qemu/module.h"
#include "cpu.h"
#include "hw/irq.h"
#include "exec/address-spaces.h"
#include "exec/memory.h"
#include "hw/ppc/ppc.h"
#include "hw/qdev-properties.h"
#include "hw/pci/pci.h"
#include "sysemu/block-backend.h"
#include "sysemu/reset.h"
#include "ppc440.h"
#include "qom/object.h"

/*****************************************************************************/
/* L2 Cache as SRAM */
/* FIXME:fix names */
enum {
    DCR_L2CACHE_BASE  = 0x30,
    DCR_L2CACHE_CFG   = DCR_L2CACHE_BASE,
    DCR_L2CACHE_CMD,
    DCR_L2CACHE_ADDR,
    DCR_L2CACHE_DATA,
    DCR_L2CACHE_STAT,
    DCR_L2CACHE_CVER,
    DCR_L2CACHE_SNP0,
    DCR_L2CACHE_SNP1,
    DCR_L2CACHE_END   = DCR_L2CACHE_SNP1,
};

/* base is 460ex-specific, cf. U-Boot, ppc4xx-isram.h */
enum {
    DCR_ISRAM0_BASE   = 0x20,
    DCR_ISRAM0_SB0CR  = DCR_ISRAM0_BASE,
    DCR_ISRAM0_SB1CR,
    DCR_ISRAM0_SB2CR,
    DCR_ISRAM0_SB3CR,
    DCR_ISRAM0_BEAR,
    DCR_ISRAM0_BESR0,
    DCR_ISRAM0_BESR1,
    DCR_ISRAM0_PMEG,
    DCR_ISRAM0_CID,
    DCR_ISRAM0_REVID,
    DCR_ISRAM0_DPC,
    DCR_ISRAM0_END    = DCR_ISRAM0_DPC
};

enum {
    DCR_ISRAM1_BASE   = 0xb0,
    DCR_ISRAM1_SB0CR  = DCR_ISRAM1_BASE,
    /* single bank */
    DCR_ISRAM1_BEAR   = DCR_ISRAM1_BASE + 0x04,
    DCR_ISRAM1_BESR0,
    DCR_ISRAM1_BESR1,
    DCR_ISRAM1_PMEG,
    DCR_ISRAM1_CID,
    DCR_ISRAM1_REVID,
    DCR_ISRAM1_DPC,
    DCR_ISRAM1_END    = DCR_ISRAM1_DPC
};

typedef struct ppc4xx_l2sram_t {
    MemoryRegion bank[4];
    uint32_t l2cache[8];
    uint32_t isram0[11];
} ppc4xx_l2sram_t;

#ifdef MAP_L2SRAM
static void l2sram_update_mappings(ppc4xx_l2sram_t *l2sram,
                                   uint32_t isarc, uint32_t isacntl,
                                   uint32_t dsarc, uint32_t dsacntl)
{
    if (l2sram->isarc != isarc ||
        (l2sram->isacntl & 0x80000000) != (isacntl & 0x80000000)) {
        if (l2sram->isacntl & 0x80000000) {
            /* Unmap previously assigned memory region */
            memory_region_del_subregion(get_system_memory(),
                                        &l2sram->isarc_ram);
        }
        if (isacntl & 0x80000000) {
            /* Map new instruction memory region */
            memory_region_add_subregion(get_system_memory(), isarc,
                                        &l2sram->isarc_ram);
        }
    }
    if (l2sram->dsarc != dsarc ||
        (l2sram->dsacntl & 0x80000000) != (dsacntl & 0x80000000)) {
        if (l2sram->dsacntl & 0x80000000) {
            /* Beware not to unmap the region we just mapped */
            if (!(isacntl & 0x80000000) || l2sram->dsarc != isarc) {
                /* Unmap previously assigned memory region */
                memory_region_del_subregion(get_system_memory(),
                                            &l2sram->dsarc_ram);
            }
        }
        if (dsacntl & 0x80000000) {
            /* Beware not to remap the region we just mapped */
            if (!(isacntl & 0x80000000) || dsarc != isarc) {
                /* Map new data memory region */
                memory_region_add_subregion(get_system_memory(), dsarc,
                                            &l2sram->dsarc_ram);
            }
        }
    }
}
#endif

static uint32_t dcr_read_l2sram(void *opaque, int dcrn)
{
    ppc4xx_l2sram_t *l2sram = opaque;
    uint32_t ret = 0;

    switch (dcrn) {
    case DCR_L2CACHE_CFG:
    case DCR_L2CACHE_CMD:
    case DCR_L2CACHE_ADDR:
    case DCR_L2CACHE_DATA:
    case DCR_L2CACHE_STAT:
    case DCR_L2CACHE_CVER:
    case DCR_L2CACHE_SNP0:
    case DCR_L2CACHE_SNP1:
        ret = l2sram->l2cache[dcrn - DCR_L2CACHE_BASE];
        break;

    case DCR_ISRAM0_SB0CR:
    case DCR_ISRAM0_SB1CR:
    case DCR_ISRAM0_SB2CR:
    case DCR_ISRAM0_SB3CR:
    case DCR_ISRAM0_BEAR:
    case DCR_ISRAM0_BESR0:
    case DCR_ISRAM0_BESR1:
    case DCR_ISRAM0_PMEG:
    case DCR_ISRAM0_CID:
    case DCR_ISRAM0_REVID:
    case DCR_ISRAM0_DPC:
        ret = l2sram->isram0[dcrn - DCR_ISRAM0_BASE];
        break;

    default:
        break;
    }

    return ret;
}

static void dcr_write_l2sram(void *opaque, int dcrn, uint32_t val)
{
    /*ppc4xx_l2sram_t *l2sram = opaque;*/
    /* FIXME: Actually handle L2 cache mapping */

    switch (dcrn) {
    case DCR_L2CACHE_CFG:
    case DCR_L2CACHE_CMD:
    case DCR_L2CACHE_ADDR:
    case DCR_L2CACHE_DATA:
    case DCR_L2CACHE_STAT:
    case DCR_L2CACHE_CVER:
    case DCR_L2CACHE_SNP0:
    case DCR_L2CACHE_SNP1:
        /*l2sram->l2cache[dcrn - DCR_L2CACHE_BASE] = val;*/
        break;

    case DCR_ISRAM0_SB0CR:
    case DCR_ISRAM0_SB1CR:
    case DCR_ISRAM0_SB2CR:
    case DCR_ISRAM0_SB3CR:
    case DCR_ISRAM0_BEAR:
    case DCR_ISRAM0_BESR0:
    case DCR_ISRAM0_BESR1:
    case DCR_ISRAM0_PMEG:
    case DCR_ISRAM0_CID:
    case DCR_ISRAM0_REVID:
    case DCR_ISRAM0_DPC:
        /*l2sram->isram0[dcrn - DCR_L2CACHE_BASE] = val;*/
        break;

    case DCR_ISRAM1_SB0CR:
    case DCR_ISRAM1_BEAR:
    case DCR_ISRAM1_BESR0:
    case DCR_ISRAM1_BESR1:
    case DCR_ISRAM1_PMEG:
    case DCR_ISRAM1_CID:
    case DCR_ISRAM1_REVID:
    case DCR_ISRAM1_DPC:
        /*l2sram->isram1[dcrn - DCR_L2CACHE_BASE] = val;*/
        break;
    }
    /*l2sram_update_mappings(l2sram, isarc, isacntl, dsarc, dsacntl);*/
}

static void l2sram_reset(void *opaque)
{
    ppc4xx_l2sram_t *l2sram = opaque;

    memset(l2sram->l2cache, 0, sizeof(l2sram->l2cache));
    l2sram->l2cache[DCR_L2CACHE_STAT - DCR_L2CACHE_BASE] = 0x80000000;
    memset(l2sram->isram0, 0, sizeof(l2sram->isram0));
    /*l2sram_update_mappings(l2sram, isarc, isacntl, dsarc, dsacntl);*/
}

void ppc4xx_l2sram_init(CPUPPCState *env)
{
    ppc4xx_l2sram_t *l2sram;

    l2sram = g_malloc0(sizeof(*l2sram));
    /* XXX: Size is 4*64kB for 460ex, cf. U-Boot, ppc4xx-isram.h */
    memory_region_init_ram(&l2sram->bank[0], NULL, "ppc4xx.l2sram_bank0",
                           64 * KiB, &error_abort);
    memory_region_init_ram(&l2sram->bank[1], NULL, "ppc4xx.l2sram_bank1",
                           64 * KiB, &error_abort);
    memory_region_init_ram(&l2sram->bank[2], NULL, "ppc4xx.l2sram_bank2",
                           64 * KiB, &error_abort);
    memory_region_init_ram(&l2sram->bank[3], NULL, "ppc4xx.l2sram_bank3",
                           64 * KiB, &error_abort);
    qemu_register_reset(&l2sram_reset, l2sram);
    ppc_dcr_register(env, DCR_L2CACHE_CFG,
                     l2sram, &dcr_read_l2sram, &dcr_write_l2sram);
    ppc_dcr_register(env, DCR_L2CACHE_CMD,
                     l2sram, &dcr_read_l2sram, &dcr_write_l2sram);
    ppc_dcr_register(env, DCR_L2CACHE_ADDR,
                     l2sram, &dcr_read_l2sram, &dcr_write_l2sram);
    ppc_dcr_register(env, DCR_L2CACHE_DATA,
                     l2sram, &dcr_read_l2sram, &dcr_write_l2sram);
    ppc_dcr_register(env, DCR_L2CACHE_STAT,
                     l2sram, &dcr_read_l2sram, &dcr_write_l2sram);
    ppc_dcr_register(env, DCR_L2CACHE_CVER,
                     l2sram, &dcr_read_l2sram, &dcr_write_l2sram);
    ppc_dcr_register(env, DCR_L2CACHE_SNP0,
                     l2sram, &dcr_read_l2sram, &dcr_write_l2sram);
    ppc_dcr_register(env, DCR_L2CACHE_SNP1,
                     l2sram, &dcr_read_l2sram, &dcr_write_l2sram);

    ppc_dcr_register(env, DCR_ISRAM0_SB0CR,
                     l2sram, &dcr_read_l2sram, &dcr_write_l2sram);
    ppc_dcr_register(env, DCR_ISRAM0_SB1CR,
                     l2sram, &dcr_read_l2sram, &dcr_write_l2sram);
    ppc_dcr_register(env, DCR_ISRAM0_SB2CR,
                     l2sram, &dcr_read_l2sram, &dcr_write_l2sram);
    ppc_dcr_register(env, DCR_ISRAM0_SB3CR,
                     l2sram, &dcr_read_l2sram, &dcr_write_l2sram);
    ppc_dcr_register(env, DCR_ISRAM0_PMEG,
                     l2sram, &dcr_read_l2sram, &dcr_write_l2sram);
    ppc_dcr_register(env, DCR_ISRAM0_DPC,
                     l2sram, &dcr_read_l2sram, &dcr_write_l2sram);

    ppc_dcr_register(env, DCR_ISRAM1_SB0CR,
                     l2sram, &dcr_read_l2sram, &dcr_write_l2sram);
    ppc_dcr_register(env, DCR_ISRAM1_PMEG,
                     l2sram, &dcr_read_l2sram, &dcr_write_l2sram);
    ppc_dcr_register(env, DCR_ISRAM1_DPC,
                     l2sram, &dcr_read_l2sram, &dcr_write_l2sram);
}

/*****************************************************************************/
/* Clocking Power on Reset */
enum {
    CPR0_CFGADDR = 0xC,
    CPR0_CFGDATA = 0xD,

    CPR0_PLLD = 0x060,
    CPR0_PLBED = 0x080,
    CPR0_OPBD = 0x0C0,
    CPR0_PERD = 0x0E0,
    CPR0_AHBD = 0x100,
};

typedef struct ppc4xx_cpr_t {
    uint32_t addr;
} ppc4xx_cpr_t;

static uint32_t dcr_read_cpr(void *opaque, int dcrn)
{
    ppc4xx_cpr_t *cpr = opaque;
    uint32_t ret = 0;

    switch (dcrn) {
    case CPR0_CFGADDR:
        ret = cpr->addr;
        break;
    case CPR0_CFGDATA:
        switch (cpr->addr) {
        case CPR0_PLLD:
            ret = (0xb5 << 24) | (1 << 16) | (9 << 8);
            break;
        case CPR0_PLBED:
            ret = (5 << 24);
            break;
        case CPR0_OPBD:
            ret = (2 << 24);
            break;
        case CPR0_PERD:
        case CPR0_AHBD:
            ret = (1 << 24);
            break;
        default:
            break;
        }
        break;
    default:
        break;
    }

    return ret;
}

static void dcr_write_cpr(void *opaque, int dcrn, uint32_t val)
{
    ppc4xx_cpr_t *cpr = opaque;

    switch (dcrn) {
    case CPR0_CFGADDR:
        cpr->addr = val;
        break;
    case CPR0_CFGDATA:
        break;
    default:
        break;
    }
}

static void ppc4xx_cpr_reset(void *opaque)
{
    ppc4xx_cpr_t *cpr = opaque;

    cpr->addr = 0;
}

void ppc4xx_cpr_init(CPUPPCState *env)
{
    ppc4xx_cpr_t *cpr;

    cpr = g_malloc0(sizeof(*cpr));
    ppc_dcr_register(env, CPR0_CFGADDR, cpr, &dcr_read_cpr, &dcr_write_cpr);
    ppc_dcr_register(env, CPR0_CFGDATA, cpr, &dcr_read_cpr, &dcr_write_cpr);
    qemu_register_reset(ppc4xx_cpr_reset, cpr);
}

/*****************************************************************************/
/* System DCRs */
typedef struct ppc4xx_sdr_t ppc4xx_sdr_t;
struct ppc4xx_sdr_t {
    uint32_t addr;
};

enum {
    SDR0_CFGADDR = 0x00e,
    SDR0_CFGDATA,
    SDR0_STRP0 = 0x020,
    SDR0_STRP1,
    SDR0_102 = 0x66,
    SDR0_103,
    SDR0_128 = 0x80,
    SDR0_ECID3 = 0x083,
    SDR0_DDR0 = 0x0e1,
    SDR0_USB0 = 0x320,
};

enum {
    PESDR0_LOOP = 0x303,
    PESDR0_RCSSET,
    PESDR0_RCSSTS,
    PESDR0_RSTSTA = 0x310,
    PESDR1_LOOP = 0x343,
    PESDR1_RCSSET,
    PESDR1_RCSSTS,
    PESDR1_RSTSTA = 0x365,
};

#define SDR0_DDR0_DDRM_ENCODE(n)  ((((unsigned long)(n)) & 0x03) << 29)
#define SDR0_DDR0_DDRM_DDR1       0x20000000
#define SDR0_DDR0_DDRM_DDR2       0x40000000

static uint32_t dcr_read_sdr(void *opaque, int dcrn)
{
    ppc4xx_sdr_t *sdr = opaque;
    uint32_t ret = 0;

    switch (dcrn) {
    case SDR0_CFGADDR:
        ret = sdr->addr;
        break;
    case SDR0_CFGDATA:
        switch (sdr->addr) {
        case SDR0_STRP0:
            ret = (0xb5 << 8) | (1 << 4) | 9;
            break;
        case SDR0_STRP1:
            ret = (5 << 29) | (2 << 26) | (1 << 24);
            break;
        case SDR0_ECID3:
            ret = 1 << 20; /* No Security/Kasumi support */
            break;
        case SDR0_DDR0:
            ret = SDR0_DDR0_DDRM_ENCODE(1) | SDR0_DDR0_DDRM_DDR1;
            break;
        case PESDR0_RCSSET:
        case PESDR1_RCSSET:
            ret = (1 << 24) | (1 << 16);
            break;
        case PESDR0_RCSSTS:
        case PESDR1_RCSSTS:
            ret = (1 << 16) | (1 << 12);
            break;
        case PESDR0_RSTSTA:
        case PESDR1_RSTSTA:
            ret = 1;
            break;
        case PESDR0_LOOP:
        case PESDR1_LOOP:
            ret = 1 << 12;
            break;
        default:
            break;
        }
        break;
    default:
        break;
    }

    return ret;
}

static void dcr_write_sdr(void *opaque, int dcrn, uint32_t val)
{
    ppc4xx_sdr_t *sdr = opaque;

    switch (dcrn) {
    case SDR0_CFGADDR:
        sdr->addr = val;
        break;
    case SDR0_CFGDATA:
        switch (sdr->addr) {
        case 0x00: /* B0CR */
            break;
        default:
            break;
        }
        break;
    default:
        break;
    }
}

static void sdr_reset(void *opaque)
{
    ppc4xx_sdr_t *sdr = opaque;

    sdr->addr = 0;
}

void ppc4xx_sdr_init(CPUPPCState *env)
{
    ppc4xx_sdr_t *sdr;

    sdr = g_malloc0(sizeof(*sdr));
    qemu_register_reset(&sdr_reset, sdr);
    ppc_dcr_register(env, SDR0_CFGADDR,
                     sdr, &dcr_read_sdr, &dcr_write_sdr);
    ppc_dcr_register(env, SDR0_CFGDATA,
                     sdr, &dcr_read_sdr, &dcr_write_sdr);
    ppc_dcr_register(env, SDR0_102,
                     sdr, &dcr_read_sdr, &dcr_write_sdr);
    ppc_dcr_register(env, SDR0_103,
                     sdr, &dcr_read_sdr, &dcr_write_sdr);
    ppc_dcr_register(env, SDR0_128,
                     sdr, &dcr_read_sdr, &dcr_write_sdr);
    ppc_dcr_register(env, SDR0_USB0,
                     sdr, &dcr_read_sdr, &dcr_write_sdr);
}

/*****************************************************************************/
/* SDRAM controller */
typedef struct ppc440_sdram_t {
    uint32_t addr;
    int nbanks;
    MemoryRegion containers[4]; /* used for clipping */
    MemoryRegion *ram_memories;
    hwaddr ram_bases[4];
    hwaddr ram_sizes[4];
    uint32_t bcr[4];
} ppc440_sdram_t;

enum {
    SDRAM0_CFGADDR = 0x10,
    SDRAM0_CFGDATA,
    SDRAM_R0BAS = 0x40,
    SDRAM_R1BAS,
    SDRAM_R2BAS,
    SDRAM_R3BAS,
    SDRAM_CONF1HB = 0x45,
    SDRAM_PLBADDULL = 0x4a,
    SDRAM_CONF1LL = 0x4b,
    SDRAM_CONFPATHB = 0x4f,
    SDRAM_PLBADDUHB = 0x50,
};

static uint32_t sdram_bcr(hwaddr ram_base, hwaddr ram_size)
{
    uint32_t bcr;

    switch (ram_size) {
    case (8 * MiB):
        bcr = 0xffc0;
        break;
    case (16 * MiB):
        bcr = 0xff80;
        break;
    case (32 * MiB):
        bcr = 0xff00;
        break;
    case (64 * MiB):
        bcr = 0xfe00;
        break;
    case (128 * MiB):
        bcr = 0xfc00;
        break;
    case (256 * MiB):
        bcr = 0xf800;
        break;
    case (512 * MiB):
        bcr = 0xf000;
        break;
    case (1 * GiB):
        bcr = 0xe000;
        break;
    case (2 * GiB):
        bcr = 0xc000;
        break;
    case (4 * GiB):
        bcr = 0x8000;
        break;
    default:
        error_report("invalid RAM size " TARGET_FMT_plx, ram_size);
        return 0;
    }
    bcr |= ram_base >> 2 & 0xffe00000;
    bcr |= 1;

    return bcr;
}

static inline hwaddr sdram_base(uint32_t bcr)
{
    return (bcr & 0xffe00000) << 2;
}

static uint64_t sdram_size(uint32_t bcr)
{
    uint64_t size;
    int sh;

    sh = 1024 - ((bcr >> 6) & 0x3ff);
    size = 8 * MiB * sh;

    return size;
}

static void sdram_set_bcr(ppc440_sdram_t *sdram, int i,
                          uint32_t bcr, int enabled)
{
    if (sdram->bcr[i] & 1) {
        /* First unmap RAM if enabled */
        memory_region_del_subregion(get_system_memory(),
                                    &sdram->containers[i]);
        memory_region_del_subregion(&sdram->containers[i],
                                    &sdram->ram_memories[i]);
        object_unparent(OBJECT(&sdram->containers[i]));
    }
    sdram->bcr[i] = bcr & 0xffe0ffc1;
    if (enabled && (bcr & 1)) {
        memory_region_init(&sdram->containers[i], NULL, "sdram-containers",
                           sdram_size(bcr));
        memory_region_add_subregion(&sdram->containers[i], 0,
                                    &sdram->ram_memories[i]);
        memory_region_add_subregion(get_system_memory(),
                                    sdram_base(bcr),
                                    &sdram->containers[i]);
    }
}

static void sdram_map_bcr(ppc440_sdram_t *sdram)
{
    int i;

    for (i = 0; i < sdram->nbanks; i++) {
        if (sdram->ram_sizes[i] != 0) {
            sdram_set_bcr(sdram, i, sdram_bcr(sdram->ram_bases[i],
                                              sdram->ram_sizes[i]), 1);
        } else {
            sdram_set_bcr(sdram, i, 0, 0);
        }
    }
}

static uint32_t dcr_read_sdram(void *opaque, int dcrn)
{
    ppc440_sdram_t *sdram = opaque;
    uint32_t ret = 0;

    switch (dcrn) {
    case SDRAM_R0BAS:
    case SDRAM_R1BAS:
    case SDRAM_R2BAS:
    case SDRAM_R3BAS:
        if (sdram->ram_sizes[dcrn - SDRAM_R0BAS]) {
            ret = sdram_bcr(sdram->ram_bases[dcrn - SDRAM_R0BAS],
                            sdram->ram_sizes[dcrn - SDRAM_R0BAS]);
        }
        break;
    case SDRAM_CONF1HB:
    case SDRAM_CONF1LL:
    case SDRAM_CONFPATHB:
    case SDRAM_PLBADDULL:
    case SDRAM_PLBADDUHB:
        break;
    case SDRAM0_CFGADDR:
        ret = sdram->addr;
        break;
    case SDRAM0_CFGDATA:
        switch (sdram->addr) {
        case 0x14: /* SDRAM_MCSTAT (405EX) */
        case 0x1F:
            ret = 0x80000000;
            break;
        case 0x21: /* SDRAM_MCOPT2 */
            ret = 0x08000000;
            break;
        case 0x40: /* SDRAM_MB0CF */
            ret = 0x00008001;
            break;
        case 0x7A: /* SDRAM_DLCR */
            ret = 0x02000000;
            break;
        case 0xE1: /* SDR0_DDR0 */
            ret = SDR0_DDR0_DDRM_ENCODE(1) | SDR0_DDR0_DDRM_DDR1;
            break;
        default:
            break;
        }
        break;
    default:
        break;
    }

    return ret;
}

static void dcr_write_sdram(void *opaque, int dcrn, uint32_t val)
{
    ppc440_sdram_t *sdram = opaque;

    switch (dcrn) {
    case SDRAM_R0BAS:
    case SDRAM_R1BAS:
    case SDRAM_R2BAS:
    case SDRAM_R3BAS:
    case SDRAM_CONF1HB:
    case SDRAM_CONF1LL:
    case SDRAM_CONFPATHB:
    case SDRAM_PLBADDULL:
    case SDRAM_PLBADDUHB:
        break;
    case SDRAM0_CFGADDR:
        sdram->addr = val;
        break;
    case SDRAM0_CFGDATA:
        switch (sdram->addr) {
        case 0x00: /* B0CR */
            break;
        default:
            break;
        }
        break;
    default:
        break;
    }
}

static void sdram_reset(void *opaque)
{
    ppc440_sdram_t *sdram = opaque;

    sdram->addr = 0;
}

void ppc440_sdram_init(CPUPPCState *env, int nbanks,
                       MemoryRegion *ram_memories,
                       hwaddr *ram_bases, hwaddr *ram_sizes,
                       int do_init)
{
    ppc440_sdram_t *sdram;

    sdram = g_malloc0(sizeof(*sdram));
    sdram->nbanks = nbanks;
    sdram->ram_memories = ram_memories;
    memcpy(sdram->ram_bases, ram_bases, nbanks * sizeof(hwaddr));
    memcpy(sdram->ram_sizes, ram_sizes, nbanks * sizeof(hwaddr));
    qemu_register_reset(&sdram_reset, sdram);
    ppc_dcr_register(env, SDRAM0_CFGADDR,
                     sdram, &dcr_read_sdram, &dcr_write_sdram);
    ppc_dcr_register(env, SDRAM0_CFGDATA,
                     sdram, &dcr_read_sdram, &dcr_write_sdram);
    if (do_init) {
        sdram_map_bcr(sdram);
    }

    ppc_dcr_register(env, SDRAM_R0BAS,
                     sdram, &dcr_read_sdram, &dcr_write_sdram);
    ppc_dcr_register(env, SDRAM_R1BAS,
                     sdram, &dcr_read_sdram, &dcr_write_sdram);
    ppc_dcr_register(env, SDRAM_R2BAS,
                     sdram, &dcr_read_sdram, &dcr_write_sdram);
    ppc_dcr_register(env, SDRAM_R3BAS,
                     sdram, &dcr_read_sdram, &dcr_write_sdram);
    ppc_dcr_register(env, SDRAM_CONF1HB,
                     sdram, &dcr_read_sdram, &dcr_write_sdram);
    ppc_dcr_register(env, SDRAM_PLBADDULL,
                     sdram, &dcr_read_sdram, &dcr_write_sdram);
    ppc_dcr_register(env, SDRAM_CONF1LL,
                     sdram, &dcr_read_sdram, &dcr_write_sdram);
    ppc_dcr_register(env, SDRAM_CONFPATHB,
                     sdram, &dcr_read_sdram, &dcr_write_sdram);
    ppc_dcr_register(env, SDRAM_PLBADDUHB,
                     sdram, &dcr_read_sdram, &dcr_write_sdram);
}

/*****************************************************************************/
/* PLB to AHB bridge */
enum {
    AHB_TOP    = 0xA4,
    AHB_BOT    = 0xA5,
};

typedef struct ppc4xx_ahb_t {
    uint32_t top;
    uint32_t bot;
} ppc4xx_ahb_t;

static uint32_t dcr_read_ahb(void *opaque, int dcrn)
{
    ppc4xx_ahb_t *ahb = opaque;
    uint32_t ret = 0;

    switch (dcrn) {
    case AHB_TOP:
        ret = ahb->top;
        break;
    case AHB_BOT:
        ret = ahb->bot;
        break;
    default:
        break;
    }

    return ret;
}

static void dcr_write_ahb(void *opaque, int dcrn, uint32_t val)
{
    ppc4xx_ahb_t *ahb = opaque;

    switch (dcrn) {
    case AHB_TOP:
        ahb->top = val;
        break;
    case AHB_BOT:
        ahb->bot = val;
        break;
    }
}

static void ppc4xx_ahb_reset(void *opaque)
{
    ppc4xx_ahb_t *ahb = opaque;

    /* No error */
    ahb->top = 0;
    ahb->bot = 0;
}

void ppc4xx_ahb_init(CPUPPCState *env)
{
    ppc4xx_ahb_t *ahb;

    ahb = g_malloc0(sizeof(*ahb));
    ppc_dcr_register(env, AHB_TOP, ahb, &dcr_read_ahb, &dcr_write_ahb);
    ppc_dcr_register(env, AHB_BOT, ahb, &dcr_read_ahb, &dcr_write_ahb);
    qemu_register_reset(ppc4xx_ahb_reset, ahb);
}

/*****************************************************************************/
/* DMA controller */

#define DMA0_CR_CE  (1 << 31)
#define DMA0_CR_PW  (1 << 26 | 1 << 25)
#define DMA0_CR_DAI (1 << 24)
#define DMA0_CR_SAI (1 << 23)
#define DMA0_CR_DEC (1 << 2)

enum {
    DMA0_CR  = 0x00,
    DMA0_CT,
    DMA0_SAH,
    DMA0_SAL,
    DMA0_DAH,
    DMA0_DAL,
    DMA0_SGH,
    DMA0_SGL,

    DMA0_SR  = 0x20,
    DMA0_SGC = 0x23,
    DMA0_SLP = 0x25,
    DMA0_POL = 0x26,
};

typedef struct {
    uint32_t cr;
    uint32_t ct;
    uint64_t sa;
    uint64_t da;
    uint64_t sg;
} PPC4xxDmaChnl;

typedef struct {
    int base;
    PPC4xxDmaChnl ch[4];
    uint32_t sr;
} PPC4xxDmaState;

static uint32_t dcr_read_dma(void *opaque, int dcrn)
{
    PPC4xxDmaState *dma = opaque;
    uint32_t val = 0;
    int addr = dcrn - dma->base;
    int chnl = addr / 8;

    switch (addr) {
    case 0x00 ... 0x1f:
        switch (addr % 8) {
        case DMA0_CR:
            val = dma->ch[chnl].cr;
            break;
        case DMA0_CT:
            val = dma->ch[chnl].ct;
            break;
        case DMA0_SAH:
            val = dma->ch[chnl].sa >> 32;
            break;
        case DMA0_SAL:
            val = dma->ch[chnl].sa;
            break;
        case DMA0_DAH:
            val = dma->ch[chnl].da >> 32;
            break;
        case DMA0_DAL:
            val = dma->ch[chnl].da;
            break;
        case DMA0_SGH:
            val = dma->ch[chnl].sg >> 32;
            break;
        case DMA0_SGL:
            val = dma->ch[chnl].sg;
            break;
        }
        break;
    case DMA0_SR:
        val = dma->sr;
        break;
    default:
        qemu_log_mask(LOG_UNIMP, "%s: unimplemented register %x (%d, %x)\n",
                      __func__, dcrn, chnl, addr);
    }

    return val;
}

static void dcr_write_dma(void *opaque, int dcrn, uint32_t val)
{
    PPC4xxDmaState *dma = opaque;
    int addr = dcrn - dma->base;
    int chnl = addr / 8;

    switch (addr) {
    case 0x00 ... 0x1f:
        switch (addr % 8) {
        case DMA0_CR:
            dma->ch[chnl].cr = val;
            if (val & DMA0_CR_CE) {
                int count = dma->ch[chnl].ct & 0xffff;

                if (count) {
                    int width, i, sidx, didx;
                    uint8_t *rptr, *wptr;
                    hwaddr rlen, wlen;

                    sidx = didx = 0;
                    width = 1 << ((val & DMA0_CR_PW) >> 25);
                    rptr = cpu_physical_memory_map(dma->ch[chnl].sa, &rlen,
                                                   false);
                    wptr = cpu_physical_memory_map(dma->ch[chnl].da, &wlen,
                                                   true);
                    if (rptr && wptr) {
                        if (!(val & DMA0_CR_DEC) &&
                            val & DMA0_CR_SAI && val & DMA0_CR_DAI) {
                            /* optimise common case */
                            memmove(wptr, rptr, count * width);
                            sidx = didx = count * width;
                        } else {
                            /* do it the slow way */
                            for (sidx = didx = i = 0; i < count; i++) {
                                uint64_t v = ldn_le_p(rptr + sidx, width);
                                stn_le_p(wptr + didx, width, v);
                                if (val & DMA0_CR_SAI) {
                                    sidx += width;
                                }
                                if (val & DMA0_CR_DAI) {
                                    didx += width;
                                }
                            }
                        }
                    }
                    if (wptr) {
                        cpu_physical_memory_unmap(wptr, wlen, 1, didx);
                    }
                    if (rptr) {
                        cpu_physical_memory_unmap(rptr, rlen, 0, sidx);
                    }
                }
            }
            break;
        case DMA0_CT:
            dma->ch[chnl].ct = val;
            break;
        case DMA0_SAH:
            dma->ch[chnl].sa &= 0xffffffffULL;
            dma->ch[chnl].sa |= (uint64_t)val << 32;
            break;
        case DMA0_SAL:
            dma->ch[chnl].sa &= 0xffffffff00000000ULL;
            dma->ch[chnl].sa |= val;
            break;
        case DMA0_DAH:
            dma->ch[chnl].da &= 0xffffffffULL;
            dma->ch[chnl].da |= (uint64_t)val << 32;
            break;
        case DMA0_DAL:
            dma->ch[chnl].da &= 0xffffffff00000000ULL;
            dma->ch[chnl].da |= val;
            break;
        case DMA0_SGH:
            dma->ch[chnl].sg &= 0xffffffffULL;
            dma->ch[chnl].sg |= (uint64_t)val << 32;
            break;
        case DMA0_SGL:
            dma->ch[chnl].sg &= 0xffffffff00000000ULL;
            dma->ch[chnl].sg |= val;
            break;
        }
        break;
    case DMA0_SR:
        dma->sr &= ~val;
        break;
    default:
        qemu_log_mask(LOG_UNIMP, "%s: unimplemented register %x (%d, %x)\n",
                      __func__, dcrn, chnl, addr);
    }
}

static void ppc4xx_dma_reset(void *opaque)
{
    PPC4xxDmaState *dma = opaque;
    int dma_base = dma->base;

    memset(dma, 0, sizeof(*dma));
    dma->base = dma_base;
}

void ppc4xx_dma_init(CPUPPCState *env, int dcr_base)
{
    PPC4xxDmaState *dma;
    int i;

    dma = g_malloc0(sizeof(*dma));
    dma->base = dcr_base;
    qemu_register_reset(&ppc4xx_dma_reset, dma);
    for (i = 0; i < 4; i++) {
        ppc_dcr_register(env, dcr_base + i * 8 + DMA0_CR,
                         dma, &dcr_read_dma, &dcr_write_dma);
        ppc_dcr_register(env, dcr_base + i * 8 + DMA0_CT,
                         dma, &dcr_read_dma, &dcr_write_dma);
        ppc_dcr_register(env, dcr_base + i * 8 + DMA0_SAH,
                         dma, &dcr_read_dma, &dcr_write_dma);
        ppc_dcr_register(env, dcr_base + i * 8 + DMA0_SAL,
                         dma, &dcr_read_dma, &dcr_write_dma);
        ppc_dcr_register(env, dcr_base + i * 8 + DMA0_DAH,
                         dma, &dcr_read_dma, &dcr_write_dma);
        ppc_dcr_register(env, dcr_base + i * 8 + DMA0_DAL,
                         dma, &dcr_read_dma, &dcr_write_dma);
        ppc_dcr_register(env, dcr_base + i * 8 + DMA0_SGH,
                         dma, &dcr_read_dma, &dcr_write_dma);
        ppc_dcr_register(env, dcr_base + i * 8 + DMA0_SGL,
                         dma, &dcr_read_dma, &dcr_write_dma);
    }
    ppc_dcr_register(env, dcr_base + DMA0_SR,
                     dma, &dcr_read_dma, &dcr_write_dma);
    ppc_dcr_register(env, dcr_base + DMA0_SGC,
                     dma, &dcr_read_dma, &dcr_write_dma);
    ppc_dcr_register(env, dcr_base + DMA0_SLP,
                     dma, &dcr_read_dma, &dcr_write_dma);
    ppc_dcr_register(env, dcr_base + DMA0_POL,
                     dma, &dcr_read_dma, &dcr_write_dma);
}

/*****************************************************************************/
/* PCI Express controller */
/* FIXME: This is not complete and does not work, only implemented partially
 * to allow firmware and guests to find an empty bus. Cards should use PCI.
 */
#include "hw/pci/pcie_host.h"

#define TYPE_PPC460EX_PCIE_HOST "ppc460ex-pcie-host"
OBJECT_DECLARE_SIMPLE_TYPE(PPC460EXPCIEState, PPC460EX_PCIE_HOST)

struct PPC460EXPCIEState {
    PCIExpressHost host;

    MemoryRegion iomem;
    qemu_irq irq[4];
    int32_t dcrn_base;

    uint64_t cfg_base;
    uint32_t cfg_mask;
    uint64_t msg_base;
    uint32_t msg_mask;
    uint64_t omr1_base;
    uint64_t omr1_mask;
    uint64_t omr2_base;
    uint64_t omr2_mask;
    uint64_t omr3_base;
    uint64_t omr3_mask;
    uint64_t reg_base;
    uint32_t reg_mask;
    uint32_t special;
    uint32_t cfg;
};

#define DCRN_PCIE0_BASE 0x100
#define DCRN_PCIE1_BASE 0x120

enum {
    PEGPL_CFGBAH = 0x0,
    PEGPL_CFGBAL,
    PEGPL_CFGMSK,
    PEGPL_MSGBAH,
    PEGPL_MSGBAL,
    PEGPL_MSGMSK,
    PEGPL_OMR1BAH,
    PEGPL_OMR1BAL,
    PEGPL_OMR1MSKH,
    PEGPL_OMR1MSKL,
    PEGPL_OMR2BAH,
    PEGPL_OMR2BAL,
    PEGPL_OMR2MSKH,
    PEGPL_OMR2MSKL,
    PEGPL_OMR3BAH,
    PEGPL_OMR3BAL,
    PEGPL_OMR3MSKH,
    PEGPL_OMR3MSKL,
    PEGPL_REGBAH,
    PEGPL_REGBAL,
    PEGPL_REGMSK,
    PEGPL_SPECIAL,
    PEGPL_CFG,
};

static uint32_t dcr_read_pcie(void *opaque, int dcrn)
{
    PPC460EXPCIEState *state = opaque;
    uint32_t ret = 0;

    switch (dcrn - state->dcrn_base) {
    case PEGPL_CFGBAH:
        ret = state->cfg_base >> 32;
        break;
    case PEGPL_CFGBAL:
        ret = state->cfg_base;
        break;
    case PEGPL_CFGMSK:
        ret = state->cfg_mask;
        break;
    case PEGPL_MSGBAH:
        ret = state->msg_base >> 32;
        break;
    case PEGPL_MSGBAL:
        ret = state->msg_base;
        break;
    case PEGPL_MSGMSK:
        ret = state->msg_mask;
        break;
    case PEGPL_OMR1BAH:
        ret = state->omr1_base >> 32;
        break;
    case PEGPL_OMR1BAL:
        ret = state->omr1_base;
        break;
    case PEGPL_OMR1MSKH:
        ret = state->omr1_mask >> 32;
        break;
    case PEGPL_OMR1MSKL:
        ret = state->omr1_mask;
        break;
    case PEGPL_OMR2BAH:
        ret = state->omr2_base >> 32;
        break;
    case PEGPL_OMR2BAL:
        ret = state->omr2_base;
        break;
    case PEGPL_OMR2MSKH:
        ret = state->omr2_mask >> 32;
        break;
    case PEGPL_OMR2MSKL:
        ret = state->omr3_mask;
        break;
    case PEGPL_OMR3BAH:
        ret = state->omr3_base >> 32;
        break;
    case PEGPL_OMR3BAL:
        ret = state->omr3_base;
        break;
    case PEGPL_OMR3MSKH:
        ret = state->omr3_mask >> 32;
        break;
    case PEGPL_OMR3MSKL:
        ret = state->omr3_mask;
        break;
    case PEGPL_REGBAH:
        ret = state->reg_base >> 32;
        break;
    case PEGPL_REGBAL:
        ret = state->reg_base;
        break;
    case PEGPL_REGMSK:
        ret = state->reg_mask;
        break;
    case PEGPL_SPECIAL:
        ret = state->special;
        break;
    case PEGPL_CFG:
        ret = state->cfg;
        break;
    }

    return ret;
}

static void dcr_write_pcie(void *opaque, int dcrn, uint32_t val)
{
    PPC460EXPCIEState *s = opaque;
    uint64_t size;

    switch (dcrn - s->dcrn_base) {
    case PEGPL_CFGBAH:
        s->cfg_base = ((uint64_t)val << 32) | (s->cfg_base & 0xffffffff);
        break;
    case PEGPL_CFGBAL:
        s->cfg_base = (s->cfg_base & 0xffffffff00000000ULL) | val;
        break;
    case PEGPL_CFGMSK:
        s->cfg_mask = val;
        size = ~(val & 0xfffffffe) + 1;
        pcie_host_mmcfg_update(PCIE_HOST_BRIDGE(s), val & 1, s->cfg_base, size);
        break;
    case PEGPL_MSGBAH:
        s->msg_base = ((uint64_t)val << 32) | (s->msg_base & 0xffffffff);
        break;
    case PEGPL_MSGBAL:
        s->msg_base = (s->msg_base & 0xffffffff00000000ULL) | val;
        break;
    case PEGPL_MSGMSK:
        s->msg_mask = val;
        break;
    case PEGPL_OMR1BAH:
        s->omr1_base = ((uint64_t)val << 32) | (s->omr1_base & 0xffffffff);
        break;
    case PEGPL_OMR1BAL:
        s->omr1_base = (s->omr1_base & 0xffffffff00000000ULL) | val;
        break;
    case PEGPL_OMR1MSKH:
        s->omr1_mask = ((uint64_t)val << 32) | (s->omr1_mask & 0xffffffff);
        break;
    case PEGPL_OMR1MSKL:
        s->omr1_mask = (s->omr1_mask & 0xffffffff00000000ULL) | val;
        break;
    case PEGPL_OMR2BAH:
        s->omr2_base = ((uint64_t)val << 32) | (s->omr2_base & 0xffffffff);
        break;
    case PEGPL_OMR2BAL:
        s->omr2_base = (s->omr2_base & 0xffffffff00000000ULL) | val;
        break;
    case PEGPL_OMR2MSKH:
        s->omr2_mask = ((uint64_t)val << 32) | (s->omr2_mask & 0xffffffff);
        break;
    case PEGPL_OMR2MSKL:
        s->omr2_mask = (s->omr2_mask & 0xffffffff00000000ULL) | val;
        break;
    case PEGPL_OMR3BAH:
        s->omr3_base = ((uint64_t)val << 32) | (s->omr3_base & 0xffffffff);
        break;
    case PEGPL_OMR3BAL:
        s->omr3_base = (s->omr3_base & 0xffffffff00000000ULL) | val;
        break;
    case PEGPL_OMR3MSKH:
        s->omr3_mask = ((uint64_t)val << 32) | (s->omr3_mask & 0xffffffff);
        break;
    case PEGPL_OMR3MSKL:
        s->omr3_mask = (s->omr3_mask & 0xffffffff00000000ULL) | val;
        break;
    case PEGPL_REGBAH:
        s->reg_base = ((uint64_t)val << 32) | (s->reg_base & 0xffffffff);
        break;
    case PEGPL_REGBAL:
        s->reg_base = (s->reg_base & 0xffffffff00000000ULL) | val;
        break;
    case PEGPL_REGMSK:
        s->reg_mask = val;
        /* FIXME: how is size encoded? */
        size = (val == 0x7001 ? 4096 : ~(val & 0xfffffffe) + 1);
        break;
    case PEGPL_SPECIAL:
        s->special = val;
        break;
    case PEGPL_CFG:
        s->cfg = val;
        break;
    }
}

static void ppc460ex_set_irq(void *opaque, int irq_num, int level)
{
       PPC460EXPCIEState *s = opaque;
       qemu_set_irq(s->irq[irq_num], level);
}

static void ppc460ex_pcie_realize(DeviceState *dev, Error **errp)
{
    PPC460EXPCIEState *s = PPC460EX_PCIE_HOST(dev);
    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
    int i, id;
    char buf[16];

    switch (s->dcrn_base) {
    case DCRN_PCIE0_BASE:
        id = 0;
        break;
    case DCRN_PCIE1_BASE:
        id = 1;
        break;
    default:
        error_setg(errp, "invalid PCIe DCRN base");
        return;
    }
    snprintf(buf, sizeof(buf), "pcie%d-io", id);
    memory_region_init(&s->iomem, OBJECT(s), buf, UINT64_MAX);
    for (i = 0; i < 4; i++) {
        sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq[i]);
    }
    snprintf(buf, sizeof(buf), "pcie.%d", id);
    pci->bus = pci_register_root_bus(DEVICE(s), buf, ppc460ex_set_irq,
                                pci_swizzle_map_irq_fn, s, &s->iomem,
                                get_system_io(), 0, 4, TYPE_PCIE_BUS);
}

static Property ppc460ex_pcie_props[] = {
    DEFINE_PROP_INT32("dcrn-base", PPC460EXPCIEState, dcrn_base, -1),
    DEFINE_PROP_END_OF_LIST(),
};

static void ppc460ex_pcie_class_init(ObjectClass *klass, void *data)
{
    DeviceClass *dc = DEVICE_CLASS(klass);

    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
    dc->realize = ppc460ex_pcie_realize;
    device_class_set_props(dc, ppc460ex_pcie_props);
    dc->hotpluggable = false;
}

static const TypeInfo ppc460ex_pcie_host_info = {
    .name = TYPE_PPC460EX_PCIE_HOST,
    .parent = TYPE_PCIE_HOST_BRIDGE,
    .instance_size = sizeof(PPC460EXPCIEState),
    .class_init = ppc460ex_pcie_class_init,
};

static void ppc460ex_pcie_register(void)
{
    type_register_static(&ppc460ex_pcie_host_info);
}

type_init(ppc460ex_pcie_register)

static void ppc460ex_pcie_register_dcrs(PPC460EXPCIEState *s, CPUPPCState *env)
{
    ppc_dcr_register(env, s->dcrn_base + PEGPL_CFGBAH, s,
                     &dcr_read_pcie, &dcr_write_pcie);
    ppc_dcr_register(env, s->dcrn_base + PEGPL_CFGBAL, s,
                     &dcr_read_pcie, &dcr_write_pcie);
    ppc_dcr_register(env, s->dcrn_base + PEGPL_CFGMSK, s,
                     &dcr_read_pcie, &dcr_write_pcie);
    ppc_dcr_register(env, s->dcrn_base + PEGPL_MSGBAH, s,
                     &dcr_read_pcie, &dcr_write_pcie);
    ppc_dcr_register(env, s->dcrn_base + PEGPL_MSGBAL, s,
                     &dcr_read_pcie, &dcr_write_pcie);
    ppc_dcr_register(env, s->dcrn_base + PEGPL_MSGMSK, s,
                     &dcr_read_pcie, &dcr_write_pcie);
    ppc_dcr_register(env, s->dcrn_base + PEGPL_OMR1BAH, s,
                     &dcr_read_pcie, &dcr_write_pcie);
    ppc_dcr_register(env, s->dcrn_base + PEGPL_OMR1BAL, s,
                     &dcr_read_pcie, &dcr_write_pcie);
    ppc_dcr_register(env, s->dcrn_base + PEGPL_OMR1MSKH, s,
                     &dcr_read_pcie, &dcr_write_pcie);
    ppc_dcr_register(env, s->dcrn_base + PEGPL_OMR1MSKL, s,
                     &dcr_read_pcie, &dcr_write_pcie);
    ppc_dcr_register(env, s->dcrn_base + PEGPL_OMR2BAH, s,
                     &dcr_read_pcie, &dcr_write_pcie);
    ppc_dcr_register(env, s->dcrn_base + PEGPL_OMR2BAL, s,
                     &dcr_read_pcie, &dcr_write_pcie);
    ppc_dcr_register(env, s->dcrn_base + PEGPL_OMR2MSKH, s,
                     &dcr_read_pcie, &dcr_write_pcie);
    ppc_dcr_register(env, s->dcrn_base + PEGPL_OMR2MSKL, s,
                     &dcr_read_pcie, &dcr_write_pcie);
    ppc_dcr_register(env, s->dcrn_base + PEGPL_OMR3BAH, s,
                     &dcr_read_pcie, &dcr_write_pcie);
    ppc_dcr_register(env, s->dcrn_base + PEGPL_OMR3BAL, s,
                     &dcr_read_pcie, &dcr_write_pcie);
    ppc_dcr_register(env, s->dcrn_base + PEGPL_OMR3MSKH, s,
                     &dcr_read_pcie, &dcr_write_pcie);
    ppc_dcr_register(env, s->dcrn_base + PEGPL_OMR3MSKL, s,
                     &dcr_read_pcie, &dcr_write_pcie);
    ppc_dcr_register(env, s->dcrn_base + PEGPL_REGBAH, s,
                     &dcr_read_pcie, &dcr_write_pcie);
    ppc_dcr_register(env, s->dcrn_base + PEGPL_REGBAL, s,
                     &dcr_read_pcie, &dcr_write_pcie);
    ppc_dcr_register(env, s->dcrn_base + PEGPL_REGMSK, s,
                     &dcr_read_pcie, &dcr_write_pcie);
    ppc_dcr_register(env, s->dcrn_base + PEGPL_SPECIAL, s,
                     &dcr_read_pcie, &dcr_write_pcie);
    ppc_dcr_register(env, s->dcrn_base + PEGPL_CFG, s,
                     &dcr_read_pcie, &dcr_write_pcie);
}

void ppc460ex_pcie_init(CPUPPCState *env)
{
    DeviceState *dev;

    dev = qdev_new(TYPE_PPC460EX_PCIE_HOST);
    qdev_prop_set_int32(dev, "dcrn-base", DCRN_PCIE0_BASE);
    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
    ppc460ex_pcie_register_dcrs(PPC460EX_PCIE_HOST(dev), env);

    dev = qdev_new(TYPE_PPC460EX_PCIE_HOST);
    qdev_prop_set_int32(dev, "dcrn-base", DCRN_PCIE1_BASE);
    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
    ppc460ex_pcie_register_dcrs(PPC460EX_PCIE_HOST(dev), env);
}
