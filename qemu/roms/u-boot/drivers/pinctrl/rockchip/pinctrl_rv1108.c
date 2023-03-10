// SPDX-License-Identifier: GPL-2.0+
/*
 * (C) Copyright 2016 Rockchip Electronics Co., Ltd
 * Author: Andy Yan <andy.yan@rock-chips.com>
 */
#include <common.h>
#include <dm.h>
#include <errno.h>
#include <syscon.h>
#include <asm/io.h>
#include <asm/arch/clock.h>
#include <asm/arch/grf_rv1108.h>
#include <asm/arch/hardware.h>
#include <asm/arch/periph.h>
#include <dm/pinctrl.h>

struct rv1108_pinctrl_priv {
	struct rv1108_grf *grf;
};

/* GRF_GPIO1B_IOMUX */
enum {
	GPIO1B7_SHIFT		= 14,
	GPIO1B7_MASK		= 3 << GPIO1B7_SHIFT,
	GPIO1B7_GPIO		= 0,
	GPIO1B7_LCDC_D12,
	GPIO1B7_I2S_SDIO2_M0,
	GPIO1B7_GMAC_RXDV,

	GPIO1B6_SHIFT		= 12,
	GPIO1B6_MASK		= 3 << GPIO1B6_SHIFT,
	GPIO1B6_GPIO		= 0,
	GPIO1B6_LCDC_D13,
	GPIO1B6_I2S_LRCLKTX_M0,
	GPIO1B6_GMAC_RXD1,

	GPIO1B5_SHIFT		= 10,
	GPIO1B5_MASK		= 3 << GPIO1B5_SHIFT,
	GPIO1B5_GPIO		= 0,
	GPIO1B5_LCDC_D14,
	GPIO1B5_I2S_SDIO1_M0,
	GPIO1B5_GMAC_RXD0,

	GPIO1B4_SHIFT		= 8,
	GPIO1B4_MASK		= 3 << GPIO1B4_SHIFT,
	GPIO1B4_GPIO		= 0,
	GPIO1B4_LCDC_D15,
	GPIO1B4_I2S_MCLK_M0,
	GPIO1B4_GMAC_TXEN,

	GPIO1B3_SHIFT		= 6,
	GPIO1B3_MASK		= 3 << GPIO1B3_SHIFT,
	GPIO1B3_GPIO		= 0,
	GPIO1B3_LCDC_D16,
	GPIO1B3_I2S_SCLK_M0,
	GPIO1B3_GMAC_TXD1,

	GPIO1B2_SHIFT		= 4,
	GPIO1B2_MASK		= 3 << GPIO1B2_SHIFT,
	GPIO1B2_GPIO		= 0,
	GPIO1B2_LCDC_D17,
	GPIO1B2_I2S_SDIO_M0,
	GPIO1B2_GMAC_TXD0,

	GPIO1B1_SHIFT		= 2,
	GPIO1B1_MASK		= 3 << GPIO1B1_SHIFT,
	GPIO1B1_GPIO		= 0,
	GPIO1B1_LCDC_D9,
	GPIO1B1_PWM7,

	GPIO1B0_SHIFT		= 0,
	GPIO1B0_MASK		= 3,
	GPIO1B0_GPIO		= 0,
	GPIO1B0_LCDC_D8,
	GPIO1B0_PWM6,
};

/* GRF_GPIO1C_IOMUX */
enum {
	GPIO1C7_SHIFT		= 14,
	GPIO1C7_MASK		= 3 << GPIO1C7_SHIFT,
	GPIO1C7_GPIO		= 0,
	GPIO1C7_CIF_D5,
	GPIO1C7_I2S_SDIO2_M1,

	GPIO1C6_SHIFT		= 12,
	GPIO1C6_MASK		= 3 << GPIO1C6_SHIFT,
	GPIO1C6_GPIO		= 0,
	GPIO1C6_CIF_D4,
	GPIO1C6_I2S_LRCLKTX_M1,

	GPIO1C5_SHIFT		= 10,
	GPIO1C5_MASK		= 3 << GPIO1C5_SHIFT,
	GPIO1C5_GPIO		= 0,
	GPIO1C5_LCDC_CLK,
	GPIO1C5_GMAC_CLK,

