/* { dg-require-effective-target arm_v8_1m_mve_ok } */
/* { dg-add-options arm_v8_1m_mve } */
/* { dg-additional-options "-O2" } */

#include "arm_mve.h"

uint16x8_t
foo (uint16x8_t a, int16x8_t b, mve_pred16_t p)
{
  return vminaq_m_s16 (a, b, p);
}

/* { dg-final { scan-assembler "vpst" } } */
/* { dg-final { scan-assembler "vminat.s16"  }  } */

uint16x8_t
foo1 (uint16x8_t a, int16x8_t b, mve_pred16_t p)
{
  return vminaq_m (a, b, p);
}

/* { dg-final { scan-assembler "vpst" } } */
