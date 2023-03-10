/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * Copyright (c) 2010-2014, NVIDIA CORPORATION. All rights reserved.
 */

#ifndef _TEGRA30_PINMUX_H_
#define _TEGRA30_PINMUX_H_

enum pmux_pingrp {
	PMUX_PINGRP_ULPI_DATA0_PO1,
	PMUX_PINGRP_ULPI_DATA1_PO2,
	PMUX_PINGRP_ULPI_DATA2_PO3,
	PMUX_PINGRP_ULPI_DATA3_PO4,
	PMUX_PINGRP_ULPI_DATA4_PO5,
	PMUX_PINGRP_ULPI_DATA5_PO6,
	PMUX_PINGRP_ULPI_DATA6_PO7,
	PMUX_PINGRP_ULPI_DATA7_PO0,
	PMUX_PINGRP_ULPI_CLK_PY0,
	PMUX_PINGRP_ULPI_DIR_PY1,
	PMUX_PINGRP_ULPI_NXT_PY2,
	PMUX_PINGRP_ULPI_STP_PY3,
	PMUX_PINGRP_DAP3_FS_PP0,
	PMUX_PINGRP_DAP3_DIN_PP1,
	PMUX_PINGRP_DAP3_DOUT_PP2,
	PMUX_PINGRP_DAP3_SCLK_PP3,
	PMUX_PINGRP_PV0,
	PMUX_PINGRP_PV1,
	PMUX_PINGRP_SDMMC1_CLK_PZ0,
	PMUX_PINGRP_SDMMC1_CMD_PZ1,
	PMUX_PINGRP_SDMMC1_DAT3_PY4,
	PMUX_PINGRP_SDMMC1_DAT2_PY5,
	PMUX_PINGRP_SDMMC1_DAT1_PY6,
	PMUX_PINGRP_SDMMC1_DAT0_PY7,
	PMUX_PINGRP_PV2,
	PMUX_PINGRP_PV3,
	PMUX_PINGRP_CLK2_OUT_PW5,
	PMUX_PINGRP_CLK2_REQ_PCC5,
	PMUX_PINGRP_LCD_PWR1_PC1,
	PMUX_PINGRP_LCD_PWR2_PC6,
	PMUX_PINGRP_LCD_SDIN_PZ2,
	PMUX_PINGRP_LCD_SDOUT_PN5,
	PMUX_PINGRP_LCD_WR_N_PZ3,
	PMUX_PINGRP_LCD_CS0_N_PN4,
	PMUX_PINGRP_LCD_DC0_PN6,
	PMUX_PINGRP_LCD_SCK_PZ4,
	PMUX_PINGRP_LCD_PWR0_PB2,
	PMUX_PINGRP_LCD_PCLK_PB3,
	PMUX_PINGRP_LCD_DE_PJ1,
	PMUX_PINGRP_LCD_HSYNC_PJ3,
	PMUX_PINGRP_LCD_VSYNC_PJ4,
	PMUX_PINGRP_LCD_D0_PE0,
	PMUX_PINGRP_LCD_D1_PE1,
	PMUX_PINGRP_LCD_D2_PE2,
	PMUX_PINGRP_LCD_D3_PE3,
	PMUX_PINGRP_LCD_D4_PE4,
	PMUX_PINGRP_LCD_D5_PE5,
	PMUX_PINGRP_LCD_D6_PE6,
	PMUX_PINGRP_LCD_D7_PE7,
	PMUX_PINGRP_LCD_D8_PF0,
	PMUX_PINGRP_LCD_D9_PF1,
	PMUX_PINGRP_LCD_D10_PF2,
	PMUX_PINGRP_LCD_D11_PF3,
	PMUX_PINGRP_LCD_D12_PF4,
	PMUX_PINGRP_LCD_D13_PF5,
	PMUX_PINGRP_LCD_D14_PF6,
	PMUX_PINGRP_LCD_D15_PF7,
	PMUX_PINGRP_LCD_D16_PM0,
	PMUX_PINGRP_LCD_D17_PM1,
	PMUX_PINGRP_LCD_D18_PM2,
	PMUX_PINGRP_LCD_D19_PM3,
	PMUX_PINGRP_LCD_D20_PM4,
	PMUX_PINGRP_LCD_D21_PM5,
	PMUX_PINGRP_LCD_D22_PM6,
	PMUX_PINGRP_LCD_D23_PM7,
	PMUX_PINGRP_LCD_CS1_N_PW0,
	PMUX_PINGRP_LCD_M1_PW1,
	PMUX_PINGRP_LCD_DC1_PD2,
	PMUX_PINGRP_HDMI_INT_PN7,
	PMUX_PINGRP_DDC_SCL_PV4,
	PMUX_PINGRP_DDC_SDA_PV5,
	PMUX_PINGRP_CRT_HSYNC_PV6,
	PMUX_PINGRP_CRT_VSYNC_PV7,
	PMUX_PINGRP_VI_D0_PT4,
	PMUX_PINGRP_VI_D1_PD5,
	PMUX_PINGRP_VI_D2_PL0,
	PMUX_PINGRP_VI_D3_PL1,
	PMUX_PINGRP_VI_D4_PL2,
	PMUX_PINGRP_VI_D5_PL3,
	PMUX_PINGRP_VI_D6_PL4,
	PMUX_PINGRP_VI_D7_PL5,
	PMUX_PINGRP_VI_D8_PL6,
	PMUX_PINGRP_VI_D9_PL7,
	PMUX_PINGRP_VI_D10_PT2,
	PMUX_PINGRP_VI_D11_PT3,
	PMUX_PINGRP_VI_PCLK_PT0,
	PMUX_PINGRP_VI_MCLK_PT1,
	PMUX_PINGRP_VI_VSYNC_PD6,
	PMUX_PINGRP_VI_HSYNC_PD7,
	PMUX_PINGRP_UART2_RXD_PC3,
	PMUX_PINGRP_UART2_TXD_PC2,
	PMUX_PINGRP_UART2_RTS_N_PJ6,
	PMUX_PINGRP_UART2_CTS_N_PJ5,
	PMUX_PINGRP_UART3_TXD_PW6,
	PMUX_PINGRP_UART3_RXD_PW7,
	PMUX_PINGRP_UART3_CTS_N_PA1,
	PMUX_PINGRP_UART3_RTS_N_PC0,
	PMUX_PINGRP_PU0,
	PMUX_PINGRP_PU1,
	PMUX_PINGRP_PU2,
	PMUX_PINGRP_PU3,
	PMUX_PINGRP_PU4,
	PMUX_PINGRP_PU5,
	PMUX_PINGRP_PU6,
	PMUX_PINGRP_GEN1_I2C_SDA_PC5,
	PMUX_PINGRP_GEN1_I2C_SCL_PC4,
	PMUX_PINGRP_DAP4_FS_PP4,
	PMUX_PINGRP_DAP4_DIN_PP5,
	PMUX_PINGRP_DAP4_DOUT_PP6,
	PMUX_PINGRP_DAP4_SCLK_PP7,
	PMUX_PINGRP_CLK3_OUT_PEE0,
	PMUX_PINGRP_CLK3_REQ_PEE1,
	PMUX_PINGRP_GMI_WP_N_PC7,
	PMUX_PINGRP_GMI_IORDY_PI5,
	PMUX_PINGRP_GMI_WAIT_PI7,
	PMUX_PINGRP_GMI_ADV_N_PK0,
	PMUX_PINGRP_GMI_CLK_PK1,
	PMUX_PINGRP_GMI_CS0_N_PJ0,
	PMUX_PINGRP_GMI_CS1_N_PJ2,
	PMUX_PINGRP_GMI_CS2_N_PK3,
	PMUX_PINGRP_GMI_CS3_N_PK4,
	PMUX_PINGRP_GMI_CS4_N_PK2,
	PMUX_PINGRP_GMI_CS6_N_PI3,
	PMUX_PINGRP_GMI_CS7_N_PI6,
	PMUX_PINGRP_GMI_AD0_PG0,
	PMUX_PINGRP_GMI_AD1_PG1,
	PMUX_PINGRP_GMI_AD2_PG2,
	PMUX_PINGRP_GMI_AD3_PG3,
	PMUX_PINGRP_GMI_AD4_PG4,
	PMUX_PINGRP_GMI_AD5_PG5,
	PMUX_PINGRP_GMI_AD6_PG6,
	PMUX_PINGRP_GMI_AD7_PG7,
	PMUX_PINGRP_GMI_AD8_PH0,
	PMUX_PINGRP_GMI_AD9_PH1,
	PMUX_PINGRP_GMI_AD10_PH2,
	PMUX_PINGRP_GMI_AD11_PH3,
	PMUX_PINGRP_GMI_AD12_PH4,
	PMUX_PINGRP_GMI_AD13_PH5,
	PMUX_PINGRP_GMI_AD14_PH6,
	PMUX_PINGRP_GMI_AD15_PH7,
	PMUX_PINGRP_GMI_A16_PJ7,
	PMUX_PINGRP_GMI_A17_PB0,
	PMUX_PINGRP_GMI_A18_PB1,
	PMUX_PINGRP_GMI_A19_PK7,
	PMUX_PINGRP_GMI_WR_N_PI0,
	PMUX_PINGRP_GMI_OE_N_PI1,
	PMUX_PINGRP_GMI_DQS_PI2,
	PMUX_PINGRP_GMI_RST_N_PI4,
	PMUX_PINGRP_GEN2_I2C_SCL_PT5,
	PMUX_PINGRP_GEN2_I2C_SDA_PT6,
	PMUX_PINGRP_SDMMC4_CLK_PCC4,
	PMUX_PINGRP_SDMMC4_CMD_PT7,
	PMUX_PINGRP_SDMMC4_DAT0_PAA0,
	PMUX_PINGRP_SDMMC4_DAT1_PAA1,
	PMUX_PINGRP_SDMMC4_DAT2_PAA2,
	PMUX_PINGRP_SDMMC4_DAT3_PAA3,
	PMUX_PINGRP_SDMMC4_DAT4_PAA4,
	PMUX_PINGRP_SDMMC4_DAT5_PAA5,
	PMUX_PINGRP_SDMMC4_DAT6_PAA6,
	PMUX_PINGRP_SDMMC4_DAT7_PAA7,
	PMUX_PINGRP_SDMMC4_RST_N_PCC3,
	PMUX_PINGRP_CAM_MCLK_PCC0,
	PMUX_PINGRP_PCC1,
	PMUX_PINGRP_PBB0,
	PMUX_PINGRP_CAM_I2C_SCL_PBB1,
	PMUX_PINGRP_CAM_I2C_SDA_PBB2,
	PMUX_PINGRP_PBB3,
	PMUX_PINGRP_PBB4,
	PMUX_PINGRP_PBB5,
	PMUX_PINGRP_PBB6,
	PMUX_PINGRP_PBB7,
	PMUX_PINGRP_PCC2,
	PMUX_PINGRP_JTAG_RTCK_PU7,
	PMUX_PINGRP_PWR_I2C_SCL_PZ6,
	PMUX_PINGRP_PWR_I2C_SDA_PZ7,
	PMUX_PINGRP_KB_ROW0_PR0,
	PMUX_PINGRP_KB_ROW1_PR1,
	PMUX_PINGRP_KB_ROW2_PR2,
	PMUX_PINGRP_KB_ROW3_PR3,
	PMUX_PINGRP_KB_ROW4_PR4,
	PMUX_PINGRP_KB_ROW5_PR5,
	PMUX_PINGRP_KB_ROW6_PR6,
	PMUX_PINGRP_KB_ROW7_PR7,
	PMUX_PINGRP_KB_ROW8_PS0,
	PMUX_PINGRP_KB_ROW9_PS1,
	PMUX_PINGRP_KB_ROW10_PS2,
	PMUX_PINGRP_KB_ROW11_PS3,
	PMUX_PINGRP_KB_ROW12_PS4,
	PMUX_PINGRP_KB_ROW13_PS5,
	PMUX_PINGRP_KB_ROW14_PS6,
	PMUX_PINGRP_KB_ROW15_PS7,
	PMUX_PINGRP_KB_COL0_PQ0,
	PMUX_PINGRP_KB_COL1_PQ1,
	PMUX_PINGRP_KB_COL2_PQ2,
	PMUX_PINGRP_KB_COL3_PQ3,
	PMUX_PINGRP_KB_COL4_PQ4,
	PMUX_PINGRP_KB_COL5_PQ5,
	PMUX_PINGRP_KB_COL6_PQ6,
	PMUX_PINGRP_KB_COL7_PQ7,
	PMUX_PINGRP_CLK_32K_OUT_PA0,
	PMUX_PINGRP_SYS_CLK_REQ_PZ5,
	PMUX_PINGRP_CORE_PWR_REQ,
	PMUX_PINGRP_CPU_PWR_REQ,
	PMUX_PINGRP_PWR_INT_N,
	PMUX_PINGRP_CLK_32K_IN,
	PMUX_PINGRP_OWR,
	PMUX_PINGRP_DAP1_FS_PN0,
	PMUX_PINGRP_DAP1_DIN_PN1,
	PMUX_PINGRP_DAP1_DOUT_PN2,
	PMUX_PINGRP_DAP1_SCLK_PN3,
	PMUX_PINGRP_CLK1_REQ_PEE2,
	PMUX_PINGRP_CLK1_OUT_PW4,
	PMUX_PINGRP_SPDIF_IN_PK6,
	PMUX_PINGRP_SPDIF_OUT_PK5,
	PMUX_PINGRP_DAP2_FS_PA2,
	PMUX_PINGRP_DAP2_DIN_PA4,
	PMUX_PINGRP_DAP2_DOUT_PA5,
	PMUX_PINGRP_DAP2_SCLK_PA3,
	PMUX_PINGRP_SPI2_MOSI_PX0,
	PMUX_PINGRP_SPI2_MISO_PX1,
	PMUX_PINGRP_SPI2_CS0_N_PX3,
	PMUX_PINGRP_SPI2_SCK_PX2,
	PMUX_PINGRP_SPI1_MOSI_PX4,
	PMUX_PINGRP_SPI1_SCK_PX5,
	PMUX_PINGRP_SPI1_CS0_N_PX6,
	PMUX_PINGRP_SPI1_MISO_PX7,
	PMUX_PINGRP_SPI2_CS1_N_PW2,
	PMUX_PINGRP_SPI2_CS2_N_PW3,
	PMUX_PINGRP_SDMMC3_CLK_PA6,
	PMUX_PINGRP_SDMMC3_CMD_PA7,
	PMUX_PINGRP_SDMMC3_DAT0_PB7,
	PMUX_PINGRP_SDMMC3_DAT1_PB6,
	PMUX_PINGRP_SDMMC3_DAT2_PB5,
	PMUX_PINGRP_SDMMC3_DAT3_PB4,
	PMUX_PINGRP_SDMMC3_DAT4_PD1,
	PMUX_PINGRP_SDMMC3_DAT5_PD0,
	PMUX_PINGRP_SDMMC3_DAT6_PD3,
	PMUX_PINGRP_SDMMC3_DAT7_PD4,
	PMUX_PINGRP_PEX_L0_PRSNT_N_PDD0,
	PMUX_PINGRP_PEX_L0_RST_N_PDD1,
	PMUX_PINGRP_PEX_L0_CLKREQ_N_PDD2,
	PMUX_PINGRP_PEX_WAKE_N_PDD3,
	PMUX_PINGRP_PEX_L1_PRSNT_N_PDD4,
	PMUX_PINGRP_PEX_L1_RST_N_PDD5,
	PMUX_PINGRP_PEX_L1_CLKREQ_N_PDD6,
	PMUX_PINGRP_PEX_L2_PRSNT_N_PDD7,
	PMUX_PINGRP_PEX_L2_RST_N_PCC6,
	PMUX_PINGRP_PEX_L2_CLKREQ_N_PCC7,
	PMUX_PINGRP_HDMI_CEC_PEE3,
	PMUX_PINGRP_COUNT,
};

