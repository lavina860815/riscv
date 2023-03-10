/* Test the nvptx atomic instructions for __atomic_fetch_OP for SM_35
   targets.  */

/* { dg-do compile } */
/* { dg-options "-O2 -misa=sm_35" } */

int
main()
{
  unsigned long long a = ~0;
  unsigned b = 0xa;

  __atomic_fetch_add (&a, b, 0);
  __atomic_fetch_and (&a, b, 0);
  __atomic_fetch_or (&a, b, 0);
  __atomic_fetch_xor (&a, b, 0);
  
  return a;
}

/* { dg-final { scan-assembler "atom.add.u64" } } */
/* { dg-final { scan-assembler "atom.b64.and" } } */
/* { dg-final { scan-assembler "atom.b64.or" } } */
/* { dg-final { scan-assembler "atom.b64.xor" } } */
