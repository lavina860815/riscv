/* Test the stc ACLE intrinsic.  */

/* { dg-do assemble } */
/* { dg-options "-save-temps" } */
/* { dg-require-effective-target arm_coproc1_ok } */

#include "arm_acle.h"
#if (__ARM_ARCH < 8 || !defined (__ARM_ARCH_ISA_ARM)) \
    && (__ARM_FEATURE_COPROC & 0x1) == 0
  #error "__ARM_FEATURE_COPROC does not have correct feature bits set"
#endif

extern void * p;

void test_stc (void)
{
  __arm_stc (10, 1, p + 4);
  __arm_stc (11, 1, p + 1024);
}

/* { dg-final { scan-assembler "stc\tp10, CR1, \[r\[0-9\]+" } } */
/* { dg-final { scan-assembler "stc\tp11, CR1, \[r\[0-9\]+\]\n" } } */
