/* In Thumb-2 mode, when optimizing for size, generate a "muls"
   instruction and use the resulting condition flags rather than a
   separate compare instruction.  */
/* { dg-options "-mthumb -Os" }  */
/* { dg-require-effective-target arm_thumb2_ok } */
/* { dg-final { scan-assembler "muls" } } */
/* { dg-final { scan-assembler-not "cmp" } } */

int x;

void f(int i, int j)
{
  if (i * j < 0)
    x = 1;
}
