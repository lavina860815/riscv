/* { dg-require-effective-target arm_v8_1m_mve_fp_ok } */
/* { dg-add-options arm_v8_1m_mve_fp } */
/* { dg-additional-options "-O2" } */

#include "arm_mve.h"

float32x4_t
foo (float32x4_t inactive, float16x8_t a, mve_pred16_t p)
{
  return vcvttq_m_f32_f16 (inactive, a, p);
}

/* { dg-final { scan-assembler "vpst" } } */
/* { dg-final { scan-assembler "vcvttt.f32.f16"  }  } */

float32x4_t
foo1 (float32x4_t inactive, float16x8_t a, mve_pred16_t p)
{
  return vcvttq_m (inactive, a, p);
}

/* { dg-final { scan-assembler "vpst" } } */
