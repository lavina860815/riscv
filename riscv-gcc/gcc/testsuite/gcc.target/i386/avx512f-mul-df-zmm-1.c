/* { dg-do compile } */
/* { dg-options "-mavx512f -O2" } */
/* { dg-final { scan-assembler-times "vmulpd\[ \\t\]+\\(%(?:eax|rdi|edi)\\)\\\{1to\[1-8\]+\\\}, %zmm\[0-9\]+, %zmm0" 1 } } */
/* { dg-final { scan-assembler-not "vbroadcastsd\[^\n\]*%zmm\[0-9\]+" } } */

#define type __m512d
#define vec 512
#define op mul
#define suffix pd
#define SCALAR double

#include "avx512-binop-1.h"
