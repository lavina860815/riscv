/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * (C) Copyright 2016 Rockchip Electronics Co., Ltd
 * Author: Andy Yan <andy.yan@rock-chips.com>
 */
#ifndef _ASM_ARCH_CRU_RV1108_H
#define _ASM_ARCH_CRU_RV1108_H

#include <common.h>

#define OSC_HZ		(24 * 1000 * 1000)

#define APLL_HZ		(600 * 1000000)
#define GPLL_HZ		(1188 * 1000000)
#define ACLK_PERI_HZ	(148500000)
#define HCLK_PERI_HZ	(148500000)
#define PCLK_PERI_HZ	(74250000)
#define ACLK_BUS_HZ	(148500000)

struct rv1108_clk_priv {
	struct rv1108_cru *cru;
	ulong rate;
};

struct rv1108_cru {
	struct rv1108_pll {
		unsigned int con0;
		unsigned int con1;
		unsigned int con2;
		unsigned int con3;
		unsigned int con4;
		unsigned int con5;
		unsigned int reserved[2];
	} pll[3];
	unsigned int clksel_con[46];
	unsigned int reserved1[2];
	unsigned int clkgate_con[20];
	unsigned int reserved2[4];
	unsigned int softrst_con[13];
	unsigned int reserved3[3];
	unsigned int glb_srst_fst_val;
	unsigned int glb_srst_snd_val;
	unsigned int glb_cnt_th;
	unsigned int misc_con;
	unsigned int glb_rst_con;
	unsigned int glb_rst_st;
	unsigned int sdmmc_con[2];
	unsigned int sdio_con[2];
	unsigned int emmc_con[2];
};
check_member(rv1108_cru, emmc_con[1], 0x01ec);

struct pll_div {
	u32 refdiv;
	u32 fbdiv;
	u32 postdiv1;
	u32 postdiv2;
	u32 frac;
};

enum {
	/* PLL CON0 */
	FBDIV_MASK		= 0xfff,
	FBDIV_SHIFT		= 0,

	/* PLL CON1 */
	POSTDIV2_SHIFT          = 12,
	POSTDIV2_MASK		= 7 << POSTDIV2_SHIFT,
	POSTDIV1_SHIFT          = 8,
	POSTDIV1_MASK		= 7 << POSTDIV1_SHIFT,
	REFDIV_MASK		= 0x3f,
	REFDIV_SHIFT		= 0,

	/* PLL CON2 */
	LOCK_STA_SHIFT          = 31,
	LOCK_STA_MASK		= 1 << LOCK_STA_SHIFT,
	FRACDIV_MASK		= 0xffffff,
	FRACDIV_SHIFT		= 0,

	/* PLL CON3 */
	WORK_MODE_SHIFT         = 8,
	WORK_MODE_MASK		= 1 << WORK_MODE_SHIFT,
	WORK_MODE_SLOW		= 0,
	WORK_MODE_NORMAL	= 1,
	DSMPD_SHIFT             = 3,
	DSMPD_MASK		= 1 << DSMPD_SHIFT,
	INTEGER_MODE			= 1,
	GLOBAL_POWER_DOWN_SHIFT		= 0,
	GLOBAL_POWER_DOWN_MASK		= 1 << GLOBAL_POWER_DOWN_SHIFT,
	GLOBAL_POWER_DOWN		= 1,
	GLOBAL_POWER_UP			= 0,

	/* CLKSEL0_CON */
	CORE_PLL_SEL_SHIFT	= 8,
	CORE_PLL_SEL_MASK	= 3 << CORE_PLL_SEL_SHIFT,
	CORE_PLL_SEL_APLL	= 0,
	CORE_PLL_SEL_GPLL	= 1,
	CORE_PLL_SEL_DPLL	= 2,
	CORE_CLK_DIV_SHIFT	= 0,
	CORE_CLK_DIV_MASK	= 0x1f << CORE_CLK_DIV_SHIFT,

	/* CLKSEL_CON1 */
	PCLK_DBG_DIV_CON_SHIFT		= 4,
	PCLK_DBG_DIV_CON_MASK		= 0xf << PCLK_DBG_DIV_CON_SHIFT,
	ACLK_CORE_DIV_CON_SHIFT		= 0,
	ACLK_CORE_DIV_CON_MASK		= 7 << ACLK_CORE_DIV_CON_SHIFT,

	/* CLKSEL_CON2 */
	ACLK_BUS_PLL_SEL_SHIFT		= 8,
	ACLK_BUS_PLL_SEL_MASK		= 3 << ACLK_BUS_PLL_SEL_SHIFT,
	ACLK_BUS_PLL_SEL_GPLL		= 0,
	ACLK_BUS_PLL_SEL_APLL		= 1,
	ACLK_BUS_PLL_SEL_DPLL		= 2,
	ACLK_BUS_DIV_CON_SHIFT		= 0,
	ACLK_BUS_DIV_CON_MASK		= 0x1f << ACLK_BUS_DIV_CON_SHIFT,
	ACLK_BUS_DIV_CON_WIDTH		= 5,

