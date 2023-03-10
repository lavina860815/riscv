/* { dg-do compile } */
/* { dg-require-effective-target arm_fp_dp_ok } */
/* { dg-skip-if "need fp instructions" { *-*-* } { "-mfloat-abi=soft" } { "" } } */
/* { dg-options "-O2" } */
/* { dg-add-options arm_fp_dp } */

extern void bar (double);

void
foo (double *p, double a, int n)
{
  do
    bar (*--p + a);
  while (n--);
}

/* { dg-final { scan-assembler "vldmdb.64" } } */
