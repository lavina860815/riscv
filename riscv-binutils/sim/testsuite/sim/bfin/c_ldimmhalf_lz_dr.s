//Original:/testcases/core/c_ldimmhalf_lz_dr/c_ldimmhalf_lz_dr.dsp
// Spec Reference: ldimmhalf lz dreg
# mach: bfin

.include "testutils.inc"
	start


INIT_R_REGS -1;


// test Dreg
R0 = 0x0001 (Z);
R1 = 0x0003 (Z);
R2 = 0x0005 (Z);
R3 = 0x0007 (Z);
R4 = 0x0009 (Z);
R5 = 0x000b (Z);
R6 = 0x000d (Z);
R7 = 0x000f (Z);
CHECKREG r0, 0x00000001;
CHECKREG r1, 0x00000003;
CHECKREG r2, 0x00000005;
CHECKREG r3, 0x00000007;
CHECKREG r4, 0x00000009;
CHECKREG r5, 0x0000000b;
CHECKREG r6, 0x0000000d;
CHECKREG r7, 0x0000000f;

R0 = 0x0010 (Z);
R1 = 0x0030 (Z);
R2 = 0x0050 (Z);
R3 = 0x0070 (Z);
R4 = 0x0090 (Z);
R5 = 0x00b0 (Z);
R6 = 0x00d0 (Z);
R7 = 0x00f0 (Z);
CHECKREG r0, 0x00000010;
CHECKREG r1, 0x00000030;
CHECKREG r2, 0x00000050;
CHECKREG r3, 0x00000070;
CHECKREG r4, 0x00000090;
CHECKREG r5, 0x000000b0;
CHECKREG r6, 0x000000d0;
CHECKREG r7, 0x000000f0;

R0 = 0x0100 (Z);
R1 = 0x0300 (Z);
R2 = 0x0500 (Z);
R3 = 0x0700 (Z);
R4 = 0x0900 (Z);
R5 = 0x0b00 (Z);
R6 = 0x0d00 (Z);
R7 = 0x0f00 (Z);
CHECKREG r0, 0x00000100;
CHECKREG r1, 0x00000300;
CHECKREG r2, 0x00000500;
CHECKREG r3, 0x00000700;
CHECKREG r4, 0x00000900;
CHECKREG r5, 0x00000b00;
CHECKREG r6, 0x00000d00;
CHECKREG r7, 0x00000f00;

R0 = 0x1000 (Z);
R1 = 0x3000 (Z);
R2 = 0x5000 (Z);
R3 = 0x7000 (Z);
R4 = 0x9000 (Z);
R5 = 0xb000 (Z);
R6 = 0xd000 (Z);
R7 = 0xf000 (Z);
CHECKREG r0, 0x00001000;
CHECKREG r1, 0x00003000;
CHECKREG r2, 0x00005000;
CHECKREG r3, 0x00007000;
CHECKREG r4, 0x00009000;
CHECKREG r5, 0x0000b000;
CHECKREG r6, 0x0000d000;
CHECKREG r7, 0x0000f000;

pass
