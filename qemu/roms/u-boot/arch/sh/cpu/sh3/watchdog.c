// SPDX-License-Identifier: GPL-2.0+
/*
 * (C) Copyright 2010
 * Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
 *
 * (C) Copyright 2007
 * Yoshihiro Shimoda <shimoda.yoshihiro@renesas.com>
 */

#include <common.h>
#include <asm/processor.h>
#include <asm/system.h>

int watchdog_init(void)
{
	return 0;
}

void reset_cpu(unsigned long ignored)
{
	/* Address error with SR.BL=1 first. */
	trigger_address_error();

	while (1)
		;
}