	GPIO1C4_SHIFT		= 8,
	GPIO1C4_MASK		= 3 << GPIO1C4_SHIFT,
	GPIO1C4_GPIO		= 0,
	GPIO1C4_LCDC_HSYNC,
	GPIO1C4_GMAC_MDC,

	GPIO1C3_SHIFT		= 6,
	GPIO1C3_MASK		= 3 << GPIO1C3_SHIFT,
	GPIO1C3_GPIO		= 0,
	GPIO1C3_LCDC_VSYNC,
	GPIO1C3_GMAC_MDIO,

	GPIO1C2_SHIFT		= 4,
	GPIO1C2_MASK		= 3 << GPIO1C2_SHIFT,
	GPIO1C2_GPIO		= 0,
	GPIO1C2_LCDC_EN,
	GPIO1C2_I2S_SDIO3_M0,
	GPIO1C2_GMAC_RXER,

	GPIO1C1_SHIFT		= 2,
	GPIO1C1_MASK		= 3 << GPIO1C1_SHIFT,
	GPIO1C1_GPIO		= 0,
	GPIO1C1_LCDC_D10,
	GPIO1C1_I2S_SDI_M0,
	GPIO1C1_PWM4,

	GPIO1C0_SHIFT           = 0,
	GPIO1C0_MASK		= 3,
	GPIO1C0_GPIO		= 0,
	GPIO1C0_LCDC_D11,
	GPIO1C0_I2S_LRCLKRX_M0,
};

/* GRF_GPIO1D_OIMUX */
enum {
	GPIO1D7_SHIFT		= 14,
	GPIO1D7_MASK		= 3 << GPIO1D7_SHIFT,
	GPIO1D7_GPIO		= 0,
	GPIO1D7_HDMI_CEC,
	GPIO1D7_DSP_RTCK,

	GPIO1D6_SHIFT		= 12,
	GPIO1D6_MASK		= 1 << GPIO1D6_SHIFT,
	GPIO1D6_GPIO		= 0,
	GPIO1D6_HDMI_HPD_M0,

	GPIO1D5_SHIFT		= 10,
	GPIO1D5_MASK		= 3 << GPIO1D5_SHIFT,
	GPIO1D5_GPIO		= 0,
	GPIO1D5_UART2_RTSN,
	GPIO1D5_HDMI_SDA_M0,

	GPIO1D4_SHIFT		= 8,
	GPIO1D4_MASK		= 3 << GPIO1D4_SHIFT,
	GPIO1D4_GPIO		= 0,
	GPIO1D4_UART2_CTSN,
	GPIO1D4_HDMI_SCL_M0,

	GPIO1D3_SHIFT		= 6,
	GPIO1D3_MASK		= 3 << GPIO1D3_SHIFT,
	GPIO1D3_GPIO		= 0,
	GPIO1D3_UART0_SOUT,
	GPIO1D3_SPI_TXD_M0,

	GPIO1D2_SHIFT		= 4,
	GPIO1D2_MASK		= 3 << GPIO1D2_SHIFT,
	GPIO1D2_GPIO		= 0,
	GPIO1D2_UART0_SIN,
	GPIO1D2_SPI_RXD_M0,
	GPIO1D2_DSP_TDI,

	GPIO1D1_SHIFT		= 2,
	GPIO1D1_MASK		= 3 << GPIO1D1_SHIFT,
	GPIO1D1_GPIO		= 0,
	GPIO1D1_UART0_RTSN,
	GPIO1D1_SPI_CSN0_M0,
	GPIO1D1_DSP_TMS,

	GPIO1D0_SHIFT		= 0,
	GPIO1D0_MASK		= 3,
	GPIO1D0_GPIO		= 0,
	GPIO1D0_UART0_CTSN,
	GPIO1D0_SPI_CLK_M0,
	GPIO1D0_DSP_TCK,
};

/* GRF_GPIO2A_IOMUX */
enum {
	GPIO2A7_SHIFT		= 14,
	GPIO2A7_MASK		= 3 << GPIO2A7_SHIFT,
	GPIO2A7_GPIO		= 0,
	GPIO2A7_FLASH_D7,
	GPIO2A7_EMMC_D7,

