/* SPDX-License-Identifier: GPL-2.0 */
/*
 * Copyright (C) Marvell International Ltd. and its affiliates
 */

#ifndef __AXP_VARS_H
#define __AXP_VARS_H

#include "ddr3_axp_config.h"
#include "ddr3_axp_mc_static.h"
#include "ddr3_axp_training_static.h"

MV_DRAM_MODES ddr_modes[MV_DDR3_MODES_NUMBER] = {
	/*      Conf name               CPUFreq         FabFreq         Chip ID Chip/Board      MC regs                 Training Values */
	/* db board values: */
	{"db_800-400", 0xA, 0x5, 0x0, A0, ddr3_A0_db_400, NULL},
	{"db_1200-300", 0x2, 0xC, 0x0, A0, ddr3_A0_db_400, NULL},
	{"db_1200-600", 0x2, 0x5, 0x0, A0, NULL, NULL},
	{"db_1333-667", 0x3, 0x5, 0x0, A0, ddr3_A0_db_667, ddr3_db_rev2_667},
	{"db_1600-800", 0xB, 0x5, 0x0, A0, ddr3_A0_db_667, ddr3_db_rev2_800},
	{"amc_1333-667", 0x3, 0x5, 0x0, A0_AMC, ddr3_A0_AMC_667, NULL},
	{"db_667-667", 0x9, 0x13, 0x0, Z1, ddr3_Z1_db_600, ddr3_db_667},
	{"db_800-400", 0xA, 0x1, 0x0, Z1, ddr3_Z1_db_300, ddr3_db_400},
	{"db_1066-533", 0x1, 0x1, 0x0, Z1, ddr3_Z1_db_300, ddr3_db_533},
	{"db_1200-300", 0x2, 0xC, 0x0, Z1, ddr3_Z1_db_300, ddr3_db_667},
	{"db_1200-600", 0x2, 0x5, 0x0, Z1, ddr3_Z1_db_600, NULL},
	{"db_1333-333", 0x3, 0xC, 0x0, Z1, ddr3_Z1_db_300, ddr3_db_400},
	{"db_1333-667", 0x3, 0x5, 0x0, Z1, ddr3_Z1_db_600, ddr3_db_667},
	/* pcac board values (Z1 device): */
	{"pcac_1200-600", 0x2, 0x5, 0x0, Z1_PCAC, ddr3_Z1_db_600,
	 ddr3_pcac_600},
	/* rd board values (Z1 device): */
	{"rd_667_0", 0x3, 0x5, 0x0, Z1_RD_SLED, ddr3_Z1_db_600, ddr3_rd_667_0},
	{"rd_667_1", 0x3, 0x5, 0x1, Z1_RD_SLED, ddr3_Z1_db_600, ddr3_rd_667_1},
	{"rd_667_2", 0x3, 0x5, 0x2, Z1_RD_SLED, ddr3_Z1_db_600, ddr3_rd_667_2},
	{"rd_667_3", 0x3, 0x5, 0x3, Z1_RD_SLED, ddr3_Z1_db_600, ddr3_rd_667_3}
};

/* ODT settings - if needed update the following tables: (ODT_OPT - represents the CS configuration bitmap) */

u16 odt_static[ODT_OPT][MAX_CS] = {	/*        NearEnd/FarEnd */
	{0, 0, 0, 0},		/* 0000         0/0 - Not supported */
	{ODT40, 0, 0, 0},	/* 0001         0/1 */
	{0, 0, 0, 0},		/* 0010         0/0 - Not supported */
	{ODT40, ODT40, 0, 0},	/* 0011         0/2 */
	{0, 0, ODT40, 0},	/* 0100         1/0 */
	{ODT30, 0, ODT30, 0},	/* 0101         1/1 */
	{0, 0, 0, 0},		/* 0110         0/0 - Not supported */
	{ODT120, ODT20, ODT20, 0},	/* 0111         1/2 */
	{0, 0, 0, 0},		/* 1000         0/0 - Not supported */
	{0, 0, 0, 0},		/* 1001         0/0 - Not supported */
	{0, 0, 0, 0},		/* 1010         0/0 - Not supported */
	{0, 0, 0, 0},		/* 1011         0/0 - Not supported */
	{0, 0, ODT40, 0},	/* 1100         2/0 */
	{ODT20, 0, ODT120, ODT20},	/* 1101         2/1 */
	{0, 0, 0, 0},		/* 1110         0/0 - Not supported */
	{ODT120, ODT30, ODT120, ODT30}	/* 1111         2/2 */
};

