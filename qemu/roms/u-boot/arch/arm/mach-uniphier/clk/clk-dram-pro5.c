// SPDX-License-Identifier: GPL-2.0+
/*
 * Copyright (C) 2015-2017 Socionext Inc.
 */

#include <linux/io.h>

#include "../init.h"
#include "../sc-regs.h"

void uniphier_pro5_dram_clk_init(void)
{
	u32 tmp;

	/*
	 * deassert reset
	 * UMCA2: Ch1 (DDR3)
	 * UMCA1, UMC31: Ch0 (WIO1)
	 * UMCA0, UMC30: Ch0 (WIO0)
	 */
	tmp = readl(SC_RSTCTRL4);
	tmp |= SC_RSTCTRL4_NRST_UMCSB | SC_RSTCTRL4_NRST_UMCA2 |
	       SC_RSTCTRL4_NRST_UMCA1 | SC_RSTCTRL4_NRST_UMCA0 |
	       SC_RSTCTRL4_NRST_UMC31 | SC_RSTCTRL4_NRST_UMC30;
	writel(tmp, SC_RSTCTRL4);
	readl(SC_RSTCTRL4); /* dummy read */

	/* provide clocks */
	tmp = readl(SC_CLKCTRL4);
	tmp |= SC_CLKCTRL4_CEN_UMCSB | SC_CLKCTRL4_CEN_UMC1 |
	       SC_CLKCTRL4_CEN_UMC0;
	writel(tmp, SC_CLKCTRL4);
	readl(SC_CLKCTRL4); /* dummy read */
}
