/* { dg-do compile } */
/* { dg-options "-mavx2 -O2" } */
/* { dg-final { scan-assembler "vpmulhrsw\[ \\t\]+\[^\n\]*%ymm\[0-9\]" } } */

#include <immintrin.h>

volatile __m256i x;

void extern
avx2_test (void)
{
  x = _mm256_mulhrs_epi16 (x, x);
}
