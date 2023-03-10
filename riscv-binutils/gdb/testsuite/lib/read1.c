/* This is part of GDB, the GNU debugger.

   Copyright 2011-2021 Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#define _GNU_SOURCE 1
#include <dlfcn.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>

/* Wrap 'read', forcing it to return only one byte at a time, if
   reading from the terminal.  */

ssize_t
read (int fd, void *buf, size_t count)
{
  static ssize_t (*read2) (int fd, void *buf, size_t count) = NULL;
  if (read2 == NULL)
    {
      /* Use setenv (v, "", 1) rather than unsetenv (v) to work around
         https://core.tcl-lang.org/tcl/tktview?name=67fd4f973a "incorrect
	 results of 'info exists' when unset env var in one interp and check
	 for existence from another interp".  */
      setenv ("LD_PRELOAD", "", 1);
      read2 = dlsym (RTLD_NEXT, "read");
    }
  if (count > 1 && isatty (fd) >= 1)
    count = 1;
  return read2 (fd, buf, count);
}
