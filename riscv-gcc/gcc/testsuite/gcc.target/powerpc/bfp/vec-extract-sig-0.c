/* { dg-do compile { target { powerpc*-*-* } } } */
/* { dg-require-effective-target powerpc_p9vector_ok } */
/* { dg-options "-mdejagnu-cpu=power9" } */

#include <altivec.h>

__vector unsigned int
get_significands (__vector float *p)
{
  __vector float source = *p;

  return vec_extract_sig (source);
}

/* { dg-final { scan-assembler "xvxsigsp" } } */
