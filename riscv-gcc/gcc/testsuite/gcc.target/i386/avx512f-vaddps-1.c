/* { dg-do compile } */
/* { dg-options "-O2 -mavx512f" } */
/* { dg-final { scan-assembler-times "vaddps\[ \\t\]+\[^\{\n\]*%zmm\[0-9\]+(?:\n|\[ \\t\]+#)"  1 } } */
/* { dg-final { scan-assembler-times "vaddps\[ \\t\]+\[^\{\n\]*%zmm\[0-9\]+\{%k\[1-7\]\}(?:\n|\[ \\t\]+#)"  1 } } */
/* { dg-final { scan-assembler-times "vaddps\[ \\t\]+\[^\{\n\]*%zmm\[0-9\]+\{%k\[1-7\]\}\{z\}(?:\n|\[ \\t\]+#)"  1 } } */
/* { dg-final { scan-assembler-times "vaddps\[ \\t\]+\[^\n\]*\{rn-sae\}\[^\{\n\]*%zmm\[0-9\]+(?:\n|\[ \\t\]+#)" 1 } } */
/* { dg-final { scan-assembler-times "vaddps\[ \\t\]+\[^\n\]*\{ru-sae\}\[^\{\n\]*%zmm\[0-9\]+\{%k\[1-7\]\}(?:\n|\[ \\t\]+#)" 1 } } */
/* { dg-final { scan-assembler-times "vaddps\[ \\t\]+\[^\n\]*\{rz-sae\}\[^\{\n\]*%zmm\[0-9\]+\{%k\[1-7\]\}\{z\}(?:\n|\[ \\t\]+#)" 1 } } */

#include <immintrin.h>

volatile __m512 x;
volatile __mmask16 m;

void extern
avx512f_test (void)
{
  x = _mm512_add_ps (x, x);
  x = _mm512_mask_add_ps (x, m, x, x);
  x = _mm512_maskz_add_ps (m, x, x);
  x = _mm512_add_round_ps (x, x, _MM_FROUND_TO_NEAREST_INT | _MM_FROUND_NO_EXC);
  x = _mm512_mask_add_round_ps (x, m, x, x, _MM_FROUND_TO_POS_INF | _MM_FROUND_NO_EXC);
  x = _mm512_maskz_add_round_ps (m, x, x, _MM_FROUND_TO_ZERO | _MM_FROUND_NO_EXC);
}
