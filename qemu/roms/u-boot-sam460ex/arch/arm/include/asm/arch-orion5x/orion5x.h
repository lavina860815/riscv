/*
 * Copyright (C) 2010 Albert ARIBAUD <albert.aribaud@free.fr>
 *
 * Based on original Kirkwood support which is
 * (C) Copyright 2009
 * Marvell Semiconductor <www.marvell.com>
 * Written-by: Prafulla Wadaskar <prafulla@marvell.com>
 *
 * Header file for Marvell's Orion SoC with Feroceon CPU core.
 *
 * See file CREDITS for list of people who contributed to this
 * project.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301 USA
 */

#ifndef _ASM_ARCH_ORION5X_H
#define _ASM_ARCH_ORION5X_H

#ifndef __ASSEMBLY__
#include <asm/types.h>
#include <asm/io.h>
#endif /* __ASSEMBLY__ */

#if defined(CONFIG_FEROCEON)
#include <asm/arch/cpu.h>

/* SOC specific definations */
#define ORION5X_REGISTER(x)			(ORION5X_REGS_PHY_BASE + x)

/* Documented registers */
#define ORION5X_TWSI_BASE			(ORION5X_REGISTER(0x11000))
#define ORION5X_UART0_BASE			(ORION5X_REGISTER(0x12000))
#define ORION5X_UART1_BASE			(ORION5X_REGISTER(0x12100))
#define ORION5X_MPP_BASE			(ORION5X_REGISTER(0x10000))
#define ORION5X_GPIO_BASE			(ORION5X_REGISTER(0x10100))
#define ORION5X_CPU_WIN_BASE			(ORION5X_REGISTER(0x20000))
#define ORION5X_CPU_REG_BASE			(ORION5X_REGISTER(0x20100))
#define ORION5X_TIMER_BASE			(ORION5X_REGISTER(0x20300))
#define ORION5X_REG_PCI_BASE			(ORION5X_REGISTER(0x30000))
#define ORION5X_REG_PCIE_BASE			(ORION5X_REGISTER(0x40000))
#define ORION5X_USB20_PORT0_BASE		(ORION5X_REGISTER(0x50000))
#define ORION5X_USB20_PORT1_BASE		(ORION5X_REGISTER(0xA0000))
#define ORION5X_EGIGA_BASE			(ORION5X_REGISTER(0x72000))

#define CONFIG_MAX_RAM_BANK_SIZE		(64*1024*1024)

/* include here SoC variants. 5181, 5281, 6183 should go here when
   adding support for them, and this comment should then be updated. */
#if defined(CONFIG_88F5182)
#include <asm/arch/mv88f5182.h>
#else
#error "SOC Name not defined"
#endif
#endif /* CONFIG_FEROCEON */
#endif /* _ASM_ARCH_ORION5X_H */
