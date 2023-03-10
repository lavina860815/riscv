// SPDX-License-Identifier: GPL-2.0+
/*
 * Copyright 2008 Extreme Engineering Solutions, Inc.
 * Copyright 2008 Freescale Semiconductor, Inc.
 *
 * (C) Copyright 2000
 * Wolfgang Denk, DENX Software Engineering, wd@denx.de.
 */

#include <common.h>
#include <asm/mmu.h>

struct fsl_e_tlb_entry tlb_table[] = {
	/* TLB 0 - for temp stack in cache */
	SET_TLB_ENTRY(0, CONFIG_SYS_INIT_RAM_ADDR, CONFIG_SYS_INIT_RAM_ADDR,
		MAS3_SX|MAS3_SW|MAS3_SR, 0,
		0, 0, BOOKE_PAGESZ_4K, 0),
	SET_TLB_ENTRY(0, CONFIG_SYS_INIT_RAM_ADDR + 4 * 1024,
		CONFIG_SYS_INIT_RAM_ADDR + 4 * 1024,
		MAS3_SX|MAS3_SW|MAS3_SR, 0,
		0, 0, BOOKE_PAGESZ_4K, 0),
	SET_TLB_ENTRY(0, CONFIG_SYS_INIT_RAM_ADDR + 8 * 1024,
		CONFIG_SYS_INIT_RAM_ADDR + 8 * 1024,
		MAS3_SX|MAS3_SW|MAS3_SR, 0,
		0, 0, BOOKE_PAGESZ_4K, 0),
	SET_TLB_ENTRY(0, CONFIG_SYS_INIT_RAM_ADDR + 12 * 1024,
		CONFIG_SYS_INIT_RAM_ADDR + 12 * 1024,
		MAS3_SX|MAS3_SW|MAS3_SR, 0,
		0, 0, BOOKE_PAGESZ_4K, 0),

	/* W**G* - NOR flashes */
	/* This will be changed to *I*G* after relocation to RAM. */
	SET_TLB_ENTRY(1, CONFIG_SYS_FLASH_BASE2, CONFIG_SYS_FLASH_BASE2,
		MAS3_SX|MAS3_SW|MAS3_SR, MAS2_W|MAS2_G,
		0, 0, BOOKE_PAGESZ_256M, 1),

	SET_TLB_ENTRY(1, CONFIG_SYS_CCSRBAR, CONFIG_SYS_CCSRBAR_PHYS,
		MAS3_SX|MAS3_SW|MAS3_SR, MAS2_I|MAS2_G,
		0, 1, BOOKE_PAGESZ_1M, 1),

	/* *I*G* - NAND flash */
	SET_TLB_ENTRY(1, CONFIG_SYS_NAND_BASE, CONFIG_SYS_NAND_BASE,
		MAS3_SX|MAS3_SW|MAS3_SR, MAS2_I|MAS2_G,
		0, 2, BOOKE_PAGESZ_1M, 1),

#if CONFIG_PCI1
	/* *I*G* - PCI MEM */
	SET_TLB_ENTRY(1, CONFIG_SYS_PCI1_MEM_PHYS, CONFIG_SYS_PCI1_MEM_PHYS,
		MAS3_SX|MAS3_SW|MAS3_SR, MAS2_I|MAS2_G,
		0, 3, BOOKE_PAGESZ_1G, 1),
#endif

#if CONFIG_PCI2
	/* *I*G* - PCI MEM */
	SET_TLB_ENTRY(1, CONFIG_SYS_PCI2_MEM_PHYS, CONFIG_SYS_PCI2_MEM_PHYS,
		MAS3_SX|MAS3_SW|MAS3_SR, MAS2_I|MAS2_G,
		0, 4, BOOKE_PAGESZ_256M, 1),
#endif

#if defined(CONFIG_PCI1) || defined(CONFIG_PCI2)
	/* *I*G* - PCI IO */
	SET_TLB_ENTRY(1, CONFIG_SYS_PCI1_IO_PHYS, CONFIG_SYS_PCI1_IO_PHYS,
		MAS3_SX|MAS3_SW|MAS3_SR, MAS2_I|MAS2_G,
		0, 5, BOOKE_PAGESZ_16M, 1),
#endif
};

int num_tlb_entries = ARRAY_SIZE(tlb_table);
