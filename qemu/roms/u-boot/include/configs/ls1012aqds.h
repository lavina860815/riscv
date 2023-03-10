/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * Copyright 2016 Freescale Semiconductor, Inc.
 */

#ifndef __LS1012AQDS_H__
#define __LS1012AQDS_H__

#include "ls1012a_common.h"

/* DDR */
#define CONFIG_DIMM_SLOTS_PER_CTLR	1
#define CONFIG_CHIP_SELECTS_PER_CTRL	1
#define CONFIG_SYS_SDRAM_SIZE		0x40000000
#define CONFIG_CMD_MEMINFO
#define CONFIG_SYS_MEMTEST_START	0x80000000
#define CONFIG_SYS_MEMTEST_END		0x9fffffff

/*
 * QIXIS Definitions
 */
#define CONFIG_FSL_QIXIS

#ifdef CONFIG_FSL_QIXIS
#define CONFIG_QIXIS_I2C_ACCESS
#define CONFIG_SYS_I2C_FPGA_ADDR	0x66
#define QIXIS_LBMAP_BRDCFG_REG		0x04
#define QIXIS_LBMAP_SWITCH		6
#define QIXIS_LBMAP_MASK		0x08
#define QIXIS_LBMAP_SHIFT		0
#define QIXIS_LBMAP_DFLTBANK		0x00
#define QIXIS_LBMAP_ALTBANK		0x08
#define QIXIS_RST_CTL_RESET		0x31
#define QIXIS_RCFG_CTL_RECONFIG_IDLE	0x20
#define QIXIS_RCFG_CTL_RECONFIG_START	0x21
#define QIXIS_RCFG_CTL_WATCHDOG_ENBLE	0x08
#endif

/*
 * I2C bus multiplexer
 */
#define I2C_MUX_PCA_ADDR_PRI		0x77
#define I2C_MUX_PCA_ADDR_SEC		0x76 /* Secondary multiplexer */
#define I2C_RETIMER_ADDR		0x18
#define I2C_MUX_CH_DEFAULT		0x8
#define I2C_MUX_CH_CH7301		0xC
#define I2C_MUX_CH5			0xD
#define I2C_MUX_CH7			0xF

#define I2C_MUX_CH_VOL_MONITOR 0xa

/*
* RTC configuration
*/
#define RTC
#define CONFIG_RTC_PCF8563 1
#define CONFIG_SYS_I2C_RTC_ADDR         0x51  /* Channel 3*/

/* EEPROM */
#define CONFIG_ID_EEPROM
#define CONFIG_SYS_I2C_EEPROM_NXID
#define CONFIG_SYS_EEPROM_BUS_NUM    0
#define CONFIG_SYS_I2C_EEPROM_ADDR   0x57
#define CONFIG_SYS_I2C_EEPROM_ADDR_LEN     1
#define CONFIG_SYS_EEPROM_PAGE_WRITE_BITS 3
#define CONFIG_SYS_EEPROM_PAGE_WRITE_DELAY_MS 5


/* Voltage monitor on channel 2*/
#define I2C_VOL_MONITOR_ADDR           0x40
#define I2C_VOL_MONITOR_BUS_V_OFFSET   0x2
#define I2C_VOL_MONITOR_BUS_V_OVF      0x1
#define I2C_VOL_MONITOR_BUS_V_SHIFT    3

/* DSPI */
#define CONFIG_FSL_DSPI1
#define CONFIG_DEFAULT_SPI_BUS 1

#define CONFIG_CMD_SPI
#define MMAP_DSPI          DSPI1_BASE_ADDR

#define CONFIG_SYS_DSPI_CTAR0   1

#define CONFIG_SYS_DSPI_CTAR1	(DSPI_CTAR_TRSZ(7) | DSPI_CTAR_PCSSCK_1CLK |\
				DSPI_CTAR_PASC(0) | DSPI_CTAR_PDT(0) | \
				DSPI_CTAR_CSSCK(2) | DSPI_CTAR_ASC(0) | \
				DSPI_CTAR_DT(0))
#define CONFIG_SPI_FLASH_SST /* cs1 */

#define CONFIG_SYS_DSPI_CTAR2	(DSPI_CTAR_TRSZ(7) | DSPI_CTAR_PCSSCK_1CLK |\
				DSPI_CTAR_PASC(0) | DSPI_CTAR_PDT(0) | \
				DSPI_CTAR_CSSCK(0) | DSPI_CTAR_ASC(0) | \
				DSPI_CTAR_DT(0))
#define CONFIG_SPI_FLASH_STMICRO /* cs2 */

#define CONFIG_SYS_DSPI_CTAR3	(DSPI_CTAR_TRSZ(7) | DSPI_CTAR_PCSSCK_1CLK |\
				DSPI_CTAR_PASC(0) | DSPI_CTAR_PDT(0) | \
				DSPI_CTAR_CSSCK(2) | DSPI_CTAR_ASC(0) | \
				DSPI_CTAR_DT(0))
#define CONFIG_SPI_FLASH_EON /* cs3 */

#define CONFIG_SF_DEFAULT_SPEED      10000000
#define CONFIG_SF_DEFAULT_MODE       SPI_MODE_0
#define CONFIG_SF_DEFAULT_BUS        1
#define CONFIG_SF_DEFAULT_CS         0

/*  MMC  */
#ifdef CONFIG_MMC
#define CONFIG_SYS_FSL_MMC_HAS_CAPBLT_VS33
#endif

#define CONFIG_PCIE1		/* PCIE controller 1 */

#define CONFIG_PCI_SCAN_SHOW

#define CONFIG_CMD_MEMINFO
#define CONFIG_SYS_MEMTEST_START	0x80000000
#define CONFIG_SYS_MEMTEST_END		0x9fffffff

#include <asm/fsl_secure_boot.h>
#endif /* __LS1012AQDS_H__ */
