/* { dg-require-effective-target arm_v8_1m_mve_fp_ok } */
/* { dg-add-options arm_v8_1m_mve_fp } */
/* { dg-additional-options "-O2" } */

#include "arm_mve.h"

float32x4_t
foo (float32_t const * base, mve_pred16_t p)
{
  return vld1q_z_f32 (base, p);
}

float32x4_t
foo1 (float32_t const * base, mve_pred16_t p)
{
  return vld1q_z (base, p);
}

/* { dg-final { scan-assembler-times "vpst" 2 }  } */
/* { dg-final { scan-assembler-times "vldrwt.32" 2 }  } */
/* { dg-final { scan-assembler-not "__ARM_undef" } } */
