/* { dg-do compile } */
/* { dg-require-effective-target arm_v8_neon_ok } */
/* { dg-options "-O2 -ffast-math -ftree-vectorize" } */
/* { dg-add-options arm_v8_neon } */

#define N 32

float __attribute__((aligned(16))) input[N];
float __attribute__((aligned(16))) output[N];

void
foo ()
{
  int i = 0;
  /* Vectorizable.  */
  for (i = 0; i < N; i++)
    output[i] = __builtin_ceilf (input[i]);
}

/* { dg-final { scan-tree-dump-times "vectorized 1 loops" 1 "vect" { target vect_call_ceilf } } } */
