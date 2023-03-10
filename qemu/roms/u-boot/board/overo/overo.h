/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * (C) Copyright 2008
 * Steve Sakoman <steve@sakoman.com>
 */
#ifndef _OVERO_H_
#define _OVERO_H_

const omap3_sysinfo sysinfo = {
	DDR_STACKED,
	"Gumstix Overo board",
#if defined(CONFIG_ENV_IS_IN_ONENAND)
	"OneNAND",
#else
	"NAND",
#endif
};

int get_board_revision(void);

/* overo revisions */
#define REVISION_0	0x0
#define REVISION_1	0x1
#define REVISION_2	0x2
#define REVISION_3	0x3
#define REVISION_4	0x4

/*
 * IEN  - Input Enable
 * IDIS - Input Disable
 * PTD  - Pull type Down
 * PTU  - Pull type Up
 * DIS  - Pull type selection is inactive
 * EN   - Pull type selection is active
 * M0   - Mode 0
 * The commented string gives the final mux configuration for that pin
 */
#define MUX_GUMSTIX() \
  /*GPMC*/\
	MUX_VAL(CP(GPMC_NCS1),		(IDIS | PTU | EN  | M0)) /*GPMC_nCS1*/\
	MUX_VAL(CP(GPMC_NCS4),		(IDIS | PTU | EN  | M0)) /*GPMC_nCS4*/\
	MUX_VAL(CP(GPMC_NCS5),		(IDIS | PTU | EN  | M0)) /*GPMC_nCS5*/\
	MUX_VAL(CP(GPMC_NCS6),		(IEN  | PTD | DIS | M0)) /*GPMC_nCS6*/\
	MUX_VAL(CP(GPMC_WAIT1),		(IEN  | PTU | EN  | M4)) /*GPIO_63*/\
								 /* - CAM_IRQ*/\
	MUX_VAL(CP(GPMC_WAIT2),		(IEN  | PTU | EN  | M4)) /*GPIO_64*/\
								 /* - SMSC911X_NRES*/\
	MUX_VAL(CP(GPMC_WAIT3),		(IEN  | PTU | DIS | M4)) /*GPIO_65*/\
 /*DSS*/\
	MUX_VAL(CP(DSS_PCLK),		(IDIS | PTD | DIS | M0)) /*DSS_PCLK*/\
	MUX_VAL(CP(DSS_HSYNC),		(IDIS | PTD | DIS | M0)) /*DSS_HSYNC*/\
	MUX_VAL(CP(DSS_VSYNC),		(IDIS | PTD | DIS | M0)) /*DSS_VSYNC*/\
	MUX_VAL(CP(DSS_ACBIAS),		(IDIS | PTD | DIS | M0)) /*DSS_ACBIAS*/\
	MUX_VAL(CP(DSS_DATA0),		(IDIS | PTD | DIS | M0)) /*DSS_DATA0*/\
	MUX_VAL(CP(DSS_DATA1),		(IDIS | PTD | DIS | M0)) /*DSS_DATA1*/\
	MUX_VAL(CP(DSS_DATA2),		(IDIS | PTD | DIS | M0)) /*DSS_DATA2*/\
	MUX_VAL(CP(DSS_DATA3),		(IDIS | PTD | DIS | M0)) /*DSS_DATA3*/\
	MUX_VAL(CP(DSS_DATA4),		(IDIS | PTD | DIS | M0)) /*DSS_DATA4*/\
	MUX_VAL(CP(DSS_DATA5),		(IDIS | PTD | DIS | M0)) /*DSS_DATA5*/\
	MUX_VAL(CP(DSS_DATA6),		(IDIS | PTD | DIS | M0)) /*DSS_DATA6*/\
	MUX_VAL(CP(DSS_DATA7),		(IDIS | PTD | DIS | M0)) /*DSS_DATA7*/\
	MUX_VAL(CP(DSS_DATA8),		(IDIS | PTD | DIS | M0)) /*DSS_DATA8*/\
	MUX_VAL(CP(DSS_DATA9),		(IDIS | PTD | DIS | M0)) /*DSS_DATA9*/\
	MUX_VAL(CP(DSS_DATA10),		(IDIS | PTD | DIS | M0)) /*DSS_DATA10*/\
	MUX_VAL(CP(DSS_DATA11),		(IDIS | PTD | DIS | M0)) /*DSS_DATA11*/\
	MUX_VAL(CP(DSS_DATA12),		(IDIS | PTD | DIS | M0)) /*DSS_DATA12*/\
	MUX_VAL(CP(DSS_DATA13),		(IDIS | PTD | DIS | M0)) /*DSS_DATA13*/\
	MUX_VAL(CP(DSS_DATA14),		(IDIS | PTD | DIS | M0)) /*DSS_DATA14*/\
	MUX_VAL(CP(DSS_DATA15),		(IDIS | PTD | DIS | M0)) /*DSS_DATA15*/\
	MUX_VAL(CP(DSS_DATA16),		(IDIS | PTD | DIS | M0)) /*DSS_DATA16*/\
	MUX_VAL(CP(DSS_DATA17),		(IDIS | PTD | DIS | M0)) /*DSS_DATA17*/\
	MUX_VAL(CP(DSS_DATA18),		(IDIS | PTD | DIS | M0)) /*DSS_DATA18*/\
	MUX_VAL(CP(DSS_DATA19),		(IDIS | PTD | DIS | M0)) /*DSS_DATA19*/\
	MUX_VAL(CP(DSS_DATA20),		(IDIS | PTD | DIS | M0)) /*DSS_DATA20*/\
	MUX_VAL(CP(DSS_DATA21),		(IDIS | PTD | DIS | M0)) /*DSS_DATA21*/\
	MUX_VAL(CP(DSS_DATA22),		(IDIS | PTD | DIS | M0)) /*DSS_DATA22*/\
	MUX_VAL(CP(DSS_DATA23),		(IDIS | PTD | DIS | M0)) /*DSS_DATA23*/\
 /*CAMERA*/\
	MUX_VAL(CP(CAM_FLD),		(IDIS | PTD | DIS | M4)) /*CAM_FLD*/\
	MUX_VAL(CP(CAM_XCLKB),		(IDIS | PTD | DIS | M0)) /*CAM_XCLKB*/\
	MUX_VAL(CP(CAM_WEN),		(IEN  | PTD | DIS | M0)) /*CAM_WEN*/\
	MUX_VAL(CP(CAM_STROBE),		(IDIS | PTD | DIS | M0)) /*CAM_STROBE*/\
	MUX_VAL(CP(CSI2_DX1),		(IEN  | PTD | EN  | M4)) /*GPIO_114*/\
								 /* - PEN_DOWN*/\
 /*Bluetooth*/\
	MUX_VAL(CP(UART2_CTS),		(IEN  | PTD | DIS | M4)) /*GPIO_144 - LCD_EN*/\
	MUX_VAL(CP(UART2_RTS),		(IEN  | PTD | DIS | M4)) /*GPIO_145*/\
	MUX_VAL(CP(UART2_TX),		(IEN  | PTD | DIS | M4)) /*GPIO_146*/\
	MUX_VAL(CP(UART2_RX),		(IEN  | PTD | DIS | M4)) /*GPIO_147*/\
	MUX_VAL(CP(UART1_TX),		(IDIS | PTD | DIS | M0)) /*UART1_TX*/\
	MUX_VAL(CP(UART1_CTS),		(IEN  | PTU | DIS | M4)) /*GPIO_150-MMC3_WP*/\
	MUX_VAL(CP(UART1_RX),		(IEN  | PTD | DIS | M0)) /*UART1_RX*/\
 /*Serial Interface*/\
	MUX_VAL(CP(UART3_CTS_RCTX),	(IEN  | PTD | EN  | M0)) /*UART3_CTS_RCTX*/\
	MUX_VAL(CP(HDQ_SIO),		(IDIS | PTU | EN  | M4)) /*HDQ_SIO*/\
	MUX_VAL(CP(MCSPI1_CLK),		(IEN  | PTD | DIS | M0)) /*McSPI1_CLK*/\
	MUX_VAL(CP(MCSPI1_SIMO),	(IEN  | PTD | DIS | M0)) /*McSPI1_SIMO */\
	MUX_VAL(CP(MCSPI1_SOMI),	(IEN  | PTD | DIS | M0)) /*McSPI1_SOMI */\
	MUX_VAL(CP(MCSPI1_CS0),		(IEN  | PTD | EN  | M0)) /*McSPI1_CS0*/\
	MUX_VAL(CP(MCSPI1_CS1),		(IDIS | PTD | EN  | M0)) /*McSPI1_CS1*/\
	MUX_VAL(CP(MCSPI1_CS2),		(IEN  | PTU | DIS | M4)) /*GPIO_176 */\
								 /* - LAN_INTR */\
 /*Control and debug */\
	MUX_VAL(CP(SYS_CLKOUT1),	(IEN  | PTU | EN  | M4)) /*GPIO_10*/\
	MUX_VAL(CP(SYS_CLKOUT2),	(IEN  | PTU | EN  | M4)) /*GPIO_186*/\
	MUX_VAL(CP(ETK_CLK_ES2),	(IEN  | PTU | EN  | M2)) /*MMC3_CLK*/\
	MUX_VAL(CP(ETK_CTL_ES2),	(IEN  | PTU | EN  | M2)) /*MMC3_CMD*/\
	MUX_VAL(CP(ETK_D0_ES2),		(IEN  | PTU | EN  | M4)) /*GPIO_14*/\
	MUX_VAL(CP(ETK_D3_ES2),		(IEN  | PTU | EN  | M2)) /*MMC3_DAT3*/\
	MUX_VAL(CP(ETK_D4_ES2),		(IEN  | PTU | EN  | M2)) /*MMC3_DAT0*/\
	MUX_VAL(CP(ETK_D5_ES2),		(IEN  | PTU | EN  | M2)) /*MMC3_DAT1*/\
	MUX_VAL(CP(ETK_D6_ES2),		(IEN  | PTU | EN  | M2)) /*MMC3_DAT2*/\
	MUX_VAL(CP(ETK_D7_ES2),		(IEN  | PTU | EN  | M4)) /*GPIO_21*/\
	MUX_VAL(CP(ETK_D8_ES2),		(IEN  | PTU | EN  | M4)) /*GPIO_22*/\
	MUX_VAL(CP(ETK_D9_ES2),		(IEN  | PTU | EN  | M4)) /*GPIO_23*/\