	/* CLKSEL_CON3 */
	PCLK_BUS_DIV_CON_SHIFT		= 8,
	PCLK_BUS_DIV_CON_MASK		= 0x1f << PCLK_BUS_DIV_CON_SHIFT,
	HCLK_BUS_DIV_CON_SHIFT		= 0,
	HCLK_BUS_DIV_CON_MASK		= 0x1f,

	/* CLKSEL_CON4 */
	CLK_DDR_PLL_SEL_SHIFT		= 8,
	CLK_DDR_PLL_SEL_MASK		= 0x3 << CLK_DDR_PLL_SEL_SHIFT,
	CLK_DDR_DIV_CON_SHIFT		= 0,
	CLK_DDR_DIV_CON_MASK		= 0x3 << CLK_DDR_DIV_CON_SHIFT,

	/* CLKSEL_CON19 */
	CLK_I2C1_PLL_SEL_SHIFT		= 15,
	CLK_I2C1_PLL_SEL_MASK		= 1 << CLK_I2C1_PLL_SEL_SHIFT,
	CLK_I2C1_PLL_SEL_DPLL		= 0,
	CLK_I2C1_PLL_SEL_GPLL		= 1,
	CLK_I2C1_DIV_CON_SHIFT		= 8,
	CLK_I2C1_DIV_CON_MASK		= 0x7f << CLK_I2C1_DIV_CON_SHIFT,
	CLK_I2C0_PLL_SEL_SHIFT		= 7,
	CLK_I2C0_PLL_SEL_MASK		= 1 << CLK_I2C0_PLL_SEL_SHIFT,
	CLK_I2C0_DIV_CON_SHIFT		= 0,
	CLK_I2C0_DIV_CON_MASK		= 0x7f,
	I2C_DIV_CON_WIDTH		= 7,

	/* CLKSEL_CON20 */
	CLK_I2C3_PLL_SEL_SHIFT		= 15,
	CLK_I2C3_PLL_SEL_MASK		= 1 << CLK_I2C3_PLL_SEL_SHIFT,
	CLK_I2C3_PLL_SEL_DPLL		= 0,
	CLK_I2C3_PLL_SEL_GPLL		= 1,
	CLK_I2C3_DIV_CON_SHIFT		= 8,
	CLK_I2C3_DIV_CON_MASK		= 0x7f << CLK_I2C3_DIV_CON_SHIFT,
	CLK_I2C2_PLL_SEL_SHIFT		= 7,
	CLK_I2C2_PLL_SEL_MASK		= 1 << CLK_I2C2_PLL_SEL_SHIFT,
	CLK_I2C2_DIV_CON_SHIFT		= 0,
	CLK_I2C2_DIV_CON_MASK		= 0x7f,

	/* CLKSEL_CON22 */
	CLK_SARADC_DIV_CON_SHIFT= 0,
	CLK_SARADC_DIV_CON_MASK	= GENMASK(9, 0),
	CLK_SARADC_DIV_CON_WIDTH= 10,

	/* CLKSEL_CON23 */
	ACLK_PERI_PLL_SEL_SHIFT		= 15,
	ACLK_PERI_PLL_SEL_MASK		= 1 << ACLK_PERI_PLL_SEL_SHIFT,
	ACLK_PERI_PLL_SEL_GPLL		= 0,
	ACLK_PERI_PLL_SEL_DPLL		= 1,
	PCLK_PERI_DIV_CON_SHIFT		= 10,
	PCLK_PERI_DIV_CON_MASK		= 0x1f << PCLK_PERI_DIV_CON_SHIFT,
	HCLK_PERI_DIV_CON_SHIFT		= 5,
	HCLK_PERI_DIV_CON_MASK		= 0x1f << HCLK_PERI_DIV_CON_SHIFT,
	ACLK_PERI_DIV_CON_SHIFT		= 0,
	ACLK_PERI_DIV_CON_MASK		= 0x1f,
	PERI_DIV_CON_WIDTH		= 5,

	/* CLKSEL24_CON */
	MAC_PLL_SEL_SHIFT	= 12,
	MAC_PLL_SEL_MASK	= 1 << MAC_PLL_SEL_SHIFT,
	MAC_PLL_SEL_APLL	= 0,
	MAC_PLL_SEL_GPLL	= 1,
	RMII_EXTCLK_SEL_SHIFT   = 8,
	RMII_EXTCLK_SEL_MASK	= 1 << RMII_EXTCLK_SEL_SHIFT,
	MAC_CLK_DIV_MASK	= 0x1f,
	MAC_CLK_DIV_SHIFT	= 0,

	/* CLKSEL25_CON */
	EMMC_PLL_SEL_SHIFT	= 12,
	EMMC_PLL_SEL_MASK	= 3 << EMMC_PLL_SEL_SHIFT,
	EMMC_PLL_SEL_DPLL	= 0,
	EMMC_PLL_SEL_GPLL,
	EMMC_PLL_SEL_OSC,

