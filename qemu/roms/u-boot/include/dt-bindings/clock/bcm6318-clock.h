/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * Copyright (C) 2018 Álvaro Fernández Rojas <noltari@gmail.com>
 *
 * Derived from linux/arch/mips/include/asm/mach-bcm63xx/bcm63xx_regs.h
 */

#ifndef __DT_BINDINGS_CLOCK_BCM6318_H
#define __DT_BINDINGS_CLOCK_BCM6318_H

#define BCM6318_CLK_ADSL_ASB	0
#define BCM6318_CLK_USB_ASB	1
#define BCM6318_CLK_MIPS_ASB	2
#define BCM6318_CLK_PCIE_ASB	3
#define BCM6318_CLK_PHYMIPS_ASB	4
#define BCM6318_CLK_ROBOSW_ASB	5
#define BCM6318_CLK_SAR_ASB	6
#define BCM6318_CLK_SDR_ASB	7
#define BCM6318_CLK_SWREG_ASB	8
#define BCM6318_CLK_PERIPH_ASB	9
#define BCM6318_CLK_CPUBUS160	10
#define BCM6318_CLK_ADSL	11
#define BCM6318_CLK_SAR125	12
#define BCM6318_CLK_MIPS	13
#define BCM6318_CLK_PCIE	14
#define BCM6318_CLK_ROBOSW250	16
#define BCM6318_CLK_ROBOSW025	17
#define BCM6318_CLK_SDR		19
#define BCM6318_CLK_USB		20
#define BCM6318_CLK_HSSPI	25
#define BCM6318_CLK_PCIE25	27
#define BCM6318_CLK_PHYMIPS	28
#define BCM6318_CLK_AFE		29
#define BCM6318_CLK_QPROC	30

#define BCM6318_UCLK_ADSL	0
#define BCM6318_UCLK_ARB	1
#define BCM6318_UCLK_MIPS	2
#define BCM6318_UCLK_PCIE	3
#define BCM6318_UCLK_PERIPH	4
#define BCM6318_UCLK_PHYMIPS	5
#define BCM6318_UCLK_ROBOSW	6
#define BCM6318_UCLK_SAR	7
#define BCM6318_UCLK_SDR	8
#define BCM6318_UCLK_USB	9

#endif /* __DT_BINDINGS_CLOCK_BCM6318_H */
