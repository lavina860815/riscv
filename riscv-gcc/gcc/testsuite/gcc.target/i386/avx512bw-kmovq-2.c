/* { dg-do compile } */
/* { dg-options "-mavx512bw -O2" } */
/* { dg-final { scan-assembler-times "kmovq\[ \\t\]+\[^\{\n\]*%k\[0-7\](?:\n|\[ \\t\]+#)" 1 } } */

#include <immintrin.h>
volatile __mmask64 k1;

void
avx512bw_test ()
{
  __mmask64 k0 = 11; 
  __mmask64 k = _load_mask64 (&k0);

  asm volatile ("" : "+k" (k));
  k1 = k;
}
