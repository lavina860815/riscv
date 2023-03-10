/* { dg-do compile { target { ! ia32 } } } */
/* { dg-options "-O2 -march=haswell" } */
/* { dg-final { scan-assembler-times "vpmovzxwq" 1 } } */
/* { dg-final { scan-assembler-not "vmovq" } } */

#include <immintrin.h>

void
f (void *dst, void *ptr)
{
  __m128i data = _mm_cvtsi64_si128(*(long long int*)ptr);
  __m256i x = _mm256_cvtepu16_epi64(data);
  _mm256_storeu_si256((__m256i*)dst, x);
}
