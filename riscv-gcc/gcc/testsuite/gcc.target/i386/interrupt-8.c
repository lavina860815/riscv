/* { dg-do compile { target *-*-linux* } } */
/* { dg-options "-O2 -mgeneral-regs-only -mno-cld -mno-iamcu -maccumulate-outgoing-args" } */

extern void bar (void);

void
 __attribute__ ((interrupt))
foo (void *frame)
{
  bar ();
}

/* { dg-final { scan-assembler-not "movups\[\\t .\]*%(x|y|z)mm\[0-9\]+" } } */
/* { dg-final { scan-assembler-not "kmov.\[\\t \]*%k\[0-7\]+,\[\\t \]*\[\\-]?\[0-9\]*\\(%\[re\]?sp\\)" } } */
/* { dg-final { scan-assembler-not "kmov.\[\\t \]*\[0-9\]*\\(%\[re\]?sp\\),\[\\t \]*%k\[0-7\]+" } } */
/* { dg-final { scan-assembler-not "pushq\[\\t \]*%rbx" { target { ! ia32 } } } } */
/* { dg-final { scan-assembler-not "pushq\[\\t \]*%r1\[2-5\]+" { target { ! ia32 } } } } */
/* { dg-final { scan-assembler-not "pushl\[\\t \]*%ebx" { target ia32 } } } */
/* { dg-final { scan-assembler-not "pushl\[\\t \]*%e(s|d)i" { target ia32 } } } */
/* { dg-final { scan-assembler-times "push(?:l|q)\[\\t \]*%(?:e|r)ax" 1 } } */
/* { dg-final { scan-assembler-times "push(?:l|q)\[\\t \]*%(?:e|r)cx" 1 } } */
/* { dg-final { scan-assembler-times "push(?:l|q)\[\\t \]*%(?:e|r)dx" 1 } } */
/* { dg-final { scan-assembler-times "pushq\[\\t \]*%rdi" 1 { target { ! ia32 } } } } */
/* { dg-final { scan-assembler-times "pushq\[\\t \]*%rsi" 1 { target { ! ia32 } } } } */
/* { dg-final { scan-assembler-times "pushq\[\\t \]*%r8" 1 { target { ! ia32 } } } } */
/* { dg-final { scan-assembler-times "pushq\[\\t \]*%r9" 1 { target { ! ia32 } } } } */
/* { dg-final { scan-assembler-times "pushq\[\\t \]*%r10" 1 { target { ! ia32 } } } } */
/* { dg-final { scan-assembler-times "pushq\[\\t \]*%r11" 1 { target { ! ia32 } } } } */
/* { dg-final { scan-assembler-times "pop(?:l|q)\[\\t \]*%(?:e|r)ax" 1 } } */
/* { dg-final { scan-assembler-times "pop(?:l|q)\[\\t \]*%(?:e|r)cx" 1 } } */
/* { dg-final { scan-assembler-times "pop(?:l|q)\[\\t \]*%(?:e|r)dx" 1 } } */
/* { dg-final { scan-assembler-times "popq\[\\t \]*%rdi" 1 { target { ! ia32 } } } } */
/* { dg-final { scan-assembler-times "popq\[\\t \]*%rsi" 1 { target { ! ia32 } } } } */
/* { dg-final { scan-assembler-times "popq\[\\t \]*%r8" 1 { target { ! ia32 } } } } */
/* { dg-final { scan-assembler-times "popq\[\\t \]*%r9" 1 { target { ! ia32 } } } } */
/* { dg-final { scan-assembler-times "popq\[\\t \]*%r10" 1 { target { ! ia32 } } } } */
/* { dg-final { scan-assembler-times "popq\[\\t \]*%r11" 1 { target { ! ia32 } } } } */
/* { dg-final { scan-assembler-times "\tcld" 1 } } */
