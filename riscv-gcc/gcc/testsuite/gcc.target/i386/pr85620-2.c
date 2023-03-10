/* { dg-do compile } */
/* { dg-options "-O2 -fcf-protection" } */
/* { dg-final { scan-assembler-times {\mendbr} 1 } } */

struct ucontext;

extern int bar (struct ucontext *) __attribute__((__indirect_return__));

int
foo (struct ucontext *oucp)
{
  return bar (oucp);
}
