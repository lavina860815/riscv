dnl ----------------------------------------------------------------------
dnl This whole bit snagged from libgfortran.

sinclude(../libtool.m4)
sinclude(../config/enable.m4)
sinclude(../config/cet.m4)
dnl The lines below arrange for aclocal not to bring an installed
dnl libtool.m4 into aclocal.m4, while still arranging for automake to
dnl add a definition of LIBTOOL to Makefile.in.
ifelse(,,,[AC_SUBST(LIBTOOL)
AC_DEFUN([AM_PROG_LIBTOOL])
])
