/* Test the `vrev64q_s8' AArch64 SIMD intrinsic.  */

/* { dg-do run } */
/* { dg-options "-save-temps -fno-inline" } */

#include <arm_neon.h>
#include "vrev64qs8.x"

/* { dg-final { scan-assembler-times "rev64\[ \t\]+v\[0-9\]+.16b, ?v\[0-9\]+.16b!?\(?:\[ \t\]+@\[a-zA-Z0-9 \]+\)?\n" 1 } } */
