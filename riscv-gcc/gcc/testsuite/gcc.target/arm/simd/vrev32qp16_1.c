/* Test the `vrev32q_p16' ARM Neon intrinsic.  */

/* { dg-options "-save-temps -fno-inline" } */
/* { dg-add-options arm_neon } */

#include "arm_neon.h"
#include "../../aarch64/simd/vrev32qp16.x"

/* { dg-final { scan-assembler "vrev32\.16\[ \t\]+\[qQ\]\[0-9\]+, \[qQ\]\[0-9\]+!?\(\[ \t\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