	GPIO2A6_SHIFT		= 12,
	GPIO2A6_MASK		= 3 << GPIO2A6_SHIFT,
	GPIO2A6_GPIO		= 0,
	GPIO2A6_FLASH_D6,
	GPIO2A6_EMMC_D6,

	GPIO2A5_SHIFT           = 10,
	GPIO2A5_MASK            = 3 << GPIO2A5_SHIFT,
	GPIO2A5_GPIO            = 0,
	GPIO2A5_FLASH_D5,
	GPIO2A5_EMMC_D5,

	GPIO2A4_SHIFT           = 8,
	GPIO2A4_MASK            = 3 << GPIO2A4_SHIFT,
	GPIO2A4_GPIO            = 0,
	GPIO2A4_FLASH_D4,
	GPIO2A4_EMMC_D4,

	GPIO2A3_SHIFT           = 6,
	GPIO2A3_MASK            = 3 << GPIO2A3_SHIFT,
	GPIO2A3_GPIO            = 0,
	GPIO2A3_FLASH_D3,
	GPIO2A3_EMMC_D3,
	GPIO2A3_SFC_HOLD_IO3,

	GPIO2A2_SHIFT           = 4,
	GPIO2A2_MASK            = 3 << GPIO2A2_SHIFT,
	GPIO2A2_GPIO            = 0,
	GPIO2A2_FLASH_D2,
	GPIO2A2_EMMC_D2,
	GPIO2A2_SFC_WP_IO2,

	GPIO2A1_SHIFT           = 2,
	GPIO2A1_MASK            = 3 << GPIO2A1_SHIFT,
	GPIO2A1_GPIO            = 0,
	GPIO2A1_FLASH_D1,
	GPIO2A1_EMMC_D1,
	GPIO2A1_SFC_SO_IO1,

	GPIO2A0_SHIFT           = 0,
	GPIO2A0_MASK            = 3 << GPIO2A0_SHIFT,
	GPIO2A0_GPIO            = 0,
	GPIO2A0_FLASH_D0,
	GPIO2A0_EMMC_D0,
	GPIO2A0_SFC_SI_IO0,
};

/* GRF_GPIO2D_IOMUX */
enum {
	GPIO2B7_SHIFT		= 14,
	GPIO2B7_MASK		= 3 << GPIO2B7_SHIFT,
	GPIO2B7_GPIO		= 0,
	GPIO2B7_FLASH_CS1,
	GPIO2B7_SFC_CLK,

	GPIO2B6_SHIFT           = 12,
	GPIO2B6_MASK            = 1 << GPIO2B6_SHIFT,
	GPIO2B6_GPIO            = 0,
	GPIO2B6_EMMC_CLKO,

	GPIO2B5_SHIFT           = 10,
	GPIO2B5_MASK            = 1 << GPIO2B5_SHIFT,
	GPIO2B5_GPIO            = 0,
	GPIO2B5_FLASH_CS0,

	GPIO2B4_SHIFT           = 8,
	GPIO2B4_MASK            = 3 << GPIO2B4_SHIFT,
	GPIO2B4_GPIO            = 0,
	GPIO2B4_FLASH_RDY,
	GPIO2B4_EMMC_CMD,
	GPIO2B4_SFC_CSN0,

	GPIO2B3_SHIFT           = 6,
	GPIO2B3_MASK            = 1 << GPIO2B3_SHIFT,
	GPIO2B3_GPIO            = 0,
	GPIO2B3_FLASH_RDN,

	GPIO2B2_SHIFT           = 4,
	GPIO2B2_MASK            = 1 << GPIO2B2_SHIFT,
	GPIO2B2_GPIO            = 0,
	GPIO2B2_FLASH_WRN,

	GPIO2B1_SHIFT           = 2,
	GPIO2B1_MASK            = 1 << GPIO2B1_SHIFT,
	GPIO2B1_GPIO            = 0,
	GPIO2B1_FLASH_CLE,

	GPIO2B0_SHIFT           = 0,
	GPIO2B0_MASK            = 1 << GPIO2B0_SHIFT,
	GPIO2B0_GPIO            = 0,
	GPIO2B0_FLASH_ALE,
};

/* GRF_GPIO2D_IOMUX */
enum {
	GPIO2D7_SHIFT		= 14,
	GPIO2D7_MASK		= 1 << GPIO2D7_SHIFT,
	GPIO2D7_GPIO		= 0,
	GPIO2D7_SDIO_D0,

