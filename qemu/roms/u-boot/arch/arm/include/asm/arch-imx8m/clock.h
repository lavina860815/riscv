/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * Copyright 2017 NXP
 *
 * Peng Fan <peng.fan@nxp.com>
 */

#ifndef _ASM_ARCH_IMX8M_CLOCK_H
#define _ASM_ARCH_IMX8M_CLOCK_H

#include <linux/bitops.h>

#define MHZ(X)	((X) * 1000000UL)

enum pll_clocks {
	ANATOP_ARM_PLL,
	ANATOP_GPU_PLL,
	ANATOP_SYSTEM_PLL1,
	ANATOP_SYSTEM_PLL2,
	ANATOP_SYSTEM_PLL3,
	ANATOP_AUDIO_PLL1,
	ANATOP_AUDIO_PLL2,
	ANATOP_VIDEO_PLL1,
	ANATOP_VIDEO_PLL2,
	ANATOP_DRAM_PLL,
};

enum clk_slice_type {
	CORE_CLOCK_SLICE,
	BUS_CLOCK_SLICE,
	IP_CLOCK_SLICE,
	AHB_CLOCK_SLICE,
	IPG_CLOCK_SLICE,
	CORE_SEL_CLOCK_SLICE,
	DRAM_SEL_CLOCK_SLICE,
};

enum clk_root_index {
	MXC_ARM_CLK			= 0,
	ARM_A53_CLK_ROOT		= 0,
	ARM_M4_CLK_ROOT			= 1,
	VPU_A53_CLK_ROOT		= 2,
	GPU_CORE_CLK_ROOT		= 3,
	GPU_SHADER_CLK_ROOT		= 4,
	MAIN_AXI_CLK_ROOT		= 16,
	ENET_AXI_CLK_ROOT		= 17,
	NAND_USDHC_BUS_CLK_ROOT		= 18,
	VPU_BUS_CLK_ROOT		= 19,
	DISPLAY_AXI_CLK_ROOT		= 20,
	DISPLAY_APB_CLK_ROOT		= 21,
	DISPLAY_RTRM_CLK_ROOT		= 22,
	USB_BUS_CLK_ROOT		= 23,
	GPU_AXI_CLK_ROOT		= 24,
	GPU_AHB_CLK_ROOT		= 25,
	NOC_CLK_ROOT			= 26,
	NOC_APB_CLK_ROOT		= 27,
	AHB_CLK_ROOT			= 32,
	IPG_CLK_ROOT			= 33,
	MXC_IPG_CLK			= 33,
	AUDIO_AHB_CLK_ROOT		= 34,
	MIPI_DSI_ESC_RX_CLK_ROOT	= 36,
	DRAM_SEL_CFG			= 48,
	CORE_SEL_CFG			= 49,
	DRAM_ALT_CLK_ROOT		= 64,
	DRAM_APB_CLK_ROOT		= 65,
	VPU_G1_CLK_ROOT			= 66,
	VPU_G2_CLK_ROOT			= 67,
	DISPLAY_DTRC_CLK_ROOT		= 68,
	DISPLAY_DC8000_CLK_ROOT		= 69,
	PCIE1_CTRL_CLK_ROOT		= 70,
	PCIE1_PHY_CLK_ROOT		= 71,
	PCIE1_AUX_CLK_ROOT		= 72,
	DC_PIXEL_CLK_ROOT		= 73,
	LCDIF_PIXEL_CLK_ROOT		= 74,
	SAI1_CLK_ROOT			= 75,
	SAI2_CLK_ROOT			= 76,
	SAI3_CLK_ROOT			= 77,
	SAI4_CLK_ROOT			= 78,
	SAI5_CLK_ROOT			= 79,
	SAI6_CLK_ROOT			= 80,
	SPDIF1_CLK_ROOT			= 81,
	SPDIF2_CLK_ROOT			= 82,
	ENET_REF_CLK_ROOT		= 83,
	ENET_TIMER_CLK_ROOT		= 84,
	ENET_PHY_REF_CLK_ROOT		= 85,
	NAND_CLK_ROOT			= 86,
	QSPI_CLK_ROOT			= 87,
	MXC_ESDHC_CLK			= 88,
	USDHC1_CLK_ROOT			= 88,
	MXC_ESDHC2_CLK			= 89,
	USDHC2_CLK_ROOT			= 89,
	I2C1_CLK_ROOT			= 90,
	MXC_I2C_CLK			= 90,
	I2C2_CLK_ROOT			= 91,
	I2C3_CLK_ROOT			= 92,
	I2C4_CLK_ROOT			= 93,
	UART1_CLK_ROOT			= 94,
	UART2_CLK_ROOT			= 95,
	UART3_CLK_ROOT			= 96,
	UART4_CLK_ROOT			= 97,
	USB_CORE_REF_CLK_ROOT		= 98,
	USB_PHY_REF_CLK_ROOT		= 99,
	GIC_CLK_ROOT			= 100,
	ECSPI1_CLK_ROOT			= 101,
	ECSPI2_CLK_ROOT			= 102,
	PWM1_CLK_ROOT			= 103,
	PWM2_CLK_ROOT			= 104,
	PWM3_CLK_ROOT			= 105,
	PWM4_CLK_ROOT			= 106,
	GPT1_CLK_ROOT			= 107,
	GPT2_CLK_ROOT			= 108,
	GPT3_CLK_ROOT			= 109,
	GPT4_CLK_ROOT			= 110,
	GPT5_CLK_ROOT			= 111,
	GPT6_CLK_ROOT			= 112,
	TRACE_CLK_ROOT			= 113,
	WDOG_CLK_ROOT			= 114,
	WRCLK_CLK_ROOT			= 115,
	IPP_DO_CLKO1			= 116,
	IPP_DO_CLKO2			= 117,
	MIPI_DSI_CORE_CLK_ROOT		= 118,
	MIPI_DSI_PHY_REF_CLK_ROOT	= 119,
	MIPI_DSI_DBI_CLK_ROOT		= 120,
	OLD_MIPI_DSI_ESC_CLK_ROOT	= 121,
	MIPI_CSI1_CORE_CLK_ROOT		= 122,
	MIPI_CSI1_PHY_REF_CLK_ROOT	= 123,
	MIPI_CSI1_ESC_CLK_ROOT		= 124,
	MIPI_CSI2_CORE_CLK_ROOT		= 125,
	MIPI_CSI2_PHY_REF_CLK_ROOT	= 126,
	MIPI_CSI2_ESC_CLK_ROOT		= 127,
	PCIE2_CTRL_CLK_ROOT		= 128,
	PCIE2_PHY_CLK_ROOT		= 129,
	PCIE2_AUX_CLK_ROOT		= 130,
	ECSPI3_CLK_ROOT			= 131,
	OLD_MIPI_DSI_ESC_RX_ROOT	= 132,
	DISPLAY_HDMI_CLK_ROOT		= 133,
	CLK_ROOT_MAX,
};

