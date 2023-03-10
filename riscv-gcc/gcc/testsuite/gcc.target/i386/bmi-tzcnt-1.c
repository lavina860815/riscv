/* { dg-do run { target { bmi && { ! ia32 } } } } */
/* { dg-options "-O2 -mbmi -fno-inline" } */

#include <x86intrin.h>

#include "bmi-check.h"

long long calc_tzcnt_u64 (long long src)
{
  int i;
  int res = 0;

  while ( (res<64) && ((src&1) == 0)) {
    ++res;
    src >>= 1;
  }

  return res;
}

static void
bmi_test ()
{
  unsigned i;
  long long src = 0xfacec0ffeefacec0;
  long long res, res_ref;

  for (i=0; i<5; ++i) {
    src = i + src << i;

    res_ref = calc_tzcnt_u64 (src);
    res = __tzcnt_u64 (src);

    if (res != res_ref)
      abort();
  }
}
