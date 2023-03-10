// SPDX-License-Identifier: GPL-2.0+
/*
 * Copyright 2014 Freescale Semiconductor, Inc.
 */

#include <common.h>
#include <asm/fsl_law.h>
#include <asm/mmu.h>

struct law_entry law_table[] = {
#ifdef CONFIG_MTD_NOR_FLASH
	SET_LAW(CONFIG_SYS_FLASH_BASE_PHYS, LAW_SIZE_256M, LAW_TRGT_IF_IFC),
#endif
#ifdef CONFIG_SYS_BMAN_MEM_PHYS
	SET_LAW(CONFIG_SYS_BMAN_MEM_PHYS, LAW_SIZE_32M, LAW_TRGT_IF_BMAN),
#endif
#ifdef CONFIG_SYS_QMAN_MEM_PHYS
	SET_LAW(CONFIG_SYS_QMAN_MEM_PHYS, LAW_SIZE_32M, LAW_TRGT_IF_QMAN),
#endif
#ifdef QIXIS_BASE_PHYS
	SET_LAW(QIXIS_BASE_PHYS, LAW_SIZE_4K, LAW_TRGT_IF_IFC),
#endif
#ifdef CONFIG_SYS_DCSRBAR_PHYS
	SET_LAW(CONFIG_SYS_DCSRBAR_PHYS, LAW_SIZE_4M, LAW_TRGT_IF_DCSR),
#endif
#ifdef CONFIG_SYS_NAND_BASE_PHYS
	SET_LAW(CONFIG_SYS_NAND_BASE_PHYS, LAW_SIZE_64K, LAW_TRGT_IF_IFC),
#endif
};

int num_law_entries = ARRAY_SIZE(law_table);
