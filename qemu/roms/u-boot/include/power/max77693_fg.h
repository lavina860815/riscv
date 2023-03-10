/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * Copyright (C) 2013 Samsung Electronics
 * Piotr Wilczek <p.wilczek@samsung.com>
 */

#ifndef __MAX77693_FG_H_
#define __MAX77693_FG_H_

/* MAX 77693 registers */
enum {
	MAX77693_STATUS		= 0x00,
	MAX77693_SOCREP		= 0x06,
	MAX77693_VCELL		= 0x09,
	MAX77693_CURRENT	= 0x0A,
	MAX77693_AVG_CURRENT	= 0x0B,
	MAX77693_SOCMIX		= 0x0D,
	MAX77693_SOCAV		= 0x0E,
	MAX77693_DESIGN_CAP	= 0x18,
	MAX77693_AVG_VCELL	= 0x19,
	MAX77693_CONFIG		= 0x1D,
	MAX77693_VERSION	= 0x21,
	MAX77693_LEARNCFG	= 0x28,
	MAX77693_FILTERCFG	= 0x29,
	MAX77693_RELAXCFG	= 0x2A,
	MAX77693_MISCCFG	= 0x2B,
	MAX77693_CGAIN		= 0x2E,
	MAX77693_COFF		= 0x2F,
	MAX77693_RCOMP0		= 0x38,
	MAX77693_TEMPCO		= 0x39,
	MAX77693_FSTAT		= 0x3D,
	MAX77693_VFOCV		= 0xEE,
	MAX77693_VFSOC		= 0xFF,

	FG_NUM_OF_REGS		= 0x100,
};

#define MAX77693_POR (1 << 1)

#define MODEL_UNLOCK1		0x0059
#define MODEL_UNLOCK2		0x00c4
#define MODEL_LOCK1		0x0000
#define MODEL_LOCK2		0x0000

#define MAX77693_FUEL_I2C_ADDR	(0x6C >> 1)

int power_fg_init(unsigned char bus);
#endif /* __MAX77693_FG_H_ */