#define MUX_OVERO_SDIO2_DIRECT() \
	MUX_VAL(CP(MMC2_CLK),		(IEN  | PTU | EN  | M0)) /*MMC2_CLK*/\
	MUX_VAL(CP(MMC2_CMD),		(IEN  | PTU | EN  | M0)) /*MMC2_CMD*/\
	MUX_VAL(CP(MMC2_DAT0),		(IEN  | PTU | EN  | M0)) /*MMC2_DAT0*/\
	MUX_VAL(CP(MMC2_DAT1),		(IEN  | PTU | EN  | M0)) /*MMC2_DAT1*/\
	MUX_VAL(CP(MMC2_DAT2),		(IEN  | PTU | EN  | M0)) /*MMC2_DAT2*/\
	MUX_VAL(CP(MMC2_DAT3),		(IEN  | PTU | EN  | M0)) /*MMC2_DAT3*/\
	MUX_VAL(CP(MMC2_DAT4),		(IEN  | PTU | EN  | M0)) /*MMC2_DAT4*/\
	MUX_VAL(CP(MMC2_DAT5),		(IEN  | PTU | EN  | M0)) /*MMC2_DAT5*/\
	MUX_VAL(CP(MMC2_DAT6),		(IEN  | PTU | EN  | M0)) /*MMC2_DAT6*/\
	MUX_VAL(CP(MMC2_DAT7),		(IEN  | PTU | EN  | M0)) /*MMC2_DAT7*/\
	MUX_VAL(CP(MMC1_DAT4),		(IEN  | PTD | EN  | M4)) /*GPIO_126*/\
	MUX_VAL(CP(MMC1_DAT5),		(IEN  | PTU | EN  | M4)) /*GPIO_127*/\
	MUX_VAL(CP(MMC1_DAT6),		(IEN  | PTU | EN  | M4)) /*GPIO_128*/\
	MUX_VAL(CP(MMC1_DAT7),		(IEN  | PTU | EN  | M4)) /*GPIO_129*/

