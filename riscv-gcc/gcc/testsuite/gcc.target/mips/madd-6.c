/* { dg-options "-march=5kc" } */
/* { dg-skip-if "code quality test" { *-*-* } { "-O0" } { "" } } */
/* { dg-final { scan-assembler-not "\tmadd\t" } } */
/* { dg-final { scan-assembler "\tmul\t" } } */
/* { dg-final { scan-assembler "\taddu\t" } } */

NOMIPS16 void f1 (int *a) { a[0] = a[0] * a[1] + a[2]; }
