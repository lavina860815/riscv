//Original:/testcases/core/c_dagmodim_lz_inc_dec/c_dagmodim_lz_inc_dec.dsp
// Spec Reference: dagmodim L=0, I incremented & decremented (by M)
# mach: bfin

.include "testutils.inc"
	start


INIT_R_REGS 0;

imm32 i0, 0x10001000;
imm32 i1, 0x02001100;
imm32 i2, 0x00301010;
imm32 i3, 0x00041001;

imm32 m0, 0x00000005;
imm32 m1, 0x00000006;
imm32 m2, 0x00000007;
imm32 m3, 0x00000008;

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

CHECKREG r0, 0x10001005;
CHECKREG r1, 0x02001106;
CHECKREG r2, 0x00301017;
CHECKREG r3, 0x00041009;
CHECKREG r4, 0x1000100B;
CHECKREG r5, 0x0200110D;
CHECKREG r6, 0x0030101F;
CHECKREG r7, 0x0004100E;

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
CHECKREG r0, 0x10001004;
CHECKREG r1, 0x02001105;
CHECKREG r2, 0x0030101A;
CHECKREG r3, 0x00041008;
CHECKREG r4, 0x10000FFC;
CHECKREG r5, 0x020010FE;
CHECKREG r6, 0x00301014;
CHECKREG r7, 0x00041003;

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
CHECKREG r0, 0x10000FF2;
CHECKREG r1, 0x020010F8;
CHECKREG r2, 0x00301011;
CHECKREG r3, 0x00041005;
CHECKREG r4, 0x10000FF4;
CHECKREG r5, 0x020010F4;
CHECKREG r6, 0x00301014;
CHECKREG r7, 0x00041000;


pass
