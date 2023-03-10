/* { dg-do compile } */
/* { dg-options "-mavx2 -O3" } */
/* { dg-final { scan-assembler "vpslld\[ \\t\]+\[^\n\]*\\$\[0-9\]" } } */

#include <immintrin.h>

volatile __m256i x;

void extern
avx2_test (void)
{
  x = _mm256_slli_epi32 (x, 13);
}
