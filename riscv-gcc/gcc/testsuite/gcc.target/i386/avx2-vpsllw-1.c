/* { dg-do compile } */
/* { dg-options "-mavx2 -O2" } */
/* { dg-final { scan-assembler "vpsllw\[ \\t\]+\[^\n\]*%xmm\[0-9\]" } } */

#include <immintrin.h>

volatile __m256i x;
__m128i y;

void extern
avx2_test (void)
{
  x = _mm256_sll_epi16 (x, y);
}
