/* { dg-do compile } */
/* { dg-options "-O2 -mfunction-return=thunk-inline" } */

extern void foo (void) __attribute__ ((function_return("keep")));

void
foo (void)
{
}

/* { dg-final { scan-assembler-not "jmp\[ \t\]*_?__x86_return_thunk" } } */
/* { dg-final { scan-assembler-not {\t(lfence|pause)} } } */
/* { dg-final { scan-assembler-not {jmp[ \t]*\.?LIND} } } */
/* { dg-final { scan-assembler-not {call[ \t]*\.?LIND} } } */
