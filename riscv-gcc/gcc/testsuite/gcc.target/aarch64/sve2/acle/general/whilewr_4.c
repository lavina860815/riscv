/* { dg-do compile } */
/* { dg-options "-O2" } */

#include <arm_sve.h>

void
test1 (int64_t *x, int64_t *y, int *any, svbool_t *ptr)
{
  svbool_t res = svwhilewr (x, y);
  *any = svptest_last (svptrue_b64 (), res);
  *ptr = res;
}

int
test2 (int64_t *x, int64_t *y)
{
  svbool_t res = svwhilewr (x, y);
  return svptest_last (svptrue_b64 (), res);
}

/* { dg-final { scan-assembler-times {\twhilewr\t} 2 } } */
/* { dg-final { scan-assembler-not {\tptrue\t} } } */
/* { dg-final { scan-assembler-not {\tptest\t} } } */
