/*
 * Copyright (C) 2011 Andes Technology Corporation
 * Copyright (C) 2010 Shawn Lin (nobuhiro@andestech.com)
 * Copyright (C) 2011 Macpaul Lin (macpaul@andestech.com)
 *
 * This file is subject to the terms and conditions of the GNU General Public
 * License.  See the file "COPYING" in the main directory of this archive
 * for more details.
 */

#ifndef __ASM_NDS_TYPES_H
#define __ASM_NDS_TYPES_H

#include <asm-generic/int-ll64.h>

typedef unsigned short umode_t;

/*
 * These aren't exported outside the kernel to avoid name space clashes
 */
#ifdef __KERNEL__

#define BITS_PER_LONG 32

#include <stddef.h>

typedef u32 dma_addr_t;

typedef unsigned long phys_addr_t;
typedef unsigned long phys_size_t;

#endif /* __KERNEL__ */

#endif
