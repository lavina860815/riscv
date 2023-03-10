/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * Copyright (C) 2016 Toradex AG
 * Stefan Agner <stefan.agner@toradex.com>
 */
#ifndef __RN5T567_PMIC_H_
#define __RN5T567_PMIC_H_

/* RN5T567 registers */
enum {
	RN5T567_LSIVER		= 0x00,
	RN5T567_OTPVER		= 0x01,
	RN5T567_IODAC		= 0x02,
	RN5T567_VINDAC		= 0x03,
	RN5T567_OUT32KEN	= 0x05,

	RN5T567_CPUCNT		= 0x06,

	RN5T567_PSWR		= 0x07,
	RN5T567_PONHIS		= 0x09,
	RN5T567_POFFHIS		= 0x0A,
	RN5T567_WATCHDOG	= 0x0B,
	RN5T567_WATCHDOGCNT	= 0x0C,
	RN5T567_PWRFUNC		= 0x0D,
	RN5T567_SLPCNT		= 0x0E,
	RN5T567_REPCNT		= 0x0F,
	RN5T567_PWRONTIMSET	= 0x10,
	RN5T567_NOETIMSETCNT	= 0x11,
	RN5T567_PWRIREN		= 0x12,
	RN5T567_PWRIRQ		= 0x13,
	RN5T567_PWRMON		= 0x14,
	RN5T567_PWRIRSEL	= 0x15,

	RN5T567_DC1_SLOT	= 0x16,
	RN5T567_DC2_SLOT	= 0x17,
	RN5T567_DC3_SLOT	= 0x18,
	RN5T567_DC4_SLOT	= 0x19,

	RN5T567_LDO1_SLOT	= 0x1B,
	RN5T567_LDO2_SLOT	= 0x1C,
	RN5T567_LDO3_SLOT	= 0x1D,
	RN5T567_LDO4_SLOT	= 0x1E,
	RN5T567_LDO5_SLOT	= 0x1F,

	RN5T567_PSO0_SLOT	= 0x25,
	RN5T567_PSO1_SLOT	= 0x26,
	RN5T567_PSO2_SLOT	= 0x27,
	RN5T567_PSO3_SLOT	= 0x28,

	RN5T567_LDORTC1_SLOT	= 0x2A,

	RN5T567_DC1CTL		= 0x2C,
	RN5T567_DC1CTL2		= 0x2D,
	RN5T567_DC2CTL		= 0x2E,
	RN5T567_DC2CTL2		= 0x2F,
	RN5T567_DC3CTL		= 0x30,
	RN5T567_DC3CTL2		= 0x31,
	RN5T567_DC4CTL		= 0x32,
	RN5T567_DC4CTL2		= 0x33,

	RN5T567_DC1DAC		= 0x36,
	RN5T567_DC2DAC		= 0x37,
	RN5T567_DC3DAC		= 0x38,
	RN5T567_DC4DAC		= 0x39,

	RN5T567_DC1DAC_SLP	= 0x3B,
	RN5T567_DC2DAC_SLP	= 0x3C,
	RN5T567_DC3DAC_SLP	= 0x3D,
	RN5T567_DC4DAC_SLP	= 0x3E,

	RN5T567_DCIREN		= 0x40,
	RN5T567_DCIRQ		= 0x41,
	RN5T567_DCIRMON		= 0x42,

	RN5T567_LDOEN1		= 0x44,
	RN5T567_LDOEN2		= 0x45,
	RN5T567_LDODIS1		= 0x46,

	RN5T567_LDO1DAC		= 0x4C,
	RN5T567_LDO2DAC		= 0x4D,
	RN5T567_LDO3DAC		= 0x4E,
	RN5T567_LDO4DAC		= 0x4F,
	RN5T567_LDO5DAC		= 0x50,

	RN5T567_LDORTC1DAC	= 0x56,
	RN5T567_LDORTC2DAC	= 0x57,

	RN5T567_LDO1DAC_SLP	= 0x58,
	RN5T567_LDO2DAC_SLP	= 0x59,
	RN5T567_LDO3DAC_SLP	= 0x5A,
	RN5T567_LDO4DAC_SLP	= 0x5B,
	RN5T567_LDO5DAC_SLP	= 0x5C,

	RN5T567_IOSEL		= 0x90,
	RN5T567_IOOUT		= 0x91,
	RN5T567_GPEDGE1		= 0x92,
	RN5T567_EN_GPIR		= 0x94,
	RN5T567_IR_GPR		= 0x95,
	RN5T567_IR_GPF		= 0x96,
	RN5T567_MON_IOIN	= 0x97,
	RN5T567_GPLED_FUNC	= 0x98,
	RN5T567_INTPOL		= 0x9C,
	RN5T567_INTEN		= 0x9D,
	RN5T567_INTMON		= 0x9E,

	RN5T567_PREVINDAC	= 0xB0,
	RN5T567_OVTEMP		= 0xBC,

	RN5T567_NUM_OF_REGS	= 0xBF,
};

#endif
