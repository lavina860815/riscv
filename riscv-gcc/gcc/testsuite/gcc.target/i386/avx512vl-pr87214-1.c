/* PR target/87214 */
/* { dg-do run { target { avx512vl } } } */
/* { dg-options "-O3 -mavx512vl -mtune=skylake-avx512" } */

#define AVX512VL
#define AVX512F_LEN 512
#define AVX512F_LEN_HALF 256
#include "avx512f-check.h"

struct s { unsigned long a, b, c; };

void __attribute__ ((noipa))
foo (struct s *restrict s1, struct s *restrict s2, int n)
{
  for (int i = 0; i < n; ++i)
    {
      s1[i].b = s2[i].b;
      s1[i].c = s2[i].c;
      s2[i].c = 0;
    }
}
                            
#define N 12

static void
test_256 (void)
{
  struct s s1[N], s2[N];
  for (unsigned int j = 0; j < N; ++j)
    {
      s2[j].a = j * 5;
      s2[j].b = j * 5 + 2;
      s2[j].c = j * 5 + 4;
    }
  foo (s1, s2, N);
  for (unsigned int j = 0; j < N; ++j)
  if (s1[j].b != j * 5 + 2)
    __builtin_abort ();
}

static void
test_128 (void)
{
}
