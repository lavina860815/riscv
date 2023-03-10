dnl Copyright (C) 2010, 2011, 2015 Free Software Foundation, Inc.
dnl This file is free software, distributed under the terms of the GNU
dnl General Public License.  As a special exception to the GNU General
dnl Public License, this file may be distributed as part of a program
dnl that contains a configuration script generated by Autoconf, under
dnl the same distribution terms as the rest of that program.

dnl From Paolo Bonzini.

dnl Is this an ELF target supporting the LTO plugin?

dnl usage: ACX_ELF_TARGET_IFELSE([if-elf], [if-not-elf])
AC_DEFUN([ACX_ELF_TARGET_IFELSE], [
AC_REQUIRE([AC_CANONICAL_TARGET])

target_elf=no
case $target in
  *-darwin* | *-aix* | *-cygwin* | *-mingw* | *-aout* | *-*coff* | \
  *-msdosdjgpp* | *-vms* | *-wince* | *-*-pe* | \
  alpha*-dec-osf* | *-interix* | hppa[[12]]*-*-hpux* | \
  nvptx-*-none)
    target_elf=no
    ;;
  *)
    target_elf=yes
    ;;
esac

AS_IF([test $target_elf = yes], [$1], [$2])
])
