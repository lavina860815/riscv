/* { dg-do compile } */
/* { dg-additional-options "-march=armv8.4-a+dotprod" } */

int main ()
{
  return 0;
}

/* { dg-final { scan-assembler-times {\.arch armv8\.4\-a} 1 } } */

/* Checking if enabling default features drops the superfluous bits.   */