#define MUX_OVERO_SDIO2_TRANSCEIVER() \
	MUX_VAL(CP(MMC2_CLK),		(IEN  | PTU | EN  | M0)) /*MMC2_CLK*/\
	MUX_VAL(CP(MMC2_CMD),		(IEN  | PTU | EN  | M0)) /*MMC2_CMD*/\
	MUX_VAL(CP(MMC2_DAT0),		(IEN  | PTU | EN  | M0)) /*MMC2_DAT0*/\
	MUX_VAL(CP(MMC2_DAT1),		(IEN  | PTU | EN  | M0)) /*MMC2_DAT1*/\
	MUX_VAL(CP(MMC2_DAT2),		(IEN  | PTU | EN  | M0)) /*MMC2_DAT2*/\
	MUX_VAL(CP(MMC2_DAT3),		(IEN  | PTU | EN  | M0)) /*MMC2_DAT3*/\
	MUX_VAL(CP(MMC2_DAT4),		(IEN  | PTU | EN  | M1)) /*MMC2_DIR_DAT0*/\
	MUX_VAL(CP(MMC2_DAT5),		(IEN  | PTU | EN  | M1)) /*MMC2_DIR_DAT1*/\
	MUX_VAL(CP(MMC2_DAT6),		(IEN  | PTU | EN  | M1)) /*MMC2_DIR_CMD*/\
	MUX_VAL(CP(MMC2_DAT7),		(IEN  | PTU | EN  | M1)) /*MMC2_CLKIN*/\
	MUX_VAL(CP(MMC1_DAT4),		(IEN  | PTU | EN  | M4)) /*GPIO_126*/\
	MUX_VAL(CP(MMC1_DAT5),		(IEN  | PTU | EN  | M4)) /*GPIO_127*/\
	MUX_VAL(CP(MMC1_DAT6),		(IEN  | PTU | EN  | M4)) /*GPIO_128*/\
	MUX_VAL(CP(MMC1_DAT7),		(IEN  | PTU | EN  | M4)) /*GPIO_129*/

