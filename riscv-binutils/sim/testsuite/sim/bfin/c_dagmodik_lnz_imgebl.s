//Original:/testcases/core/c_dagmodik_lnz_imgebl/c_dagmodik_lnz_imgebl.dsp
// Spec Reference: dagmodik l not zero & i+m >= b+l
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

 I0 += 2;
 I1 += 2;
 I2 += 2;
 I3 += 2;
R0 = I0;
R1 = I1;
R2 = I2;
R3 = I3;
 I0 += 2;
 I1 += 2;
 I2 += 2;
 I3 += 2;
R4 = I0;
R5 = I1;
R6 = I2;
R7 = I3;
CHECKREG r0, 0x00001001;
CHECKREG r1, 0x00001100;
CHECKREG r2, 0x0000100F;
CHECKREG r3, 0x00001003;
CHECKREG r4, 0x00001002;
CHECKREG r5, 0x00001100;
CHECKREG r6, 0x0000100E;
CHECKREG r7, 0x00001001;


 I0 -= 2;
 I1 -= 2;
 I2 -= 2;
 I3 -= 2;
R0 = I0;
R1 = I1;
R2 = I2;
R3 = I3;
 I0 -= 2;
 I1 -= 2;
 I2 -= 2;
 I3 -= 2;
R4 = I0;
R5 = I1;
R6 = I2;
R7 = I3;
CHECKREG r0, 0x00001000;
CHECKREG r1, 0x000010FE;
CHECKREG r2, 0x0000100C;
CHECKREG r3, 0x00001003;
CHECKREG r4, 0x00000FFF;
CHECKREG r5, 0x000010FC;
CHECKREG r6, 0x0000100A;
CHECKREG r7, 0x00001001;

 I0 += 4;
 I1 += 4;
 I2 += 4;
 I3 += 4;
R0 = I0;
R1 = I1;
R2 = I2;
R3 = I3;
 I0 += 4;
 I1 += 4;
 I2 += 4;
 I3 += 4;
R4 = I0;
R5 = I1;
R6 = I2;
R7 = I3;
CHECKREG r0, 0x00001002;
CHECKREG r1, 0x000010FE;
CHECKREG r2, 0x0000100B;
CHECKREG r3, 0x00001001;
CHECKREG r4, 0x00001005;
CHECKREG r5, 0x00001100;
CHECKREG r6, 0x0000100C;
CHECKREG r7, 0x00001001;

 I0 -= 4;
 I0 -= 4;
 I1 -= 4;
 I2 -= 4;
 I3 -= 4;
 I1 -= 4;
 I2 -= 4;
 I3 -= 4;
R0 = I0;
R1 = I1;
R2 = I2;
R3 = I3;
CHECKREG r0, 0x00000FFE;
CHECKREG r1, 0x000010F8;
CHECKREG r2, 0x00001004;
CHECKREG r3, 0x00001001;
CHECKREG r4, 0x00001005;
CHECKREG r5, 0x00001100;
CHECKREG r6, 0x0000100C;
CHECKREG r7, 0x00001001;

 I0 -= 4;
 I1 -= 4;
 I2 -= 4;
 I3 -= 4;
 I0 -= 4;
 I1 -= 4;
 I2 -= 4;
 I3 -= 4;
R4 = I0;
R5 = I1;
R6 = I2;
R7 = I3;
CHECKREG r0, 0x00000FFE;
CHECKREG r1, 0x000010F8;
CHECKREG r2, 0x00001004;
CHECKREG r3, 0x00001001;
CHECKREG r4, 0x00000FF8;
CHECKREG r5, 0x000010F0;
CHECKREG r6, 0x00000FFF;
CHECKREG r7, 0x00001001;

// i+m = b+l
imm32 i0, 0x00001000;
imm32 i1, 0x00001100;
imm32 i2, 0x00001010;
imm32 i3, 0x00001001;

imm32 b0, 0x00001000;
imm32 b1, 0x00001100;
imm32 b2, 0x00001010;
imm32 b3, 0x00001001;

imm32 l0, 0x00000015;
imm32 l1, 0x00000016;
imm32 l2, 0x00000017;
imm32 l3, 0x00000018;

imm32 m0, 0x00000015;
imm32 m1, 0x00000016;
imm32 m2, 0x00000017;
imm32 m3, 0x00000018;

 I0 += 2;
 I1 += 2;
 I2 += 2;
 I3 += 2;
R0 = I0;
R1 = I1;
R2 = I2;
R3 = I3;
 I0 += 2;
 I1 += 2;
 I2 += 2;
 I3 += 2;
R4 = I0;
R5 = I1;
R6 = I2;
R7 = I3;
CHECKREG r0, 0x00001002;
CHECKREG r1, 0x00001102;
CHECKREG r2, 0x00001012;
CHECKREG r3, 0x00001003;
CHECKREG r4, 0x00001004;
CHECKREG r5, 0x00001104;
CHECKREG r6, 0x00001014;
CHECKREG r7, 0x00001005;


 I0 -= 2;
 I1 -= 2;
 I2 -= 2;
 I3 -= 2;
R0 = I0;
R1 = I1;
R2 = I2;
R3 = I3;
 I0 -= 2;
 I1 -= 2;
 I2 -= 2;
 I3 -= 2;
R4 = I0;
R5 = I1;
R6 = I2;
R7 = I3;
CHECKREG r0, 0x00001002;
CHECKREG r1, 0x00001102;
CHECKREG r2, 0x00001012;
CHECKREG r3, 0x00001003;
CHECKREG r4, 0x00001000;
CHECKREG r5, 0x00001100;
CHECKREG r6, 0x00001010;
CHECKREG r7, 0x00001001;

 I0 += 4;
 I1 += 4;
 I2 += 4;
 I3 += 4;
R0 = I0;
R1 = I1;
R2 = I2;
R3 = I3;
 I0 += 4;
 I1 += 4;
 I2 += 4;
 I3 += 4;
R4 = I0;
R5 = I1;
R6 = I2;
R7 = I3;
CHECKREG r0, 0x00001004;
CHECKREG r1, 0x00001104;
CHECKREG r2, 0x00001014;
CHECKREG r3, 0x00001005;
CHECKREG r4, 0x00001008;
CHECKREG r5, 0x00001108;
CHECKREG r6, 0x00001018;
CHECKREG r7, 0x00001009;

 I0 -= 4;
 I0 -= 4;
 I1 -= 4;
 I2 -= 4;
 I3 -= 4;
 I1 -= 4;
 I2 -= 4;
 I3 -= 4;
R0 = I0;
R1 = I1;
R2 = I2;
R3 = I3;
CHECKREG r0, 0x00001000;
CHECKREG r1, 0x00001100;
CHECKREG r2, 0x00001010;
CHECKREG r3, 0x00001001;
CHECKREG r4, 0x00001008;
CHECKREG r5, 0x00001108;
CHECKREG r6, 0x00001018;
CHECKREG r7, 0x00001009;

 I0 -= 4;
 I1 -= 4;
 I2 -= 4;
 I3 -= 4;
 I0 -= 4;
 I1 -= 4;
 I2 -= 4;
 I3 -= 4;
R4 = I0;
R5 = I1;
R6 = I2;
R7 = I3;
CHECKREG r0, 0x00001000;
CHECKREG r1, 0x00001100;
CHECKREG r2, 0x00001010;
CHECKREG r3, 0x00001001;
CHECKREG r4, 0x0000100D;
CHECKREG r5, 0x0000110E;
CHECKREG r6, 0x0000101F;
CHECKREG r7, 0x00001011;



pass
