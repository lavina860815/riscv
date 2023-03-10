/* SPDX-License-Identifier: GPL-2.0+ */
/*
 *  Copyright (C) 2012 Samsung Electronics
 *  Lukasz Majewski <l.majewski@samsung.com>
 */

#ifndef __FG_BATTERY_CELL_PARAMS_H_
#define __FG_BATTERY_CELL_PARAMS_H_

#if  defined(CONFIG_POWER_FG_MAX17042) && defined(CONFIG_TRATS)

/* Cell characteristics - Exynos4 TRATS development board */
/* Shall be written to addr 0x80h */
u16 cell_character0[16] = {
	0xA2A0,
	0xB6E0,
	0xB850,
	0xBAD0,
	0xBB20,
	0xBB70,
	0xBBC0,
	0xBC20,
	0xBC80,
	0xBCE0,
	0xBD80,
	0xBE20,
	0xC090,
	0xC420,
	0xC910,
	0xD070
};

/* Shall be written to addr 0x90h */
u16 cell_character1[16] = {
	0x0090,
	0x1A50,
	0x02F0,
	0x2060,
	0x2060,
	0x2E60,
	0x26A0,
	0x2DB0,
	0x2DB0,
	0x1870,
	0x2A20,
	0x16F0,
	0x08F0,
	0x0D40,
	0x08C0,
	0x08C0
};

/* Shall be written to addr 0xA0h */
u16 cell_character2[16] = {
	0x0100,
	0x0100,
	0x0100,
	0x0100,
	0x0100,
	0x0100,
	0x0100,
	0x0100,
	0x0100,
	0x0100,
	0x0100,
	0x0100,
	0x0100,
	0x0100,
	0x0100,
	0x0100
};
#endif
#endif /* __FG_BATTERY_CELL_PARAMS_H_ */
