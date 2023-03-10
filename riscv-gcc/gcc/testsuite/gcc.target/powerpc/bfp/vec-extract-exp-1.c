/* { dg-do compile { target { powerpc*-*-* } } } */
/* { dg-require-effective-target powerpc_p9vector_ok } */
/* { dg-options "-mdejagnu-cpu=power9" } */

#include <altivec.h>

__vector unsigned long long int
get_exponents (__vector double *p)
{
  __vector double source = *p;

  return vec_extract_exp (source);
}

/* { dg-final { scan-assembler "xvxexpdp" } } */
