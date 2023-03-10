/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * (C) Copyright 2012-2013 Henrik Nordstrom <henrik@henriknordstrom.net>
 *
 * Configuration settings for the Allwinner A13 (sun5i) CPU
 */
#ifndef __CONFIG_H
#define __CONFIG_H

/*
 * High Level Configuration Options
 */

#ifdef CONFIG_USB_EHCI_HCD
#define CONFIG_USB_EHCI_SUNXI
#endif

/*
 * Include common sunxi configuration where most the settings are
 */
#include <configs/sunxi-common.h>

#define CONFIG_MACH_TYPE	(4138 | ((CONFIG_MACH_TYPE_COMPAT_REV) << 28))

#endif /* __CONFIG_H */
