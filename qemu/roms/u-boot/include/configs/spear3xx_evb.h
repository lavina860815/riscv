/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * (C) Copyright 2009
 * Vipin Kumar, STMicroelectronics, <vipin.kumar@st.com>
 */

#ifndef __CONFIG_H
#define __CONFIG_H

/*
 * High Level Configuration Options
 * (easy to change)
 */
#if defined(CONFIG_SPEAR300)
#define CONFIG_SPEAR3XX
#elif defined(CONFIG_SPEAR310)
#define CONFIG_SPEAR3XX
#elif defined(CONFIG_SPEAR320)
#define CONFIG_SPEAR3XX
#endif

#if defined(CONFIG_USBTTY)
#define CONFIG_SPEAR_USBTTY
#endif

#include <configs/spear-common.h>

/* Ethernet driver configuration */
#define CONFIG_DW_ALTDESCRIPTOR

#if defined(CONFIG_SPEAR310)
#define CONFIG_MACB
#define CONFIG_MACB0_PHY			0x01
#define CONFIG_MACB1_PHY			0x03
#define CONFIG_MACB2_PHY			0x05
#define CONFIG_MACB3_PHY			0x07

#elif defined(CONFIG_SPEAR320)
#define CONFIG_MACB
#define CONFIG_MACB0_PHY			0x01

#endif

/* Serial Configuration (PL011) */
#define CONFIG_SYS_SERIAL0			0xD0000000

#if defined(CONFIG_SPEAR300)
#define CONFIG_PL01x_PORTS			{(void *)CONFIG_SYS_SERIAL0}

#elif defined(CONFIG_SPEAR310)

#if (CONFIG_CONS_INDEX)
#undef  CONFIG_PL011_CLOCK
#define CONFIG_PL011_CLOCK			(83 * 1000 * 1000)
#endif

#define CONFIG_SYS_SERIAL1			0xB2000000
#define CONFIG_SYS_SERIAL2			0xB2080000
#define CONFIG_SYS_SERIAL3			0xB2100000
#define CONFIG_SYS_SERIAL4			0xB2180000
#define CONFIG_SYS_SERIAL5			0xB2200000
#define CONFIG_PL01x_PORTS			{(void *)CONFIG_SYS_SERIAL0, \
						(void *)CONFIG_SYS_SERIAL1, \
						(void *)CONFIG_SYS_SERIAL2, \
						(void *)CONFIG_SYS_SERIAL3, \
						(void *)CONFIG_SYS_SERIAL4, \
						(void *)CONFIG_SYS_SERIAL5 }
#elif defined(CONFIG_SPEAR320)

#if (CONFIG_CONS_INDEX)
#undef  CONFIG_PL011_CLOCK
#define CONFIG_PL011_CLOCK			(83 * 1000 * 1000)
#endif

#define CONFIG_SYS_SERIAL1			0xA3000000
#define CONFIG_SYS_SERIAL2			0xA4000000
#define CONFIG_PL01x_PORTS			{(void *)CONFIG_SYS_SERIAL0, \
						(void *)CONFIG_SYS_SERIAL1, \
						(void *)CONFIG_SYS_SERIAL2 }
#endif

#if defined(CONFIG_SPEAR_EMI)
#if defined(CONFIG_SPEAR310)
#define CONFIG_SYS_FLASH_BASE			0x50000000
#define CONFIG_SYS_CS1_FLASH_BASE		0x60000000
#define CONFIG_SYS_CS2_FLASH_BASE		0x70000000
#define CONFIG_SYS_CS3_FLASH_BASE		0x80000000
#define CONFIG_SYS_CS4_FLASH_BASE		0x90000000
#define CONFIG_SYS_CS5_FLASH_BASE		0xA0000000
#define CONFIG_SYS_FLASH_BANKS_LIST		{ CONFIG_SYS_FLASH_BASE,   \
						CONFIG_SYS_CS1_FLASH_BASE, \
						CONFIG_SYS_CS2_FLASH_BASE, \
						CONFIG_SYS_CS3_FLASH_BASE, \
						CONFIG_SYS_CS4_FLASH_BASE, \
						CONFIG_SYS_CS5_FLASH_BASE }
#define CONFIG_SYS_MAX_FLASH_BANKS		6

#elif defined(CONFIG_SPEAR320)
#define CONFIG_SYS_FLASH_BASE			0x44000000
#define CONFIG_SYS_CS1_FLASH_BASE		0x45000000
#define CONFIG_SYS_CS2_FLASH_BASE		0x46000000
#define CONFIG_SYS_CS3_FLASH_BASE		0x47000000
#define CONFIG_SYS_FLASH_BANKS_LIST		{ CONFIG_SYS_FLASH_BASE,   \
						CONFIG_SYS_CS1_FLASH_BASE, \
						CONFIG_SYS_CS2_FLASH_BASE, \
						CONFIG_SYS_CS3_FLASH_BASE }
#define CONFIG_SYS_MAX_FLASH_BANKS		4

#endif

#define CONFIG_SYS_MAX_FLASH_SECT		(127 + 8)
#define CONFIG_SYS_FLASH_QUIET_TEST

#endif

/* NAND flash configuration */
#define CONFIG_SYS_FSMC_NAND_SP
#define CONFIG_SYS_FSMC_NAND_8BIT

#if defined(CONFIG_SPEAR300)
#define CONFIG_SYS_NAND_BASE			0x80000000

#elif defined(CONFIG_SPEAR310)
#define CONFIG_SYS_NAND_BASE			0x40000000

#elif defined(CONFIG_SPEAR320)
#define CONFIG_SYS_NAND_BASE			0x50000000

#endif

/* Environment Settings */
#if defined(CONFIG_SPEAR300)
#define CONFIG_EXTRA_ENV_SETTINGS              CONFIG_EXTRA_ENV_USBTTY

#elif defined(CONFIG_SPEAR310) || defined(CONFIG_SPEAR320)
#define CONFIG_EXTRA_ENV_UNLOCK                        "unlock=yes\0"
#define CONFIG_EXTRA_ENV_SETTINGS              CONFIG_EXTRA_ENV_USBTTY \
						CONFIG_EXTRA_ENV_UNLOCK
#endif

#endif  /* __CONFIG_H */
