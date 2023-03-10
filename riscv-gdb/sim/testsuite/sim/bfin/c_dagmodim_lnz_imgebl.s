//Original:/testcases/core/c_dagmodim_lnz_imgebl/c_dagmodim_lnz_imgebl.dsp
// Spec Reference: dagmodim l not zero & i+m >= b+l
# mach: bfin

.include "testutils.inc"
	start


INIT_R_REGS 0;

imm32 i0, 0x00001000;
imm32 i1, 0x00001100;
imm32 i2, 0x00001010;
imm32 i3, 0x00001001;

imm32 b0, 0x00001000;
imm32 b1, 0x00001000;
imm32 b2, 0x00001000;
imm32 b3, 0x00001000;

imm32 l0, 0x00000001;
imm32 l1, 0x00000002;
imm32 l2, 0x00000003;
imm32 l3, 0x00000004;

imm32 m0, 0x00000015;
imm32 m1, 0x00000016;
imm32 m2, 0x00000017;
imm32 m3, 0x00000018;

 I0 += M0;
 I1 += M1;
 I2 += M2;
 I3 += M3;
R0 = I0;
R1 = I1;
R2 = I2;
R3 = I3;
 I0 += M1;
 I1 += M2;
 I2 += M3;
 I3 += M0;
R4 = I0;
R5 = I1;
R6 = I2;
R7 = I3;

CHECKREG r0, 0x00001014;
CHECKREG r1, 0x00001114;
CHECKREG r2, 0x00001024;
CHECKREG r3, 0x00001015;
CHECKREG r4, 0x00001029;
CHECKREG r5, 0x00001129;
CHECKREG r6, 0x00001039;
CHECKREG r7, 0x00001026;

 I0 -= M2;
 I1 -= M3;
 I2 -= M0;
 I3 -= M1;
R0 = I0;
R1 = I1;
R2 = I2;
R3 = I3;
 I0 -= M3;
 I1 -= M2;
 I2 -= M1;
 I3 -= M0;
R4 = I0;
R5 = I1;
R6 = I2;
R7 = I3;
CHECKREG r0, 0x00001012;
CHECKREG r1, 0x00001111;
CHECKREG r2, 0x00001024;
CHECKREG r3, 0x00001010;
CHECKREG r4, 0x00000FFB;
CHECKREG r5, 0x000010FA;
CHECKREG r6, 0x0000100E;
CHECKREG r7, 0x00000FFF;

 I0 += M3 (BREV);
 I1 += M0 (BREV);
 I2 += M1 (BREV);
 I3 += M2 (BREV);
R0 = I0;
R1 = I1;
R2 = I2;
R3 = I3;
 I0 += M2 (BREV);
 I1 += M3 (BREV);
 I2 += M0 (BREV);
 I3 += M1 (BREV);
R4 = I0;
R5 = I1;
R6 = I2;
R7 = I3;
CHECKREG r0, 0x00000FEF;
CHECKREG r1, 0x000010E0;
CHECKREG r2, 0x0000101B;
CHECKREG r3, 0x00000FE7;
CHECKREG r4, 0x00000FFB;
CHECKREG r5, 0x000010F8;
CHECKREG r6, 0x00001001;
CHECKREG r7, 0x00000FF2;


pass
