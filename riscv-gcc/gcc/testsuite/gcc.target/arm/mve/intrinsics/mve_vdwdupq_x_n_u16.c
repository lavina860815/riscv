/* { dg-require-effective-target arm_v8_1m_mve_ok } */
/* { dg-add-options arm_v8_1m_mve } */
/* { dg-additional-options "-O2" } */

#include "arm_mve.h"

uint16x8_t
foo1 (int32_t a, uint32_t b, mve_pred16_t p)
{
  return vdwdupq_x_u16 (a, b, 1, p);
}

/* { dg-final { scan-assembler-not "__ARM_undef" } } */