enum clk_root_src {
	OSC_25M_CLK,
	ARM_PLL_CLK,
	DRAM_PLL1_CLK,
	VIDEO_PLL2_CLK,
	VPU_PLL_CLK,
	GPU_PLL_CLK,
	SYSTEM_PLL1_800M_CLK,
	SYSTEM_PLL1_400M_CLK,
	SYSTEM_PLL1_266M_CLK,
	SYSTEM_PLL1_200M_CLK,
	SYSTEM_PLL1_160M_CLK,
	SYSTEM_PLL1_133M_CLK,
	SYSTEM_PLL1_100M_CLK,
	SYSTEM_PLL1_80M_CLK,
	SYSTEM_PLL1_40M_CLK,
	SYSTEM_PLL2_1000M_CLK,
	SYSTEM_PLL2_500M_CLK,
	SYSTEM_PLL2_333M_CLK,
	SYSTEM_PLL2_250M_CLK,
	SYSTEM_PLL2_200M_CLK,
	SYSTEM_PLL2_166M_CLK,
	SYSTEM_PLL2_125M_CLK,
	SYSTEM_PLL2_100M_CLK,
	SYSTEM_PLL2_50M_CLK,
	SYSTEM_PLL3_CLK,
	AUDIO_PLL1_CLK,
	AUDIO_PLL2_CLK,
	VIDEO_PLL_CLK,
	OSC_32K_CLK,
	EXT_CLK_1,
	EXT_CLK_2,
	EXT_CLK_3,
	EXT_CLK_4,
	OSC_27M_CLK,
};

