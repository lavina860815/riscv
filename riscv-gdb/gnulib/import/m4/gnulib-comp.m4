# DO NOT EDIT! GENERATED AUTOMATICALLY!
# Copyright (C) 2002-2020 Free Software Foundation, Inc.
#
# This file is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This file is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this file.  If not, see <https://www.gnu.org/licenses/>.
#
# As a special exception to the GNU General Public License,
# this file may be distributed as part of a program that
# contains a configuration script generated by Autoconf, under
# the same distribution terms as the rest of that program.
#
# Generated by gnulib-tool.
#
# This file represents the compiled summary of the specification in
# gnulib-cache.m4. It lists the computed macro invocations that need
# to be invoked from configure.ac.
# In projects that use version control, this file can be treated like
# other built files.


# This macro should be invoked from ./configure.ac, in the section
# "Checks for programs", right after AC_PROG_CC, and certainly before
# any checks for libraries, header files, types and library functions.
AC_DEFUN([gl_EARLY],
[
  m4_pattern_forbid([^gl_[A-Z]])dnl the gnulib macro namespace
  m4_pattern_allow([^gl_ES$])dnl a valid locale name
  m4_pattern_allow([^gl_LIBOBJS$])dnl a variable
  m4_pattern_allow([^gl_LTLIBOBJS$])dnl a variable

  # Pre-early section.
  AC_REQUIRE([gl_USE_SYSTEM_EXTENSIONS])
  AC_REQUIRE([gl_PROG_AR_RANLIB])

  AC_REQUIRE([AM_PROG_CC_C_O])
  # Code from module absolute-header:
  # Code from module alloca:
  # Code from module alloca-opt:
  # Code from module arpa_inet:
  # Code from module assure:
  # Code from module at-internal:
  # Code from module attribute:
  # Code from module btowc:
  # Code from module builtin-expect:
  # Code from module c99:
  # Code from module canonicalize-lgpl:
  # Code from module chdir:
  # Code from module chdir-long:
  # Code from module cloexec:
  # Code from module close:
  # Code from module closedir:
  # Code from module count-one-bits:
  # Code from module ctype:
  # Code from module d-ino:
  # Code from module d-type:
  # Code from module dirent:
  # Code from module dirfd:
  # Code from module dirname-lgpl:
  # Code from module double-slash-root:
  # Code from module dup:
  # Code from module dup2:
  # Code from module environ:
  # Code from module errno:
  # Code from module error:
  # Code from module exitfail:
  # Code from module extensions:
  # Code from module extern-inline:
  # Code from module fchdir:
  # Code from module fcntl:
  # Code from module fcntl-h:
  # Code from module fd-hook:
  # Code from module fd-safer-flag:
  # Code from module fdopendir:
  # Code from module filename:
  # Code from module filenamecat-lgpl:
  # Code from module flexmember:
  # Code from module float:
  # Code from module fnmatch:
  # Code from module fnmatch-gnu:
  # Code from module fnmatch-h:
  # Code from module fpieee:
  AC_REQUIRE([gl_FP_IEEE])
  # Code from module fpucw:
  # Code from module frexp:
  # Code from module frexpl:
  # Code from module fstat:
  # Code from module fstatat:
  # Code from module getcwd:
  # Code from module getcwd-lgpl:
  # Code from module getdtablesize:
  # Code from module getlogin_r:
  # Code from module getprogname:
  # Code from module getrandom:
  # Code from module gettext-h:
  # Code from module gettimeofday:
  # Code from module glob:
  # Code from module glob-h:
  # Code from module hard-locale:
  # Code from module include_next:
  # Code from module inet_ntop:
  # Code from module intprops:
  # Code from module inttypes:
  # Code from module inttypes-incomplete:
  # Code from module isblank:
  # Code from module isnand-nolibm:
  # Code from module isnanl-nolibm:
  # Code from module largefile:
  AC_REQUIRE([AC_SYS_LARGEFILE])
  # Code from module libc-config:
  # Code from module limits-h:
  # Code from module localcharset:
  # Code from module locale:
  # Code from module localtime-buffer:
  # Code from module lock:
  # Code from module lstat:
  # Code from module malloc-posix:
  # Code from module malloca:
  # Code from module math:
  # Code from module mbrtowc:
  # Code from module mbsinit:
  # Code from module mbsrtowcs:
  # Code from module mbtowc:
  # Code from module memchr:
  # Code from module memmem:
  # Code from module memmem-simple:
  # Code from module mempcpy:
  # Code from module memrchr:
  # Code from module minmax:
  # Code from module mkdir:
  # Code from module mkdtemp:
  # Code from module mkostemp:
  # Code from module msvc-inval:
  # Code from module msvc-nothrow:
  # Code from module multiarch:
  # Code from module netinet_in:
  # Code from module nocrash:
  # Code from module open:
  # Code from module openat:
  # Code from module openat-die:
  # Code from module openat-h:
  # Code from module opendir:
  # Code from module pathmax:
  # Code from module rawmemchr:
  # Code from module readdir:
  # Code from module readlink:
  # Code from module realloc-posix:
  # Code from module rename:
  # Code from module rewinddir:
  # Code from module rmdir:
  # Code from module same-inode:
  # Code from module save-cwd:
  # Code from module scratch_buffer:
  # Code from module setenv:
  # Code from module setlocale-null:
  # Code from module signal-h:
  # Code from module snippet/_Noreturn:
  # Code from module snippet/arg-nonnull:
  # Code from module snippet/c++defs:
  # Code from module snippet/warn-on-use:
  # Code from module socklen:
  # Code from module ssize_t:
  # Code from module stat:
  # Code from module stat-time:
  # Code from module std-gnu11:
  # Code from module stdalign:
  # Code from module stdbool:
  # Code from module stddef:
  # Code from module stdint:
  # Code from module stdio:
  # Code from module stdlib:
  # Code from module strchrnul:
  # Code from module strdup-posix:
  # Code from module streq:
  # Code from module strerror:
  # Code from module strerror-override:
  # Code from module strerror_r-posix:
  # Code from module string:
  # Code from module strnlen:
  # Code from module strnlen1:
  # Code from module strstr:
  # Code from module strstr-simple:
  # Code from module strtok_r:
  # Code from module sys_random:
  # Code from module sys_socket:
  # Code from module sys_stat:
  # Code from module sys_time:
  # Code from module sys_types:
  # Code from module sys_uio:
  # Code from module tempname:
  # Code from module threadlib:
  gl_THREADLIB_EARLY
  # Code from module time:
  # Code from module time_r:
  # Code from module unistd:
  # Code from module unistd-safer:
  # Code from module unsetenv:
  # Code from module update-copyright:
  # Code from module verify:
  # Code from module wchar:
  # Code from module wctype-h:
  # Code from module windows-mutex:
  # Code from module windows-once:
  # Code from module windows-recmutex:
  # Code from module windows-rwlock:
  # Code from module wmemchr:
  # Code from module wmempcpy:
  # Code from module xalloc-oversized:
])

