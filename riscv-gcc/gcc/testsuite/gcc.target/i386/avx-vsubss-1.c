/* { dg-do run } */
/* { dg-require-effective-target avx } */
/* { dg-options "-O2 -mfpmath=sse -mavx" } */

#define CHECK_H "avx-check.h"
#define TEST avx_test

#include "sse-subss-1.c"
