/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * Copyright (C) Stefano Babic <sbabic@denx.de>
 *
 * Configuration settings for the E+L i.MX6Q DO82 board.
 */

#ifndef __EL_ZC5202_H
#define __EL_ZC5202_H

#define CONFIG_MXC_UART_BASE	UART2_BASE
#define CONSOLE_DEV		"ttymxc1"
#define CONFIG_MMCROOT			"/dev/mmcblk0p2"

#define CONFIG_SUPPORT_EMMC_BOOT /* eMMC specific */

#include "el6x_common.h"

/* Ethernet */
#define CONFIG_FEC_MXC
#define IMX_FEC_BASE				ENET_BASE_ADDR
#define CONFIG_FEC_XCV_TYPE			MII100
#define CONFIG_ETHPRIME				"FEC"
#define CONFIG_FEC_MXC_PHYADDR			0
#define CONFIG_MV88E6352_SWITCH

#define CONFIG_PCI_SCAN_SHOW
#define CONFIG_PCIE_IMX

#endif                         /*__EL6Q_CONFIG_H */
