/* { dg-do compile { target { ! ia32 } } } */
/* { dg-options "-mavx512f -O2" } */
/* { dg-final { scan-assembler-times "vbroadcastss\[^\n\]*%zmm\[0-9\]+" 1 } } */
/* { dg-final { scan-assembler-times "vfnmadd...ps\[ \\t\]+%zmm\[0-9\]+, %zmm\[0-9\]+, %zmm0" 1 } } */

#define type __m512
#define vec 512
#define op fnmadd
#define suffix ps
#define SCALAR float

#include "avx512-fma-8.h"
