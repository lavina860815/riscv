/*
 *   Creation Date: <2004/01/15 16:14:05 samuel>
 *   Time-stamp: <2004/01/15 16:14:05 samuel>
 *
 *	<openbios.h>
 *
 *
 *
 *   Copyright (C) 2004 Samuel Rydh (samuel@ibrium.se)
 *
 *   This program is free software; you can redistribute it and/or
 *   modify it under the terms of the GNU General Public License
 *   version 2
 *
 */

#ifndef _H_OPENBIOS
#define _H_OPENBIOS

int openbios(void);

/* entry.S */
void init_exceptions(void);

/* console.c */
extern void	cls(void);
#ifdef CONFIG_DEBUG_CONSOLE
extern int	uart_init(int port, unsigned long speed);
extern void     video_init(void);
#endif

#endif   /* _H_OPENBIOS */
