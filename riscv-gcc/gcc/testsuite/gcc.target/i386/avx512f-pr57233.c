/* PR tree-optimization/57233 */
/* { dg-do run { target avx512f } } */
/* { dg-options "-O2 -mavx512f" } */

#include "avx512f-check.h"

int do_main (void);

static void
avx512f_test (void)
{
  do_main ();
}

#undef main
#define main() do_main ()

#include "../../gcc.dg/pr57233.c"
