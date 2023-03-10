/* { dg-do compile } */
/* { dg-options "-O2 -msha" } */
/* { dg-final { scan-assembler "sha256msg1\[ \\t\]+\[^\n\]*%xmm\[0-9\]" } } */

#include <immintrin.h>

volatile __m128i x;

void extern
sha_test (void)
{
  x = _mm_sha256msg1_epu32 (x, x);
}
