/* { dg-do compile } */
/* { dg-options "-march=armv8.2-a+fp16fml" } */

#include "fp16_fmul_high.h"

/* { dg-final { scan-assembler-times "fmlal2\\tv\[0-9\]+\.2s, v\[0-9\]+\.2h, v\[0-9\]+\.2h" 1 } } */
/* { dg-final { scan-assembler-times "fmlal2\\tv\[0-9\]+\.4s, v\[0-9\]+\.4h, v\[0-9\]+\.4h" 1 } } */
/* { dg-final { scan-assembler-times "fmlsl2\\tv\[0-9\]+\.2s, v\[0-9\]+\.2h, v\[0-9\]+\.2h" 1 } } */
/* { dg-final { scan-assembler-times "fmlsl2\\tv\[0-9\]+\.4s, v\[0-9\]+\.4h, v\[0-9\]+\.4h" 1 } } */