u16 odt_dynamic[ODT_OPT][MAX_CS] = {	/*        NearEnd/FarEnd */
	{0, 0, 0, 0},		/* 0000         0/0 */
	{0, 0, 0, 0},		/* 0001         0/1 */
	{0, 0, 0, 0},		/* 0010         0/0 - Not supported */
	{0, 0, 0, 0},		/* 0011         0/2 */
	{0, 0, 0, 0},		/* 0100         1/0 */
	{ODT120D, 0, ODT120D, 0},	/* 0101         1/1 */
	{0, 0, 0, 0},		/* 0110         0/0 - Not supported */
	{0, 0, ODT120D, 0},	/* 0111         1/2 */
	{0, 0, 0, 0},		/* 1000         0/0 - Not supported */
	{0, 0, 0, 0},		/* 1001         0/0 - Not supported */
	{0, 0, 0, 0},		/* 1010         0/0 - Not supported */
	{0, 0, 0, 0},		/* 1011         0/0 - Not supported */
	{0, 0, 0, 0},		/* 1100         2/0 */
	{ODT120D, 0, 0, 0},	/* 1101         2/1 */
	{0, 0, 0, 0},		/* 1110         0/0 - Not supported */
	{0, 0, 0, 0}		/* 1111         2/2 */
};

u32 odt_config[ODT_OPT] = {
	0, 0x00010000, 0, 0x00030000, 0x04000000, 0x05050104, 0, 0x07430340, 0,
	    0, 0, 0,
	0x30000, 0x1C0D100C, 0, 0x3CC330C0
};

/*
 * User can manually set SPD values (in case SPD is not available on
 * DIMM/System).
 * SPD Values can simplify calculating the DUNIT registers values
 */
u8 spd_data[SPD_SIZE] = {
	/* AXP DB Board DIMM SPD Values - manually set */
	0x92, 0x10, 0x0B, 0x2, 0x3, 0x19, 0x0, 0x9, 0x09, 0x52, 0x1, 0x8, 0x0C,
	0x0, 0x7E, 0x0, 0x69, 0x78,
	0x69, 0x30, 0x69, 0x11, 0x20, 0x89, 0x0, 0x5, 0x3C, 0x3C, 0x0, 0xF0,
	0x82, 0x5, 0x80, 0x0, 0x0, 0x0,
	0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
	0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
	0x0, 0x0, 0x0, 0x0, 0x0F, 0x1, 0x3, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
	0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
	0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
	0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
	0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
	0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
	0x0, 0x80, 0x2C, 0x1, 0x10, 0x23, 0x35, 0x28, 0xEB, 0xCA, 0x19, 0x8F
};

/*
 * Controller Specific configurations Starts Here - DO NOT MODIFY
 */

/* Frequency - values are 1/HCLK in ps */
u32 cpu_fab_clk_to_hclk[FAB_OPT][CLK_CPU] =
/* CPU Frequency:
	1000	1066	1200	1333	1500	1666	1800	2000	600		667		800		1600	Fabric */
{
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 3000, 2500, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 4500, 3750, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 2500, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{4000, 3750, 3333, 3000, 2666, 2400, 0, 0, 0, 0, 5000, 2500},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 3000, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{2500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 5000, 0, 4000, 0, 0, 0, 0, 0, 0, 3750},
	{5000, 0, 0, 3750, 3333, 0, 0, 0, 0, 0, 0, 3125},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 3330, 3000, 0, 0, 0, 0, 0, 0, 0, 2500},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3750},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 3000, 2500, 0},
	{3000, 0, 2500, 0, 0, 0, 0, 0, 0, 0, 3750, 0}
};

u32 cpu_ddr_ratios[FAB_OPT][CLK_CPU] =
/* CPU Frequency:
	1000	1066	1200	1333	1500	1666	1800	2000	600		667		800		1600	Fabric */
{
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, DDR_333, DDR_400, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, DDR_444, DDR_533, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, DDR_400, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{DDR_500, DDR_533, DDR_600, DDR_666, DDR_750, DDR_833, 0, 0, 0, 0,
	 DDR_400, DDR_800},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, DDR_333, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{DDR_400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, DDR_400, 0, DDR_500, 0, 0, 0, 0, 0, 0, DDR_533},
	{DDR_400, 0, 0, DDR_533, DDR_600, 0, 0, 0, 0, 0, 0, DDR_640},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, DDR_300, DDR_333, 0, 0, 0, 0, 0, 0, 0, DDR_400},
	{0, 0, 0, 0, 0, 0, DDR_600, DDR_666, 0, 0, 0, DDR_533},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, DDR_666, DDR_800, 0},
	{DDR_666, 0, DDR_800, 0, 0, 0, 0, 0, 0, 0, DDR_533, 0}
};

