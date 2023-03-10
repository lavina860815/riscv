/* { dg-require-effective-target arm_v8_1m_mve_ok } */
/* { dg-add-options arm_v8_1m_mve } */
/* { dg-additional-options "-O2" } */

#include "arm_mve.h"

uint16x8_t
foo (uint8x16_t a, uint8x16_t b, mve_pred16_t p)
{
  return vmullbq_poly_x_p8 (a, b, p);
}

/* { dg-final { scan-assembler "vpst" } } */
/* { dg-final { scan-assembler "vmullbt.p8"  }  } */

uint16x8_t
foo1 (uint8x16_t a, uint8x16_t b, mve_pred16_t p)
{
  return vmullbq_poly_x (a, b, p);
}

/* { dg-final { scan-assembler "vpst" } } */
