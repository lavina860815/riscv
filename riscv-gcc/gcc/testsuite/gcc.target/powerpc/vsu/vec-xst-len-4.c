/* { dg-do compile { target { powerpc*-*-* } } } */
/* { dg-require-effective-target lp64 } */
/* { dg-require-effective-target powerpc_p9vector_ok } */
/* { dg-options "-mdejagnu-cpu=power9" } */

#include <stddef.h>
#include <altivec.h>

void
store_data (vector signed __int128 *datap, signed __int128 *address,
	    size_t length)
{
  vector signed __int128 data = *datap;

  vec_xst_len (data, address, length);
}

/* { dg-final { scan-assembler "sldi" } } */
/* { dg-final { scan-assembler "stxvl" } } */
