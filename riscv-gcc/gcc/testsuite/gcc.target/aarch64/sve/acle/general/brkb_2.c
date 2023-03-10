/* { dg-do compile } */
/* { dg-options "-O2" } */

#include <arm_sve.h>

void
test1 (svbool_t pg, svbool_t x, int *any, svbool_t *ptr)
{
  svbool_t res = svbrkb_z (pg, x);
  *any = svptest_any (pg, res);
  *ptr = res;
}

int
test2 (svbool_t pg, svbool_t x, int *any)
{
  svbool_t res = svbrkb_z (pg, x);
  return svptest_any (pg, res);
}

/* { dg-final { scan-assembler-times {\tbrkbs\tp[0-9]+\.b, p[0-9]+/z,} 2 } } */
/* { dg-final { scan-assembler-not {\tbrkb\t} } } */
