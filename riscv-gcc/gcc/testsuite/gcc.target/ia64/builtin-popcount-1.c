/* { dg-do compile } */
/* { dg-options "-O2" } */
/* { dg-final { scan-assembler "popcnt" } } */

int foo (int x)
{
  return __builtin_popcount (x);
}

