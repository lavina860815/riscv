/* { dg-require-effective-target arm_v8_1m_mve_ok } */
/* { dg-add-options arm_v8_1m_mve } */
/* { dg-additional-options "-O2" } */

#include "arm_mve.h"

int32x4_t
foo (int32_t const * base, uint32x4_t offset)
{
  return vldrwq_gather_shifted_offset_s32 (base, offset);
}

/* { dg-final { scan-assembler "vldrw.u32"  }  } */

int32x4_t
foo1 (int32_t const * base, uint32x4_t offset)
{
  return vldrwq_gather_shifted_offset (base, offset);
}

/* { dg-final { scan-assembler "vldrw.u32"  }  } */