/* CCGR index */
enum clk_ccgr_index {
	CCGR_DVFS = 0,
	CCGR_ANAMIX = 1,
	CCGR_CPU = 2,
	CCGR_CSU = 4,
	CCGR_DRAM1 = 5,
	CCGR_DRAM2_OBSOLETE = 6,
	CCGR_ECSPI1 = 7,
	CCGR_ECSPI2 = 8,
	CCGR_ECSPI3 = 9,
	CCGR_ENET1 = 10,
	CCGR_GPIO1 = 11,
	CCGR_GPIO2 = 12,
	CCGR_GPIO3 = 13,
	CCGR_GPIO4 = 14,
	CCGR_GPIO5 = 15,
	CCGR_GPT1 = 16,
	CCGR_GPT2 = 17,
	CCGR_GPT3 = 18,
	CCGR_GPT4 = 19,
	CCGR_GPT5 = 20,
	CCGR_GPT6 = 21,
	CCGR_HS = 22,
	CCGR_I2C1 = 23,
	CCGR_I2C2 = 24,
	CCGR_I2C3 = 25,
	CCGR_I2C4 = 26,
	CCGR_IOMUX = 27,
	CCGR_IOMUX1 = 28,
	CCGR_IOMUX2 = 29,
	CCGR_IOMUX3 = 30,
	CCGR_IOMUX4 = 31,
	CCGR_M4 = 32,
	CCGR_MU = 33,
	CCGR_OCOTP = 34,
	CCGR_OCRAM = 35,
	CCGR_OCRAM_S = 36,
	CCGR_PCIE = 37,
	CCGR_PERFMON1 = 38,
	CCGR_PERFMON2 = 39,
	CCGR_PWM1 = 40,
	CCGR_PWM2 = 41,
	CCGR_PWM3 = 42,
	CCGR_PWM4 = 43,
	CCGR_QOS = 44,
	CCGR_DISMIX = 45,
	CCGR_MEGAMIX = 46,
	CCGR_QSPI = 47,
	CCGR_RAWNAND = 48,
	CCGR_RDC = 49,
	CCGR_ROM = 50,
	CCGR_SAI1 = 51,
	CCGR_SAI2 = 52,
	CCGR_SAI3 = 53,
	CCGR_SAI4 = 54,
	CCGR_SAI5 = 55,
	CCGR_SAI6 = 56,
	CCGR_SCTR = 57,
	CCGR_SDMA1 = 58,
	CCGR_SDMA2 = 59,
	CCGR_SEC_DEBUG = 60,
	CCGR_SEMA1 = 61,
	CCGR_SEMA2 = 62,
	CCGR_SIM_DISPLAY = 63,
	CCGR_SIM_ENET = 64,
	CCGR_SIM_M = 65,
	CCGR_SIM_MAIN = 66,
	CCGR_SIM_S = 67,
	CCGR_SIM_WAKEUP = 68,
	CCGR_SIM_USB = 69,
	CCGR_SIM_VPU = 70,
	CCGR_SNVS = 71,
	CCGR_TRACE = 72,
	CCGR_UART1 = 73,
	CCGR_UART2 = 74,
	CCGR_UART3 = 75,
	CCGR_UART4 = 76,
	CCGR_USB_CTRL1 = 77,
	CCGR_USB_CTRL2 = 78,
	CCGR_USB_PHY1 = 79,
	CCGR_USB_PHY2 = 80,
	CCGR_USDHC1 = 81,
	CCGR_USDHC2 = 82,
	CCGR_WDOG1 = 83,
	CCGR_WDOG2 = 84,
	CCGR_WDOG3 = 85,
	CCGR_VA53 = 86,
	CCGR_GPU = 87,
	CCGR_HEVC = 88,
	CCGR_AVC = 89,
	CCGR_VP9 = 90,
	CCGR_HEVC_INTER = 91,
	CCGR_GIC = 92,
	CCGR_DISPLAY = 93,
	CCGR_HDMI = 94,
	CCGR_HDMI_PHY = 95,
	CCGR_XTAL = 96,
	CCGR_PLL = 97,
	CCGR_TSENSOR = 98,
	CCGR_VPU_DEC = 99,
	CCGR_PCIE2 = 100,
	CCGR_MIPI_CSI1 = 101,
	CCGR_MIPI_CSI2 = 102,
	CCGR_MAX,
};

