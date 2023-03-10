/* { dg-do compile } */
/* { dg-require-effective-target arm_arch_v8m_main_ok } */
/* { dg-options "-O2" } */
/* { dg-add-options arm_arch_v8m_main } */

#include "../aarch64/atomic-op-relaxed.x"

/* { dg-final { scan-assembler-times "ldrex\tr\[0-9\]+, \\\[r\[0-9\]+\\\]" 6 } } */
/* { dg-final { scan-assembler-times "strex\t...?, r\[0-9\]+, \\\[r\[0-9\]+\\\]" 6 } } */
/* { dg-final { scan-assembler-not "dmb" } } */