#define MUX_USRP_E() \
	MUX_VAL(CP(MCSPI1_SOMI),	(IEN  | PTD | DIS | M4)) /*GPIO_173 */\
	MUX_VAL(CP(MCSPI1_CS1),		(IDIS | PTD | EN  | M4)) /*GPIO_175 */\

#define MUX_ALTO35() \
	MUX_VAL(CP(SYS_CLKOUT1),	(IEN  | PTU | EN  | M4)) /*GPIO_10-BTN*/\
	MUX_VAL(CP(UART1_TX),		(IDIS | PTD | DIS | M4)) /*GPIO_148-RED LED*/\
	MUX_VAL(CP(UART1_CTS),		(IDIS | PTD | DIS | M4)) /*GPIO_150-YELLOW LED*/\
	MUX_VAL(CP(UART1_RX),		(IDIS | PTD | DIS | M4)) /*GPIO_151-BLUE LED*/\
	MUX_VAL(CP(HDQ_SIO),		(IDIS | PTD | DIS | M4)) /*GPIO_170-GREEN LED*/\
	MUX_VAL(CP(MCSPI1_CS1),		(IDIS | PTD | EN  | M4)) /*GPIO_175*/\

#define MUX_ARBOR43C() \
	MUX_VAL(CP(CSI2_DX1),		(IDIS | PTD | DIS | M4)) /*GPIO_114-RED LED*/\
	MUX_VAL(CP(UART1_CTS),		(IDIS | PTD | DIS | M4)) /*GPIO_150-YELLOW LED*/\
	MUX_VAL(CP(HDQ_SIO),		(IEN  | PTU | EN  | M4)) /*GPIO_170-BUTTON */\
	MUX_VAL(CP(SYS_CLKOUT2),	(IDIS | PTD | DIS | M4)) /*GPIO_186-BLUE LED*/\
	MUX_VAL(CP(JTAG_EMU1),		(IDIS | PTD | DIS | M4)) /*GPIO_31-CAP WAKE*/\
	MUX_VAL(CP(SYS_CLKOUT1),	(IEN  | PTU | EN  | M4)) /*GPIO_10-CAP IRQ*/\

#endif