/* src index */
enum clk_src_index {
	CLK_SRC_CKIL_SYNC_REQ = 0,
	CLK_SRC_ARM_PLL_EN = 1,
	CLK_SRC_GPU_PLL_EN = 2,
	CLK_SRC_VPU_PLL_EN = 3,
	CLK_SRC_DRAM_PLL_EN = 4,
	CLK_SRC_SYSTEM_PLL1_EN = 5,
	CLK_SRC_SYSTEM_PLL2_EN = 6,
	CLK_SRC_SYSTEM_PLL3_EN = 7,
	CLK_SRC_AUDIO_PLL1_EN = 8,
	CLK_SRC_AUDIO_PLL2_EN = 9,
	CLK_SRC_VIDEO_PLL1_EN = 10,
	CLK_SRC_VIDEO_PLL2_EN = 11,
	CLK_SRC_ARM_PLL = 12,
	CLK_SRC_GPU_PLL = 13,
	CLK_SRC_VPU_PLL = 14,
	CLK_SRC_DRAM_PLL = 15,
	CLK_SRC_SYSTEM_PLL1_800M = 16,
	CLK_SRC_SYSTEM_PLL1_400M = 17,
	CLK_SRC_SYSTEM_PLL1_266M = 18,
	CLK_SRC_SYSTEM_PLL1_200M = 19,
	CLK_SRC_SYSTEM_PLL1_160M = 20,
	CLK_SRC_SYSTEM_PLL1_133M = 21,
	CLK_SRC_SYSTEM_PLL1_100M = 22,
	CLK_SRC_SYSTEM_PLL1_80M = 23,
	CLK_SRC_SYSTEM_PLL1_40M = 24,
	CLK_SRC_SYSTEM_PLL2_1000M = 25,
	CLK_SRC_SYSTEM_PLL2_500M = 26,
	CLK_SRC_SYSTEM_PLL2_333M = 27,
	CLK_SRC_SYSTEM_PLL2_250M = 28,
	CLK_SRC_SYSTEM_PLL2_200M = 29,
	CLK_SRC_SYSTEM_PLL2_166M = 30,
	CLK_SRC_SYSTEM_PLL2_125M = 31,
	CLK_SRC_SYSTEM_PLL2_100M = 32,
	CLK_SRC_SYSTEM_PLL2_50M = 33,
	CLK_SRC_SYSTEM_PLL3 = 34,
	CLK_SRC_AUDIO_PLL1 = 35,
	CLK_SRC_AUDIO_PLL2 = 36,
	CLK_SRC_VIDEO_PLL1 = 37,
	CLK_SRC_VIDEO_PLL2 = 38,
	CLK_SRC_OSC_25M = 39,
	CLK_SRC_OSC_27M = 40,
};

enum root_pre_div {
	CLK_ROOT_PRE_DIV1 = 0,
	CLK_ROOT_PRE_DIV2,
	CLK_ROOT_PRE_DIV3,
	CLK_ROOT_PRE_DIV4,
	CLK_ROOT_PRE_DIV5,
	CLK_ROOT_PRE_DIV6,
	CLK_ROOT_PRE_DIV7,
	CLK_ROOT_PRE_DIV8,
};

