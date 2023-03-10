/*
 * [origin: Linux kernel include/asm-arm/arch-at91/io.h]
 *
 *  Copyright (C) 2003 SAN People
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#ifndef __ASM_ARCH_IO_H
#define __ASM_ARCH_IO_H

#include <asm/io.h>

#ifdef CONFIG_AT91_LEGACY

static inline unsigned int at91_sys_read(unsigned int reg_offset)
{
	void *addr = (void *)AT91_BASE_SYS;

	return __raw_readl(addr + reg_offset);
}

static inline void at91_sys_write(unsigned int reg_offset, unsigned long value)
{
	void *addr = (void *)AT91_BASE_SYS;

	__raw_writel(value, addr + reg_offset);
}
#endif

#endif
