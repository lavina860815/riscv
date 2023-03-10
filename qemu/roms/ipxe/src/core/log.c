/*
 * Copyright (C) 2012 Michael Brown <mbrown@fensystems.co.uk>.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301, USA.
 *
 * You can also choose to distribute this program under the terms of
 * the Unmodified Binary Distribution Licence (as given in the file
 * COPYING.UBDL), provided that you have satisfied its requirements.
 */

FILE_LICENCE ( GPL2_OR_LATER_OR_UBDL );

/** @file
 *
 * System logger
 *
 */

#include <stdarg.h>
#include <syslog.h>
#include <ipxe/console.h>

/**
 * Write message to system log
 *
 * @v fmt		Format string
 * @v args		Arguments
 */
void log_vprintf ( const char *fmt, va_list args ) {
	int saved_usage;

	/* Mark console as in use for log messages */
	saved_usage = console_set_usage ( CONSOLE_USAGE_LOG );

	/* Print message */
	vprintf ( fmt, args );

	/* Restore console usage */
	console_set_usage ( saved_usage );
}

/**
 * Write message to system log
 *
 * @v fmt		Format string
 * @v ...		Arguments
 */
void log_printf ( const char *fmt, ... ) {
	va_list args;

	va_start ( args, fmt );
	log_vprintf ( fmt, args );
	va_end ( args );
}
