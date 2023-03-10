/* { dg-options "-O2 -ftree-vectorize -msve-vector-bits=512" } */

#include <stdint.h>

void
f1 (uint32_t *dst, uint16_t *src1, int8_t *src2)
{
  for (int i = 0; i < 7; ++i)
    dst[i] += (int16_t) (src1[i] + src2[i]);
}

/* { dg-final { scan-assembler-times {\tld1sb\tz[0-9]+\.s,} 1 } } */
/* { dg-final { scan-assembler-times {\tld1h\tz[0-9]+\.s,} 1 } } */
/* { dg-final { scan-assembler-times {\tld1w\tz[0-9]+\.s,} 1 } } */

/* { dg-final { scan-assembler-times {\tadd\tz} 2 } } */
/* { dg-final { scan-assembler-times {\tadd\tz[0-9]+\.h, z[0-9]+\.h, z[0-9]+\.h\n} 1 } } */
/* { dg-final { scan-assembler-times {\tadd\tz[0-9]+\.s, z[0-9]+\.s, z[0-9]+\.s\n} 1 } } */

/* { dg-final { scan-assembler-times {\tsxt.\t} 1 } } */
/* { dg-final { scan-assembler-times {\tsxth\tz[0-9]+\.s,} 1 } } */
