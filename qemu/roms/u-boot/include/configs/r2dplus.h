#ifndef __CONFIG_H
#define __CONFIG_H

#define CONFIG_CPU_SH7751	1
#define __LITTLE_ENDIAN__	1

#define CONFIG_DISPLAY_BOARDINFO

/* SCIF */
#define CONFIG_CONS_SCIF1	1

#define CONFIG_ENV_OVERWRITE	1

/* SDRAM */
#define CONFIG_SYS_SDRAM_BASE		0x8C000000
#define CONFIG_SYS_SDRAM_SIZE		0x04000000

#define CONFIG_SYS_PBSIZE		256

#define CONFIG_SYS_MEMTEST_START	(CONFIG_SYS_SDRAM_BASE)
#define CONFIG_SYS_MEMTEST_END		(CONFIG_SYS_TEXT_BASE - 0x100000)

#define CONFIG_SYS_LOAD_ADDR		(CONFIG_SYS_SDRAM_BASE + 32 * 1024 * 1024)
/* Address of u-boot image in Flash */
#define CONFIG_SYS_MONITOR_BASE	(CONFIG_SYS_FLASH_BASE)
#define CONFIG_SYS_MONITOR_LEN		(256 * 1024)
/* Size of DRAM reserved for malloc() use */
#define CONFIG_SYS_MALLOC_LEN		(1024 * 1024)
#define CONFIG_SYS_BOOTMAPSZ		(8 * 1024 * 1024)

/*
 * NOR Flash ( Spantion S29GL256P )
 */
#define CONFIG_SYS_FLASH_BASE		(0xA0000000)
#define CONFIG_SYS_MAX_FLASH_BANKS (1)
#define CONFIG_SYS_MAX_FLASH_SECT  256
#define CONFIG_SYS_FLASH_BANKS_LIST	{ CONFIG_SYS_FLASH_BASE }

#define CONFIG_ENV_SECT_SIZE	0x40000
#define CONFIG_ENV_SIZE        (CONFIG_ENV_SECT_SIZE)
#define CONFIG_ENV_ADDR        (CONFIG_SYS_MONITOR_BASE + CONFIG_SYS_MONITOR_LEN)

/*
 * SuperH Clock setting
 */
#define CONFIG_SYS_CLK_FREQ	60000000
#define CONFIG_SH_SCIF_CLK_FREQ CONFIG_SYS_CLK_FREQ
#define	CONFIG_SYS_PLL_SETTLING_TIME	100/* in us */

/*
 * IDE support
 */
#define CONFIG_IDE_RESET	1
#define CONFIG_SYS_PIO_MODE		1
#define CONFIG_SYS_IDE_MAXBUS		1 /* IDE bus */
#define CONFIG_SYS_IDE_MAXDEVICE	1
#define CONFIG_SYS_ATA_BASE_ADDR	0xb4000000
#define CONFIG_SYS_ATA_STRIDE		2 /* 1bit shift */
#define CONFIG_SYS_ATA_DATA_OFFSET	0x1000	/* data reg offset */
#define CONFIG_SYS_ATA_REG_OFFSET	0x1000	/* reg offset */
#define CONFIG_SYS_ATA_ALT_OFFSET	0x800	/* alternate register offset */
#define CONFIG_IDE_SWAP_IO

/*
 * SuperH PCI Bridge Configration
 */
#define CONFIG_SH4_PCI
#define CONFIG_SH7751_PCI
#define CONFIG_PCI_SCAN_SHOW	1
#define __mem_pci

#define CONFIG_PCI_MEM_BUS	0xFD000000	/* Memory space base addr */
#define CONFIG_PCI_MEM_PHYS	CONFIG_PCI_MEM_BUS
#define CONFIG_PCI_MEM_SIZE	0x01000000	/* Size of Memory window */
#define CONFIG_PCI_IO_BUS	0xFE240000	/* IO space base address */
#define CONFIG_PCI_IO_PHYS	CONFIG_PCI_IO_BUS
#define CONFIG_PCI_IO_SIZE	0x00040000	/* Size of IO window */
#define CONFIG_PCI_SYS_BUS	CONFIG_SYS_SDRAM_BASE
#define CONFIG_PCI_SYS_PHYS	CONFIG_SYS_SDRAM_BASE
#define CONFIG_PCI_SYS_SIZE	CONFIG_SYS_SDRAM_SIZE

#endif /* __CONFIG_H */
