/* { dg-require-effective-target arm_v8_1m_mve_ok } */
/* { dg-add-options arm_v8_1m_mve } */
/* { dg-additional-options "-O2" } */

#include "arm_mve.h"

int32_t
foo (int32_t a, int16x8_t b, mve_pred16_t p)
{
  return vaddvaq_p_s16 (a, b, p);
}

/* { dg-final { scan-assembler "vaddvat.s16"  }  } */

int32_t
foo1 (int32_t a, int16x8_t b, mve_pred16_t p)
{
  return vaddvaq_p (a, b, p);
}

/* { dg-final { scan-assembler "vaddvat.s16"  }  } */
