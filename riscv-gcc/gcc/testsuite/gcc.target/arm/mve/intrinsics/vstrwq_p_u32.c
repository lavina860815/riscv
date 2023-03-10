/* { dg-require-effective-target arm_v8_1m_mve_ok } */
/* { dg-add-options arm_v8_1m_mve } */
/* { dg-additional-options "-O2" } */

#include "arm_mve.h"

void
foo (uint32_t * addr, uint32x4_t value, mve_pred16_t p)
{
  vstrwq_p_u32 (addr, value, p);
}

/* { dg-final { scan-assembler "vstrwt.32"  }  } */

void
foo1 (uint32_t * addr, uint32x4_t value, mve_pred16_t p)
{
  vstrwq_p (addr, value, p);
}

/* { dg-final { scan-assembler "vstrwt.32"  }  } */
