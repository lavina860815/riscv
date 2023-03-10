/* { dg-do run } */
/* { dg-options "-O2 -mavx512f" } */
/* { dg-require-effective-target avx512f } */

#define AVX512F

#include "avx512f-helper.h"

#define SIZE (AVX512F_LEN / 64)
#include "avx512f-mask-type.h"
#include <limits.h>

void 
CALC (short *r, long long *s, int mem)
{
  int i;
  int len = mem ? SIZE : 8;
  for (i = 0; i < len; i++)
    {
      if (s[i] < SHRT_MIN)
	r[i] = SHRT_MIN;
      else if (s[i] > SHRT_MAX)
	r[i] = SHRT_MAX;
      else
	r[i] = s[i];
      r[i] = (i < SIZE) ? r[i] : 0;
    }
}

void
TEST (void)
{
  int i, sign;
  UNION_TYPE (128, i_w) res1, res2, res3;
  short res4[8];
  UNION_TYPE (AVX512F_LEN, i_q) src;
  MASK_TYPE mask = MASK_VALUE;
  short res_ref[8];
  short res_ref2[8];

  sign = -1;
  for (i = 0; i < SIZE; i++)
    {
      src.a[i] = 1 + 34 * i * sign;
      sign = sign * -1;
      res2.a[i] = DEFAULT_VALUE;
      res4[i] = DEFAULT_VALUE;
    }

  for (i = SIZE; i < 8; i++)
    {
      res_ref2[i] = DEFAULT_VALUE * 2;
      res4[i] = DEFAULT_VALUE * 2;
    }

  res1.x = INTRINSIC (_cvtsepi64_epi16) (src.x);
  res2.x = INTRINSIC (_mask_cvtsepi64_epi16) (res2.x, mask, src.x);
  res3.x = INTRINSIC (_maskz_cvtsepi64_epi16) (mask, src.x);

  CALC (res_ref, src.a, 0);

  if (UNION_CHECK (128, i_w) (res1, res_ref))
    abort ();

  MASK_MERGE (i_w) (res_ref, mask, SIZE);
  if (UNION_CHECK (128, i_w) (res2, res_ref))
    abort ();

  MASK_ZERO (i_w) (res_ref, mask, SIZE);
  if (UNION_CHECK (128, i_w) (res3, res_ref))
    abort ();

  INTRINSIC (_mask_cvtsepi64_storeu_epi16) (res4, mask, src.x);
  CALC (res_ref2, src.a, 1);

  MASK_MERGE (i_w) (res_ref2, mask, SIZE);
  if (checkVs (res4, res_ref2, 8))
    abort ();
}