# This macro should be invoked from ./configure.ac, in the section
# "Check for header files, types and library functions".
AC_DEFUN([gl_INIT],
[
  AM_CONDITIONAL([GL_COND_LIBTOOL], [false])
  gl_cond_libtool=false
  gl_libdeps=
  gl_ltlibdeps=
  gl_m4_base='import/m4'
  m4_pushdef([AC_LIBOBJ], m4_defn([gl_LIBOBJ]))
  m4_pushdef([AC_REPLACE_FUNCS], m4_defn([gl_REPLACE_FUNCS]))
  m4_pushdef([AC_LIBSOURCES], m4_defn([gl_LIBSOURCES]))
  m4_pushdef([gl_LIBSOURCES_LIST], [])
  m4_pushdef([gl_LIBSOURCES_DIR], [])
  gl_COMMON
  gl_source_base='import'
  gl_FUNC_ALLOCA
  gl_HEADER_ARPA_INET
  AC_PROG_MKDIR_P
  AC_REQUIRE([AC_CANONICAL_HOST])
  gl_FUNC_BTOWC
  if test $HAVE_BTOWC = 0 || test $REPLACE_BTOWC = 1; then
    AC_LIBOBJ([btowc])
    gl_PREREQ_BTOWC
  fi
  gl_WCHAR_MODULE_INDICATOR([btowc])
  gl___BUILTIN_EXPECT
  gl_CANONICALIZE_LGPL
  if test $HAVE_CANONICALIZE_FILE_NAME = 0 || test $REPLACE_CANONICALIZE_FILE_NAME = 1; then
    AC_LIBOBJ([canonicalize-lgpl])
  fi
  gl_MODULE_INDICATOR([canonicalize-lgpl])
  gl_STDLIB_MODULE_INDICATOR([canonicalize_file_name])
  gl_STDLIB_MODULE_INDICATOR([realpath])
  gl_UNISTD_MODULE_INDICATOR([chdir])
  gl_FUNC_CHDIR_LONG
  if test $gl_cv_have_arbitrary_file_name_length_limit = yes; then
    AC_LIBOBJ([chdir-long])
    gl_PREREQ_CHDIR_LONG
  fi
  gl_MODULE_INDICATOR_FOR_TESTS([cloexec])
  gl_FUNC_CLOSE
  if test $REPLACE_CLOSE = 1; then
    AC_LIBOBJ([close])
  fi
  gl_UNISTD_MODULE_INDICATOR([close])
  gl_FUNC_CLOSEDIR
  if test $HAVE_CLOSEDIR = 0 || test $REPLACE_CLOSEDIR = 1; then
    AC_LIBOBJ([closedir])
  fi
  gl_DIRENT_MODULE_INDICATOR([closedir])
  gl_CTYPE_H
  gl_CHECK_TYPE_STRUCT_DIRENT_D_INO
  gl_CHECK_TYPE_STRUCT_DIRENT_D_TYPE
  gl_DIRENT_H
  gl_FUNC_DIRFD
  if test $ac_cv_func_dirfd = no && test $gl_cv_func_dirfd_macro = no \
     || test $REPLACE_DIRFD = 1; then
    AC_LIBOBJ([dirfd])
    gl_PREREQ_DIRFD
  fi
  gl_DIRENT_MODULE_INDICATOR([dirfd])
  gl_DIRNAME_LGPL
  gl_DOUBLE_SLASH_ROOT
  gl_FUNC_DUP
  if test $REPLACE_DUP = 1; then
    AC_LIBOBJ([dup])
    gl_PREREQ_DUP
  fi
  gl_UNISTD_MODULE_INDICATOR([dup])
  gl_FUNC_DUP2
  if test $HAVE_DUP2 = 0 || test $REPLACE_DUP2 = 1; then
    AC_LIBOBJ([dup2])
    gl_PREREQ_DUP2
  fi
  gl_UNISTD_MODULE_INDICATOR([dup2])
  gl_ENVIRON
  gl_UNISTD_MODULE_INDICATOR([environ])
  gl_HEADER_ERRNO_H
  gl_ERROR
  if test $ac_cv_lib_error_at_line = no; then
    AC_LIBOBJ([error])
    gl_PREREQ_ERROR
  fi
  m4_ifdef([AM_XGETTEXT_OPTION],
    [AM_][XGETTEXT_OPTION([--flag=error:3:c-format])
     AM_][XGETTEXT_OPTION([--flag=error_at_line:5:c-format])])
  AC_REQUIRE([gl_EXTERN_INLINE])
  gl_FUNC_FCHDIR
  gl_UNISTD_MODULE_INDICATOR([fchdir])
  gl_FUNC_FCNTL
  if test $HAVE_FCNTL = 0 || test $REPLACE_FCNTL = 1; then
    AC_LIBOBJ([fcntl])
  fi
  gl_FCNTL_MODULE_INDICATOR([fcntl])
  gl_FCNTL_H
  gl_MODULE_INDICATOR([fd-safer-flag])
  gl_FUNC_FDOPENDIR
  if test $HAVE_FDOPENDIR = 0 || test $REPLACE_FDOPENDIR = 1; then
    AC_LIBOBJ([fdopendir])
  fi
  gl_DIRENT_MODULE_INDICATOR([fdopendir])
  gl_MODULE_INDICATOR([fdopendir])
  gl_FILE_NAME_CONCAT_LGPL
  AC_C_FLEXIBLE_ARRAY_MEMBER
  gl_FLOAT_H
  if test $REPLACE_FLOAT_LDBL = 1; then
    AC_LIBOBJ([float])
  fi
  if test $REPLACE_ITOLD = 1; then
    AC_LIBOBJ([itold])
  fi
  gl_FUNC_FNMATCH_POSIX
  if test $HAVE_FNMATCH = 0 || test $REPLACE_FNMATCH = 1; then
    AC_LIBOBJ([fnmatch])
    gl_PREREQ_FNMATCH
  fi
  gl_FNMATCH_MODULE_INDICATOR([fnmatch])
  gl_FUNC_FNMATCH_GNU
  if test $HAVE_FNMATCH = 0 || test $REPLACE_FNMATCH = 1; then
    AC_LIBOBJ([fnmatch])
    gl_PREREQ_FNMATCH
  fi
  gl_MODULE_INDICATOR([fnmatch-gnu])
  gl_FNMATCH_H
  AC_REQUIRE([gl_FUNC_FREXP])
  if test $gl_func_frexp != yes; then
    AC_LIBOBJ([frexp])
  fi
  gl_MATH_MODULE_INDICATOR([frexp])
  AC_REQUIRE([gl_FUNC_FREXPL])
  if test $HAVE_DECL_FREXPL = 0 || test $gl_func_frexpl = no; then
    AC_LIBOBJ([frexpl])
  fi
  gl_MATH_MODULE_INDICATOR([frexpl])
  gl_FUNC_FSTAT
  if test $REPLACE_FSTAT = 1; then
    AC_LIBOBJ([fstat])
    case "$host_os" in
      mingw*)
        AC_LIBOBJ([stat-w32])
        ;;
    esac
    gl_PREREQ_FSTAT
  fi
  gl_SYS_STAT_MODULE_INDICATOR([fstat])
  gl_FUNC_FSTATAT
  if test $HAVE_FSTATAT = 0 || test $REPLACE_FSTATAT = 1; then
    AC_LIBOBJ([fstatat])
  fi
  gl_SYS_STAT_MODULE_INDICATOR([fstatat])
  gl_FUNC_GETCWD
  if test $REPLACE_GETCWD = 1; then
    AC_LIBOBJ([getcwd])
    gl_PREREQ_GETCWD
  fi
  gl_MODULE_INDICATOR([getcwd])
  gl_UNISTD_MODULE_INDICATOR([getcwd])
  gl_FUNC_GETCWD_LGPL
  if test $REPLACE_GETCWD = 1; then
    AC_LIBOBJ([getcwd-lgpl])
  fi
  gl_UNISTD_MODULE_INDICATOR([getcwd])
  gl_FUNC_GETDTABLESIZE
  if test $HAVE_GETDTABLESIZE = 0 || test $REPLACE_GETDTABLESIZE = 1; then
    AC_LIBOBJ([getdtablesize])
    gl_PREREQ_GETDTABLESIZE
  fi
  gl_UNISTD_MODULE_INDICATOR([getdtablesize])
  gl_FUNC_GETLOGIN_R
  if test $HAVE_GETLOGIN_R = 0 || test $REPLACE_GETLOGIN_R = 1; then
    AC_LIBOBJ([getlogin_r])
    gl_PREREQ_GETLOGIN_R
  fi
  gl_UNISTD_MODULE_INDICATOR([getlogin_r])
  AC_REQUIRE([gl_LIB_GETLOGIN])
  gl_FUNC_GETPROGNAME
  AC_REQUIRE([AC_CANONICAL_HOST])
  gl_FUNC_GETRANDOM
  if test $HAVE_GETRANDOM = 0 || test $REPLACE_GETRANDOM = 1; then
    AC_LIBOBJ([getrandom])
  fi
  gl_SYS_RANDOM_MODULE_INDICATOR([getrandom])
  AC_SUBST([LIBINTL])
  AC_SUBST([LTLIBINTL])
  gl_FUNC_GETTIMEOFDAY
  if test $HAVE_GETTIMEOFDAY = 0 || test $REPLACE_GETTIMEOFDAY = 1; then
    AC_LIBOBJ([gettimeofday])
    gl_PREREQ_GETTIMEOFDAY
  fi
  gl_SYS_TIME_MODULE_INDICATOR([gettimeofday])
  gl_GLOB
  if test $HAVE_GLOB = 0 || test $REPLACE_GLOB = 1; then
    AC_LIBOBJ([glob])
    AC_LIBOBJ([globfree])
    gl_PREREQ_GLOB
  fi
  if test $HAVE_GLOB_PATTERN_P = 0 || test $REPLACE_GLOB_PATTERN_P = 1; then
    AC_LIBOBJ([glob_pattern_p])
  fi
  gl_GLOB_MODULE_INDICATOR([glob])
  gl_GLOB_H
  AC_REQUIRE([gl_FUNC_SETLOCALE_NULL])
  LIB_HARD_LOCALE="$LIB_SETLOCALE_NULL"
  AC_SUBST([LIB_HARD_LOCALE])
  gl_FUNC_INET_NTOP
  if test $HAVE_INET_NTOP = 0 || test $REPLACE_INET_NTOP = 1; then
    AC_LIBOBJ([inet_ntop])
    gl_PREREQ_INET_NTOP
  fi
  gl_ARPA_INET_MODULE_INDICATOR([inet_ntop])
  gl_INTTYPES_H
  gl_INTTYPES_INCOMPLETE
  gl_FUNC_ISBLANK
  if test $HAVE_ISBLANK = 0; then
    AC_LIBOBJ([isblank])
  fi
  gl_MODULE_INDICATOR([isblank])
  gl_CTYPE_MODULE_INDICATOR([isblank])
  gl_FUNC_ISNAND_NO_LIBM
  if test $gl_func_isnand_no_libm != yes; then
    AC_LIBOBJ([isnand])
    gl_PREREQ_ISNAND
  fi
  gl_FUNC_ISNANL_NO_LIBM
  if test $gl_func_isnanl_no_libm != yes; then
    AC_LIBOBJ([isnanl])
    gl_PREREQ_ISNANL
  fi
  AC_REQUIRE([gl_LARGEFILE])
  gl___INLINE
  gl_LIMITS_H
  gl_LOCALCHARSET
  dnl For backward compatibility. Some packages still use this.
  LOCALCHARSET_TESTS_ENVIRONMENT=
  AC_SUBST([LOCALCHARSET_TESTS_ENVIRONMENT])
  gl_LOCALE_H
  AC_REQUIRE([gl_LOCALTIME_BUFFER_DEFAULTS])
  AC_LIBOBJ([localtime-buffer])
  gl_LOCK
  gl_MODULE_INDICATOR([lock])
  gl_FUNC_LSTAT
  if test $REPLACE_LSTAT = 1; then
    AC_LIBOBJ([lstat])
    gl_PREREQ_LSTAT
  fi
  gl_SYS_STAT_MODULE_INDICATOR([lstat])
  gl_FUNC_MALLOC_POSIX
  if test $REPLACE_MALLOC = 1; then
    AC_LIBOBJ([malloc])
  fi
  gl_STDLIB_MODULE_INDICATOR([malloc-posix])
  gl_MALLOCA
  gl_MATH_H
  gl_FUNC_MBRTOWC
  if test $HAVE_MBRTOWC = 0 || test $REPLACE_MBRTOWC = 1; then
    AC_LIBOBJ([mbrtowc])
    if test $REPLACE_MBSTATE_T = 1; then
      AC_LIBOBJ([lc-charset-dispatch])
      AC_LIBOBJ([mbtowc-lock])
      gl_PREREQ_MBTOWC_LOCK
    fi
    gl_PREREQ_MBRTOWC
  fi
  gl_WCHAR_MODULE_INDICATOR([mbrtowc])
  gl_FUNC_MBSINIT
  if test $HAVE_MBSINIT = 0 || test $REPLACE_MBSINIT = 1; then
    AC_LIBOBJ([mbsinit])
    gl_PREREQ_MBSINIT
  fi
  gl_WCHAR_MODULE_INDICATOR([mbsinit])
  gl_FUNC_MBSRTOWCS
  if test $HAVE_MBSRTOWCS = 0 || test $REPLACE_MBSRTOWCS = 1; then
    AC_LIBOBJ([mbsrtowcs])
    AC_LIBOBJ([mbsrtowcs-state])
    gl_PREREQ_MBSRTOWCS
  fi
  gl_WCHAR_MODULE_INDICATOR([mbsrtowcs])
  gl_FUNC_MBTOWC
  if test $HAVE_MBTOWC = 0 || test $REPLACE_MBTOWC = 1; then
    AC_LIBOBJ([mbtowc])
    gl_PREREQ_MBTOWC
  fi
  gl_STDLIB_MODULE_INDICATOR([mbtowc])
  gl_FUNC_MEMCHR
  if test $HAVE_MEMCHR = 0 || test $REPLACE_MEMCHR = 1; then
    AC_LIBOBJ([memchr])
    gl_PREREQ_MEMCHR
  fi
  gl_STRING_MODULE_INDICATOR([memchr])
  gl_FUNC_MEMMEM
  if test $HAVE_MEMMEM = 0 || test $REPLACE_MEMMEM = 1; then
    AC_LIBOBJ([memmem])
  fi
  gl_FUNC_MEMMEM_SIMPLE
  if test $HAVE_MEMMEM = 0 || test $REPLACE_MEMMEM = 1; then
    AC_LIBOBJ([memmem])
  fi
  gl_STRING_MODULE_INDICATOR([memmem])
  gl_FUNC_MEMPCPY
  if test $HAVE_MEMPCPY = 0; then
    AC_LIBOBJ([mempcpy])
    gl_PREREQ_MEMPCPY
  fi
  gl_STRING_MODULE_INDICATOR([mempcpy])
  gl_FUNC_MEMRCHR
  if test $ac_cv_func_memrchr = no; then
    AC_LIBOBJ([memrchr])
    gl_PREREQ_MEMRCHR
  fi
  gl_STRING_MODULE_INDICATOR([memrchr])
  gl_MINMAX
  gl_FUNC_MKDIR
  if test $REPLACE_MKDIR = 1; then
    AC_LIBOBJ([mkdir])
  fi
  gl_FUNC_MKDTEMP
  if test $HAVE_MKDTEMP = 0; then
    AC_LIBOBJ([mkdtemp])
    gl_PREREQ_MKDTEMP
  fi
  gl_STDLIB_MODULE_INDICATOR([mkdtemp])
  gl_FUNC_MKOSTEMP
  if test $HAVE_MKOSTEMP = 0; then
    AC_LIBOBJ([mkostemp])
    gl_PREREQ_MKOSTEMP
  fi
  gl_MODULE_INDICATOR([mkostemp])
  gl_STDLIB_MODULE_INDICATOR([mkostemp])
  AC_REQUIRE([gl_MSVC_INVAL])
  if test $HAVE_MSVC_INVALID_PARAMETER_HANDLER = 1; then
    AC_LIBOBJ([msvc-inval])
  fi
  AC_REQUIRE([gl_MSVC_NOTHROW])
  if test $HAVE_MSVC_INVALID_PARAMETER_HANDLER = 1; then
    AC_LIBOBJ([msvc-nothrow])
  fi
  gl_MODULE_INDICATOR([msvc-nothrow])
  gl_MULTIARCH
  gl_HEADER_NETINET_IN
  AC_PROG_MKDIR_P
  gl_FUNC_OPEN
  if test $REPLACE_OPEN = 1; then
    AC_LIBOBJ([open])
    gl_PREREQ_OPEN
  fi
  gl_FCNTL_MODULE_INDICATOR([open])
  gl_FUNC_OPENAT
  if test $HAVE_OPENAT = 0 || test $REPLACE_OPENAT = 1; then
    AC_LIBOBJ([openat])
    gl_PREREQ_OPENAT
  fi
  gl_MODULE_INDICATOR([openat]) dnl for lib/getcwd.c
  gl_FCNTL_MODULE_INDICATOR([openat])
  gl_FUNC_OPENDIR
  if test $HAVE_OPENDIR = 0 || test $REPLACE_OPENDIR = 1; then
    AC_LIBOBJ([opendir])
  fi
  gl_DIRENT_MODULE_INDICATOR([opendir])
  gl_PATHMAX
  gl_FUNC_RAWMEMCHR
  if test $HAVE_RAWMEMCHR = 0; then
    AC_LIBOBJ([rawmemchr])
    gl_PREREQ_RAWMEMCHR
  fi
  gl_STRING_MODULE_INDICATOR([rawmemchr])
  gl_FUNC_READDIR
  if test $HAVE_READDIR = 0; then
    AC_LIBOBJ([readdir])
  fi
  gl_DIRENT_MODULE_INDICATOR([readdir])
  gl_FUNC_READLINK
  if test $HAVE_READLINK = 0 || test $REPLACE_READLINK = 1; then
    AC_LIBOBJ([readlink])
    gl_PREREQ_READLINK
  fi
  gl_UNISTD_MODULE_INDICATOR([readlink])
  gl_FUNC_REALLOC_POSIX
  if test $REPLACE_REALLOC = 1; then
    AC_LIBOBJ([realloc])
  fi
  gl_STDLIB_MODULE_INDICATOR([realloc-posix])
  gl_FUNC_RENAME
  if test $REPLACE_RENAME = 1; then
    AC_LIBOBJ([rename])
  fi
  gl_STDIO_MODULE_INDICATOR([rename])
  gl_FUNC_REWINDDIR
  if test $HAVE_REWINDDIR = 0; then
    AC_LIBOBJ([rewinddir])
  fi
  gl_DIRENT_MODULE_INDICATOR([rewinddir])
  gl_FUNC_RMDIR
  if test $REPLACE_RMDIR = 1; then
    AC_LIBOBJ([rmdir])
  fi
  gl_UNISTD_MODULE_INDICATOR([rmdir])
  gl_SAVE_CWD
  gl_FUNC_SETENV
  if test $HAVE_SETENV = 0 || test $REPLACE_SETENV = 1; then
    AC_LIBOBJ([setenv])
  fi
  gl_STDLIB_MODULE_INDICATOR([setenv])
  gl_FUNC_SETLOCALE_NULL
  if test $SETLOCALE_NULL_ALL_MTSAFE = 0 || test $SETLOCALE_NULL_ONE_MTSAFE = 0; then
    AC_LIBOBJ([setlocale-lock])
    gl_PREREQ_SETLOCALE_LOCK
  fi
  gl_LOCALE_MODULE_INDICATOR([setlocale_null])
  gl_SIGNAL_H
  gl_TYPE_SOCKLEN_T
  gt_TYPE_SSIZE_T
  gl_FUNC_STAT
  if test $REPLACE_STAT = 1; then
    AC_LIBOBJ([stat])
    case "$host_os" in
      mingw*)
        AC_LIBOBJ([stat-w32])
        ;;
    esac
    gl_PREREQ_STAT
  fi
  gl_SYS_STAT_MODULE_INDICATOR([stat])
  gl_STAT_TIME
  gl_STAT_BIRTHTIME
  gl_STDALIGN_H
  AM_STDBOOL_H
  gl_STDDEF_H
  gl_STDINT_H
  gl_STDIO_H
  gl_STDLIB_H
  gl_FUNC_STRCHRNUL
  if test $HAVE_STRCHRNUL = 0 || test $REPLACE_STRCHRNUL = 1; then
    AC_LIBOBJ([strchrnul])
    gl_PREREQ_STRCHRNUL
  fi
  gl_STRING_MODULE_INDICATOR([strchrnul])
  gl_FUNC_STRDUP_POSIX
  if test $ac_cv_func_strdup = no || test $REPLACE_STRDUP = 1; then
    AC_LIBOBJ([strdup])
    gl_PREREQ_STRDUP
  fi
  gl_STRING_MODULE_INDICATOR([strdup])
  gl_FUNC_STRERROR
  if test $REPLACE_STRERROR = 1; then
    AC_LIBOBJ([strerror])
  fi
  gl_MODULE_INDICATOR([strerror])
  gl_STRING_MODULE_INDICATOR([strerror])
  AC_REQUIRE([gl_HEADER_ERRNO_H])
  AC_REQUIRE([gl_FUNC_STRERROR_0])
  if test -n "$ERRNO_H" || test $REPLACE_STRERROR_0 = 1; then
    AC_LIBOBJ([strerror-override])
    gl_PREREQ_SYS_H_WINSOCK2
  fi
  gl_FUNC_STRERROR_R
  if test $HAVE_DECL_STRERROR_R = 0 || test $REPLACE_STRERROR_R = 1; then
    AC_LIBOBJ([strerror_r])
    gl_PREREQ_STRERROR_R
  fi
  gl_STRING_MODULE_INDICATOR([strerror_r])
  dnl For the modules argp, error.
  gl_MODULE_INDICATOR([strerror_r-posix])
  gl_HEADER_STRING_H
  gl_FUNC_STRNLEN
  if test $HAVE_DECL_STRNLEN = 0 || test $REPLACE_STRNLEN = 1; then
    AC_LIBOBJ([strnlen])
    gl_PREREQ_STRNLEN
  fi
  gl_STRING_MODULE_INDICATOR([strnlen])
  gl_FUNC_STRSTR
  if test $REPLACE_STRSTR = 1; then
    AC_LIBOBJ([strstr])
  fi
  gl_FUNC_STRSTR_SIMPLE
  if test $REPLACE_STRSTR = 1; then
    AC_LIBOBJ([strstr])
  fi
  gl_STRING_MODULE_INDICATOR([strstr])
  gl_FUNC_STRTOK_R
  if test $HAVE_STRTOK_R = 0 || test $REPLACE_STRTOK_R = 1; then
    AC_LIBOBJ([strtok_r])
    gl_PREREQ_STRTOK_R
  fi
  gl_STRING_MODULE_INDICATOR([strtok_r])
  gl_HEADER_SYS_RANDOM
  AC_PROG_MKDIR_P
  AC_REQUIRE([gl_HEADER_SYS_SOCKET])
  AC_PROG_MKDIR_P
  gl_HEADER_SYS_STAT_H
  AC_PROG_MKDIR_P
  gl_HEADER_SYS_TIME_H
  AC_PROG_MKDIR_P
  gl_SYS_TYPES_H
  AC_PROG_MKDIR_P
  gl_HEADER_SYS_UIO
  AC_PROG_MKDIR_P
  gl_FUNC_GEN_TEMPNAME
  AC_REQUIRE([gl_THREADLIB])
  gl_HEADER_TIME_H
  gl_TIME_R
  if test $HAVE_LOCALTIME_R = 0 || test $REPLACE_LOCALTIME_R = 1; then
    AC_LIBOBJ([time_r])
    gl_PREREQ_TIME_R
  fi
  gl_TIME_MODULE_INDICATOR([time_r])
  gl_UNISTD_H
  gl_UNISTD_SAFER
  gl_FUNC_UNSETENV
  if test $HAVE_UNSETENV = 0 || test $REPLACE_UNSETENV = 1; then
    AC_LIBOBJ([unsetenv])
    gl_PREREQ_UNSETENV
  fi
  gl_STDLIB_MODULE_INDICATOR([unsetenv])
  gl_WCHAR_H
  gl_WCTYPE_H
  AC_REQUIRE([AC_CANONICAL_HOST])
  case "$host_os" in
    mingw*)
      AC_LIBOBJ([windows-mutex])
      ;;
  esac
  AC_REQUIRE([AC_CANONICAL_HOST])
  case "$host_os" in
    mingw*)
      AC_LIBOBJ([windows-once])
      ;;
  esac
  AC_REQUIRE([AC_CANONICAL_HOST])
  case "$host_os" in
    mingw*)
      AC_LIBOBJ([windows-recmutex])
      ;;
  esac
  AC_REQUIRE([AC_CANONICAL_HOST])
  case "$host_os" in
    mingw*)
      AC_LIBOBJ([windows-rwlock])
      ;;
  esac
  gl_FUNC_WMEMCHR
  if test $HAVE_WMEMCHR = 0; then
    AC_LIBOBJ([wmemchr])
  fi
  gl_WCHAR_MODULE_INDICATOR([wmemchr])
  gl_FUNC_WMEMPCPY
  if test $HAVE_WMEMPCPY = 0; then
    AC_LIBOBJ([wmempcpy])
  fi
  gl_WCHAR_MODULE_INDICATOR([wmempcpy])
  # End of code from modules
  m4_ifval(gl_LIBSOURCES_LIST, [
    m4_syscmd([test ! -d ]m4_defn([gl_LIBSOURCES_DIR])[ ||
      for gl_file in ]gl_LIBSOURCES_LIST[ ; do
        if test ! -r ]m4_defn([gl_LIBSOURCES_DIR])[/$gl_file ; then
          echo "missing file ]m4_defn([gl_LIBSOURCES_DIR])[/$gl_file" >&2
          exit 1
        fi
      done])dnl
      m4_if(m4_sysval, [0], [],
        [AC_FATAL([expected source file, required through AC_LIBSOURCES, not found])])
  ])
  m4_popdef([gl_LIBSOURCES_DIR])
  m4_popdef([gl_LIBSOURCES_LIST])
  m4_popdef([AC_LIBSOURCES])
  m4_popdef([AC_REPLACE_FUNCS])
  m4_popdef([AC_LIBOBJ])
  AC_CONFIG_COMMANDS_PRE([
    gl_libobjs=
    gl_ltlibobjs=
    if test -n "$gl_LIBOBJS"; then
      # Remove the extension.
      sed_drop_objext='s/\.o$//;s/\.obj$//'
      for i in `for i in $gl_LIBOBJS; do echo "$i"; done | sed -e "$sed_drop_objext" | sort | uniq`; do
        gl_libobjs="$gl_libobjs $i.$ac_objext"
        gl_ltlibobjs="$gl_ltlibobjs $i.lo"
      done
    fi
    AC_SUBST([gl_LIBOBJS], [$gl_libobjs])
    AC_SUBST([gl_LTLIBOBJS], [$gl_ltlibobjs])
  ])
  gltests_libdeps=
  gltests_ltlibdeps=
  m4_pushdef([AC_LIBOBJ], m4_defn([gltests_LIBOBJ]))
  m4_pushdef([AC_REPLACE_FUNCS], m4_defn([gltests_REPLACE_FUNCS]))
  m4_pushdef([AC_LIBSOURCES], m4_defn([gltests_LIBSOURCES]))
  m4_pushdef([gltests_LIBSOURCES_LIST], [])
  m4_pushdef([gltests_LIBSOURCES_DIR], [])
  gl_COMMON
  gl_source_base='tests'
