/* { dg-do compile } */
/* { dg-options "-mavx2 -O2" } */
/* { dg-final { scan-assembler "vpbroadcastd\[ \\t\]+\[^\n\]*%xmm\[0-9\]" } } */

#include <immintrin.h>

__m128i x;

void extern
avx2_test (void)
{
  x = _mm_broadcastd_epi32 (x);
}