enum pmux_drvgrp {
	PMUX_DRVGRP_AO1,
	PMUX_DRVGRP_AO2,
	PMUX_DRVGRP_AT1,
	PMUX_DRVGRP_AT2,
	PMUX_DRVGRP_AT3,
	PMUX_DRVGRP_AT4,
	PMUX_DRVGRP_AT5,
	PMUX_DRVGRP_CDEV1,
	PMUX_DRVGRP_CDEV2,
	PMUX_DRVGRP_CSUS,
	PMUX_DRVGRP_DAP1,
	PMUX_DRVGRP_DAP2,
	PMUX_DRVGRP_DAP3,
	PMUX_DRVGRP_DAP4,
	PMUX_DRVGRP_DBG,
	PMUX_DRVGRP_LCD1,
	PMUX_DRVGRP_LCD2,
	PMUX_DRVGRP_SDIO2,
	PMUX_DRVGRP_SDIO3,
	PMUX_DRVGRP_SPI,
	PMUX_DRVGRP_UAA,
	PMUX_DRVGRP_UAB,
	PMUX_DRVGRP_UART2,
	PMUX_DRVGRP_UART3,
	PMUX_DRVGRP_VI1,
	PMUX_DRVGRP_SDIO1 = (0x84 / 4),
	PMUX_DRVGRP_CRT = (0x90 / 4),
	PMUX_DRVGRP_DDC,
	PMUX_DRVGRP_GMA,
	PMUX_DRVGRP_GMB,
	PMUX_DRVGRP_GMC,
	PMUX_DRVGRP_GMD,
	PMUX_DRVGRP_GME,
	PMUX_DRVGRP_GMF,
	PMUX_DRVGRP_GMG,
	PMUX_DRVGRP_GMH,
	PMUX_DRVGRP_OWR,
	PMUX_DRVGRP_UDA,
	PMUX_DRVGRP_GPV,
	PMUX_DRVGRP_DEV3,
	PMUX_DRVGRP_CEC = (0xd0 / 4),
	PMUX_DRVGRP_COUNT,
};

