/* { dg-do run } */
/* { dg-options "-O2 -mavx512f" } */
/* { dg-require-effective-target avx512f } */

#define AVX512F

#include "avx512f-helper.h"

#define SIZE (AVX512F_LEN / 64)
#include "avx512f-mask-type.h"

static void
CALC (double *r, double *s1, double *s2, MASK_TYPE mask)
{
  int i;
  for (i = 0; i < SIZE; i++)
    {
      r[i] = (mask & (1LL << i)) ? s2[i] : s1[i];
    }
}

void
TEST (void)
{
  int i, sign;
  UNION_TYPE (AVX512F_LEN, d) res1, src1, src2;
  MASK_TYPE mask = MASK_VALUE;
  double res_ref[SIZE];

  sign = -1;
  for (i = 0; i < SIZE; i++)
    {
      src1.a[i] = 1.5 + 34.67 * i * sign;
      src2.a[i] = -22.17 * i * sign;
      sign = sign * -1;
    }

  res1.x = INTRINSIC (_mask_blend_pd) (mask, src1.x, src2.x);

  CALC (res_ref, src1.a, src2.a, mask);

  if (UNION_CHECK (AVX512F_LEN, d) (res1, res_ref))
    abort ();
}
