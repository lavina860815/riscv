/* { dg-do compile } */
/* { dg-options "-O0 -mavx512bw" } */
/* { dg-final { scan-assembler-times "ktestq\[ \\t\]+\[^\{\n\]*%k\[0-7\](?:\n|\[ \\t\]+#)" 2 } } */

#include <immintrin.h>

void
avx512bw_test () {
  volatile __mmask64 k1;
  __mmask64 k2;

  volatile unsigned char r __attribute__((unused));	

  r = _ktestc_mask64_u8(k1, k2);
  r = _ktestz_mask64_u8(k1, k2);
}