changequote(,)dnl
  gltests_WITNESS=IN_`echo "${PACKAGE-$PACKAGE_TARNAME}" | LC_ALL=C tr abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ | LC_ALL=C sed -e 's/[^A-Z0-9_]/_/g'`_GNULIB_TESTS
changequote([, ])dnl
  AC_SUBST([gltests_WITNESS])
  gl_module_indicator_condition=$gltests_WITNESS
  m4_pushdef([gl_MODULE_INDICATOR_CONDITION], [$gl_module_indicator_condition])
  m4_popdef([gl_MODULE_INDICATOR_CONDITION])
  m4_ifval(gltests_LIBSOURCES_LIST, [
    m4_syscmd([test ! -d ]m4_defn([gltests_LIBSOURCES_DIR])[ ||
      for gl_file in ]gltests_LIBSOURCES_LIST[ ; do
        if test ! -r ]m4_defn([gltests_LIBSOURCES_DIR])[/$gl_file ; then
          echo "missing file ]m4_defn([gltests_LIBSOURCES_DIR])[/$gl_file" >&2
          exit 1
        fi
      done])dnl
      m4_if(m4_sysval, [0], [],
        [AC_FATAL([expected source file, required through AC_LIBSOURCES, not found])])
  ])
  m4_popdef([gltests_LIBSOURCES_DIR])
  m4_popdef([gltests_LIBSOURCES_LIST])
  m4_popdef([AC_LIBSOURCES])
  m4_popdef([AC_REPLACE_FUNCS])
  m4_popdef([AC_LIBOBJ])
  AC_CONFIG_COMMANDS_PRE([
    gltests_libobjs=
    gltests_ltlibobjs=
    if test -n "$gltests_LIBOBJS"; then
      # Remove the extension.
      sed_drop_objext='s/\.o$//;s/\.obj$//'
      for i in `for i in $gltests_LIBOBJS; do echo "$i"; done | sed -e "$sed_drop_objext" | sort | uniq`; do
        gltests_libobjs="$gltests_libobjs $i.$ac_objext"
        gltests_ltlibobjs="$gltests_ltlibobjs $i.lo"
      done
    fi
    AC_SUBST([gltests_LIBOBJS], [$gltests_libobjs])
    AC_SUBST([gltests_LTLIBOBJS], [$gltests_ltlibobjs])
  ])
  LIBGNU_LIBDEPS="$gl_libdeps"
  AC_SUBST([LIBGNU_LIBDEPS])
  LIBGNU_LTLIBDEPS="$gl_ltlibdeps"
  AC_SUBST([LIBGNU_LTLIBDEPS])
])

