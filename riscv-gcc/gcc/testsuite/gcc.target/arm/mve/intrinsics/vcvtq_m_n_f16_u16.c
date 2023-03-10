/* { dg-require-effective-target arm_v8_1m_mve_fp_ok } */
/* { dg-add-options arm_v8_1m_mve_fp } */
/* { dg-additional-options "-O2" } */

#include "arm_mve.h"

float16x8_t
foo (float16x8_t inactive, uint16x8_t a, mve_pred16_t p)
{
  return vcvtq_m_n_f16_u16 (inactive, a, 1, p);
}

/* { dg-final { scan-assembler "vpst" } } */
/* { dg-final { scan-assembler "vcvtt.f16.u16"  }  } */

float16x8_t
foo1 (float16x8_t inactive, uint16x8_t a, mve_pred16_t p)
{
  return vcvtq_m_n (inactive, a, 1, p);
}

/* { dg-final { scan-assembler "vpst" } } */
/* { dg-final { scan-assembler "vcvtt.f16.u16"  }  } */
