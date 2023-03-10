// SPDX-License-Identifier: GPL-2.0+
/*
 * (C) Copyright 2002
 * Daniel Engström, Omicron Ceti AB, <daniel@omicron.se>
 */

#include <common.h>
#include <asm/io.h>
#include <asm/i8254.h>

#define TIMER1_VALUE	18	/* 15.6us */
#define TIMER2_VALUE	0x0a8e	/* 440Hz */

int i8254_init(void)
{
	/*
	 * Initialize counter 1, used to refresh request signal.
	 * This is required for legacy purpose as some codes like
	 * vgabios utilizes counter 1 to provide delay functionality.
	 */
	outb(PIT_CMD_CTR1 | PIT_CMD_LOW | PIT_CMD_MODE2,
	     PIT_BASE + PIT_COMMAND);
	outb(TIMER1_VALUE, PIT_BASE + PIT_T1);

	/*
	 * Initialize counter 2, used to drive the speaker.
	 * To start a beep, set both bit0 and bit1 of port 0x61.
	 * To stop it, clear both bit0 and bit1 of port 0x61.
	 */
	outb(PIT_CMD_CTR2 | PIT_CMD_BOTH | PIT_CMD_MODE3,
	     PIT_BASE + PIT_COMMAND);
	outb(TIMER2_VALUE & 0xff, PIT_BASE + PIT_T2);
	outb(TIMER2_VALUE >> 8, PIT_BASE + PIT_T2);

	return 0;
}
