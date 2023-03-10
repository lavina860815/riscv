//Original:/testcases/core/c_dagmodik_lz_inc_dec/c_dagmodik_lz_inc_dec.dsp
// Spec Reference: dagmodik L=0, I incremented & decremented
# mach: bfin

.include "testutils.inc"
	start


INIT_R_REGS 0;

imm32 i0, 0x00001000;
imm32 i1, 0x00001100;
imm32 i2, 0x00001200;
imm32 i3, 0x00001300;
imm32 m0, 0x00000000;
imm32 m1, 0x00000110;
imm32 m2, 0x00000210;
imm32 m3, 0x00000310;

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
CHECKREG r2, 0x00001202;
CHECKREG r3, 0x00001302;
CHECKREG r4, 0x00001004;
CHECKREG r5, 0x00001104;
CHECKREG r6, 0x00001204;
CHECKREG r7, 0x00001304;


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
CHECKREG r2, 0x00001202;
CHECKREG r3, 0x00001302;
CHECKREG r4, 0x00001000;
CHECKREG r5, 0x00001100;
CHECKREG r6, 0x00001200;
CHECKREG r7, 0x00001300;

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
CHECKREG r2, 0x00001204;
CHECKREG r3, 0x00001304;
CHECKREG r4, 0x00001008;
CHECKREG r5, 0x00001108;
CHECKREG r6, 0x00001208;
CHECKREG r7, 0x00001308;

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
CHECKREG r2, 0x00001200;
CHECKREG r3, 0x00001300;
CHECKREG r4, 0x00001008;
CHECKREG r5, 0x00001108;
CHECKREG r6, 0x00001208;
CHECKREG r7, 0x00001308;

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
CHECKREG r2, 0x00001200;
CHECKREG r3, 0x00001300;
CHECKREG r4, 0x00000FF8;
CHECKREG r5, 0x000010F8;
CHECKREG r6, 0x000011F8;
CHECKREG r7, 0x000012F8;



pass
