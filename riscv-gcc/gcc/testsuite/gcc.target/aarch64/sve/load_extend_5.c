/* { dg-options "-O2 -ftree-vectorize -msve-vector-bits=512" } */

#include <stdint.h>

void
f1 (uint64_t *dst, uint32_t *src1, uint8_t *src2)
{
  for (int i = 0; i < 7; ++i)
    dst[i] += (uint32_t) (src1[i] + src2[i]);
}

/* { dg-final { scan-assembler-times {\tld1b\tz[0-9]+\.d,} 1 } } */
/* { dg-final { scan-assembler-times {\tld1w\tz[0-9]+\.d,} 1 } } */
/* { dg-final { scan-assembler-times {\tld1d\tz[0-9]+\.d,} 1 } } */

/* { dg-final { scan-assembler-times {\tadd\tz} 2 } } */
/* { dg-final { scan-assembler-times {\tadd\tz[0-9]+\.s, z[0-9]+\.s, z[0-9]+\.s\n} 1 } } */
/* { dg-final { scan-assembler-times {\tadd\tz[0-9]+\.d, z[0-9]+\.d, z[0-9]+\.d\n} 1 } } */

/* { dg-final { scan-assembler-times {\tuxt.\t} 1 } } */
/* { dg-final { scan-assembler-times {\tuxtw\tz[0-9]+\.d,} 1 } } */
