/* { dg-require-effective-target arm_v8_1m_mve_ok } */
/* { dg-add-options arm_v8_1m_mve } */
/* { dg-additional-options "-O2" } */

#include "arm_mve.h"

uint8x16_t
foo (uint8x16_t a, int8x16_t b, mve_pred16_t p)
{
  return vminaq_m_s8 (a, b, p);
}

/* { dg-final { scan-assembler "vpst" } } */
/* { dg-final { scan-assembler "vminat.s8"  }  } */

uint8x16_t
foo1 (uint8x16_t a, int8x16_t b, mve_pred16_t p)
{
  return vminaq_m (a, b, p);
}

/* { dg-final { scan-assembler "vpst" } } */
