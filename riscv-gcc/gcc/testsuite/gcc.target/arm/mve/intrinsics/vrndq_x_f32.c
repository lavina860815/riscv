/* { dg-require-effective-target arm_v8_1m_mve_fp_ok } */
/* { dg-add-options arm_v8_1m_mve_fp } */
/* { dg-additional-options "-O2" } */

#include "arm_mve.h"

float32x4_t
foo (float32x4_t a, mve_pred16_t p)
{
  return vrndq_x_f32 (a, p);
}

/* { dg-final { scan-assembler "vpst" } } */
/* { dg-final { scan-assembler "vrintzt.f32"  }  } */

float32x4_t
foo1 (float32x4_t a, mve_pred16_t p)
{
  return vrndq_x (a, p);
}

/* { dg-final { scan-assembler "vpst" } } */
