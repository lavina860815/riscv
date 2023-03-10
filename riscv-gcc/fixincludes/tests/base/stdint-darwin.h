/*  DO NOT EDIT THIS FILE.

    It has been auto-edited by fixincludes from:

	"fixinc/tests/inc/stdint-darwin.h"

    This had to be done to correct non-standard usages in the
    original, manufacturer supplied header file.  */



#if defined( DARWIN_STDINT_1_CHECK )
#define UINT8_C(v)	v
#define UINT16_C(v)	v
#endif  /* DARWIN_STDINT_1_CHECK */


#if defined( DARWIN_STDINT_2_CHECK )
#if __WORDSIZE == 64
#define INTPTR_MAX 9223372036854775807L
#define INTPTR_MIN (-INTPTR_MAX-1)
#else
#define INTPTR_MAX 2147483647L
#define INTPTR_MIN (-INTPTR_MAX-1)
#endif
#endif  /* DARWIN_STDINT_2_CHECK */


#if defined( DARWIN_STDINT_3_CHECK )
#if __WORDSIZE == 64
#define UINTPTR_MAX 18446744073709551615UL
#else
#define UINTPTR_MAX 4294967295UL
#endif
#endif  /* DARWIN_STDINT_3_CHECK */


#if defined( DARWIN_STDINT_4_CHECK )
#if __WORDSIZE == 64
#define SIZE_MAX 18446744073709551615UL
#else
#define SIZE_MAX 4294967295UL
#endif
#endif  /* DARWIN_STDINT_4_CHECK */


#if defined( DARWIN_STDINT_5_CHECK )
#if __WORDSIZE == 64
#define INTMAX_MIN   (-9223372036854775807L - 1)
#define INTMAX_MAX   9223372036854775807L
#define UINTMAX_MAX  18446744073709551615UL
#else
#define INTMAX_MIN   (-9223372036854775807LL - 1)
#define INTMAX_MAX   9223372036854775807LL
#define UINTMAX_MAX  18446744073709551615ULL
#endif
#endif  /* DARWIN_STDINT_5_CHECK */


#if defined( DARWIN_STDINT_6_CHECK )
#if __WORDSIZE == 64
#define PTRDIFF_MIN (-9223372036854775807L - 1)
#define PTRDIFF_MAX 9223372036854775807L
#else
#define PTRDIFF_MIN (-2147483647 - 1)
#define PTRDIFF_MAX 2147483647
#endif
#endif  /* DARWIN_STDINT_6_CHECK */


#if defined( DARWIN_STDINT_7_CHECK )
#if __WORDSIZE == 64
#define INTMAX_C(v)  (v ## L)
#define UINTMAX_C(v) (v ## UL)
#else
#define INTMAX_C(v)  (v ## LL)
#define UINTMAX_C(v) (v ## ULL)
#endif
#endif  /* DARWIN_STDINT_7_CHECK */
