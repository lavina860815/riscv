dnl Process this file with autoconf to produce a configure script.
AC_INIT(Makefile.in)
sinclude(../common/acinclude.m4)

SIM_AC_COMMON

SIM_AC_OPTION_ENDIAN(BIG)
SIM_AC_OPTION_ALIGNMENT(STRICT_ALIGNMENT,STRICT_ALIGNMENT)
SIM_AC_OPTION_SCACHE(16384)
SIM_AC_OPTION_DEFAULT_MODEL(lm32)
SIM_AC_OPTION_CGEN_MAINT
SIM_AC_OPTION_HARDWARE(yes,,lm32cpu lm32timer lm32uart)

SIM_AC_OUTPUT
