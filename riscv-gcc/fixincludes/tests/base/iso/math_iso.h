/*  DO NOT EDIT THIS FILE.

    It has been auto-edited by fixincludes from:

	"fixinc/tests/inc/iso/math_iso.h"

    This had to be done to correct non-standard usages in the
    original, manufacturer supplied header file.  */



#if defined( SOLARIS_POW_INT_OVERLOAD_CHECK )
#if __cplusplus < 201103L
	inline long double pow(long double __X, int __Y) { return
		__powl(__X, (long double) (__Y)); }
#endif
#endif  /* SOLARIS_POW_INT_OVERLOAD_CHECK */
