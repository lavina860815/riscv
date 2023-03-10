/* Collection of constants used to access Nomadik registers */

#ifndef __NOMADIK_H__
#define __NOMADIK_H__

/* Base addresses of our peripherals */
#define NOMADIK_CLCDC_BASE	0x10120000	/* CLCD Controller */
#define NOMADIK_SRC_BASE	0x101E0000	/* System and Reset Cnt */
#define NOMADIK_PMU_BASE	0x101E9000	/* Power Management Unit */
#define NOMADIK_MPMC_BASE	0x10110000	/* SDRAM Controller */
#define NOMADIK_FSMC_BASE	0x10100000	/* FSMC Controller */
#define NOMADIK_1NAND_BASE	0x30000000
#define NOMADIK_GPIO0_BASE	0x101E4000
#define NOMADIK_GPIO1_BASE	0x101E5000
#define NOMADIK_GPIO2_BASE	0x101E6000
#define NOMADIK_GPIO3_BASE	0x101E7000
#define NOMADIK_CPLD_BASE	0x36000000
#define NOMADIK_UART0_BASE	0x101FD000
#define NOMADIK_UART1_BASE	0x101FB000
#define NOMADIK_UART2_BASE	0x101F2000

#define NOMADIK_I2C1_BASE	0x101F7000	/* I2C1 interface */
#define NOMADIK_I2C0_BASE	0x101F8000	/* I2C0 interface */

#define NOMADIK_RTC_BASE	0x101E8000
#define NOMADIK_ETH0_BASE	0x36800300
#define NOMADIK_CPLD_UART_BASE	0x36480000

/* Chip select registers ("Flexible Static Memory Controller") */

#define REG_FSMC_BCR0	(NOMADIK_FSMC_BASE + 0x00)
#define REG_FSMC_BTR0	(NOMADIK_FSMC_BASE + 0x04)
#define REG_FSMC_BCR1	(NOMADIK_FSMC_BASE + 0x08)
#define REG_FSMC_BTR1	(NOMADIK_FSMC_BASE + 0x0c)
#define REG_FSMC_PCR0	(NOMADIK_FSMC_BASE + 0x40)
#define REG_FSMC_PMEM0	(NOMADIK_FSMC_BASE + 0x48)
#define REG_FSMC_PATT0	(NOMADIK_FSMC_BASE + 0x4c)
#define REG_FSMC_ECCR0	(NOMADIK_FSMC_BASE + 0x54)

#endif /* __NOMADIK_H__ */