	GPIO2D6_SHIFT		= 12,
	GPIO2D6_MASK		= 1 << GPIO2D6_SHIFT,
	GPIO2D6_GPIO		= 0,
	GPIO2D6_SDIO_CMD,

	GPIO2D5_SHIFT		= 10,
	GPIO2D5_MASK		= 1 << GPIO2D5_SHIFT,
	GPIO2D5_GPIO		= 0,
	GPIO2D5_SDIO_CLKO,

	GPIO2D4_SHIFT		= 8,
	GPIO2D4_MASK		= 1 << GPIO2D4_SHIFT,
	GPIO2D4_GPIO		= 0,
	GPIO2D4_I2C1_SCL,

	GPIO2D3_SHIFT		= 6,
	GPIO2D3_MASK		= 1 << GPIO2D3_SHIFT,
	GPIO2D3_GPIO		= 0,
	GPIO2D3_I2C1_SDA,

	GPIO2D2_SHIFT		= 4,
	GPIO2D2_MASK		= 3 << GPIO2D2_SHIFT,
	GPIO2D2_GPIO		= 0,
	GPIO2D2_UART2_SOUT_M0,
	GPIO2D2_JTAG_TCK,

	GPIO2D1_SHIFT		= 2,
	GPIO2D1_MASK		= 3 << GPIO2D1_SHIFT,
	GPIO2D1_GPIO		= 0,
	GPIO2D1_UART2_SIN_M0,
	GPIO2D1_JTAG_TMS,
	GPIO2D1_DSP_TMS,

	GPIO2D0_SHIFT		= 0,
	GPIO2D0_MASK		= 3,
	GPIO2D0_GPIO		= 0,
	GPIO2D0_UART0_CTSN,
	GPIO2D0_SPI_CLK_M0,
	GPIO2D0_DSP_TCK,
};

/* GRF_GPIO3A_IOMUX */
enum {
	GPIO3A7_SHIFT		= 14,
	GPIO3A7_MASK		= 1 << GPIO3A7_SHIFT,
	GPIO3A7_GPIO		= 0,

	GPIO3A6_SHIFT		= 12,
	GPIO3A6_MASK		= 1 << GPIO3A6_SHIFT,
	GPIO3A6_GPIO		= 0,
	GPIO3A6_UART1_SOUT,

	GPIO3A5_SHIFT		= 10,
	GPIO3A5_MASK		= 1 << GPIO3A5_SHIFT,
	GPIO3A5_GPIO		= 0,
	GPIO3A5_UART1_SIN,

	GPIO3A4_SHIFT		= 8,
	GPIO3A4_MASK		= 1 << GPIO3A4_SHIFT,
	GPIO3A4_GPIO		= 0,
	GPIO3A4_UART1_CTSN,

	GPIO3A3_SHIFT		= 6,
	GPIO3A3_MASK		= 1 << GPIO3A3_SHIFT,
	GPIO3A3_GPIO		= 0,
	GPIO3A3_UART1_RTSN,

	GPIO3A2_SHIFT		= 4,
	GPIO3A2_MASK		= 1 << GPIO3A2_SHIFT,
	GPIO3A2_GPIO		= 0,
	GPIO3A2_SDIO_D3,

	GPIO3A1_SHIFT		= 2,
	GPIO3A1_MASK		= 1 << GPIO3A1_SHIFT,
	GPIO3A1_GPIO		= 0,
	GPIO3A1_SDIO_D2,

	GPIO3A0_SHIFT		= 0,
	GPIO3A0_MASK		= 1,
	GPIO3A0_GPIO		= 0,
	GPIO3A0_SDIO_D1,
};

/* GRF_GPIO3C_IOMUX */
enum {
	GPIO3C7_SHIFT		= 14,
	GPIO3C7_MASK		= 1 << GPIO3C7_SHIFT,
	GPIO3C7_GPIO		= 0,
	GPIO3C7_CIF_CLKI,

	GPIO3C6_SHIFT		= 12,
	GPIO3C6_MASK		= 1 << GPIO3C6_SHIFT,
	GPIO3C6_GPIO		= 0,
	GPIO3C6_CIF_VSYNC,

