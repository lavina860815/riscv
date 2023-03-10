/*
 * TNETV107X: Pinmux APIs
 *
 * See file CREDITS for list of people who contributed to this
 * project.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */

#ifndef __ASM_ARCH_MUX_H
#define __ASM_ARCH_MUX_H

struct pin_config {
	unsigned char reg_index;
	unsigned char mask_offset;
	unsigned char mode;
};

#define TNETV107X_MUX_CFG(reg, offset, mux_mode) \
			{ reg, offset, mux_mode }

int mux_select_pin(short index);
int mux_select_pins(const short *pins);

enum tnetv107x_pin_mux_index {
	TNETV107X_PIN_ASR_A00,
	TNETV107X_PIN_GPIO32,
	TNETV107X_PIN_ASR_A01,
	TNETV107X_PIN_GPIO33,
	TNETV107X_PIN_ASR_A02,
	TNETV107X_PIN_GPIO34,
	TNETV107X_PIN_ASR_A03,
	TNETV107X_PIN_GPIO35,
	TNETV107X_PIN_ASR_A04,
	TNETV107X_PIN_GPIO36,
	TNETV107X_PIN_ASR_A05,
	TNETV107X_PIN_GPIO37,
	TNETV107X_PIN_ASR_A06,
	TNETV107X_PIN_GPIO38,
	TNETV107X_PIN_ASR_A07,
	TNETV107X_PIN_GPIO39,
	TNETV107X_PIN_ASR_A08,
	TNETV107X_PIN_GPIO40,
	TNETV107X_PIN_ASR_A09,
	TNETV107X_PIN_GPIO41,
	TNETV107X_PIN_ASR_A10,
	TNETV107X_PIN_GPIO42,
	TNETV107X_PIN_ASR_A11,
	TNETV107X_PIN_BOOT_STRP_0,
	TNETV107X_PIN_ASR_A12,
	TNETV107X_PIN_BOOT_STRP_1,
	TNETV107X_PIN_ASR_A13,
	TNETV107X_PIN_GPIO43,
	TNETV107X_PIN_ASR_A14,
	TNETV107X_PIN_GPIO44,
	TNETV107X_PIN_ASR_A15,
	TNETV107X_PIN_GPIO45,
	TNETV107X_PIN_ASR_A16,
	TNETV107X_PIN_GPIO46,
	TNETV107X_PIN_ASR_A17,
	TNETV107X_PIN_GPIO47,
	TNETV107X_PIN_ASR_A18,
	TNETV107X_PIN_GPIO48,
	TNETV107X_PIN_SDIO1_DATA3_0,
	TNETV107X_PIN_ASR_A19,
	TNETV107X_PIN_GPIO49,
	TNETV107X_PIN_SDIO1_DATA2_0,
	TNETV107X_PIN_ASR_A20,
	TNETV107X_PIN_GPIO50,
	TNETV107X_PIN_SDIO1_DATA1_0,
	TNETV107X_PIN_ASR_A21,
	TNETV107X_PIN_GPIO51,
	TNETV107X_PIN_SDIO1_DATA0_0,
	TNETV107X_PIN_ASR_A22,
	TNETV107X_PIN_GPIO52,
	TNETV107X_PIN_SDIO1_CMD_0,
	TNETV107X_PIN_ASR_A23,
	TNETV107X_PIN_GPIO53,
	TNETV107X_PIN_SDIO1_CLK_0,
	TNETV107X_PIN_ASR_BA_1,
	TNETV107X_PIN_GPIO54,
	TNETV107X_PIN_SYS_PLL_CLK,
	TNETV107X_PIN_ASR_CS0,
	TNETV107X_PIN_ASR_CS1,
	TNETV107X_PIN_ASR_CS2,
	TNETV107X_PIN_TDM_PLL_CLK,
	TNETV107X_PIN_ASR_CS3,
	TNETV107X_PIN_ETH_PHY_CLK,
	TNETV107X_PIN_ASR_D00,
	TNETV107X_PIN_GPIO55,
	TNETV107X_PIN_ASR_D01,
	TNETV107X_PIN_GPIO56,
	TNETV107X_PIN_ASR_D02,
	TNETV107X_PIN_GPIO57,
	TNETV107X_PIN_ASR_D03,
	TNETV107X_PIN_GPIO58,
	TNETV107X_PIN_ASR_D04,
	TNETV107X_PIN_GPIO59_0,
	TNETV107X_PIN_ASR_D05,
	TNETV107X_PIN_GPIO60_0,
	TNETV107X_PIN_ASR_D06,
	TNETV107X_PIN_GPIO61_0,
	TNETV107X_PIN_ASR_D07,
	TNETV107X_PIN_GPIO62_0,
	TNETV107X_PIN_ASR_D08,
	TNETV107X_PIN_GPIO63_0,
	TNETV107X_PIN_ASR_D09,
	TNETV107X_PIN_GPIO64_0,
	TNETV107X_PIN_ASR_D10,
	TNETV107X_PIN_SDIO1_DATA3_1,
	TNETV107X_PIN_ASR_D11,
	TNETV107X_PIN_SDIO1_DATA2_1,
	TNETV107X_PIN_ASR_D12,
	TNETV107X_PIN_SDIO1_DATA1_1,
	TNETV107X_PIN_ASR_D13,
	TNETV107X_PIN_SDIO1_DATA0_1,
	TNETV107X_PIN_ASR_D14,
	TNETV107X_PIN_SDIO1_CMD_1,
	TNETV107X_PIN_ASR_D15,
	TNETV107X_PIN_SDIO1_CLK_1,
	TNETV107X_PIN_ASR_OE,
	TNETV107X_PIN_BOOT_STRP_2,
	TNETV107X_PIN_ASR_RNW,
	TNETV107X_PIN_GPIO29_0,
	TNETV107X_PIN_ASR_WAIT,
	TNETV107X_PIN_GPIO30_0,
	TNETV107X_PIN_ASR_WE,
	TNETV107X_PIN_BOOT_STRP_3,
	TNETV107X_PIN_ASR_WE_DQM0,
	TNETV107X_PIN_GPIO31,
	TNETV107X_PIN_LCD_PD17_0,
	TNETV107X_PIN_ASR_WE_DQM1,
	TNETV107X_PIN_ASR_BA0_0,
	TNETV107X_PIN_VLYNQ_CLK,
	TNETV107X_PIN_GPIO14,
	TNETV107X_PIN_LCD_PD19_0,
	TNETV107X_PIN_VLYNQ_RXD0,
	TNETV107X_PIN_GPIO15,
	TNETV107X_PIN_LCD_PD20_0,
	TNETV107X_PIN_VLYNQ_RXD1,
	TNETV107X_PIN_GPIO16,
	TNETV107X_PIN_LCD_PD21_0,
	TNETV107X_PIN_VLYNQ_TXD0,
	TNETV107X_PIN_GPIO17,
	TNETV107X_PIN_LCD_PD22_0,
	TNETV107X_PIN_VLYNQ_TXD1,
	TNETV107X_PIN_GPIO18,
	TNETV107X_PIN_LCD_PD23_0,
	TNETV107X_PIN_SDIO0_CLK,
	TNETV107X_PIN_GPIO19,
	TNETV107X_PIN_SDIO0_CMD,
	TNETV107X_PIN_GPIO20,
	TNETV107X_PIN_SDIO0_DATA0,
	TNETV107X_PIN_GPIO21,
	TNETV107X_PIN_SDIO0_DATA1,
	TNETV107X_PIN_GPIO22,
	TNETV107X_PIN_SDIO0_DATA2,
	TNETV107X_PIN_GPIO23,
	TNETV107X_PIN_SDIO0_DATA3,
	TNETV107X_PIN_GPIO24,
	TNETV107X_PIN_EMU0,
	TNETV107X_PIN_EMU1,
	TNETV107X_PIN_RTCK,
	TNETV107X_PIN_TRST_N,
	TNETV107X_PIN_TCK,
	TNETV107X_PIN_TDI,
	TNETV107X_PIN_TDO,
	TNETV107X_PIN_TMS,
	TNETV107X_PIN_TDM1_CLK,
	TNETV107X_PIN_TDM1_RX,
	TNETV107X_PIN_TDM1_TX,
	TNETV107X_PIN_TDM1_FS,
	TNETV107X_PIN_KEYPAD_R0,
	TNETV107X_PIN_KEYPAD_R1,
	TNETV107X_PIN_KEYPAD_R2,
	TNETV107X_PIN_KEYPAD_R3,
	TNETV107X_PIN_KEYPAD_R4,
	TNETV107X_PIN_KEYPAD_R5,
	TNETV107X_PIN_KEYPAD_R6,
	TNETV107X_PIN_GPIO12,
	TNETV107X_PIN_KEYPAD_R7,
	TNETV107X_PIN_GPIO10,
	TNETV107X_PIN_KEYPAD_C0,
	TNETV107X_PIN_KEYPAD_C1,
	TNETV107X_PIN_KEYPAD_C2,
	TNETV107X_PIN_KEYPAD_C3,
	TNETV107X_PIN_KEYPAD_C4,
	TNETV107X_PIN_KEYPAD_C5,
	TNETV107X_PIN_KEYPAD_C6,
	TNETV107X_PIN_GPIO13,
	TNETV107X_PIN_TEST_CLK_IN,
	TNETV107X_PIN_KEYPAD_C7,
	TNETV107X_PIN_GPIO11,
	TNETV107X_PIN_SSP0_0,
	TNETV107X_PIN_SCC_DCLK,
	TNETV107X_PIN_LCD_PD20_1,
	TNETV107X_PIN_SSP0_1,
	TNETV107X_PIN_SCC_CS_N,
	TNETV107X_PIN_LCD_PD21_1,
	TNETV107X_PIN_SSP0_2,
	TNETV107X_PIN_SCC_D,
	TNETV107X_PIN_LCD_PD22_1,
	TNETV107X_PIN_SSP0_3,
	TNETV107X_PIN_SCC_RESETN,
	TNETV107X_PIN_LCD_PD23_1,
	TNETV107X_PIN_SSP1_0,
	TNETV107X_PIN_GPIO25,
	TNETV107X_PIN_UART2_CTS,
	TNETV107X_PIN_SSP1_1,
	TNETV107X_PIN_GPIO26,
	TNETV107X_PIN_UART2_RD,
	TNETV107X_PIN_SSP1_2,
	TNETV107X_PIN_GPIO27,
	TNETV107X_PIN_UART2_RTS,
	TNETV107X_PIN_SSP1_3,
	TNETV107X_PIN_GPIO28,
	TNETV107X_PIN_UART2_TD,
	TNETV107X_PIN_UART0_CTS,
	TNETV107X_PIN_UART0_RD,
	TNETV107X_PIN_UART0_RTS,
	TNETV107X_PIN_UART0_TD,
	TNETV107X_PIN_UART1_RD,
	TNETV107X_PIN_UART1_TD,
	TNETV107X_PIN_LCD_AC_NCS,
	TNETV107X_PIN_LCD_HSYNC_RNW,
	TNETV107X_PIN_LCD_VSYNC_A0,
	TNETV107X_PIN_LCD_MCLK,
	TNETV107X_PIN_LCD_PD16_0,
	TNETV107X_PIN_LCD_PCLK_E,
	TNETV107X_PIN_LCD_PD00,
	TNETV107X_PIN_LCD_PD01,
	TNETV107X_PIN_LCD_PD02,
	TNETV107X_PIN_LCD_PD03,
	TNETV107X_PIN_LCD_PD04,
	TNETV107X_PIN_LCD_PD05,
	TNETV107X_PIN_LCD_PD06,
	TNETV107X_PIN_LCD_PD07,
	TNETV107X_PIN_LCD_PD08,
	TNETV107X_PIN_GPIO59_1,
	TNETV107X_PIN_LCD_PD09,
	TNETV107X_PIN_GPIO60_1,
	TNETV107X_PIN_LCD_PD10,
	TNETV107X_PIN_ASR_BA0_1,
	TNETV107X_PIN_GPIO61_1,
	TNETV107X_PIN_LCD_PD11,
	TNETV107X_PIN_GPIO62_1,
	TNETV107X_PIN_LCD_PD12,
	TNETV107X_PIN_GPIO63_1,
	TNETV107X_PIN_LCD_PD13,
	TNETV107X_PIN_GPIO64_1,
	TNETV107X_PIN_LCD_PD14,
	TNETV107X_PIN_GPIO29_1,
	TNETV107X_PIN_LCD_PD15,
	TNETV107X_PIN_GPIO30_1,
	TNETV107X_PIN_EINT0,
	TNETV107X_PIN_GPIO08,
	TNETV107X_PIN_EINT1,
	TNETV107X_PIN_GPIO09,
	TNETV107X_PIN_GPIO00,
	TNETV107X_PIN_LCD_PD20_2,
	TNETV107X_PIN_TDM_CLK_IN_2,
	TNETV107X_PIN_GPIO01,
	TNETV107X_PIN_LCD_PD21_2,
	TNETV107X_PIN_24M_CLK_OUT_1,
	TNETV107X_PIN_GPIO02,
	TNETV107X_PIN_LCD_PD22_2,
	TNETV107X_PIN_GPIO03,
	TNETV107X_PIN_LCD_PD23_2,
	TNETV107X_PIN_GPIO04,
	TNETV107X_PIN_LCD_PD16_1,
	TNETV107X_PIN_USB0_RXERR,
	TNETV107X_PIN_GPIO05,
	TNETV107X_PIN_LCD_PD17_1,
	TNETV107X_PIN_TDM_CLK_IN_1,
	TNETV107X_PIN_GPIO06,
	TNETV107X_PIN_LCD_PD18,
	TNETV107X_PIN_24M_CLK_OUT_2,
	TNETV107X_PIN_GPIO07,
	TNETV107X_PIN_LCD_PD19_1,
	TNETV107X_PIN_USB1_RXERR,
	TNETV107X_PIN_ETH_PLL_CLK,
	TNETV107X_PIN_MDIO,
	TNETV107X_PIN_MDC,
	TNETV107X_PIN_AIC_MUTE_STAT_N,
	TNETV107X_PIN_TDM0_CLK,
	TNETV107X_PIN_AIC_HNS_EN_N,
	TNETV107X_PIN_TDM0_FS,
	TNETV107X_PIN_AIC_HDS_EN_STAT_N,
	TNETV107X_PIN_TDM0_TX,
	TNETV107X_PIN_AIC_HNF_EN_STAT_N,
	TNETV107X_PIN_TDM0_RX,
};

#endif
