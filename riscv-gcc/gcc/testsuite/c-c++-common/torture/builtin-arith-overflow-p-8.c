/* Test __builtin_{add,sub}_overflow_p on {,un}signed short.  */
/* { dg-do run } */
/* { dg-skip-if "" { ! run_expensive_tests }  { "*" } { "-O0" "-O2" } } */

typedef signed short int S;
typedef unsigned short int U;
#define COND 1
#define SHIFT ((__SIZEOF_SHORT__ - 1) * __CHAR_BIT__)
#define S_MAX __SHRT_MAX__
#define S_MIN (-__SHRT_MAX__ - 1)
#if __SIZEOF_INT__ > __SIZEOF_SHORT__
typedef int W;
#elif __SIZEOF_LONG__ > __SIZEOF_SHORT__
typedef long int W;
#elif __SIZEOF_LONG_LONG__ > __SIZEOF_SHORT__
typedef long long int W;
#elif __SIZEOF_INT128__ > __SIZEOF_SHORT__
typedef __int128 W;
#else
#undef COND
#define COND 0
#endif
#include "builtin-arith-overflow-p-7.c"
