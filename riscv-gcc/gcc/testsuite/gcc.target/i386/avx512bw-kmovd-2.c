/* { dg-do compile } */
/* { dg-options "-mavx512bw -O2" } */
/* { dg-final { scan-assembler-times "kmovd\[ \\t\]+\[^\{\n\]*%k\[0-7\](?:\n|\[ \\t\]+#)" 1 } } */

#include <immintrin.h>
volatile __mmask32 k1;

void
avx512bw_test ()
{
  __mmask32 k0 = 11; 
  __mmask32 k = _load_mask32 (&k0);

  asm volatile ("" : "+k" (k));
  k1 = k;
}