	/* CLKSEL26_CON */
	EMMC_CLK_DIV_SHIFT	= 8,
	EMMC_CLK_DIV_MASK	= 0xff << EMMC_CLK_DIV_SHIFT,

	/* CLKSEL27_CON */
	SFC_PLL_SEL_SHIFT	= 7,
	SFC_PLL_SEL_MASK	= 1 << SFC_PLL_SEL_SHIFT,
	SFC_PLL_SEL_DPLL	= 0,
	SFC_PLL_SEL_GPLL	= 1,
	SFC_CLK_DIV_SHIFT	= 0,
	SFC_CLK_DIV_MASK	= 0x3f << SFC_CLK_DIV_SHIFT,

	/* CLKSEL28_CON */
	ACLK_VIO1_PLL_SEL_SHIFT		= 14,
	ACLK_VIO1_PLL_SEL_MASK		= 3 << ACLK_VIO1_PLL_SEL_SHIFT,
	VIO_PLL_SEL_DPLL		= 0,
	VIO_PLL_SEL_GPLL		= 1,
	ACLK_VIO1_CLK_DIV_SHIFT		= 8,
	ACLK_VIO1_CLK_DIV_MASK		= 0x1f << ACLK_VIO1_CLK_DIV_SHIFT,
	CLK_VIO_DIV_CON_WIDTH		= 5,
	ACLK_VIO0_PLL_SEL_SHIFT		= 6,
	ACLK_VIO0_PLL_SEL_MASK		= 3 << ACLK_VIO0_PLL_SEL_SHIFT,
	ACLK_VIO0_CLK_DIV_SHIFT		= 0,
	ACLK_VIO0_CLK_DIV_MASK		= 0x1f << ACLK_VIO0_CLK_DIV_SHIFT,

	/* CLKSEL29_CON */
	PCLK_VIO_CLK_DIV_SHIFT		= 8,
	PCLK_VIO_CLK_DIV_MASK		= 0x1f << PCLK_VIO_CLK_DIV_SHIFT,
	HCLK_VIO_CLK_DIV_SHIFT		= 0,
	HCLK_VIO_CLK_DIV_MASK		= 0x1f << HCLK_VIO_CLK_DIV_SHIFT,

	/* CLKSEL32_CON */
	DCLK_VOP_SEL_SHIFT		= 7,
	DCLK_VOP_SEL_MASK		= 1 << DCLK_VOP_SEL_SHIFT,
	DCLK_VOP_SEL_HDMI		= 0,
	DCLK_VOP_SEL_PLL		= 1,
	DCLK_VOP_PLL_SEL_SHIFT		= 6,
	DCLK_VOP_PLL_SEL_MASK		= 1 << DCLK_VOP_PLL_SEL_SHIFT,
	DCLK_VOP_PLL_SEL_GPLL		= 0,
	DCLK_VOP_PLL_SEL_DPLL		= 1,
	DCLK_VOP_CLK_DIV_SHIFT		= 0,
	DCLK_VOP_CLK_DIV_MASK		= 0x3f << DCLK_VOP_CLK_DIV_SHIFT,
	DCLK_VOP_DIV_CON_WIDTH		= 6,

	/* SOFTRST1_CON*/
	DDRPHY_SRSTN_CLKDIV_REQ_SHIFT	= 0,
	DDRPHY_SRSTN_CLKDIV_REQ		= 1,
	DDRPHY_SRSTN_CLKDIV_DIS		= 0,
	DDRPHY_SRSTN_CLKDIV_REQ_MASK	= 1 << DDRPHY_SRSTN_CLKDIV_REQ_SHIFT,
	DDRPHY_SRSTN_REQ_SHIFT		= 1,
	DDRPHY_SRSTN_REQ		= 1,
	DDRPHY_SRSTN_DIS		= 0,
	DDRPHY_SRSTN_REQ_MASK		= 1 << DDRPHY_SRSTN_REQ_SHIFT,
	DDRPHY_PSRSTN_REQ_SHIFT		= 2,
	DDRPHY_PSRSTN_REQ		= 1,
	DDRPHY_PSRSTN_DIS		= 0,
	DDRPHY_PSRSTN_REQ_MASK		= 1 << DDRPHY_PSRSTN_REQ_SHIFT,

	/* SOFTRST2_CON*/
	DDRUPCTL_PSRSTN_REQ_SHIFT	= 0,
	DDRUPCTL_PSRSTN_REQ		= 1,
	DDRUPCTL_PSRSTN_DIS		= 0,
	DDRUPCTL_PSRSTN_REQ_MASK	= 1 << DDRUPCTL_PSRSTN_REQ_SHIFT,
	DDRUPCTL_NSRSTN_REQ_SHIFT	= 1,
	DDRUPCTL_NSRSTN_REQ		= 1,
	DDRUPCTL_NSRSTN_DIS		= 0,
	DDRUPCTL_NSRSTN_REQ_MASK	= 1 << DDRUPCTL_NSRSTN_REQ_SHIFT,
};
#endif
