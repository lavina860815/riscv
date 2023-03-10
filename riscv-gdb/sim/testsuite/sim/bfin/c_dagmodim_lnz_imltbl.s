//Original:/testcases/core/c_dagmodim_lnz_imltbl/c_dagmodim_lnz_imltbl.dsp
// Spec Reference: dagmodim l not zero & i+m < b
# mach: bfin

.include "testutils.inc"
	start


INIT_R_REGS 0;

imm32 i0, 0x00001000;
imm32 i1, 0x00001100;
imm32 i2, 0x00001010;
imm32 i3, 0x00001001;

imm32 b0, 0x0000110e;
imm32 b1, 0x0000110c;
imm32 b2, 0x0000110a;
imm32 b3, 0x00001108;

imm32 l0, 0x000000a1;
imm32 l1, 0x000000b2;
imm32 l2, 0x000000c3;
imm32 l3, 0x000000d4;

imm32 m0, 0x00000005;
imm32 m1, 0x00000004;
imm32 m2, 0x00000003;
imm32 m3, 0x00000002;

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
CHECKREG r0, 0x00001005;
CHECKREG r1, 0x00001104;
CHECKREG r2, 0x00001013;
CHECKREG r3, 0x00001003;
CHECKREG r4, 0x00001009;
CHECKREG r5, 0x00001107;
CHECKREG r6, 0x00001015;
CHECKREG r7, 0x00001008;


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
CHECKREG r0, 0x000010A7;
CHECKREG r1, 0x000011B7;
CHECKREG r2, 0x000010D3;
CHECKREG r3, 0x000010D8;
CHECKREG r4, 0x00001146;
CHECKREG r5, 0x000011B4;
CHECKREG r6, 0x00001192;
CHECKREG r7, 0x000011A7;

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
CHECKREG r0, 0x00001145;
CHECKREG r1, 0x000011B3;
CHECKREG r2, 0x00001196;
CHECKREG r3, 0x000011A5;
CHECKREG r4, 0x00001146;
CHECKREG r5, 0x000011B0;
CHECKREG r6, 0x00001190;
CHECKREG r7, 0x000011A3;



pass
