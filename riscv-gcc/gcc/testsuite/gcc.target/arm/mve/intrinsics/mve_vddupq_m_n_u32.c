/* { dg-require-effective-target arm_v8_1m_mve_ok } */
/* { dg-add-options arm_v8_1m_mve } */
/* { dg-additional-options "-O2" } */

#include "arm_mve.h"

uint32x4_t
foo1 (uint32x4_t inactive, int32_t a, mve_pred16_t p)
{
  return vddupq_m (inactive, a, 4, p);
}

/* { dg-final { scan-assembler-not "__ARM_undef" } } */
