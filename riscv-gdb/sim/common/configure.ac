dnl Process this file with autoconf to produce a configure script.
AC_INIT(Makefile.in)

AC_PROG_CC

# Put a useful copy of CPP_FOR_TARGET in Makefile.
# This is only used to build the target values header files.  These files are
# shipped with distributions so CPP_FOR_TARGET only needs to work in
# developer's trees.  This value is borrowed from ../../Makefile.in.
CPP_FOR_TARGET="\` \
  if test -f \$\${rootme}/../../gcc/Makefile ; then \
    if test -f \$\${rootme}/../../\$(TARGET_SUBDIR)/newlib/Makefile ; then \
      echo \$\${rootme}/../../gcc/xgcc -B\$\${rootme}/../../gcc/ -idirafter \$\${rootme}/../../\$(TARGET_SUBDIR)/newlib/targ-include -idirafter \$(srcroot)/newlib/libc/include -nostdinc; \
    else \
      echo \$\${rootme}/../../gcc/xgcc -B\$\${rootme}/../../gcc/; \
    fi; \
  else \
    if test '\$(host_canonical)' = '\$(target_canonical)' ; then \
      echo \$(CC); \
    else \
      t='\$(program_transform_name)'; echo gcc | sed -e 's/x/x/' \$\$t; \
    fi; \
  fi\` -E"
AC_SUBST(CPP_FOR_TARGET)

# Set TARGET_SUBDIR, needed by CPP_FOR_TARGET.
if test x"${host}" = x"${target}" ; then
	TARGET_SUBDIR="."
else
	TARGET_SUBDIR=${target_alias}
fi
AC_SUBST(TARGET_SUBDIR)

AC_OUTPUT(Makefile)