	GPIO3C5_SHIFT		= 10,
	GPIO3C5_MASK		= 1 << GPIO3C5_SHIFT,
	GPIO3C5_GPIO		= 0,
	GPIO3C5_SDMMC_CMD,

	GPIO3C4_SHIFT		= 8,
	GPIO3C4_MASK		= 1 << GPIO3C4_SHIFT,
	GPIO3C4_GPIO		= 0,
	GPIO3C4_SDMMC_CLKO,

	GPIO3C3_SHIFT		= 6,
	GPIO3C3_MASK		= 3 << GPIO3C3_SHIFT,
	GPIO3C3_GPIO		= 0,
	GPIO3C3_SDMMC_D0,
	GPIO3C3_UART2_SOUT_M1,

	GPIO3C2_SHIFT		= 4,
	GPIO3C2_MASK		= 3 << GPIO3C2_SHIFT,
	GPIO3C2_GPIO		= 0,
	GPIO3C2_SDMMC_D1,
	GPIO3C2_UART2_SIN_M1,

	GPIOC1_SHIFT		= 2,
	GPIOC1_MASK		= 1 << GPIOC1_SHIFT,
	GPIOC1_GPIO		= 0,
	GPIOC1_SDMMC_D2,

	GPIOC0_SHIFT		= 0,
	GPIOC0_MASK		= 1,
	GPIO3C0_GPIO		= 0,
	GPIO3C0_SDMMC_D3,
};

static void pinctrl_rv1108_uart_config(struct rv1108_grf *grf, int uart_id)
{
	switch (uart_id) {
	case PERIPH_ID_UART0:
		rk_clrsetreg(&grf->gpio3a_iomux,
			     GPIO3A6_MASK | GPIO3A5_MASK,
			     GPIO3A6_UART1_SOUT << GPIO3A6_SHIFT |
			     GPIO3A5_UART1_SIN << GPIO3A5_SHIFT);
		break;
	case PERIPH_ID_UART1:
		rk_clrsetreg(&grf->gpio1d_iomux,
			     GPIO1D3_MASK | GPIO1D2_MASK | GPIO1D1_MASK |
			     GPIO1D0_MASK,
			     GPIO1D3_UART0_SOUT << GPIO1D3_SHIFT |
			     GPIO1D2_UART0_SIN << GPIO1D2_SHIFT |
			     GPIO1D1_UART0_RTSN << GPIO1D1_SHIFT |
			     GPIO1D0_UART0_CTSN << GPIO1D0_SHIFT);
		break;
	case PERIPH_ID_UART2:
		rk_clrsetreg(&grf->gpio2d_iomux,
			     GPIO2D2_MASK | GPIO2D1_MASK,
			     GPIO2D2_UART2_SOUT_M0 << GPIO2D2_SHIFT |
			     GPIO2D1_UART2_SIN_M0 << GPIO2D1_SHIFT);
		break;
	}
}

static void pinctrl_rv1108_gmac_config(struct rv1108_grf *grf, int func)
{
	rk_clrsetreg(&grf->gpio1b_iomux,
		     GPIO1B7_MASK | GPIO1B6_MASK | GPIO1B5_MASK |
		     GPIO1B4_MASK | GPIO1B3_MASK | GPIO1B2_MASK,
		     GPIO1B7_GMAC_RXDV << GPIO1B7_SHIFT |
		     GPIO1B6_GMAC_RXD1 << GPIO1B6_SHIFT |
		     GPIO1B5_GMAC_RXD0 << GPIO1B5_SHIFT |
		     GPIO1B4_GMAC_TXEN << GPIO1B4_SHIFT |
		     GPIO1B3_GMAC_TXD1 << GPIO1B3_SHIFT |
		     GPIO1B2_GMAC_TXD0 << GPIO1B2_SHIFT);
	rk_clrsetreg(&grf->gpio1c_iomux,
		     GPIO1C5_MASK | GPIO1C4_MASK |
		     GPIO1C3_MASK | GPIO1C2_MASK,
		     GPIO1C5_GMAC_CLK << GPIO1C5_SHIFT |
		     GPIO1C4_GMAC_MDC << GPIO1C4_SHIFT |
		     GPIO1C3_GMAC_MDIO << GPIO1C3_SHIFT |
		     GPIO1C2_GMAC_RXER << GPIO1C2_SHIFT);
	writel(0xffff57f5, &grf->gpio1b_drv);
}

