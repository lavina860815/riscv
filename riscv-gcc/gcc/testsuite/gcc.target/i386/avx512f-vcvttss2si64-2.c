/* { dg-do run { target { ! ia32 } } } */
/* { dg-options "-mavx512f -O2" } */
/* { dg-require-effective-target avx512f } */

#include "avx512f-check.h"
#include "avx512f-mask-type.h"
#include "avx512f-helper.h"

static int
__attribute__ ((noinline, unused))
test (__m128 x)
{
  return _mm_cvttss_i64 (x);
}

static void
avx512f_test (void)
{
  union128 s1;
  long long res, res_ref;

  s1.x = _mm_set_ps (24.43, 68.346, 43.35, 546.46);
  res = test (s1.x);
  res_ref = (long long) s1.a[0];

  if (res != res_ref)
    abort ();
}
