/* { dg-do run } */
/* { dg-options "-O2 --save-temps -ftree-vectorize" } */

#include "vect_hadd_1.h"

#define BIAS 1

FOR_EACH_SIGNED_TYPE (DEF_FUNC)

int
main (void)
{
  FOR_EACH_SIGNED_TYPE (TEST_FUNC);
  return 0;
}

/* { dg-final { scan-assembler {\tsrhadd\tv[0-9]+\.16b,} } } */
/* { dg-final { scan-assembler {\tsrhadd\tv[0-9]+\.8h,} } } */
/* { dg-final { scan-assembler {\tsrhadd\tv[0-9]+\.4s,} } } */
/* { dg-final { scan-assembler-not {\tsrhadd\tv[0-9]+\.2d,} } } */
