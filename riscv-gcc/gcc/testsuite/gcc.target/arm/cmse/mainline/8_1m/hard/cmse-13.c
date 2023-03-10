/* { dg-do compile } */
/* { dg-options "-mcmse -mfloat-abi=hard -mfpu=fpv5-d16" }  */
/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" } { "-mfloat-abi=hard" } } */
/* { dg-skip-if "Skip these if testing single precision" {*-*-*} {"-mfpu=*-sp-*"} {""} } */

#include "../../../cmse-13.x"

/* Checks for saving and clearing prior to function call.  */
/* Shift on the same register as blxns.  */
/* { dg-final { scan-assembler "lsrs\t(r\[0-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
/* { dg-final { scan-assembler "lsls\t(r\[0-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
/* { dg-final { scan-assembler "vpush.64\t\{d8, d9, d10, d11, d12, d13, d14, d15\}" } } */
/* Check the right registers are cleared and none appears twice.  */
/* { dg-final { scan-assembler "clrm\t\{(r0, )?(r1, )?(r2, )?(r3, )?(r4, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
/* Check that the right number of registers is cleared and thus only one
   register is missing.  */
/* { dg-final { scan-assembler "clrm\t\{((r\[0-9\]|r10|fp|ip), ){12}APSR\}" } } */
/* Check that no cleared register is used for blxns.  */
/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[0-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
/* { dg-final { scan-assembler-not "vmov\.f32\ts0, #1\.0" } } */
/* { dg-final { scan-assembler-not "vmov\.f64\td0, #1\.0" } } */
/* { dg-final { scan-assembler-not "vmov\.f64\td1, #1\.0" } } */
/* { dg-final { scan-assembler-not "vmov\.f32\ts2, #1\.0" } } */
/* { dg-final { scan-assembler-not "vmov\.f32\ts3, #1\.0" } } */
/* { dg-final { scan-assembler "vscclrm\t\{s1, VPR\}" } } */
/* { dg-final { scan-assembler "vscclrm\t\{s4-s31, VPR\}" } } */
/* { dg-final { scan-assembler "vldm\tsp!, \{d8-d15\}" } } */
/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */

/* Now we check that we use the correct intrinsic to call.  */
/* { dg-final { scan-assembler "blxns" } } */
