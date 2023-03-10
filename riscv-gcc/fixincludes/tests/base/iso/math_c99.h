/*  DO NOT EDIT THIS FILE.

    It has been auto-edited by fixincludes from:

	"fixinc/tests/inc/iso/math_c99.h"

    This had to be done to correct non-standard usages in the
    original, manufacturer supplied header file.  */



#if defined( SOLARIS_MATH_1_CHECK )
#ident	"@(#)math_c99.h	1.9	04/11/01 SMI"
#undef	HUGE_VAL
#define	HUGE_VAL	(__builtin_huge_val())
#undef	HUGE_VALF
#define	HUGE_VALF	(__builtin_huge_valf())
#undef	HUGE_VALL
#define	HUGE_VALL	(__builtin_huge_vall())
#endif  /* SOLARIS_MATH_1_CHECK */


#if defined( SOLARIS_MATH_10_CHECK )
#pragma ident	"@(#)math_c99.h	1.12	07/01/21 SMI"
#undef	isinf
#define	isinf(x) __builtin_isinf(x)
#endif  /* SOLARIS_MATH_10_CHECK */


#if defined( SOLARIS_MATH_2_CHECK )
#ident	"@(#)math_c99.h	1.9	04/11/01 SMI"
#undef	INFINITY
#define	INFINITY	(__builtin_inff())
#endif  /* SOLARIS_MATH_2_CHECK */


#if defined( SOLARIS_MATH_3_CHECK )
#ident	"@(#)math_c99.h	1.9	04/11/01 SMI"
#undef	NAN
#define	NAN		(__builtin_nanf(""))
#endif  /* SOLARIS_MATH_3_CHECK */


#if defined( SOLARIS_MATH_4_CHECK )
#ident	"@(#)math_c99.h	1.9	04/11/01 SMI"
#undef	fpclassify
#define	fpclassify(x) \
  __builtin_fpclassify(FP_NAN, FP_INFINITE, FP_NORMAL, FP_SUBNORMAL, FP_ZERO, (x))
#endif  /* SOLARIS_MATH_4_CHECK */


#if defined( SOLARIS_MATH_8_CHECK )
#ident	"@(#)math_c99.h	1.9	04/11/01 SMI"
#undef	signbit
#define	signbit(x)	(sizeof(x) == sizeof(float) \
			   ? __builtin_signbitf(x) \
			   : sizeof(x) == sizeof(long double) \
			     ? __builtin_signbitl(x) \
			     : __builtin_signbit(x))
#endif  /* SOLARIS_MATH_8_CHECK */


#if defined( SOLARIS_MATH_9_CHECK )
#ident	"@(#)math_c99.h	1.9	04/11/01 SMI"
#undef	isgreater
#define	isgreater(x, y)		__builtin_isgreater(x, y)
#undef	isgreaterequal
#define	isgreaterequal(x, y)	__builtin_isgreaterequal(x, y)
#undef	isless
#define	isless(x, y)		__builtin_isless(x, y)
#undef	islessequal
#define	islessequal(x, y)	__builtin_islessequal(x, y)
#undef	islessgreater
#define	islessgreater(x, y)	__builtin_islessgreater(x, y)
#undef	isunordered
#define	isunordered(x, y)	__builtin_isunordered(x, y)
#endif  /* SOLARIS_MATH_9_CHECK */


#if defined( SOLARIS_MATH_11_CHECK )
/* @(#)math_c99.h	1.14	13/03/27 */
#undef	signbit
#define	signbit(x)	(sizeof(x) == sizeof(float) \
			   ? __builtin_signbitf(x) \
			   : sizeof(x) == sizeof(long double) \
			     ? __builtin_signbitl(x) \
			     : __builtin_signbit(x))
#endif  /* SOLARIS_MATH_11_CHECK */
