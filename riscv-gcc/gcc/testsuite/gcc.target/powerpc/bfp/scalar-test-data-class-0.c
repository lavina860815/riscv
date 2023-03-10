/* { dg-do compile { target { powerpc*-*-* } } } */
/* { dg-require-effective-target powerpc_p9vector_ok } */
/* { dg-options "-mdejagnu-cpu=power9" } */

#include <altivec.h>
#include <stdbool.h>

bool
test_data_class (double *p)
{
  double source = *p;

  return scalar_test_data_class (source, 3);
}

/* { dg-final { scan-assembler "xststdcdp" } } */