enum root_post_div {
	CLK_ROOT_POST_DIV1 = 0,
	CLK_ROOT_POST_DIV2,
	CLK_ROOT_POST_DIV3,
	CLK_ROOT_POST_DIV4,
	CLK_ROOT_POST_DIV5,
	CLK_ROOT_POST_DIV6,
	CLK_ROOT_POST_DIV7,
	CLK_ROOT_POST_DIV8,
	CLK_ROOT_POST_DIV9,
	CLK_ROOT_POST_DIV10,
	CLK_ROOT_POST_DIV11,
	CLK_ROOT_POST_DIV12,
	CLK_ROOT_POST_DIV13,
	CLK_ROOT_POST_DIV14,
	CLK_ROOT_POST_DIV15,
	CLK_ROOT_POST_DIV16,
	CLK_ROOT_POST_DIV17,
	CLK_ROOT_POST_DIV18,
	CLK_ROOT_POST_DIV19,
	CLK_ROOT_POST_DIV20,
	CLK_ROOT_POST_DIV21,
	CLK_ROOT_POST_DIV22,
	CLK_ROOT_POST_DIV23,
	CLK_ROOT_POST_DIV24,
	CLK_ROOT_POST_DIV25,
	CLK_ROOT_POST_DIV26,
	CLK_ROOT_POST_DIV27,
	CLK_ROOT_POST_DIV28,
	CLK_ROOT_POST_DIV29,
	CLK_ROOT_POST_DIV30,
	CLK_ROOT_POST_DIV31,
	CLK_ROOT_POST_DIV32,
	CLK_ROOT_POST_DIV33,
	CLK_ROOT_POST_DIV34,
	CLK_ROOT_POST_DIV35,
	CLK_ROOT_POST_DIV36,
	CLK_ROOT_POST_DIV37,
	CLK_ROOT_POST_DIV38,
	CLK_ROOT_POST_DIV39,
	CLK_ROOT_POST_DIV40,
	CLK_ROOT_POST_DIV41,
	CLK_ROOT_POST_DIV42,
	CLK_ROOT_POST_DIV43,
	CLK_ROOT_POST_DIV44,
	CLK_ROOT_POST_DIV45,
	CLK_ROOT_POST_DIV46,
	CLK_ROOT_POST_DIV47,
	CLK_ROOT_POST_DIV48,
	CLK_ROOT_POST_DIV49,
	CLK_ROOT_POST_DIV50,
	CLK_ROOT_POST_DIV51,
	CLK_ROOT_POST_DIV52,
	CLK_ROOT_POST_DIV53,
	CLK_ROOT_POST_DIV54,
	CLK_ROOT_POST_DIV55,
	CLK_ROOT_POST_DIV56,
	CLK_ROOT_POST_DIV57,
	CLK_ROOT_POST_DIV58,
	CLK_ROOT_POST_DIV59,
	CLK_ROOT_POST_DIV60,
	CLK_ROOT_POST_DIV61,
	CLK_ROOT_POST_DIV62,
	CLK_ROOT_POST_DIV63,
	CLK_ROOT_POST_DIV64,
};

struct clk_root_map {
	enum clk_root_index entry;
	enum clk_slice_type slice_type;
	u32 slice_index;
	u8 src_mux[8];
};

struct ccm_ccgr {
	u32 ccgr;
	u32 ccgr_set;
	u32 ccgr_clr;
	u32 ccgr_tog;
};

struct ccm_root {
	u32 target_root;
	u32 target_root_set;
	u32 target_root_clr;
	u32 target_root_tog;
	u32 misc;
	u32 misc_set;
	u32 misc_clr;
	u32 misc_tog;
	u32 nm_post;
	u32 nm_post_root_set;
	u32 nm_post_root_clr;
	u32 nm_post_root_tog;
	u32 nm_pre;
	u32 nm_pre_root_set;
	u32 nm_pre_root_clr;
	u32 nm_pre_root_tog;
	u32 db_post;
	u32 db_post_root_set;
	u32 db_post_root_clr;
	u32 db_post_root_tog;
	u32 db_pre;
	u32 db_pre_root_set;
	u32 db_pre_root_clr;
	u32 db_pre_root_tog;
	u32 reserved[4];
	u32 access_ctrl;
	u32 access_ctrl_root_set;
	u32 access_ctrl_root_clr;
	u32 access_ctrl_root_tog;
};

struct ccm_reg {
	u32 reserved_0[4096];
	struct ccm_ccgr ccgr_array[192];
	u32 reserved_1[3328];
	struct ccm_root core_root[5];
	u32 reserved_2[352];
	struct ccm_root bus_root[12];
	u32 reserved_3[128];
	struct ccm_root ahb_ipg_root[4];
	u32 reserved_4[384];
	struct ccm_root dram_sel;
	struct ccm_root core_sel;
	u32 reserved_5[448];
	struct ccm_root ip_root[78];
};

#define CCGR_CLK_ON_MASK	0x03
#define CLK_SRC_ON_MASK		0x03

#define CLK_ROOT_ON		BIT(28)
#define CLK_ROOT_OFF		(0 << 28)
#define CLK_ROOT_ENABLE_MASK	BIT(28)
#define CLK_ROOT_ENABLE_SHIFT	28
#define CLK_ROOT_SOURCE_SEL(n)	(((n) & 0x7) << 24)

