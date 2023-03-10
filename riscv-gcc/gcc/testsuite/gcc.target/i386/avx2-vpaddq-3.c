/* { dg-do run } */
/* { dg-options "-mavx2 -mno-prefer-avx128 -O2 -ftree-vectorize -mtune=generic -save-temps" } */
/* { dg-require-effective-target avx2 } */


#define TYPE long long int
#define BIN_OP(a, b) ((a) + (b))

#include "avx2-vpop-check.h"

/* { dg-final { scan-assembler-times "vpaddq\[ \\t\]+\[^\n\]*%ymm\[0-9\]" 1 } } */