enum pmux_func {
	PMUX_FUNC_DEFAULT,
	PMUX_FUNC_BLINK,
	PMUX_FUNC_CEC,
	PMUX_FUNC_CLK_12M_OUT,
	PMUX_FUNC_CLK_32K_IN,
	PMUX_FUNC_CORE_PWR_REQ,
	PMUX_FUNC_CPU_PWR_REQ,
	PMUX_FUNC_CRT,
	PMUX_FUNC_DAP,
	PMUX_FUNC_DDR,
	PMUX_FUNC_DEV3,
	PMUX_FUNC_DISPLAYA,
	PMUX_FUNC_DISPLAYB,
	PMUX_FUNC_DTV,
	PMUX_FUNC_EXTPERIPH1,
	PMUX_FUNC_EXTPERIPH2,
	PMUX_FUNC_EXTPERIPH3,
	PMUX_FUNC_GMI,
	PMUX_FUNC_GMI_ALT,
	PMUX_FUNC_HDA,
	PMUX_FUNC_HDCP,
	PMUX_FUNC_HDMI,
	PMUX_FUNC_HSI,
	PMUX_FUNC_I2C1,
	PMUX_FUNC_I2C2,
	PMUX_FUNC_I2C3,
	PMUX_FUNC_I2C4,
	PMUX_FUNC_I2CPWR,
	PMUX_FUNC_I2S0,
	PMUX_FUNC_I2S1,
	PMUX_FUNC_I2S2,
	PMUX_FUNC_I2S3,
	PMUX_FUNC_I2S4,
	PMUX_FUNC_INVALID,
	PMUX_FUNC_KBC,
	PMUX_FUNC_MIO,
	PMUX_FUNC_NAND,
	PMUX_FUNC_NAND_ALT,
	PMUX_FUNC_OWR,
	PMUX_FUNC_PCIE,
	PMUX_FUNC_PWM0,
	PMUX_FUNC_PWM1,
	PMUX_FUNC_PWM2,
	PMUX_FUNC_PWM3,
	PMUX_FUNC_PWR_INT_N,
	PMUX_FUNC_RTCK,
	PMUX_FUNC_SATA,
	PMUX_FUNC_SDMMC1,
	PMUX_FUNC_SDMMC2,
	PMUX_FUNC_SDMMC3,
	PMUX_FUNC_SDMMC4,
	PMUX_FUNC_SPDIF,
	PMUX_FUNC_SPI1,
	PMUX_FUNC_SPI2,
	PMUX_FUNC_SPI2_ALT,
	PMUX_FUNC_SPI3,
	PMUX_FUNC_SPI4,
	PMUX_FUNC_SPI5,
	PMUX_FUNC_SPI6,
	PMUX_FUNC_SYSCLK,
	PMUX_FUNC_TEST,
	PMUX_FUNC_TRACE,
	PMUX_FUNC_UARTA,
	PMUX_FUNC_UARTB,
	PMUX_FUNC_UARTC,
	PMUX_FUNC_UARTD,
	PMUX_FUNC_UARTE,
	PMUX_FUNC_ULPI,
	PMUX_FUNC_VGP1,
	PMUX_FUNC_VGP2,
	PMUX_FUNC_VGP3,
	PMUX_FUNC_VGP4,
	PMUX_FUNC_VGP5,
	PMUX_FUNC_VGP6,
	PMUX_FUNC_VI,
	PMUX_FUNC_VI_ALT1,
	PMUX_FUNC_VI_ALT2,
	PMUX_FUNC_VI_ALT3,
	PMUX_FUNC_RSVD1,
	PMUX_FUNC_RSVD2,
	PMUX_FUNC_RSVD3,
	PMUX_FUNC_RSVD4,
	PMUX_FUNC_COUNT,
};

#define TEGRA_PMX_SOC_DRV_GROUP_BASE_REG 0x868
#define TEGRA_PMX_SOC_HAS_DRVGRPS
#define TEGRA_PMX_GRPS_HAVE_LPMD
#define TEGRA_PMX_GRPS_HAVE_SCHMT
#define TEGRA_PMX_GRPS_HAVE_HSM
#define TEGRA_PMX_PINS_HAVE_E_INPUT
#define TEGRA_PMX_PINS_HAVE_LOCK
#define TEGRA_PMX_PINS_HAVE_OD
#define TEGRA_PMX_PINS_HAVE_IO_RESET
#include <asm/arch-tegra/pinmux.h>

#endif /* _TEGRA30_PINMUX_H_ */
