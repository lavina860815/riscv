// SPDX-License-Identifier: GPL-2.0+
/*
 * (C) Copyright 2014 CompuLab, Ltd. <www.compulab.co.il>
 *
 * Authors: Igor Grinberg <grinberg@compulab.co.il>
 */

#include <common.h>
#include <asm/arch/sys_proto.h>
#include <asm/arch/mux.h>
#include <asm/io.h>

void set_muxconf_regs(void)
{
	/* SDRC */
	MUX_VAL(CP(SDRC_D0),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D1),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D2),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D3),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D4),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D5),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D6),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D7),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D8),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D9),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D10),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D11),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D12),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D13),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D14),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D15),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D16),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D17),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D18),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D19),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D20),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D21),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D22),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D23),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D24),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D25),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D26),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D27),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D28),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D29),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D30),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_D31),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_CLK),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_DQS0),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_DQS1),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_DQS2),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_DQS3),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(SDRC_CKE0),		(IDIS | PTU | EN  | M0));
	MUX_VAL(CP(SDRC_CKE1),		(IDIS | PTD | DIS | M7));

	/* GPMC */
	MUX_VAL(CP(GPMC_A1),		(IDIS | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_A2),		(IDIS | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_A3),		(IDIS | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_A4),		(IDIS | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_A5),		(IDIS | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_A6),		(IDIS | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_A7),		(IDIS | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_A8),		(IDIS | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_A9),		(IDIS | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_A10),		(IDIS | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_D0),		(IEN  | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_D1),		(IEN  | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_D2),		(IEN  | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_D3),		(IEN  | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_D4),		(IEN  | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_D5),		(IEN  | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_D6),		(IEN  | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_D7),		(IEN  | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_D8),		(IEN  | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_D9),		(IEN  | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_D10),		(IEN  | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_D11),		(IEN  | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_D12),		(IEN  | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_D13),		(IEN  | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_D14),		(IEN  | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_D15),		(IEN  | PTU | EN  | M0));
	MUX_VAL(CP(GPMC_NCS0),		(IDIS | PTU | EN  | M0));

	/* SB-T35 Ethernet */
	MUX_VAL(CP(GPMC_NCS4),		(IEN  | PTU | EN  | M0));
	/* DVI enable */
	MUX_VAL(CP(GPMC_NCS3),		(IDIS | PTU | DIS  | M4));/*GPIO_54*/
	/* DataImage backlight */
	MUX_VAL(CP(GPMC_NCS7),		(IDIS | PTU | DIS  | M4));/*GPIO_58*/

	/* SB-T35 SD/MMC WP GPIO59 */
	MUX_VAL(CP(GPMC_CLK),		(IEN  | PTU | EN  | M4)); /*GPIO_59*/
	MUX_VAL(CP(GPMC_NWE),		(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(GPMC_NOE),		(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(GPMC_NADV_ALE),	(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(GPMC_NBE0_CLE),	(IDIS | PTU | EN  | M0));
	/* SB-T35 Audio Enable GPIO61 */
	MUX_VAL(CP(GPMC_NBE1),		(IDIS | PTU | EN  | M4)); /*GPIO_61*/
	MUX_VAL(CP(GPMC_NWP),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(GPMC_WAIT0),		(IEN  | PTU | EN  | M0));
	/* SB-T35 Ethernet IRQ GPIO65 */
	MUX_VAL(CP(GPMC_WAIT3),		(IEN  | PTU | EN  | M4)); /*GPIO_65*/

	/* UART3 Console */
	MUX_VAL(CP(UART3_RX_IRRX),	(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(UART3_TX_IRTX),	(IDIS | PTD | DIS | M0));
	/* RTC V3020 nCS GPIO163 */
	MUX_VAL(CP(UART3_CTS_RCTX),	(IEN  | PTU | EN  | M4)); /*GPIO_163*/
	/* SB-T35 Ethernet nRESET GPIO164 */
	MUX_VAL(CP(UART3_RTS_SD),	(IDIS | PTU | EN  | M4)); /*GPIO_164*/

	/* SB-T35 SD/MMC CD GPIO144 */
	MUX_VAL(CP(UART2_CTS),		(IEN  | PTU | EN  | M4)); /*GPIO_144*/
	/* WIFI nRESET GPIO145 */
	MUX_VAL(CP(UART2_RTS),		(IEN  | PTD | EN  | M4)); /*GPIO_145*/
	/* USB1 PHY Reset GPIO 146 */
	MUX_VAL(CP(UART2_TX),		(IEN  | PTD | EN  | M4)); /*GPIO_146*/
	/* USB2 PHY Reset GPIO 147 */
	MUX_VAL(CP(UART2_RX),		(IEN  | PTD | EN  | M4)); /*GPIO_147*/

	/* MMC1 */
	MUX_VAL(CP(MMC1_CLK),		(IEN  | PTU | EN  | M0));
	MUX_VAL(CP(MMC1_CMD),		(IEN  | PTU | DIS  | M0));
	MUX_VAL(CP(MMC1_DAT0),		(IEN  | PTU | DIS  | M0));
	MUX_VAL(CP(MMC1_DAT1),		(IEN  | PTU | DIS  | M0));
	MUX_VAL(CP(MMC1_DAT2),		(IEN  | PTU | DIS  | M0));
	MUX_VAL(CP(MMC1_DAT3),		(IEN  | PTU | DIS  | M0));

	/* DSS */
	MUX_VAL(CP(DSS_PCLK),		(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_HSYNC),		(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_VSYNC),		(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_ACBIAS),		(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_DATA0),		(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_DATA1),		(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_DATA2),		(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_DATA3),		(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_DATA4),		(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_DATA5),		(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_DATA6),		(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_DATA7),		(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_DATA8),		(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_DATA9),		(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_DATA10),		(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_DATA11),		(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_DATA12),		(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_DATA13),		(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_DATA14),		(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_DATA15),		(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_DATA16),		(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_DATA17),		(IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_DATA18),         (IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_DATA19),         (IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_DATA20),         (IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_DATA21),         (IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_DATA22),         (IDIS | PTD | DIS | M0));
	MUX_VAL(CP(DSS_DATA23),         (IDIS | PTD | DIS | M0));

	/* I2C */
	MUX_VAL(CP(I2C1_SCL),		(IEN  | PTU | EN  | M0));
	MUX_VAL(CP(I2C1_SDA),		(IEN  | PTU | EN  | M0));
	MUX_VAL(CP(I2C3_SCL),		(IEN  | PTU | EN  | M0));
	MUX_VAL(CP(I2C3_SDA),		(IEN  | PTU | EN  | M0));

	/* SB-T35 USB HUB Reset GPIO98 */
	MUX_VAL(CP(CCDC_WEN),		(IDIS | PTU | EN  | M4)); /*GPIO_98*/
	/* CM-T3517 USB HUB Reset GPIO152 */
	MUX_VAL(CP(MCBSP4_CLKX),	(IDIS | PTD | DIS | M4)); /*GPIO_152*/

	/* RMII */
	MUX_VAL(CP(RMII_MDIO_DATA),	(IEN  | PTU | EN  | M0));
	MUX_VAL(CP(RMII_MDIO_CLK),	(M0));
	MUX_VAL(CP(RMII_RXD0),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(RMII_RXD1),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(RMII_CRS_DV),	(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(RMII_RXER),		(IEN  | PTD | DIS | M0));
	MUX_VAL(CP(RMII_TXD0),		(IDIS | M0));
	MUX_VAL(CP(RMII_TXD1),		(IDIS | M0));
	MUX_VAL(CP(RMII_TXEN),		(IDIS | M0));
	MUX_VAL(CP(RMII_50MHZ_CLK),	(IEN  | PTU | DIS | M0));

	/* Green LED GPIO186 */
	MUX_VAL(CP(SYS_CLKOUT2),	(IDIS | PTU | DIS | M4)); /*GPIO_186*/

	/* SPI */
	MUX_VAL(CP(MCBSP1_CLKR),	(IEN | PTD | DIS | M1)); /*MCSPI4_CLK*/
	MUX_VAL(CP(MCBSP1_DX),		(IEN | PTD | DIS | M1)); /*MCSPI4_SIMO*/
	MUX_VAL(CP(MCBSP1_DR),		(IEN | PTD | DIS | M1)); /*MCSPI4_SOMI*/
	MUX_VAL(CP(MCBSP1_FSX),		(IEN | PTU | EN  | M1)); /*MCSPI4_CS0*/
	/* LCD reset GPIO157 */
	MUX_VAL(CP(MCBSP1_FSR),		(IDIS | PTU | DIS | M4)); /*GPIO_157*/

	/* RTC V3020 CS Enable GPIO160 */
	MUX_VAL(CP(MCBSP_CLKS),		(IEN  | PTD | EN  | M4)); /*GPIO_160*/
	/* SB-T35 LVDS Transmitter SHDN GPIO162 */
	MUX_VAL(CP(MCBSP1_CLKX),	(IEN  | PTU | DIS | M4)); /*GPIO_162*/

	/* USB0 - mUSB */
	MUX_VAL(CP(USB0_DRVBUS),	(IEN  | PTD | EN  | M0));
	/* USB1 EHCI */
	MUX_VAL(CP(ETK_D0_ES2),		(IEN  | PTD | EN  | M3)); /*HSUSB1_DT0*/
	MUX_VAL(CP(ETK_D1_ES2),		(IEN  | PTD | EN  | M3)); /*HSUSB1_DT1*/
	MUX_VAL(CP(ETK_D2_ES2),		(IEN  | PTD | EN  | M3)); /*HSUSB1_DT2*/
	MUX_VAL(CP(ETK_D7_ES2),		(IEN  | PTD | EN  | M3)); /*HSUSB1_DT3*/
	MUX_VAL(CP(ETK_D4_ES2),		(IEN  | PTD | EN  | M3)); /*HSUSB1_DT4*/
	MUX_VAL(CP(ETK_D5_ES2),		(IEN  | PTD | EN  | M3)); /*HSUSB1_DT5*/
	MUX_VAL(CP(ETK_D6_ES2),		(IEN  | PTD | EN  | M3)); /*HSUSB1_DT6*/
	MUX_VAL(CP(ETK_D3_ES2),		(IEN  | PTD | EN  | M3)); /*HSUSB1_DT7*/
	MUX_VAL(CP(ETK_D8_ES2),		(IEN  | PTD | EN  | M3)); /*HSUSB1_DIR*/
	MUX_VAL(CP(ETK_D9_ES2),		(IEN  | PTD | EN  | M3)); /*HSUSB1_NXT*/
	MUX_VAL(CP(ETK_CTL_ES2),	(IDIS | PTD | DIS | M3)); /*HSUSB1_CLK*/
	MUX_VAL(CP(ETK_CLK_ES2),	(IDIS | PTU | DIS | M3)); /*HSUSB1_STP*/
	/* USB2 EHCI */
	MUX_VAL(CP(ETK_D14_ES2),	(IEN  | PTD | EN  | M3)); /*HSUSB2_DT0*/
	MUX_VAL(CP(ETK_D15_ES2),	(IEN  | PTD | EN  | M3)); /*HSUSB2_DT1*/
	MUX_VAL(CP(MCSPI1_CS3),		(IEN  | PTD | EN  | M3)); /*HSUSB2_DT2*/
	MUX_VAL(CP(MCSPI2_CS1),		(IEN  | PTD | EN  | M3)); /*HSUSB2_DT3*/
	MUX_VAL(CP(MCSPI2_SIMO),	(IEN  | PTD | EN  | M3)); /*HSUSB2_DT4*/
	MUX_VAL(CP(MCSPI2_SOMI),	(IEN  | PTD | EN  | M3)); /*HSUSB2_DT5*/
	MUX_VAL(CP(MCSPI2_CS0),		(IEN  | PTD | EN  | M3)); /*HSUSB2_DT6*/
	MUX_VAL(CP(MCSPI2_CLK),		(IEN  | PTD | EN  | M3)); /*HSUSB2_DT7*/
	MUX_VAL(CP(ETK_D12_ES2),	(IEN  | PTD | EN  | M3)); /*HSUSB2_DIR*/
	MUX_VAL(CP(ETK_D13_ES2),	(IEN  | PTD | EN  | M3)); /*HSUSB2_NXT*/
	MUX_VAL(CP(ETK_D10_ES2),	(IDIS | PTD | DIS | M3)); /*HSUSB2_CLK*/
	MUX_VAL(CP(ETK_D11_ES2),	(IDIS | PTU | DIS | M3)); /*HSUSB2_STP*/

	/* SYS_BOOT */
	MUX_VAL(CP(SYS_BOOT0),		(IEN  | PTU | DIS | M4)); /*GPIO_2*/
	MUX_VAL(CP(SYS_BOOT1),		(IEN  | PTU | DIS | M4)); /*GPIO_3*/
	MUX_VAL(CP(SYS_BOOT2),		(IEN  | PTU | DIS | M4)); /*GPIO_4*/
	MUX_VAL(CP(SYS_BOOT3),		(IEN  | PTU | DIS | M4)); /*GPIO_5*/
	MUX_VAL(CP(SYS_BOOT4),		(IEN  | PTU | DIS | M4)); /*GPIO_6*/
	MUX_VAL(CP(SYS_BOOT5),		(IEN  | PTU | DIS | M4)); /*GPIO_7*/
}
