/* { dg-do compile } */
/* { dg-options "-O2 -mavx512f" } */
/* { dg-final { scan-assembler-times "vsubpd\[ \\t\]+\[^\{\n\]*%zmm\[0-9\]+(?:\n|\[ \\t\]+#)"  1 } } */
/* { dg-final { scan-assembler-times "vsubpd\[ \\t\]+\[^\{\n\]*%zmm\[0-9\]+\{%k\[1-7\]\}(?:\n|\[ \\t\]+#)"  1 } } */
/* { dg-final { scan-assembler-times "vsubpd\[ \\t\]+\[^\{\n\]*%zmm\[0-9\]+\{%k\[1-7\]\}\{z\}(?:\n|\[ \\t\]+#)"  1 } } */
/* { dg-final { scan-assembler-times "vsubpd\[ \\t\]+\[^\n\]*\{rn-sae\}\[^\{\n\]*%zmm\[0-9\]+(?:\n|\[ \\t\]+#)" 1 } } */
/* { dg-final { scan-assembler-times "vsubpd\[ \\t\]+\[^\n\]*\{rd-sae\}\[^\{\n\]*%zmm\[0-9\]+\{%k\[1-7\]\}(?:\n|\[ \\t\]+#)" 1 } } */
/* { dg-final { scan-assembler-times "vsubpd\[ \\t\]+\[^\n\]*\{rz-sae\}\[^\{\n\]*%zmm\[0-9\]+\{%k\[1-7\]\}\{z\}(?:\n|\[ \\t\]+#)" 1 } } */

#include <immintrin.h>

volatile __m512d x;
volatile __mmask8 m;

void extern
avx512f_test (void)
{
  x = _mm512_sub_pd (x, x);
  x = _mm512_mask_sub_pd (x, m, x, x);
  x = _mm512_maskz_sub_pd (m, x, x);
  x = _mm512_sub_round_pd (x, x, _MM_FROUND_TO_NEAREST_INT | _MM_FROUND_NO_EXC);
  x = _mm512_mask_sub_round_pd (x, m, x, x, _MM_FROUND_TO_NEG_INF | _MM_FROUND_NO_EXC);
  x = _mm512_maskz_sub_round_pd (m, x, x, _MM_FROUND_TO_ZERO | _MM_FROUND_NO_EXC);
}
