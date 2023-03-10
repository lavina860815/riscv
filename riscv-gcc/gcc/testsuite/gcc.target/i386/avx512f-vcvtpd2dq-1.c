/* { dg-do compile } */
/* { dg-options "-mavx512f -O2" } */
/* { dg-final { scan-assembler-times "vcvtpd2dq\[ \\t\]+\[^\{\n\]*%zmm\[0-9\]+\[^\n\]*%ymm\[0-9\]+\{%k\[1-7\]\}(?:\n|\[ \\t\]+#)"  1 } } */
/* { dg-final { scan-assembler-times "vcvtpd2dq\[ \\t\]+\[^\{\n\]*%zmm\[0-9\]+\[^\n\]*%ymm\[0-9\]+\{%k\[1-7\]\}\{z\}(?:\n|\[ \\t\]+#)"  1 } } */
/* { dg-final { scan-assembler-times "vcvtpd2dq\[ \\t\]+\[^\n\]*\{rn-sae\}\[^\n\]*%zmm\[0-9\]+\[^\{\n\]*%ymm\[0-9\]+(?:\n|\[ \\t\]+#)" 1 } } */
/* { dg-final { scan-assembler-times "vcvtpd2dq\[ \\t\]+\[^\n\]*\{ru-sae\}\[^\n\]*%zmm\[0-9\]+\[^\{\n\]*%ymm\[0-9\]+\{%k\[1-7\]\}(?:\n|\[ \\t\]+#)" 1 } } */
/* { dg-final { scan-assembler-times "vcvtpd2dq\[ \\t\]+\[^\n\]*\{rz-sae\}\[^\n\]*%zmm\[0-9\]+\[^\{\n\]*%ymm\[0-9\]+\{%k\[1-7\]\}\{z\}(?:\n|\[ \\t\]+#)" 1 } } */

#include <immintrin.h>

volatile __m512d s;
volatile __m256i res;
volatile __mmask8 m;

void extern
avx512f_test (void)
{
  res = _mm512_cvtpd_epi32 (s);
  res = _mm512_mask_cvtpd_epi32 (res, m, s);
  res = _mm512_maskz_cvtpd_epi32 (m, s);
  res = _mm512_cvt_roundpd_epi32 (s, _MM_FROUND_TO_NEAREST_INT | _MM_FROUND_NO_EXC);
  res = _mm512_mask_cvt_roundpd_epi32 (res, m, s, _MM_FROUND_TO_POS_INF | _MM_FROUND_NO_EXC);
  res = _mm512_maskz_cvt_roundpd_epi32 (m, s, _MM_FROUND_TO_ZERO | _MM_FROUND_NO_EXC);
}
