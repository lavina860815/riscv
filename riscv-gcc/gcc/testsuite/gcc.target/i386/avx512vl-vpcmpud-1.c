/* { dg-do compile } */
/* { dg-options "-O2 -mavx512vl" } */
/* { dg-final { scan-assembler-times "vpcmpud\[ \\t\]+\[^\{\n\]*%ymm\[0-9\]+\[^\n^k\]*%k\[0-7\](?:\n|\[ \\t\]+#)" 1 } } */
/* { dg-final { scan-assembler-times "vpcmpud\[ \\t\]+\[^\{\n\]*%ymm\[0-9\]+\[^\n^k\]*%k\[0-7\]\{%k\[1-7\]\}(?:\n|\[ \\t\]+#)" 1 } } */
/* { dg-final { scan-assembler-times "vpcmpud\[ \\t\]+\[^\{\n\]*%xmm\[0-9\]+\[^\n^k\]*%k\[0-7\](?:\n|\[ \\t\]+#)" 1 } } */
/* { dg-final { scan-assembler-times "vpcmpud\[ \\t\]+\[^\{\n\]*%xmm\[0-9\]+\[^\n^k\]*%k\[0-7\]\{%k\[1-7\]\}(?:\n|\[ \\t\]+#)" 1 } } */

#include <immintrin.h>

volatile __m256i x;
volatile __m128i xx;
volatile __mmask8 m;

void extern
avx512vl_test (void)
{
  m = _mm256_cmp_epu32_mask (x, x, _MM_CMPINT_LE);
  m = _mm256_mask_cmp_epu32_mask (m, x, x, _MM_CMPINT_UNUSED);
  m = _mm_cmp_epu32_mask (xx, xx, _MM_CMPINT_NE);
  m = _mm_mask_cmp_epu32_mask (m, xx, xx, _MM_CMPINT_NLT);
}
