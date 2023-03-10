/* { dg-do compile { target { *-*-linux* && { ! ia32 } } } } */
/* { dg-require-effective-target maybe_x32 } */
/* { dg-options "-O2 -mx32 -fpic -fno-plt -maddress-mode=long" } */

extern int bar (void);

int
foo (void)
{
  return bar () + 1;
}

/* { dg-final { scan-assembler "call\[ \t\]*.bar@GOTPCREL" } } */
