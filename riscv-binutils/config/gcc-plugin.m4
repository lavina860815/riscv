# gcc-plugin.m4 -*- Autoconf -*-
# Check whether GCC is able to be built with plugin support.

dnl Copyright (C) 2014 Free Software Foundation, Inc.
dnl This file is free software, distributed under the terms of the GNU
dnl General Public License.  As a special exception to the GNU General
dnl Public License, this file may be distributed as part of a program
dnl that contains a configuration script generated by Autoconf, under
dnl the same distribution terms as the rest of that program.

# Check for plugin support.
# Respects --enable-plugin.
# Sets the shell variables enable_plugin and pluginlibs.
AC_DEFUN([GCC_ENABLE_PLUGINS],
  [# Check for plugin support
   AC_ARG_ENABLE(plugin,
   [AS_HELP_STRING([--enable-plugin], [enable plugin support])],
   enable_plugin=$enableval,
   enable_plugin=yes; default_plugin=yes)

   pluginlibs=
   plugin_check=yes

   case "${host}" in
     *-*-mingw*)
       # Since plugin support under MinGW is not as straightforward as on
       # other platforms (e.g., we have to link import library, etc), we
       # only enable it if explicitly requested.
       if test x"$default_plugin" = x"yes"; then
         enable_plugin=no
       elif test x"$enable_plugin" = x"yes"; then
         # Use make's target variable to derive import library name.
         pluginlibs='-Wl,--export-all-symbols -Wl,--out-implib=[$]@.a'
	 plugin_check=no
       fi
     ;;
     *-*-darwin*)
       if test x$build = x$host; then
	 export_sym_check="nm${exeext} -g"
       elif test x$host = x$target; then
	 export_sym_check="$gcc_cv_nm -g"
       else
	 export_sym_check=
       fi
     ;;
     *)
       if test x$build = x$host; then
	 export_sym_check="objdump${exeext} -T"
       elif test x$host = x$target; then
	 export_sym_check="$gcc_cv_objdump -T"
       else
	 export_sym_check=
       fi
     ;;
   esac

   if test x"$enable_plugin" = x"yes" -a x"$plugin_check" = x"yes"; then

     AC_MSG_CHECKING([for exported symbols])
     if test "x$export_sym_check" != x; then
       echo "int main() {return 0;} int foobar() {return 0;}" > conftest.c
       ${CC} ${CFLAGS} ${LDFLAGS} conftest.c -o conftest$ac_exeext > /dev/null 2>&1
       if $export_sym_check conftest$ac_exeext | grep foobar > /dev/null; then
	 : # No need to use a flag
	 AC_MSG_RESULT([yes])
       else
	 AC_MSG_RESULT([yes])
	 AC_MSG_CHECKING([for -rdynamic])
	 ${CC} ${CFLAGS} ${LDFLAGS} -rdynamic conftest.c -o conftest$ac_exeext > /dev/null 2>&1
	 if $export_sym_check conftest$ac_exeext | grep foobar > /dev/null; then
	   plugin_rdynamic=yes
	   pluginlibs="-rdynamic"
	 else
	   plugin_rdynamic=no
	   enable_plugin=no
	 fi
	 AC_MSG_RESULT([$plugin_rdynamic])
       fi
     else
       AC_MSG_RESULT([unable to check])
     fi

     # Check -ldl
     saved_LIBS="$LIBS"
     AC_SEARCH_LIBS([dlopen], [dl])
     if test x"$ac_cv_search_dlopen" = x"-ldl"; then
       pluginlibs="$pluginlibs -ldl"
     fi
     LIBS="$saved_LIBS"

     # Check that we can build shared objects with -fPIC -shared
     saved_LDFLAGS="$LDFLAGS"
     saved_CFLAGS="$CFLAGS"
     case "${host}" in
       *-*-darwin*)
	 CFLAGS=`echo $CFLAGS | sed s/-mdynamic-no-pic//g`
	 CFLAGS="$CFLAGS -fPIC"
	 LDFLAGS="$LDFLAGS -shared -undefined dynamic_lookup"
       ;;
       *)
	 CFLAGS="$CFLAGS -fPIC"
	 LDFLAGS="$LDFLAGS -fPIC -shared"
       ;;
     esac
     AC_MSG_CHECKING([for -fPIC -shared])
     AC_TRY_LINK(
       [extern int X;],[return X == 0;],
       [AC_MSG_RESULT([yes]); have_pic_shared=yes],
       [AC_MSG_RESULT([no]); have_pic_shared=no])
     if test x"$have_pic_shared" != x"yes" -o x"$ac_cv_search_dlopen" = x"no"; then
       pluginlibs=
       enable_plugin=no
     fi
     LDFLAGS="$saved_LDFLAGS"
     CFLAGS="$saved_CFLAGS"

     # If plugin support had been requested but not available, fail.
     if test x"$enable_plugin" = x"no" ; then
       if test x"$default_plugin" != x"yes"; then
	 AC_MSG_ERROR([
   Building GCC with plugin support requires a host that supports
   -fPIC, -shared, -ldl and -rdynamic.])
       fi
     fi
   fi
])
