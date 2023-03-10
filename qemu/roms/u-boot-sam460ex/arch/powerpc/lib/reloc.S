/*
 * Copyright (C) 2009 Wolfgang Denk <wd@denx.de>
 *
 * See file CREDITS for list of people who contributed to this
 * project.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
 * MA 02111-1307 USA
 */

#include <ppc_asm.tmpl>

	.file	"reloc.S"

	.text
#ifndef CONFIG_NAND_SPL
	/*
	 * Function: relocate entries for one exception vector
	 */
	.globl trap_reloc
	.type	trap_reloc, @function
trap_reloc:
	lwz	r0, 0(r7)		/* hdlr ...		*/
	add	r0, r0, r3		/*  ... += dest_addr	*/
	stw	r0, 0(r7)

	lwz	r0, 4(r7)		/* int_return ...	*/
	add	r0, r0, r3		/*  ... += dest_addr	*/
	stw	r0, 4(r7)

	lwz	r0, 8(r7)		/* transfer_to_handler ...*/
	add	r0, r0, r3		/*  ... += dest_addr	*/
	stw	r0, 8(r7)

	blr
	.size	trap_reloc, .-trap_reloc
#endif
