/* { dg-require-effective-target arm_v8_1m_mve_ok } */
/* { dg-add-options arm_v8_1m_mve } */
/* { dg-additional-options "-O2" } */

#include "arm_mve.h"

int32x4_t
foo (int32x4_t a, int32x4_t b, int32_t c)
{
  return vqdmlahq_n_s32 (a, b, c);
}

/* { dg-final { scan-assembler "vqdmlah.s32"  }  } */

int32x4_t
foo1 (int32x4_t a, int32x4_t b, int32_t c)
{
  return vqdmlahq (a, b, c);
}

/* { dg-final { scan-assembler "vqdmlah.s32"  }  } */