/* For SEL, only use 1 bit */
#define CLK_ROOT_SRC_MUX_MASK	0x07000000
#define CLK_ROOT_SRC_MUX_SHIFT	24
#define CLK_ROOT_SRC_0		0x00000000
#define CLK_ROOT_SRC_1		0x01000000
#define CLK_ROOT_SRC_2		0x02000000
#define CLK_ROOT_SRC_3		0x03000000
#define CLK_ROOT_SRC_4		0x04000000
#define CLK_ROOT_SRC_5		0x05000000
#define CLK_ROOT_SRC_6		0x06000000
#define CLK_ROOT_SRC_7		0x07000000

#define CLK_ROOT_PRE_DIV_MASK	(0x00070000)
#define CLK_ROOT_PRE_DIV_SHIFT	16
#define CLK_ROOT_PRE_DIV(n)	(((n) << 16) & 0x00070000)

#define CLK_ROOT_AUDO_SLOW_EN	0x1000

#define CLK_ROOT_AUDO_DIV_MASK	0x700
#define CLK_ROOT_AUDO_DIV_SHIFT	0x8
#define CLK_ROOT_AUDO_DIV(n)	(((n) << 8) & 0x700)

/* For CORE: mask is 0x7; For IPG: mask is 0x3 */
#define CLK_ROOT_POST_DIV_MASK		0x3f
#define CLK_ROOT_CORE_POST_DIV_MASK	0x7
#define CLK_ROOT_IPG_POST_DIV_MASK	0x3
#define CLK_ROOT_POST_DIV_SHIFT		0
#define CLK_ROOT_POST_DIV(n)		((n) & 0x3f)

/* AUDIO PLL1/2 VIDEO PLL1 GPU PLL VPU PLL ARM PLL*/
#define FRAC_PLL_LOCK_MASK		BIT(31)
#define FRAC_PLL_CLKE_MASK		BIT(21)
#define FRAC_PLL_PD_MASK		BIT(19)
#define FRAC_PLL_REFCLK_SEL_MASK	BIT(16)
#define FRAC_PLL_LOCK_SEL_MASK		BIT(15)
#define FRAC_PLL_BYPASS_MASK		BIT(14)
#define FRAC_PLL_COUNTCLK_SEL_MASK	BIT(13)
#define FRAC_PLL_NEWDIV_VAL_MASK	BIT(12)
#define FRAC_PLL_NEWDIV_ACK_MASK	BIT(11)
#define FRAC_PLL_REFCLK_DIV_VAL(n)	(((n) << 5) & (0x3f << 5))
#define FRAC_PLL_REFCLK_DIV_VAL_MASK	(0x3f << 5)
#define FRAC_PLL_REFCLK_DIV_VAL_SHIFT	5
#define FRAC_PLL_OUTPUT_DIV_VAL_MASK	0x1f
#define FRAC_PLL_OUTPUT_DIV_VAL(n)	((n) & 0x1f)

#define FRAC_PLL_REFCLK_SEL_OSC_25M	(0 << 16)
#define FRAC_PLL_REFCLK_SEL_OSC_27M	BIT(16)
#define FRAC_PLL_REFCLK_SEL_HDMI_PHY_27M (2 << 16)
#define FRAC_PLL_REFCLK_SEL_CLK_PN	(3 << 16)

#define FRAC_PLL_FRAC_DIV_CTL_MASK	(0x1ffffff << 7)
#define FRAC_PLL_FRAC_DIV_CTL_SHIFT	7
#define FRAC_PLL_INT_DIV_CTL_MASK	0x7f
#define FRAC_PLL_INT_DIV_CTL_VAL(n)	((n) & 0x7f)

