/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * Copyright (C) 2008 Yoshihiro Shimoda <shimoda.yoshihiro@renesas.com>
 */

#define PCIREG_8(_adr)	(*(volatile unsigned char *)(_adr))
#define PCIREG_32(_adr)	(*(volatile unsigned long *)(_adr))
#define PCI_PAR		PCIREG_32(0xfe0401c0)
#define PCI_PDR		PCIREG_32(0xfe040220)
#define PCI_CR		PCIREG_32(0xfe040100)
#define PCI_CONF1	PCIREG_32(0xfe040004)

#define HIGH		1
#define LOW		0

#define PCI_PROG		0x80
#define PCI_EEP_ADDRESS		(unsigned short)0x0007
#define PCI_MAC_ADDRESS_SIZE	3

#define TIME1	100
#define TIME2	20000

#define BIT_DUMMY	0
#define MAC_EEP_READ	1
#define MAC_EEP_WRITE	2
#define MAC_EEP_ERACE	3
#define MAC_EEP_EWEN	4
#define MAC_EEP_EWDS	5

/* RTL8169 */
const unsigned short EEPROM_W_Data_8169_A[] = {
	0x8129, 0x10ec, 0x8169, 0x1154, 0x032b,
	0x4020, 0xa101
};
const unsigned short EEPROM_W_Data_8169_B[] = {
	0x4d15, 0xf7c2, 0x8000, 0x0000, 0x0000, 0x1300,
	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x2000,
	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
};
