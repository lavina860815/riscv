/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * Configuation settings for MPR2
 *
 * Copyright (C) 2008
 * Mark Jonas <mark.jonas@de.bosch.com>
 */

#ifndef __MPR2_H
#define __MPR2_H

/* Supported commands */

/* Default environment variables */
#define CONFIG_BOOTFILE		"/boot/zImage"
#define CONFIG_LOADADDR		0x8E000000

/* CPU and platform */
#define CONFIG_CPU_SH7720	1

#define CONFIG_DISPLAY_BOARDINFO

/* U-Boot internals */
#define CONFIG_SYS_BAUDRATE_TABLE	{ 115200 }	/* List of legal baudrate settings for this board */
#define CONFIG_SYS_LOAD_ADDR		(CONFIG_SYS_SDRAM_BASE + 32 * 1024 * 1024)
#define CONFIG_SYS_MONITOR_BASE	CONFIG_SYS_FLASH_BASE
#define CONFIG_SYS_MONITOR_LEN		(128 * 1024)
#define CONFIG_SYS_MALLOC_LEN		(256 * 1024)

/* Memory */
#define CONFIG_SYS_SDRAM_BASE		0x8C000000
#define CONFIG_SYS_SDRAM_SIZE		(64 * 1024 * 1024)
#define CONFIG_SYS_MEMTEST_START	CONFIG_SYS_SDRAM_BASE
#define CONFIG_SYS_MEMTEST_END		(CONFIG_SYS_MEMTEST_START + (60 * 1024 * 1024))

/* Flash */
#define CONFIG_SYS_FLASH_EMPTY_INFO
#define CONFIG_SYS_FLASH_BASE		0xA0000000
#define CONFIG_SYS_MAX_FLASH_SECT	256
#define CONFIG_SYS_MAX_FLASH_BANKS	1
#define CONFIG_SYS_FLASH_BANKS_LIST	{ CONFIG_SYS_FLASH_BASE }
#define CONFIG_ENV_SECT_SIZE	(128 * 1024)
#define CONFIG_ENV_SIZE		CONFIG_ENV_SECT_SIZE
#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + CONFIG_SYS_MONITOR_LEN)
#define CONFIG_SYS_FLASH_ERASE_TOUT	120000
#define CONFIG_SYS_FLASH_WRITE_TOUT	500

/* Clocks */
#define CONFIG_SYS_CLK_FREQ	24000000
#define CONFIG_SH_SCIF_CLK_FREQ CONFIG_SYS_CLK_FREQ

/* UART */
#define CONFIG_CONS_SCIF0	1

#endif	/* __MPR2_H */
