/* { dg-do run } */
/* { dg-options "-O3 -march=z900 --save-temps -mfunction-return-mem=thunk -mindirect-branch-table" } */

int gl = 0;

int __attribute__((noinline,noclone))
bar (int a)
{
  return a + 2;
}

void __attribute__((noinline,noclone))
foo (int a)
{
  int i;

  if (a == 42)
    return;

  for (i = 0; i < a; i++)
    gl += bar (i);
}

void __attribute__((noinline,noclone))
baz (int a)
{
  int i;

  for (i = 0; i < a; i++)
    gl += bar (i);
}

int
main ()
{
  foo (3);
  if (gl != 9)
    __builtin_abort ();

  return 0;
}

/* 1 x foo, 1 x baz, 1 x main */
/* { dg-final { scan-assembler-times "jg\t__s390_indirect_jump" 3 } } */

/* 1 x foo, conditional return, shrink wrapped */
/* { dg-final { scan-assembler "jge\t__s390_indirect_jump" } } */

/* 1 x baz, conditional return, shrink wrapped */
/* { dg-final { scan-assembler "jgle\t__s390_indirect_jump" } } */

/* { dg-final { scan-assembler "ex\t" } } */

/* { dg-final { scan-assembler-not "section\t.s390_indirect_jump" } } */
/* { dg-final { scan-assembler-not "section\t.s390_indirect_call" } } */
/* { dg-final { scan-assembler-not "section\t.s390_return_reg" } } */
/* { dg-final { scan-assembler     "section\t.s390_return_mem" } } */
