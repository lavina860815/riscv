/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * (C) Copyright 2009
 * Marvell Semiconductor <www.marvell.com>
 * Written-by: Prafulla Wadaskar <prafulla@marvell.com>
 *
 * Header file for the Marvell's Feroceon CPU core.
 */

#ifndef _MVEBU_SOC_H
#define _MVEBU_SOC_H

#define SOC_MV78230_ID		0x7823
#define SOC_MV78260_ID		0x7826
#define SOC_MV78460_ID		0x7846
#define SOC_88F6720_ID		0x6720
#define SOC_88F6810_ID		0x6810
#define SOC_88F6820_ID		0x6820
#define SOC_88F6828_ID		0x6828
#define SOC_98DX3236_ID		0xf410
#define SOC_98DX3336_ID		0xf400
#define SOC_98DX4251_ID		0xfc00

/* A375 revisions */
#define MV_88F67XX_A0_ID	0x3

/* A38x revisions */
#define MV_88F68XX_Z1_ID	0x0
#define MV_88F68XX_A0_ID	0x4
#define MV_88F68XX_B0_ID	0xa

/* TCLK Core Clock definition */
#ifndef CONFIG_SYS_TCLK
#define CONFIG_SYS_TCLK		250000000	/* 250MHz */
#endif

/* SOC specific definations */
#define INTREG_BASE		0xd0000000
#define INTREG_BASE_ADDR_REG	(INTREG_BASE + 0x20080)
#if defined(CONFIG_SPL_BUILD) || defined(CONFIG_ARMADA_3700)
/*
 * The SPL U-Boot version still runs with the default
 * address for the internal registers, configured by
 * the BootROM. Only the main U-Boot version uses the
 * new internal register base address, that also is
 * required for the Linux kernel.
 */
#define SOC_REGS_PHY_BASE	0xd0000000
#elif defined(CONFIG_ARMADA_8K)
#define SOC_REGS_PHY_BASE	0xf0000000
#else
#define SOC_REGS_PHY_BASE	0xf1000000
#endif
#define MVEBU_REGISTER(x)	(SOC_REGS_PHY_BASE + x)

#define MVEBU_SDRAM_SCRATCH	(MVEBU_REGISTER(0x01504))
#define MVEBU_L2_CACHE_BASE	(MVEBU_REGISTER(0x08000))
#define CONFIG_SYS_PL310_BASE	MVEBU_L2_CACHE_BASE
#define MVEBU_TWSI_BASE		(MVEBU_REGISTER(0x11000))
#define MVEBU_TWSI1_BASE	(MVEBU_REGISTER(0x11100))
#define MVEBU_MPP_BASE		(MVEBU_REGISTER(0x18000))
#define MVEBU_GPIO0_BASE	(MVEBU_REGISTER(0x18100))
#define MVEBU_GPIO1_BASE	(MVEBU_REGISTER(0x18140))
#define MVEBU_GPIO2_BASE	(MVEBU_REGISTER(0x18180))
#define MVEBU_SYSTEM_REG_BASE	(MVEBU_REGISTER(0x18200))
#define MVEBU_CLOCK_BASE	(MVEBU_REGISTER(0x18700))
#define MVEBU_CPU_WIN_BASE	(MVEBU_REGISTER(0x20000))
#define MVEBU_SDRAM_BASE	(MVEBU_REGISTER(0x20180))
#define MVEBU_TIMER_BASE	(MVEBU_REGISTER(0x20300))
#define MVEBU_REG_PCIE_BASE	(MVEBU_REGISTER(0x40000))
#define MVEBU_AXP_USB_BASE      (MVEBU_REGISTER(0x50000))
#define MVEBU_USB20_BASE	(MVEBU_REGISTER(0x58000))
#define MVEBU_REG_PCIE0_BASE	(MVEBU_REGISTER(0x80000))
#define MVEBU_AXP_SATA_BASE	(MVEBU_REGISTER(0xa0000))
#define MVEBU_SATA0_BASE	(MVEBU_REGISTER(0xa8000))
#define MVEBU_NAND_BASE		(MVEBU_REGISTER(0xd0000))
#define MVEBU_SDIO_BASE		(MVEBU_REGISTER(0xd8000))
#define MVEBU_LCD_BASE		(MVEBU_REGISTER(0xe0000))
#define MVEBU_DFX_BASE		(MVEBU_REGISTER(0xe4000))

#define SOC_COHERENCY_FABRIC_CTRL_REG	(MVEBU_REGISTER(0x20200))
#define MBUS_ERR_PROP_EN	(1 << 8)

#define MBUS_BRIDGE_WIN_CTRL_REG (MVEBU_REGISTER(0x20250))
#define MBUS_BRIDGE_WIN_BASE_REG (MVEBU_REGISTER(0x20254))

#define MVEBU_SOC_DEV_MUX_REG	(MVEBU_SYSTEM_REG_BASE + 0x08)
#define NAND_EN			BIT(0)
#define NAND_ARBITER_EN		BIT(27)

