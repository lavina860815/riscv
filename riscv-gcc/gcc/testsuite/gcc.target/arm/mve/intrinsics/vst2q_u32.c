/* { dg-require-effective-target arm_v8_1m_mve_ok } */
/* { dg-add-options arm_v8_1m_mve } */
/* { dg-additional-options "-O2" } */

#include "arm_mve.h"

void
foo (uint32_t * addr, uint32x4x2_t value)
{
  vst2q_u32 (addr, value);
}

/* { dg-final { scan-assembler "vst20.32"  }  } */
/* { dg-final { scan-assembler "vst21.32"  }  } */

void
foo1 (uint32_t * addr, uint32x4x2_t value)
{
  vst2q (addr, value);
}

/* { dg-final { scan-assembler "vst20.32"  }  } */
