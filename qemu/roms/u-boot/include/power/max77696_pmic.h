/* SPDX-License-Identifier: GPL-2.0+ */
/*
 *  Copyright (C) 2015 Freescale Semiconductor, Inc.
 *  Fabio Estevam <fabio.estevam@freescale.com>
 */

#ifndef __MAX77696_PMIC_H__
#define __MAX77696_PMIC_H__

#define CONFIG_POWER_MAX77696_I2C_ADDR	0x3C

enum {
	L01_CNFG1 =	0x43,
	L01_CNFG2,
	L02_CNFG1,
	L02_CNFG2,
	L03_CNFG1,
	L03_CNFG2,
	L04_CNFG1,
	L04_CNFG2,
	L05_CNFG1,
	L05_CNFG2,
	L06_CNFG1,
	L06_CNFG2,
	L07_CNFG1,
	L07_CNFG2,
	L08_CNFG1,
	L08_CNFG2,
	L09_CNFG1,
	L09_CNFG2,
	L10_CNFG1,
	L10_CNFG2,
	LDO_INT1,
	LDO_INT2,
	LDO_INT1M,
	LDO_INT2M,
	LDO_CNFG3,
	SW1_CNTRL,
	SW2_CNTRL,
	SW3_CNTRL,
	SW4_CNTRL,
	EPDCNFG,
	EPDINTS,
	EPDINT,
	EPDINTM,
	EPDVCOM,
	EPDVEE,
	EPDVNEG,
	EPDVPOS,
	EPDVDDH,
	EPDSEQ,
	EPDOKINTS,
	CID =	0x9c,
	PMIC_NUM_OF_REGS,
};

int power_max77696_init(unsigned char bus);

#endif
