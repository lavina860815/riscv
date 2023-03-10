/* { dg-do compile } */
/* { dg-csky-options "-mcpu=ck810f -O1 -mconstpool" } */

/* Make sure that constant pools are emitted by the compiler when
   -mconstpool is provided.  */

void f (unsigned int *u, long long int *l, float *f, double *d)
{
  *u = 0xdeadbeef;
  *l = 0xcafef00dc0ffeeULL;
  *f = 3.14159F;
  *d = 2.718281828459;
}

/* { dg-final { scan-assembler-times "\\.long" 6 } } */
