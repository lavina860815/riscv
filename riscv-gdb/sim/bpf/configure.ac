dnl Process this file with autoconf to produce a configure script.
AC_INIT(Makefile.in)
sinclude(../common/acinclude.m4)

SIM_AC_COMMON

SIM_AC_OPTION_BITSIZE([64])
SIM_AC_OPTION_ENDIAN([], [LITTLE])
SIM_AC_OPTION_ALIGNMENT(NONSTRICT_ALIGNMENT)
SIM_AC_OPTION_SCACHE(16384)
SIM_AC_OPTION_DEFAULT_MODEL([bpf-def])
SIM_AC_OPTION_CGEN_MAINT

SIM_AC_OUTPUT