static void pinctrl_rv1108_sfc_config(struct rv1108_grf *grf)
{
	rk_clrsetreg(&grf->gpio2a_iomux, GPIO2A3_MASK | GPIO2A2_MASK |
		     GPIO2A1_MASK | GPIO2A0_MASK,
		     GPIO2A3_SFC_HOLD_IO3 << GPIO2A3_SHIFT |
		     GPIO2A2_SFC_WP_IO2 << GPIO2A2_SHIFT |
		     GPIO2A1_SFC_SO_IO1 << GPIO2A1_SHIFT |
		     GPIO2A0_SFC_SI_IO0 << GPIO2A0_SHIFT);
	rk_clrsetreg(&grf->gpio2b_iomux, GPIO2B7_MASK | GPIO2B4_MASK,
		     GPIO2B7_SFC_CLK << GPIO2B7_SHIFT |
		     GPIO2B4_SFC_CSN0 << GPIO2B4_SHIFT);
}

static int rv1108_pinctrl_request(struct udevice *dev, int func, int flags)
{
	struct rv1108_pinctrl_priv *priv = dev_get_priv(dev);

	switch (func) {
	case PERIPH_ID_UART0:
	case PERIPH_ID_UART1:
	case PERIPH_ID_UART2:
		pinctrl_rv1108_uart_config(priv->grf, func);
		break;
	case PERIPH_ID_GMAC:
		pinctrl_rv1108_gmac_config(priv->grf, func);
	case PERIPH_ID_SFC:
		pinctrl_rv1108_sfc_config(priv->grf);
	default:
		return -EINVAL;
	}

	return 0;
}

static int rv1108_pinctrl_get_periph_id(struct udevice *dev,
					struct udevice *periph)
{
	u32 cell[3];
	int ret;

	ret = dev_read_u32_array(periph, "interrupts", cell, ARRAY_SIZE(cell));
	if (ret < 0)
		return -EINVAL;

	switch (cell[1]) {
	case 11:
		return PERIPH_ID_SDCARD;
	case 13:
		return PERIPH_ID_EMMC;
	case 19:
		return PERIPH_ID_GMAC;
	case 30:
		return PERIPH_ID_I2C0;
	case 31:
		return PERIPH_ID_I2C1;
	case 32:
		return PERIPH_ID_I2C2;
	case 39:
		return PERIPH_ID_PWM0;
	case 44:
		return PERIPH_ID_UART0;
	case 45:
		return PERIPH_ID_UART1;
	case 46:
		return PERIPH_ID_UART2;
	case 56:
		return PERIPH_ID_SFC;
	}

	return -ENOENT;
}

static int rv1108_pinctrl_set_state_simple(struct udevice *dev,
					   struct udevice *periph)
{
	int func;

	func = rv1108_pinctrl_get_periph_id(dev, periph);
	if (func < 0)
		return func;

	return rv1108_pinctrl_request(dev, func, 0);
}

static struct pinctrl_ops rv1108_pinctrl_ops = {
	.set_state_simple	= rv1108_pinctrl_set_state_simple,
	.request		= rv1108_pinctrl_request,
	.get_periph_id		= rv1108_pinctrl_get_periph_id,
};

static int rv1108_pinctrl_probe(struct udevice *dev)
{
	struct rv1108_pinctrl_priv *priv = dev_get_priv(dev);

	priv->grf = syscon_get_first_range(ROCKCHIP_SYSCON_GRF);

	return 0;
}

static const struct udevice_id rv1108_pinctrl_ids[] = {
	{.compatible = "rockchip,rv1108-pinctrl" },
	{ }
};

U_BOOT_DRIVER(pinctrl_rv1108) = {
	.name           = "pinctrl_rv1108",
	.id             = UCLASS_PINCTRL,
	.of_match       = rv1108_pinctrl_ids,
	.priv_auto_alloc_size = sizeof(struct rv1108_pinctrl_priv),
	.ops            = &rv1108_pinctrl_ops,
	.bind           = dm_scan_fdt_dev,
	.probe          = rv1108_pinctrl_probe,
};
