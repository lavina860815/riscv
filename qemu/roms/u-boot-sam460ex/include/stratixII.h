/*
 * (C) Copyright 2007
 * Eran Liberty, Extricom, eran.liberty@gmail.com
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
 *
 */
#ifndef _STRATIXII_H_
#define _STRATIXII_H_

extern int StratixII_load (Altera_desc * desc, void *image, size_t size);
extern int StratixII_dump (Altera_desc * desc, void *buf, size_t bsize);
extern int StratixII_info (Altera_desc * desc);

#endif				/* _STRATIXII_H_ */
