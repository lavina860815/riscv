dnl Process this file file with autoconf to produce a configure script.
dnl This file is a shell script fragment that supplies the information
dnl necessary to tailor a template configure script into the configure
dnl script appropriate for this directory.  For more information, check
dnl any existing configure script.

AC_INIT(common/bits-tst.c)

CC=${CC-cc}
AC_SUBST(CC)
AC_CONFIG_AUX_DIR(../..)
AC_CANONICAL_SYSTEM

# Configure sub-directory for appropriate targets
case ${target} in
    d10v-*-elf )
	AC_CONFIG_SUBDIRS(d10v-elf)
	;;
    frv-*-elf )
	AC_CONFIG_SUBDIRS(frv-elf)
	;;
    m32r-*-elf )
	AC_CONFIG_SUBDIRS(m32r-elf)
	;;
    mips64el-*-elf )
        AC_CONFIG_SUBDIRS(mips64el-elf)
	;;
esac

sinclude(../configure.tgt)

AC_OUTPUT(Makefile)
