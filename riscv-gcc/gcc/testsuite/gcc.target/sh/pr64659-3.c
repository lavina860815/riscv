/* Check that atomic ops utilize insns with immediate values.  */
/* { dg-do compile { target { atomic_model_soft_imask_available } } }  */
/* { dg-options "-O2 -matomic-model=soft-imask,strict -mno-usermode" }  */
/* { dg-final { scan-assembler-times "add\t#1" 6 } }  */
/* { dg-final { scan-assembler-times "add\t#-1" 6 } }  */
/* { dg-final { scan-assembler-times "and\t#1" 12 } }  */
/* { dg-final { scan-assembler-times "\tor\t#1" 6 } }  */
/* { dg-final { scan-assembler-times "xor\t#1" 6 } }  */

#include "pr64659-0.h"
