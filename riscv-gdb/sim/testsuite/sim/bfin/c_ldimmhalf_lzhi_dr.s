//Original:/testcases/core/c_ldimmhalf_lzhi_dr/c_ldimmhalf_lzhi_dr.dsp
// Spec Reference: ldimmhalf lz & hi dreg
# mach: bfin

.include "testutils.inc"
	start


INIT_R_REGS -1;


// test Dreg
R0 = 0x0001 (Z);
R0.H = 0x0000;
R1 = 0x0003 (Z);
R1.H = 0x0002;
R2 = 0x0005 (Z);
R2.H = 0x0004;
R3 = 0x0007 (Z);
R3.H = 0x0006;
R4 = 0x0009 (Z);
R4.H = 0x0008;
R5 = 0x000b (Z);
R5.H = 0x000a;
R6 = 0x000d (Z);
R6.H = 0x000c;
R7 = 0x000f (Z);
R7.H = 0x000e;
CHECKREG r0, 0x00000001;
CHECKREG r1, 0x00020003;
CHECKREG r2, 0x00040005;
CHECKREG r3, 0x00060007;
CHECKREG r4, 0x00080009;
CHECKREG r5, 0x000a000b;
CHECKREG r6, 0x000c000d;
CHECKREG r7, 0x000e000f;

R0 = 0x0010 (Z);
R0.H = 0x0000;
R1 = 0x0030 (Z);
R1.H = 0x0020;
R2 = 0x0050 (Z);
R2.H = 0x0040;
R3 = 0x0070 (Z);
R3.H = 0x0060;
R4 = 0x0090 (Z);
R4.H = 0x0080;
R5 = 0x00b0 (Z);
R5.H = 0x00a0;
R6 = 0x00d0 (Z);
R6.H = 0x00c0;
R7 = 0x00f0 (Z);
R7.H = 0x00e0;
CHECKREG r0, 0x00000010;
CHECKREG r1, 0x00200030;
CHECKREG r2, 0x00400050;
CHECKREG r3, 0x00600070;
CHECKREG r4, 0x00800090;
CHECKREG r5, 0x00a000b0;
CHECKREG r6, 0x00c000d0;
CHECKREG r7, 0x00e000f0;

R0 = 0x0100 (Z);
R0.H = 0x0000;
R1 = 0x0300 (Z);
R1.H = 0x0200;
R2 = 0x0500 (Z);
R2.H = 0x0400;
R3 = 0x0700 (Z);
R3.H = 0x0600;
R4 = 0x0900 (Z);
R4.H = 0x0800;
R5 = 0x0b00 (Z);
R5.H = 0x0a00;
R6 = 0x0d00 (Z);
R6.H = 0x0c00;
R7 = 0x0f00 (Z);
R7.H = 0x0e00;
CHECKREG r0, 0x00000100;
CHECKREG r1, 0x02000300;
CHECKREG r2, 0x04000500;
CHECKREG r3, 0x06000700;
CHECKREG r4, 0x08000900;
CHECKREG r5, 0x0a000b00;
CHECKREG r6, 0x0c000d00;
CHECKREG r7, 0x0e000f00;

R0 = 0x1000 (Z);
R0.H = 0x0000;
R1 = 0x3000 (Z);
R1.H = 0x2000;
R2 = 0x5000 (Z);
R2.H = 0x4000;
R3 = 0x7000 (Z);
R3.H = 0x6000;
R4 = 0x9000 (Z);
R4.H = 0x8000;
R5 = 0xb000 (Z);
R5.H = 0xa000;
R6 = 0xd000 (Z);
R6.H = 0xc000;
R7 = 0xf000 (Z);
R7.H = 0xe000;
CHECKREG r0, 0x00001000;
CHECKREG r1, 0x20003000;
CHECKREG r2, 0x40005000;
CHECKREG r3, 0x60007000;
CHECKREG r4, 0x80009000;
CHECKREG r5, 0xa000b000;
CHECKREG r6, 0xc000d000;
CHECKREG r7, 0xe000f000;

pass
