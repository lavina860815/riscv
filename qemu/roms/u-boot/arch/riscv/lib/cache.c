// SPDX-License-Identifier: GPL-2.0+
/*
 * Copyright (C) 2017 Andes Technology Corporation
 * Rick Chen, Andes Technology Corporation <rick@andestech.com>
 */

#include <common.h>

void invalidate_icache_all(void)
{
	asm volatile ("fence.i" ::: "memory");
}

void flush_dcache_all(void)
{
	asm volatile ("fence" :::"memory");
}
void flush_dcache_range(unsigned long start, unsigned long end)
{
	flush_dcache_all();
}

void invalidate_icache_range(unsigned long start, unsigned long end)
{
	/*
	 * RISC-V does not have an instruction for invalidating parts of the
	 * instruction cache. Invalidate all of it instead.
	 */
	invalidate_icache_all();
}

void invalidate_dcache_range(unsigned long start, unsigned long end)
{
	flush_dcache_all();
}

void cache_flush(void)
{
	invalidate_icache_all();
	flush_dcache_all();
}

void flush_cache(unsigned long addr, unsigned long size)
{
	invalidate_icache_all();
	flush_dcache_all();
}

__weak void icache_enable(void)
{
}

__weak void icache_disable(void)
{
}

__weak int icache_status(void)
{
	return 0;
}

__weak void dcache_enable(void)
{
}

__weak void dcache_disable(void)
{
}

__weak int dcache_status(void)
{
	return 0;
}
