/* { dg-require-effective-target arm_v8_1m_mve_ok } */
/* { dg-add-options arm_v8_1m_mve } */
/* { dg-additional-options "-O2" } */

#include "arm_mve.h"

void
foo (int32_t * addr, int32x4_t value)
{
  vstrwq_s32 (addr, value);
}

/* { dg-final { scan-assembler "vstrw.32"  }  } */

void
foo1 (int32_t * addr, int32x4_t value)
{
  vstrwq (addr, value);
}

/* { dg-final { scan-assembler "vstrw.32"  }  } */