/* SYS PLL1/2/3 VIDEO PLL2 DRAM PLL */
#define SSCG_PLL_LOCK_MASK		BIT(31)
#define SSCG_PLL_CLKE_MASK		BIT(25)
#define SSCG_PLL_DIV2_CLKE_MASK		BIT(23)
#define SSCG_PLL_DIV3_CLKE_MASK		BIT(21)
#define SSCG_PLL_DIV4_CLKE_MASK		BIT(19)
#define SSCG_PLL_DIV5_CLKE_MASK		BIT(17)
#define SSCG_PLL_DIV6_CLKE_MASK		BIT(15)
#define SSCG_PLL_DIV8_CLKE_MASK		BIT(13)
#define SSCG_PLL_DIV10_CLKE_MASK	BIT(11)
#define SSCG_PLL_DIV20_CLKE_MASK	BIT(9)
#define SSCG_PLL_VIDEO_PLL2_CLKE_MASK	BIT(9)
#define SSCG_PLL_DRAM_PLL_CLKE_MASK	BIT(9)
#define SSCG_PLL_PLL3_CLKE_MASK		BIT(9)
#define SSCG_PLL_PD_MASK		BIT(7)
#define SSCG_PLL_BYPASS1_MASK		BIT(5)
#define SSCG_PLL_BYPASS2_MASK		BIT(4)
#define SSCG_PLL_LOCK_SEL_MASK		BIT(3)
#define SSCG_PLL_COUNTCLK_SEL_MASK	BIT(2)
#define SSCG_PLL_REFCLK_SEL_MASK	0x3
#define SSCG_PLL_REFCLK_SEL_OSC_25M	(0 << 16)
#define SSCG_PLL_REFCLK_SEL_OSC_27M	BIT(16)
#define SSCG_PLL_REFCLK_SEL_HDMI_PHY_27M (2 << 16)
#define SSCG_PLL_REFCLK_SEL_CLK_PN	(3 << 16)

#define SSCG_PLL_SSDS_MASK		BIT(8)
#define SSCG_PLL_SSMD_MASK		(0x7 << 5)
#define SSCG_PLL_SSMF_MASK		(0xf << 1)
#define SSCG_PLL_SSE_MASK		0x1

#define SSCG_PLL_REF_DIVR1_MASK		(0x7 << 25)
#define SSCG_PLL_REF_DIVR1_SHIFT	25
#define SSCG_PLL_REF_DIVR1_VAL(n)	(((n) << 25) & SSCG_PLL_REF_DIVR1_MASK)
#define SSCG_PLL_REF_DIVR2_MASK		(0x3f << 19)
#define SSCG_PLL_REF_DIVR2_SHIFT	19
#define SSCG_PLL_REF_DIVR2_VAL(n)	(((n) << 19) & SSCG_PLL_REF_DIVR2_MASK)
#define SSCG_PLL_FEEDBACK_DIV_F1_MASK	(0x3f << 13)
#define SSCG_PLL_FEEDBACK_DIV_F1_SHIFT	13
#define SSCG_PLL_FEEDBACK_DIV_F1_VAL(n)	(((n) << 13) & \
					 SSCG_PLL_FEEDBACK_DIV_F1_MASK)
#define SSCG_PLL_FEEDBACK_DIV_F2_MASK	(0x3f << 7)
#define SSCG_PLL_FEEDBACK_DIV_F2_SHIFT	7
#define SSCG_PLL_FEEDBACK_DIV_F2_VAL(n)	(((n) << 7) & \
					 SSCG_PLL_FEEDBACK_DIV_F2_MASK)
#define SSCG_PLL_OUTPUT_DIV_VAL_MASK	(0x3f << 1)
#define SSCG_PLL_OUTPUT_DIV_VAL_SHIFT	1
#define SSCG_PLL_OUTPUT_DIV_VAL(n)	(((n) << 1) & \
					 SSCG_PLL_OUTPUT_DIV_VAL_MASK)
#define SSCG_PLL_FILTER_RANGE_MASK	0x1

#define HW_DIGPROG_MAJOR_UPPER_MASK	(0xff << 16)
#define HW_DIGPROG_MAJOR_LOWER_MASK	(0xff << 8)
#define HW_DIGPROG_MINOR_MASK		0xff

#define HW_OSC_27M_CLKE_MASK		BIT(4)
#define HW_OSC_25M_CLKE_MASK		BIT(2)
#define HW_OSC_32K_SEL_MASK		0x1
#define HW_OSC_32K_SEL_RTC		0x1
#define HW_OSC_32K_SEL_25M_DIV800	0x0

#define HW_FRAC_ARM_PLL_DIV_MASK	(0x7 << 20)
#define HW_FRAC_ARM_PLL_DIV_SHIFT	20
#define HW_FRAC_VPU_PLL_DIV_MASK	(0x7 << 16)
#define HW_FRAC_VPU_PLL_DIV_SHIFT	16
#define HW_FRAC_GPU_PLL_DIV_MASK	(0x7 << 12)
#define HW_FRAC_GPU_PLL_DIV_SHIFT	12
#define HW_FRAC_VIDEO_PLL1_DIV_MASK	(0x7 << 10)
#define HW_FRAC_VIDEO_PLL1_DIV_SHIFT	10
#define HW_FRAC_AUDIO_PLL2_DIV_MASK	(0x7 << 4)
#define HW_FRAC_AUDIO_PLL2_DIV_SHIFT	4
#define HW_FRAC_AUDIO_PLL1_DIV_MASK	0x7
#define HW_FRAC_AUDIO_PLL1_DIV_SHIFT	0

