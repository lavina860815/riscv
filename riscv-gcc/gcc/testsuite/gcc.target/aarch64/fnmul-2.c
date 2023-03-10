/* { dg-do compile } */
/* { dg-options "-O2 -frounding-math" } */

double
foo_d (double a, double b)
{
  /* { dg-final { scan-assembler "fneg\\td\[0-9\]+, d\[0-9\]+" } } */
  /* { dg-final { scan-assembler "fmul\\td\[0-9\]+, d\[0-9\]+, d\[0-9\]+" } } */
  return -a * b;
}

float
foo_s (float a, float b)
{
  /* { dg-final { scan-assembler "fneg\\ts\[0-9\]+, s\[0-9\]+" } } */
  /* { dg-final { scan-assembler "fmul\\ts\[0-9\]+, s\[0-9\]+, s\[0-9\]+" } } */
  return -a * b;
}
