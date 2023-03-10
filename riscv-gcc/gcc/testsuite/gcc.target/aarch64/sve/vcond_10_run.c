/* { dg-do run { target aarch64_sve_hw } } */
/* { dg-options "-O2 -ftree-vectorize -march=armv8-a+sve" } */

#include "vcond_10.c"

#define N 133

#define TEST_LOOP(TYPE)							\
  {									\
    TYPE a[N];								\
    for (int i = 0; i < N; ++i)						\
      a[i] = i % 7;							\
    test_##TYPE (a, 10, 11, 12, 13, N);					\
    for (int i = 0; i < N; ++i)						\
      if (a[i] != 10 + (i & 1) * 2 + (i % 7 == 0 || i % 7 == 3))	\
	__builtin_abort ();						\
  }

int
main (void)
{
  FOR_EACH_TYPE (TEST_LOOP);
  return 0;
}