# Like AC_LIBOBJ, except that the module name goes
# into gl_LIBOBJS instead of into LIBOBJS.
AC_DEFUN([gl_LIBOBJ], [
  AS_LITERAL_IF([$1], [gl_LIBSOURCES([$1.c])])dnl
  gl_LIBOBJS="$gl_LIBOBJS $1.$ac_objext"
])

# Like AC_REPLACE_FUNCS, except that the module name goes
# into gl_LIBOBJS instead of into LIBOBJS.
AC_DEFUN([gl_REPLACE_FUNCS], [
  m4_foreach_w([gl_NAME], [$1], [AC_LIBSOURCES(gl_NAME[.c])])dnl
  AC_CHECK_FUNCS([$1], , [gl_LIBOBJ($ac_func)])
])

# Like AC_LIBSOURCES, except the directory where the source file is
# expected is derived from the gnulib-tool parameterization,
# and alloca is special cased (for the alloca-opt module).
# We could also entirely rely on EXTRA_lib..._SOURCES.
AC_DEFUN([gl_LIBSOURCES], [
  m4_foreach([_gl_NAME], [$1], [
    m4_if(_gl_NAME, [alloca.c], [], [
      m4_define([gl_LIBSOURCES_DIR], [import])
      m4_append([gl_LIBSOURCES_LIST], _gl_NAME, [ ])
    ])
  ])
])

