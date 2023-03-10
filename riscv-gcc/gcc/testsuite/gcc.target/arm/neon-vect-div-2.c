/* Test pattern div<mode>3.  */
/* { dg-do compile } */
/* { dg-require-effective-target arm_neon_ok } */
/* { dg-require-effective-target vect_hw_misalign } */
/* { dg-options "-O3 -ftree-vectorize -funsafe-math-optimizations -fdump-tree-vect-details -fno-reciprocal-math" } */
/* { dg-add-options arm_neon } */

void
foo (int len, float * __restrict p, float *__restrict x)
{
  len = len & ~31;
  for (int i = 0; i < len; i++)
    p[i] = p[i] / x[i];
}

/* { dg-final { scan-tree-dump-not "vectorized 1 loops" "vect" } } */
