/* { dg-do compile } */
/* { dg-options "-O2" } */

#define vector __attribute__((vector_size(16)))

vector float combine (float a, float b, float d)
{
  return (vector float) { a, b, a, d };
}

/* { dg-final { scan-assembler-not "movi\t" } } */
/* { dg-final { scan-assembler-not "orr\t" } } */
