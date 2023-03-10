/* { dg-do compile } */
/* { dg-options "-O3" } */

#pragma GCC target "+nosve"

int 
t6(int len, void * dummy, int * __restrict x)
{
  len = len & ~31;
  long long result = 0;
  __asm volatile ("");
  for (int i = 0; i < len; i++)
    result += x[i];
  return result;
}

/* { dg-final { scan-assembler "saddw" } } */
/* { dg-final { scan-assembler "saddw2" } } */