# Like AC_LIBOBJ, except that the module name goes
# into gltests_LIBOBJS instead of into LIBOBJS.
AC_DEFUN([gltests_LIBOBJ], [
  AS_LITERAL_IF([$1], [gltests_LIBSOURCES([$1.c])])dnl
  gltests_LIBOBJS="$gltests_LIBOBJS $1.$ac_objext"
])

# Like AC_REPLACE_FUNCS, except that the module name goes
# into gltests_LIBOBJS instead of into LIBOBJS.
AC_DEFUN([gltests_REPLACE_FUNCS], [
  m4_foreach_w([gl_NAME], [$1], [AC_LIBSOURCES(gl_NAME[.c])])dnl
  AC_CHECK_FUNCS([$1], , [gltests_LIBOBJ($ac_func)])
])

# Like AC_LIBSOURCES, except the directory where the source file is
# expected is derived from the gnulib-tool parameterization,
# and alloca is special cased (for the alloca-opt module).
# We could also entirely rely on EXTRA_lib..._SOURCES.
AC_DEFUN([gltests_LIBSOURCES], [
  m4_foreach([_gl_NAME], [$1], [
    m4_if(_gl_NAME, [alloca.c], [], [
      m4_define([gltests_LIBSOURCES_DIR], [tests])
      m4_append([gltests_LIBSOURCES_LIST], _gl_NAME, [ ])
    ])
  ])
])