u8 div_ratio1to1[CLK_VCO][CLK_DDR] =
/* DDR Frequency:
	100		300	360	400	444	500	533	600	666	750	800	833  */
{ {0xA, 3, 0, 3, 0, 2, 0, 0, 0, 0, 0, 0},	/*  1:1     CLK_CPU_1000  */
{0xB, 3, 0, 3, 0, 0, 2, 0, 0, 0, 0, 0},	/*  1:1     CLK_CPU_1066  */
{0xC, 4, 0, 3, 0, 0, 0, 2, 0, 0, 0, 0},	/*  1:1     CLK_CPU_1200  */
{0xD, 4, 0, 4, 0, 0, 0, 0, 2, 0, 0, 0},	/*      1:1     CLK_CPU_1333  */
{0xF, 5, 0, 4, 0, 3, 0, 0, 0, 0, 0, 0},	/*      1:1     CLK_CPU_1500  */
{0x11, 5, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0},	/*      1:1     CLK_CPU_1666  */
{0x12, 6, 5, 4, 0, 0, 0, 3, 0, 0, 0, 0},	/*      1:1     CLK_CPU_1800  */
{0x14, 7, 0, 5, 0, 4, 0, 0, 3, 0, 0, 0},	/*      1:1     CLK_CPU_2000  */
{0x6, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0},	/*      1:1 CLK_CPU_600   */
{0x6, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0},	/*      1:1     CLK_CPU_667   */
{0x8, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0},	/*      1:1 CLK_CPU_800   */
{0x10, 5, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0},	/*      1:1 CLK_CPU_1600   */
{0x14, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0},	/*  1:1     CLK_CPU_1000 VCO_2000 */
{0x15, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0},	/*  1:1     CLK_CPU_1066 VCO_2133 */
{0x18, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0},	/*  1:1     CLK_CPU_1200 VCO_2400 */
{0x1A, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0},	/*      1:1     CLK_CPU_1333 VCO_2666 */
{0x1E, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0},	/*      1:1     CLK_CPU_1500 VCO_3000 */
{0x21, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0},	/*      1:1     CLK_CPU_1666 VCO_3333 */
{0x24, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0},	/*      1:1     CLK_CPU_1800 VCO_3600 */
{0x28, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0},	/*      1:1     CLK_CPU_2000 VCO_4000 */
{0xC, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0},	/*      1:1 CLK_CPU_600 VCO_1200 */
{0xD, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0},	/*      1:1     CLK_CPU_667 VCO_1333 */
{0x10, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0},	/*  1:1 CLK_CPU_800 VCO_1600 */
{0x20, 10, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0}	/*      1:1 CLK_CPU_1600 VCO_3200 */
};

u8 div_ratio2to1[CLK_VCO][CLK_DDR] =
/* DDR Frequency:
		100	300	360	400	444	500	533	600	666	750	800	833  */
{ {0, 0, 0, 0, 0, 2, 0, 0, 3, 0, 0, 0},	/*      2:1     CLK_CPU_1000  */
{0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},	/*      2:1     CLK_CPU_1066  */
{0, 0, 0, 3, 5, 0, 0, 2, 0, 0, 3, 3},	/*      2:1     CLK_CPU_1200  */
{0, 0, 0, 0, 0, 0, 5, 0, 2, 0, 3, 0},	/*      2:1     CLK_CPU_1333  */
{0, 0, 0, 0, 0, 3, 0, 5, 0, 2, 0, 0},	/*      2:1     CLK_CPU_1500  */
{0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 2},	/*      2:1     CLK_CPU_1666  */
{0, 0, 0, 0, 0, 0, 0, 3, 0, 5, 0, 0},	/*      2:1     CLK_CPU_1800  */
{0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 5},	/*      2:1     CLK_CPU_2000  */
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},	/*      2:1     CLK_CPU_600   */
{0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0},	/*  2:1 CLK_CPU_667   */
{0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1, 0},	/*      2:1 CLK_CPU_800   */
{0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 2, 0},	/*      2:1 CLK_CPU_1600   */
{0, 0, 0, 5, 0, 0, 0, 0, 3, 0, 0, 0},	/*      2:1     CLK_CPU_1000 VCO_2000 */
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},	/*      2:1     CLK_CPU_1066 VCO_2133 */
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0},	/*      2:1     CLK_CPU_1200 VCO_2400 */
{0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0},	/*      2:1     CLK_CPU_1333 VCO_2666 */
{0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0},	/*      2:1     CLK_CPU_1500 VCO_3000 */
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},	/*      2:1     CLK_CPU_1666 VCO_3333 */
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},	/*      2:1     CLK_CPU_1800 VCO_3600 */
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},	/*      2:1     CLK_CPU_2000 VCO_4000 */
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},	/*      2:1     CLK_CPU_600 VCO_1200 */
{0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0},	/*  2:1 CLK_CPU_667 VCO_1333 */
{0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0},	/*      2:1 CLK_CPU_800 VCO_1600 */
{0, 0, 0, 0, 0, 0, 0, 5, 5, 0, 0, 0}	/*      2:1 CLK_CPU_1600 VCO_3200 */
};

#endif /* __AXP_VARS_H */
