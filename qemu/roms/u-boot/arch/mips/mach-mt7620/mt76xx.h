/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * Copyright (C) 2018 Stefan Roese <sr@denx.de>
 */

#ifndef __MT76XX_H
#define __MT76XX_H

#define MT76XX_SYSCTL_BASE	0x10000000

#define MT76XX_CHIPID_OFFS	0x00
#define MT76XX_CHIP_REV_ID_OFFS	0x0c
#define MT76XX_SYSCFG0_OFFS	0x10

#define MT76XX_MEMCTRL_BASE	(MT76XX_SYSCTL_BASE + 0x0300)
#define MT76XX_RGCTRL_BASE	(MT76XX_SYSCTL_BASE + 0x1000)

#define MT76XX_ROM_STATUS_REG	(MT76XX_SYSCTL_BASE + 0x0028)
#define MT76XX_CLKCFG0_REG	(MT76XX_SYSCTL_BASE + 0x002c)
#define MT76XX_DYN_CFG0_REG	(MT76XX_SYSCTL_BASE + 0x0440)

#define DDR_CFG1_REG		(MT76XX_MEMCTRL_BASE + 0x44)
#define DDR_CFG2_REG		(MT76XX_MEMCTRL_BASE + 0x48)
#define DDR_CFG3_REG		(MT76XX_MEMCTRL_BASE + 0x4c)
#define DDR_CFG4_REG		(MT76XX_MEMCTRL_BASE + 0x50)

#ifndef __ASSEMBLY__
/* Prototypes */
void ddr_calibrate(void);
#endif

#endif
