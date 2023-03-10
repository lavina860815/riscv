/* { dg-require-effective-target arm_v8_1m_mve_ok } */
/* { dg-add-options arm_v8_1m_mve } */
/* { dg-additional-options "-O2" } */

#include "arm_mve.h"

uint64x2_t
foo (uint32x4_t a, uint32x4_t b, mve_pred16_t p)
{
  return vmulltq_int_x_u32 (a, b, p);
}

/* { dg-final { scan-assembler "vpst" } } */
/* { dg-final { scan-assembler "vmulltt.u32"  }  } */

uint64x2_t
foo1 (uint32x4_t a, uint32x4_t b, mve_pred16_t p)
{
  return vmulltq_int_x (a, b, p);
}

/* { dg-final { scan-assembler "vpst" } } */
