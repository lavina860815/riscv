/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * Common definitions for LPC32XX board configurations
 *
 * Copyright (C) 2011-2015 Vladimir Zapolskiy <vz@mleia.com>
 */

#ifndef _LPC32XX_CONFIG_H
#define _LPC32XX_CONFIG_H


/* Basic CPU architecture */
#define CONFIG_ARCH_CPU_INIT

/* UART configuration */
#if	(CONFIG_SYS_LPC32XX_UART == 1) || (CONFIG_SYS_LPC32XX_UART == 2) || \
	(CONFIG_SYS_LPC32XX_UART == 7)
#if !defined(CONFIG_LPC32XX_HSUART)
#define CONFIG_LPC32XX_HSUART
#endif
#endif

#if !defined(CONFIG_SYS_NS16550_CLK)
#define CONFIG_SYS_NS16550_CLK		13000000
#endif

#define CONFIG_SYS_BAUDRATE_TABLE	\
		{ 9600, 19200, 38400, 57600, 115200, 230400, 460800 }

/* Ethernet */
#define LPC32XX_ETH_BASE ETHERNET_BASE

/* NAND */
#if defined(CONFIG_NAND_LPC32XX_SLC)
#define NAND_LARGE_BLOCK_PAGE_SIZE	0x800
#define NAND_SMALL_BLOCK_PAGE_SIZE	0x200

#if !defined(CONFIG_SYS_NAND_PAGE_SIZE)
#define CONFIG_SYS_NAND_PAGE_SIZE	NAND_LARGE_BLOCK_PAGE_SIZE
#endif

#if (CONFIG_SYS_NAND_PAGE_SIZE == NAND_LARGE_BLOCK_PAGE_SIZE)
#define CONFIG_SYS_NAND_OOBSIZE		64
#define CONFIG_SYS_NAND_ECCPOS		{ 40, 41, 42, 43, 44, 45, 46, 47, \
					  48, 49, 50, 51, 52, 53, 54, 55, \
					  56, 57, 58, 59, 60, 61, 62, 63, }
#define CONFIG_SYS_NAND_BAD_BLOCK_POS	NAND_LARGE_BADBLOCK_POS
#elif (CONFIG_SYS_NAND_PAGE_SIZE == NAND_SMALL_BLOCK_PAGE_SIZE)
#define CONFIG_SYS_NAND_OOBSIZE		16
#define CONFIG_SYS_NAND_ECCPOS		{ 10, 11, 12, 13, 14, 15, }
#define CONFIG_SYS_NAND_BAD_BLOCK_POS	0
#else
#error "CONFIG_SYS_NAND_PAGE_SIZE set to an invalid value"
#endif

#define CONFIG_SYS_NAND_ECCSIZE		0x100
#define CONFIG_SYS_NAND_ECCBYTES	3
#define CONFIG_SYS_NAND_PAGE_COUNT	(CONFIG_SYS_NAND_BLOCK_SIZE / \
						CONFIG_SYS_NAND_PAGE_SIZE)
#endif	/* CONFIG_NAND_LPC32XX_SLC */

/* NOR Flash */

/* USB OHCI */
#if defined(CONFIG_USB_OHCI_LPC32XX)
#define CONFIG_USB_OHCI_NEW
#define CONFIG_SYS_USB_OHCI_CPU_INIT
#define CONFIG_SYS_USB_OHCI_MAX_ROOT_PORTS	1
#define CONFIG_SYS_USB_OHCI_REGS_BASE		USB_BASE
#define CONFIG_SYS_USB_OHCI_SLOT_NAME		"lpc32xx-ohci"
#endif

#endif /* _LPC32XX_CONFIG_H */
