/* { dg-do run } */
/* { dg-require-effective-target sse4 } */
/* { dg-options "-O2 -msse4.1" } */

#include "sse4_1-check.h"

#ifdef DEBUG
#include <stdio.h>
#endif

#include <xmmintrin.h>

static void
__attribute__((noinline))
test (float *v)
{
  union
    {
      __m128 x;
      float f[4];
    } u;
  unsigned int i;
  
  u.x = _mm_set_ps (v[3], v[2], v[1], v[0]);

  for (i = 0; i < sizeof (u) / sizeof (v[0]); i++)
    if (v[i] != u.f[i])
      {
#ifdef DEBUG
	printf ("%i: %f != %f\n", i, v[i], u.f[i]);
#endif
	abort ();
      }
}

static void
sse4_1_test (void)
{
  float v[4] = { -3, 2, 1, 9 };
  test (v);
}
