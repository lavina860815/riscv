/* { dg-do compile } */
/* { dg-options "-mavx512bw -O2" } */
/* { dg-final { scan-assembler-times "kshiftrd\[ \\t\]+\[^\{\n\]*%k\[0-7\](?:\n|\[ \\t\]+#)" 1 } } */

#include <immintrin.h>

void
avx512bw_test ()
{
  __mmask32 k1, k2;
  unsigned int i = 5;
  volatile __m512i x = _mm512_setzero_si512 ();

  __asm__( "kmovd %1, %0" : "=k" (k1) : "r" (1) );

  k2 = _kshiftri_mask32 (k1, i);
  x = _mm512_mask_add_epi16 (x, k2, x, x);
}
