/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * (C) Copyright 2014
 * NVIDIA Corporation <www.nvidia.com>
 */

#ifndef __CONFIG_H
#define __CONFIG_H

#include <linux/sizes.h>

#include "tegra124-common.h"

/* High-level configuration options */
#define CONFIG_TEGRA_BOARD_STRING	"Google/NVIDIA Nyan-big"

/* Board-specific serial config */
#define CONFIG_TEGRA_ENABLE_UARTA
#define CONFIG_SYS_NS16550_COM1		NV_PA_APB_UARTA_BASE

/* I2C */
#define CONFIG_SYS_I2C_TEGRA

/* Environment in eMMC, at the end of 2nd "boot sector" */
#define CONFIG_SYS_MMC_ENV_DEV		0
#define CONFIG_SYS_MMC_ENV_PART		2
#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE)

/* Align LCD to 1MB boundary */
#define CONFIG_LCD_ALIGNMENT	MMU_SECTION_SIZE

/* SPI */
#define CONFIG_SF_DEFAULT_MODE         SPI_MODE_0
#define CONFIG_SF_DEFAULT_SPEED        24000000
#define CONFIG_SPI_FLASH_SIZE          (4 << 20)

/* USB Host support */
#define CONFIG_USB_EHCI_TEGRA

/* USB networking support */

/* General networking support */

#define CONFIG_KEYBOARD

#undef CONFIG_LOADADDR
#define CONFIG_LOADADDR		0x82408000

#include "tegra-common-usb-gadget.h"
#include "tegra-common-post.h"

#endif /* __CONFIG_H */
