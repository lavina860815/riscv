/* { dg-require-effective-target arm_v8_1m_mve_ok } */
/* { dg-add-options arm_v8_1m_mve } */
/* { dg-additional-options "-O2" } */

#include "arm_mve.h"

uint32x4_t
foo (uint32_t const * base, uint32x4_t offset, mve_pred16_t p)
{
  return vldrwq_gather_shifted_offset_z_u32 (base, offset, p);
}

/* { dg-final { scan-assembler "vldrwt.u32"  }  } */

uint32x4_t
foo1 (uint32_t const * base, uint32x4_t offset, mve_pred16_t p)
{
  return vldrwq_gather_shifted_offset_z (base, offset, p);
}

/* { dg-final { scan-assembler "vldrwt.u32"  }  } */
