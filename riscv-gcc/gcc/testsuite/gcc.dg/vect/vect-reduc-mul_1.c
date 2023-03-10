/* { dg-require-effective-target vect_int_mult } */
/* { dg-require-effective-target whole_vector_shift } */

/* Write a reduction loop to be reduced using vector shifts.  */

#include "tree-vect.h"

extern void abort(void);

unsigned char in[16];

int
main (unsigned char argc, char **argv)
{
  unsigned char i = 0;
  unsigned char sum = 1;

  check_vect ();

  for (i = 0; i < 16; i++)
    in[i] = i + i + 1;

  /* Prevent constant propagation of the entire loop below.  */
  asm volatile ("" : : : "memory");

  for (i = 0; i < 16; i++)
    sum *= in[i];

  if (sum != 33)
    {
      __builtin_printf("Failed %d\n", sum);
      abort();
    }

  return 0;
}

/* { dg-final { scan-tree-dump "Reduce using vector shifts" "vect" } } */

