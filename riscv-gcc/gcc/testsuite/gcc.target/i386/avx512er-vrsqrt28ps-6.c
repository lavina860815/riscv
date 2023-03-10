/* { dg-do compile } */
/* { dg-options "-O2 -ffast-math -ftree-vectorize -mavx512er" } */

#include "avx512er-vrsqrt28ps-5.c"

/* { dg-final { scan-assembler-times "vrsqrt28ps\[^\n\r\]*zmm\[0-9\]+(?:\n|\[ \\t\]+#)" 1 } } */
/* { dg-final { scan-assembler-times "vrcp28ps\[^\n\r\]*zmm\[0-9\]+(?:\n|\[ \\t\]+#)" 1 } } */
