/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * (C) Copyright 2012 Freescale Semiconductor, Inc.
 */

#ifndef __MC34704_H__
#define __MC34704_H__

enum {
	MC34704_RESERVED0_REG = 0,	/* 0x00 */
	MC34704_GENERAL1_REG,		/* 0x01 */
	MC34704_GENERAL2_REG,		/* 0x02 */
	MC34704_GENERAL3_REG,		/* 0x03 */
	MC34704_RESERVED4_REG,		/* 0x04 */
	MC34704_VGSET2_REG,		/* 0x05 */
	MC34704_REG2SET1_REG,		/* 0x06 */
	MC34704_REG2SET2_REG,		/* 0x07 */
	MC34704_REG3SET1_REG,		/* 0x08 */
	MC34704_REG3SET2_REG,		/* 0x09 */
	MC34704_REG4SET1_REG,		/* 0x0a */
	MC34704_REG4SET2_REG,		/* 0x0b */
	MC34704_REG5SET1_REG,		/* 0x0c */
	MC34704_REG5SET2_REG,		/* 0x0d */
	MC34704_REG5SET3_REG,		/* 0x0e */
	MC34704_RESERVEDF_REG,		/* 0x0f */
	MC34704_RESERVED10_REG,		/* 0x10 */
	MC34704_RESERVED11_REG,		/* 0x11 */
	MC34704_RESERVED12_REG,		/* 0x12 */
	MC34704_FSW2SET_REG,		/* 0x13 */
	MC34704_RESERVED14_REG,		/* 0x14 */
	MC34704_REG8SET1_REG,		/* 0x15 */
	MC34704_REG8SET2_REG,		/* 0x16 */
	MC34704_REG8SET3_REG,		/* 0x17 */
	MC34704_FAULTS_REG,		/* 0x18 */
	MC34704_I2CSET1,		/* 0x19 */
	MC34704_NUM_OF_REGS,
};

/* GENERAL2 register fields */
#define ONOFFE		(1 << 0)
#define ONOFFD		(1 << 1)
#define ONOFFA		(1 << 3)
#define ALLOFF		(1 << 4)

#endif /* __MC34704_H__ */
