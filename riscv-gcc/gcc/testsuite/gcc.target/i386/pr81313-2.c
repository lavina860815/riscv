/* { dg-do compile { target ia32 } } */
/* { dg-options "-O2 -mno-accumulate-outgoing-args -mincoming-stack-boundary=4 -mpreferred-stack-boundary=6 -mno-iamcu" } */

extern void foo (int, int, int);

void
bar (void)
{
  foo (1, 2, 3);
}

/* { dg-final { scan-assembler "lea\[l\]?\[\\t \]*\[0-9\]*\\(%esp\\)" } } */