# This macro records the list of files which have been installed by
# gnulib-tool and may be removed by future gnulib-tool invocations.
AC_DEFUN([gl_FILE_LIST], [
  build-aux/update-copyright
  lib/_Noreturn.h
  lib/alloca.c
  lib/alloca.in.h
  lib/arg-nonnull.h
  lib/arpa_inet.in.h
  lib/assure.h
  lib/at-func.c
  lib/attribute.h
  lib/basename-lgpl.c
  lib/btowc.c
  lib/c++defs.h
  lib/canonicalize-lgpl.c
  lib/cdefs.h
  lib/chdir-long.c
  lib/chdir-long.h
  lib/cloexec.c
  lib/cloexec.h
  lib/close.c
  lib/closedir.c
  lib/count-one-bits.c
  lib/count-one-bits.h
  lib/ctype.in.h
  lib/dirent-private.h
  lib/dirent.in.h
  lib/dirfd.c
  lib/dirname-lgpl.c
  lib/dirname.h
  lib/dup-safer-flag.c
  lib/dup-safer.c
  lib/dup.c
  lib/dup2.c
  lib/errno.in.h
  lib/error.c
  lib/error.h
  lib/exitfail.c
  lib/exitfail.h
  lib/fchdir.c
  lib/fcntl.c
  lib/fcntl.in.h
  lib/fd-hook.c
  lib/fd-hook.h
  lib/fd-safer-flag.c
  lib/fd-safer.c
  lib/fdopendir.c
  lib/filename.h
  lib/filenamecat-lgpl.c
  lib/filenamecat.h
  lib/flexmember.h
  lib/float+.h
  lib/float.c
  lib/float.in.h
  lib/fnmatch.c
  lib/fnmatch.in.h
  lib/fnmatch_loop.c
  lib/fpucw.h
  lib/frexp.c
  lib/frexpl.c
  lib/fstat.c
  lib/fstatat.c
  lib/getcwd-lgpl.c
  lib/getcwd.c
  lib/getdtablesize.c
  lib/getlogin_r.c
  lib/getprogname.c
  lib/getprogname.h
  lib/getrandom.c
  lib/gettext.h
  lib/gettimeofday.c
  lib/glob-libc.h
  lib/glob.c
  lib/glob.in.h
  lib/glob_internal.h
  lib/glob_pattern_p.c
  lib/globfree.c
  lib/glthread/lock.c
  lib/glthread/lock.h
  lib/glthread/threadlib.c
  lib/hard-locale.c
  lib/hard-locale.h
  lib/inet_ntop.c
  lib/intprops.h
  lib/inttypes.in.h
  lib/isblank.c
  lib/isnan.c
  lib/isnand-nolibm.h
  lib/isnand.c
  lib/isnanl-nolibm.h
  lib/isnanl.c
  lib/itold.c
  lib/lc-charset-dispatch.c
  lib/lc-charset-dispatch.h
  lib/libc-config.h
  lib/limits.in.h
  lib/localcharset.c
  lib/localcharset.h
  lib/locale.in.h
  lib/localtime-buffer.c
  lib/localtime-buffer.h
  lib/lstat.c
  lib/malloc.c
  lib/malloc/scratch_buffer.h
  lib/malloc/scratch_buffer_grow.c
  lib/malloc/scratch_buffer_grow_preserve.c
  lib/malloc/scratch_buffer_set_array_size.c
  lib/malloca.c
  lib/malloca.h
  lib/math.c
  lib/math.in.h
  lib/mbrtowc-impl-utf8.h
  lib/mbrtowc-impl.h
  lib/mbrtowc.c
  lib/mbsinit.c
  lib/mbsrtowcs-impl.h
  lib/mbsrtowcs-state.c
  lib/mbsrtowcs.c
  lib/mbtowc-impl.h
  lib/mbtowc-lock.c
  lib/mbtowc-lock.h
  lib/mbtowc.c
  lib/memchr.c
  lib/memchr.valgrind
  lib/memmem.c
  lib/mempcpy.c
  lib/memrchr.c
  lib/minmax.h
  lib/mkdir.c
  lib/mkdtemp.c
  lib/mkostemp.c
  lib/msvc-inval.c
  lib/msvc-inval.h
  lib/msvc-nothrow.c
  lib/msvc-nothrow.h
  lib/netinet_in.in.h
  lib/open.c
  lib/openat-die.c
  lib/openat-priv.h
  lib/openat-proc.c
  lib/openat.c
  lib/openat.h
  lib/opendir.c
  lib/pathmax.h
  lib/pipe-safer.c
  lib/rawmemchr.c
  lib/rawmemchr.valgrind
  lib/readdir.c
  lib/readlink.c
  lib/realloc.c
  lib/rename.c
  lib/rewinddir.c
  lib/rmdir.c
  lib/same-inode.h
  lib/save-cwd.c
  lib/save-cwd.h
  lib/scratch_buffer.h
  lib/setenv.c
  lib/setlocale-lock.c
  lib/setlocale_null.c
  lib/setlocale_null.h
  lib/signal.in.h
  lib/stat-time.c
  lib/stat-time.h
  lib/stat-w32.c
  lib/stat-w32.h
  lib/stat.c
  lib/stdalign.in.h
  lib/stdbool.in.h
  lib/stddef.in.h
  lib/stdint.in.h
  lib/stdio.in.h
  lib/stdlib.in.h
  lib/str-two-way.h
  lib/strchrnul.c
  lib/strchrnul.valgrind
  lib/strdup.c
  lib/streq.h
  lib/strerror-override.c
  lib/strerror-override.h
  lib/strerror.c
  lib/strerror_r.c
  lib/string.in.h
  lib/stripslash.c
  lib/strnlen.c
  lib/strnlen1.c
  lib/strnlen1.h
  lib/strstr.c
  lib/strtok_r.c
  lib/sys_random.in.h
  lib/sys_socket.c
  lib/sys_socket.in.h
  lib/sys_stat.in.h
  lib/sys_time.in.h
  lib/sys_types.in.h
  lib/sys_uio.in.h
  lib/tempname.c
  lib/tempname.h
  lib/time.in.h
  lib/time_r.c
  lib/unistd--.h
  lib/unistd-safer.h
  lib/unistd.c
  lib/unistd.in.h
  lib/unsetenv.c
  lib/verify.h
  lib/warn-on-use.h
  lib/wchar.in.h
  lib/wctype-h.c
  lib/wctype.in.h
  lib/windows-initguard.h
  lib/windows-mutex.c
  lib/windows-mutex.h
  lib/windows-once.c
  lib/windows-once.h
  lib/windows-recmutex.c
  lib/windows-recmutex.h
  lib/windows-rwlock.c
  lib/windows-rwlock.h
  lib/wmemchr-impl.h
  lib/wmemchr.c
  lib/wmempcpy.c
  lib/xalloc-oversized.h
  m4/00gnulib.m4
  m4/__inline.m4
  m4/absolute-header.m4
  m4/alloca.m4
  m4/arpa_inet_h.m4
  m4/btowc.m4
  m4/builtin-expect.m4
  m4/canonicalize.m4
  m4/chdir-long.m4
  m4/close.m4
  m4/closedir.m4
  m4/codeset.m4
  m4/ctype.m4
  m4/d-ino.m4
  m4/d-type.m4
  m4/dirent_h.m4
  m4/dirfd.m4
  m4/dirname.m4
  m4/double-slash-root.m4
  m4/dup.m4
  m4/dup2.m4
  m4/eealloc.m4
  m4/environ.m4
  m4/errno_h.m4
  m4/error.m4
  m4/exponentd.m4
  m4/exponentl.m4
  m4/extensions.m4
  m4/extern-inline.m4
  m4/fchdir.m4
  m4/fcntl-o.m4
  m4/fcntl.m4
  m4/fcntl_h.m4
  m4/fdopendir.m4
  m4/filenamecat.m4
  m4/flexmember.m4
  m4/float_h.m4
  m4/fnmatch.m4
  m4/fnmatch_h.m4
  m4/fpieee.m4
  m4/frexp.m4
  m4/frexpl.m4
  m4/fstat.m4
  m4/fstatat.m4
  m4/getcwd-abort-bug.m4
  m4/getcwd-path-max.m4
  m4/getcwd.m4
  m4/getdtablesize.m4
  m4/getlogin.m4
  m4/getlogin_r.m4
  m4/getpagesize.m4
  m4/getprogname.m4
  m4/getrandom.m4
  m4/gettimeofday.m4
  m4/glob.m4
  m4/glob_h.m4
  m4/gnulib-common.m4
  m4/include_next.m4
  m4/inet_ntop.m4
  m4/inttypes-pri.m4
  m4/inttypes.m4
  m4/isblank.m4
  m4/isnand.m4
  m4/isnanl.m4
  m4/largefile.m4
  m4/limits-h.m4
  m4/localcharset.m4
  m4/locale-fr.m4
  m4/locale-ja.m4
  m4/locale-zh.m4
  m4/locale_h.m4
  m4/localtime-buffer.m4
  m4/lock.m4
  m4/lstat.m4
  m4/malloc.m4
  m4/malloca.m4
  m4/math_h.m4
  m4/mbrtowc.m4
  m4/mbsinit.m4
  m4/mbsrtowcs.m4
  m4/mbstate_t.m4
  m4/mbtowc.m4
  m4/memchr.m4
  m4/memmem.m4
  m4/mempcpy.m4
  m4/memrchr.m4
  m4/minmax.m4
  m4/mkdir.m4
  m4/mkdtemp.m4
  m4/mkostemp.m4
  m4/mmap-anon.m4
  m4/mode_t.m4
  m4/msvc-inval.m4
  m4/msvc-nothrow.m4
  m4/multiarch.m4
  m4/netinet_in_h.m4
  m4/nocrash.m4
  m4/off_t.m4
  m4/open-cloexec.m4
  m4/open-slash.m4
  m4/open.m4
  m4/openat.m4
  m4/opendir.m4
  m4/pathmax.m4
  m4/pthread_rwlock_rdlock.m4
  m4/rawmemchr.m4
  m4/readdir.m4
  m4/readlink.m4
  m4/realloc.m4
  m4/rename.m4
  m4/rewinddir.m4
  m4/rmdir.m4
  m4/save-cwd.m4
  m4/setenv.m4
  m4/setlocale_null.m4
  m4/signal_h.m4
  m4/socklen.m4
  m4/sockpfaf.m4
  m4/ssize_t.m4
  m4/stat-time.m4
  m4/stat.m4
  m4/std-gnu11.m4
  m4/stdalign.m4
  m4/stdbool.m4
  m4/stddef_h.m4
  m4/stdint.m4
  m4/stdio_h.m4
  m4/stdlib_h.m4
  m4/strchrnul.m4
  m4/strdup.m4
  m4/strerror.m4
  m4/strerror_r.m4
  m4/string_h.m4
  m4/strnlen.m4
  m4/strstr.m4
  m4/strtok_r.m4
  m4/sys_random_h.m4
  m4/sys_socket_h.m4
  m4/sys_stat_h.m4
  m4/sys_time_h.m4
  m4/sys_types_h.m4
  m4/sys_uio_h.m4
  m4/tempname.m4
  m4/threadlib.m4
  m4/time_h.m4
  m4/time_r.m4
  m4/unistd-safer.m4
  m4/unistd_h.m4
  m4/visibility.m4
  m4/warn-on-use.m4
  m4/wchar_h.m4
  m4/wchar_t.m4
  m4/wctype_h.m4
  m4/wint_t.m4
  m4/wmemchr.m4
  m4/wmempcpy.m4
  m4/zzgnulib.m4
])