#define HW_SSCG_VIDEO_PLL2_DIV_MASK	(0x7 << 16)
#define HW_SSCG_VIDEO_PLL2_DIV_SHIFT	16
#define HW_SSCG_DRAM_PLL_DIV_MASK	(0x7 << 14)
#define HW_SSCG_DRAM_PLL_DIV_SHIFT	14
#define HW_SSCG_SYSTEM_PLL3_DIV_MASK	(0x7 << 8)
#define HW_SSCG_SYSTEM_PLL3_DIV_SHIFT	8
#define HW_SSCG_SYSTEM_PLL2_DIV_MASK	(0x7 << 4)
#define HW_SSCG_SYSTEM_PLL2_DIV_SHIFT	4
#define HW_SSCG_SYSTEM_PLL1_DIV_MASK	0x7
#define HW_SSCG_SYSTEM_PLL1_DIV_SHIFT	0

#define ENET1_REF_CLK_ROOT_FROM_PLL_ENET_MAIN_125M_CLK		0x01000000
#define ENET1_REF_CLK_ROOT_FROM_PLL_ENET_MAIN_50M_CLK		0x02000000
#define ENET1_REF_CLK_ROOT_FROM_PLL_ENET_MAIN_25M_CLK		0x03000000
#define ENET_AXI_CLK_ROOT_FROM_PLL_SYS_PFD4_CLK			0x07000000
#define ENET_AXI_CLK_ROOT_FROM_SYS1_PLL_266M			0x01000000
#define ENET1_TIME_CLK_ROOT_FROM_PLL_ENET_MAIN_100M_CLK		0x01000000
#define ENET_PHY_REF_CLK_ROOT_FROM_PLL_ENET_MAIN_25M_CLK	0x01000000

enum enet_freq {
	ENET_25MHZ = 0,
	ENET_50MHZ,
	ENET_125MHZ,
};

enum frac_pll_out_val {
	FRAC_PLL_OUT_1000M,
	FRAC_PLL_OUT_1600M,
};

#define DRAM_BYPASS_ROOT_CONFIG(_rate, _m, _p, _s, _k)			\
	{								\
		.clk		=	(_rate),			\
		.alt_root_sel	=	(_m),				\
		.alt_pre_div	=	(_p),				\
		.apb_root_sel	=	(_s),				\
		.apb_pre_div	=	(_k),				\
	}

struct dram_bypass_clk_setting {
	ulong clk;
	int alt_root_sel;
	enum root_pre_div alt_pre_div;
	int apb_root_sel;
	enum root_pre_div apb_pre_div;
};

void dram_pll_init(ulong pll_val);
void dram_enable_bypass(ulong clk_val);
void dram_disable_bypass(void);
u32 imx_get_fecclk(void);
u32 imx_get_uartclk(void);
int clock_init(void);
void init_clk_usdhc(u32 index);
void init_uart_clk(u32 index);
void init_wdog_clk(void);
unsigned int mxc_get_clock(enum clk_root_index clk);
int clock_enable(enum clk_ccgr_index index, bool enable);
int clock_root_enabled(enum clk_root_index clock_id);
int clock_root_cfg(enum clk_root_index clock_id, enum root_pre_div pre_div,
		   enum root_post_div post_div, enum clk_root_src clock_src);
int clock_set_target_val(enum clk_root_index clock_id, u32 val);
int clock_get_target_val(enum clk_root_index clock_id, u32 *val);
int clock_get_prediv(enum clk_root_index clock_id, enum root_pre_div *pre_div);
int clock_get_postdiv(enum clk_root_index clock_id,
		      enum root_post_div *post_div);
int clock_get_src(enum clk_root_index clock_id, enum clk_root_src *p_clock_src);
void mxs_set_lcdclk(u32 base_addr, u32 freq);
int set_clk_qspi(void);
void enable_ocotp_clk(unsigned char enable);
int enable_i2c_clk(unsigned char enable, unsigned int i2c_num);
int set_clk_enet(enum enet_freq type);
#endif
