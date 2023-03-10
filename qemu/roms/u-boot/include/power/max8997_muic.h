/* SPDX-License-Identifier: GPL-2.0+ */
/*
 *  Copyright (C) 2012 Samsung Electronics
 *  Lukasz Majewski <l.majewski@samsung.com>
 */

#ifndef __MAX8997_MUIC_H_
#define __MAX8997_MUIC_H_

#include <power/power_chrg.h>

/* MAX8997_MUIC_STATUS2 */
#define MAX8997_MUIC_CHG_NO	0x00
#define MAX8997_MUIC_CHG_USB	0x01
#define MAX8997_MUIC_CHG_USB_D	0x02
#define MAX8997_MUIC_CHG_TA	0x03
#define MAX8997_MUIC_CHG_TA_500 0x04
#define MAX8997_MUIC_CHG_TA_1A	0x05
#define MAX8997_MUIC_CHG_MASK	0x07

/* MAX 8997 MUIC registers */
enum {
	MAX8997_MUIC_ID         = 0x00,
	MAX8997_MUIC_INT1	= 0x01,
	MAX8997_MUIC_INT2	= 0x02,
	MAX8997_MUIC_INT3	= 0x03,
	MAX8997_MUIC_STATUS1	= 0x04,
	MAX8997_MUIC_STATUS2	= 0x05,
	MAX8997_MUIC_STATUS3	= 0x06,
	MAX8997_MUIC_INTMASK1	= 0x07,
	MAX8997_MUIC_INTMASK2	= 0x08,
	MAX8997_MUIC_INTMASK3	= 0x09,
	MAX8997_MUIC_CDETCTRL	= 0x0A,
	MAX8997_MUIC_CONTROL1	= 0x0C,
	MAX8997_MUIC_CONTROL2	= 0x0D,
	MAX8997_MUIC_CONTROL3	= 0x0E,

	MUIC_NUM_OF_REGS = 0x0F,
};

#define MAX8997_MUIC_I2C_ADDR	(0x4A >> 1)

int power_muic_init(unsigned int bus);
#endif /* __MAX8997_MUIC_H_ */
