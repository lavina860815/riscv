/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * Copyright (C) 2016, Bin Meng <bmeng.cn@gmail.com>
 */

#include <asm/arch/device.h>

#define PCI_DEV_PIRQ_ROUTES \
	PCI_DEV_PIRQ_ROUTE(GFX_DEV,	A, A, A, A), \
	PCI_DEV_PIRQ_ROUTE(EMMC_DEV,	A, A, A, A), \
	PCI_DEV_PIRQ_ROUTE(SDIO_DEV,	A, A, A, A), \
	PCI_DEV_PIRQ_ROUTE(SD_DEV,	A, A, A, A), \
	PCI_DEV_PIRQ_ROUTE(SATA_DEV,	A, A, A, A), \
	PCI_DEV_PIRQ_ROUTE(XHCI_DEV,	A, A, A, A), \
	PCI_DEV_PIRQ_ROUTE(LPE_DEV,	A, A, A, A), \
	PCI_DEV_PIRQ_ROUTE(MMC45_DEV,	A, A, A, A), \
	PCI_DEV_PIRQ_ROUTE(SIO1_DEV,	A, B, C, D), \
	PCI_DEV_PIRQ_ROUTE(TXE_DEV,	A, A, A, A), \
	PCI_DEV_PIRQ_ROUTE(HDA_DEV,	A, A, A, A), \
	PCI_DEV_PIRQ_ROUTE(PCIE_DEV,	A, B, C, D), \
	PCI_DEV_PIRQ_ROUTE(EHCI_DEV,	A, A, A, A), \
	PCI_DEV_PIRQ_ROUTE(SIO2_DEV,	A, B, C, D), \
	PCI_DEV_PIRQ_ROUTE(PCU_DEV,	A, B, C, D)

#define PCIE_BRIDGE_IRQ_ROUTES \
	PCIE_BRIDGE_DEV(RP, PCIE_DEV,	A, B, C, D)
