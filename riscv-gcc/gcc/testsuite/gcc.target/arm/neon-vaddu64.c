/* Test the `vadd_u64' ARM Neon intrinsic.  */

/* { dg-do run } */
/* { dg-require-effective-target arm_neon_hw } */
/* { dg-options "-O0" } */
/* { dg-add-options arm_neon } */

#include "arm_neon.h"
#include <stdlib.h>

int main (void)
{
  uint64x1_t out_uint64x1_t = 0;
  uint64x1_t arg0_uint64x1_t = (uint64x1_t)0xdeadbeef00000000LL;
  uint64x1_t arg1_uint64x1_t = (uint64x1_t)0x00000000deadbeefLL;

  out_uint64x1_t = vadd_u64 (arg0_uint64x1_t, arg1_uint64x1_t);
  if (out_uint64x1_t != (uint64x1_t)0xdeadbeefdeadbeefLL)
    abort();
  return 0;
}
