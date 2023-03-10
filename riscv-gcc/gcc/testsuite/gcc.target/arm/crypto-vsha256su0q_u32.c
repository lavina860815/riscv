/* { dg-do compile } */
/* { dg-require-effective-target arm_crypto_ok } */
/* { dg-add-options arm_crypto } */

#include "arm_neon.h"

int
foo (void)
{
  uint32x4_t a = {0xd, 0xe, 0xa, 0xd};
  uint32x4_t b = {0, 1, 2, 3};

  uint32x4_t res = vsha256su0q_u32 (a, b);
  return res[0];
}

/* { dg-final { scan-assembler "sha256su0.32\tq\[0-9\]+, q\[0-9\]+" } } */
