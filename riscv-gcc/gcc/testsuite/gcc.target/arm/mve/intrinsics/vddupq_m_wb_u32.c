/* { dg-require-effective-target arm_v8_1m_mve_ok } */
/* { dg-add-options arm_v8_1m_mve } */
/* { dg-additional-options "-O2" } */

#include "arm_mve.h"

uint32x4_t
foo (uint32x4_t inactive, uint32_t *a, mve_pred16_t p)
{
  return vddupq_m_wb_u32 (inactive, a, 4, p);
}

/* { dg-final { scan-assembler "vpst" } } */
/* { dg-final { scan-assembler "vddupt.u32"  }  } */

uint32x4_t
foo1 (uint32x4_t inactive, uint32_t *a, mve_pred16_t p)
{
  return vddupq_m (inactive, a, 4, p);
}

/* { dg-final { scan-assembler "vpst" } } */
/* { dg-final { scan-assembler "vddupt.u32"  }  } */