#define ARMADA_XP_PUP_ENABLE	(MVEBU_SYSTEM_REG_BASE + 0x44c)
#define GE0_PUP_EN		BIT(0)
#define GE1_PUP_EN		BIT(1)
#define LCD_PUP_EN		BIT(2)
#define NAND_PUP_EN		BIT(4)
#define SPI_PUP_EN		BIT(5)

#define MVEBU_CORE_DIV_CLK_CTRL(i)	(MVEBU_CLOCK_BASE + ((i) * 0x8))
#define MVEBU_DFX_DIV_CLK_CTRL(i)	(MVEBU_DFX_BASE + 0x250 + ((i) * 0x4))
#define NAND_ECC_DIVCKL_RATIO_OFFS	8
#define NAND_ECC_DIVCKL_RATIO_MASK	(0x3F << NAND_ECC_DIVCKL_RATIO_OFFS)

#define SDRAM_MAX_CS		4
#define SDRAM_ADDR_MASK		0xFF000000

/* MVEBU CPU memory windows */
#define MVCPU_WIN_CTRL_DATA	CPU_WIN_CTRL_DATA
#define MVCPU_WIN_ENABLE	CPU_WIN_ENABLE
#define MVCPU_WIN_DISABLE	CPU_WIN_DISABLE

#define COMPHY_REFCLK_ALIGNMENT	(MVEBU_REGISTER(0x182f8))

/* BootROM error register (also includes some status infos) */
#define CONFIG_BOOTROM_ERR_REG	(MVEBU_REGISTER(0x182d0))
#define BOOTROM_ERR_MODE_OFFS	28
#define BOOTROM_ERR_MODE_MASK	(0xf << BOOTROM_ERR_MODE_OFFS)
#define BOOTROM_ERR_MODE_UART	0x6
#define BOOTROM_ERR_CODE_OFFS	0
#define BOOTROM_ERR_CODE_MASK	(0xf << BOOTROM_ERR_CODE_OFFS)

#if defined(CONFIG_ARMADA_375)
/* SAR values for Armada 375 */
#define CONFIG_SAR_REG		(MVEBU_REGISTER(0xe8200))
#define CONFIG_SAR2_REG		(MVEBU_REGISTER(0xe8204))

#define SAR_CPU_FREQ_OFFS	17
#define SAR_CPU_FREQ_MASK	(0x1f << SAR_CPU_FREQ_OFFS)

#define BOOT_DEV_SEL_OFFS	3
#define BOOT_DEV_SEL_MASK	(0x3f << BOOT_DEV_SEL_OFFS)

#define BOOT_FROM_UART		0x30
#define BOOT_FROM_SPI		0x38
#elif defined(CONFIG_ARMADA_38X)
/* SAR values for Armada 38x */
#define CONFIG_SAR_REG		(MVEBU_REGISTER(0x18600))

#define SAR_CPU_FREQ_OFFS	10
#define SAR_CPU_FREQ_MASK	(0x1f << SAR_CPU_FREQ_OFFS)
#define SAR_BOOT_DEVICE_OFFS	4
#define SAR_BOOT_DEVICE_MASK	(0x1f << SAR_BOOT_DEVICE_OFFS)

#define BOOT_DEV_SEL_OFFS	4
#define BOOT_DEV_SEL_MASK	(0x3f << BOOT_DEV_SEL_OFFS)

#define BOOT_FROM_NAND		0x0A
#define BOOT_FROM_UART		0x28
#define BOOT_FROM_UART_ALT	0x3f
#define BOOT_FROM_SPI		0x32
#define BOOT_FROM_MMC		0x30
#define BOOT_FROM_MMC_ALT	0x31
#else
/* SAR values for Armada XP */
#define CONFIG_SAR_REG		(MVEBU_REGISTER(0x18230))
#define CONFIG_SAR2_REG		(MVEBU_REGISTER(0x18234))

#define SAR_CPU_FREQ_OFFS	21
#define SAR_CPU_FREQ_MASK	(0x7 << SAR_CPU_FREQ_OFFS)
#define SAR_FFC_FREQ_OFFS	24
#define SAR_FFC_FREQ_MASK	(0xf << SAR_FFC_FREQ_OFFS)
#define SAR2_CPU_FREQ_OFFS	20
#define SAR2_CPU_FREQ_MASK	(0x1 << SAR2_CPU_FREQ_OFFS)
#define SAR_BOOT_DEVICE_OFFS	5
#define SAR_BOOT_DEVICE_MASK	(0xf << SAR_BOOT_DEVICE_OFFS)

#define BOOT_DEV_SEL_OFFS	5
#define BOOT_DEV_SEL_MASK	(0xf << BOOT_DEV_SEL_OFFS)

#define BOOT_FROM_UART		0x2
#define BOOT_FROM_SPI		0x3
#endif

#endif /* _MVEBU_SOC_H */
