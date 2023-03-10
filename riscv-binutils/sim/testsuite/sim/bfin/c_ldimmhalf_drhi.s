//Original:/testcases/core/c_ldimmhalf_drhi/c_ldimmhalf_drhi.dsp
// Spec Reference: ldimmhalf dreg hi
# mach: bfin

.include "testutils.inc"
	start



INIT_R_REGS -1;

// test Dreg
R0.H = 0x0001;
R1.H = 0x0003;
R2.H = 0x0005;
R3.H = 0x0007;
R4.H = 0x0009;
R5.H = 0x000b;
R6.H = 0x000d;
R7.H = 0x000f;
CHECKREG r0, 0x0001FFFF;
CHECKREG r1, 0x0003FFFF;
CHECKREG r2, 0x0005FFFF;
CHECKREG r3, 0x0007FFFF;
CHECKREG r4, 0x0009FFFF;
CHECKREG r5, 0x000bFFFF;
CHECKREG r6, 0x000dFFFF;
CHECKREG r7, 0x000fFFFF;

R0.H = 0x0020;
R1.H = 0x0040;
R2.H = 0x0060;
R3.H = 0x0080;
R4.H = 0x00a0;
R5.H = 0x00b0;
R6.H = 0x00c0;
R7.H = 0x00d0;
CHECKREG r0, 0x0020FFFF;
CHECKREG r1, 0x0040FFFF;
CHECKREG r2, 0x0060FFFF;
CHECKREG r3, 0x0080FFFF;
CHECKREG r4, 0x00a0FFFF;
CHECKREG r5, 0x00b0FFFF;
CHECKREG r6, 0x00c0FFFF;
CHECKREG r7, 0x00d0FFFF;

R0.H = 0x0100;
R1.H = 0x0200;
R2.H = 0x0300;
R3.H = 0x0400;
R4.H = 0x0500;
R5.H = 0x0600;
R6.H = 0x0700;
R7.H = 0x0800;
CHECKREG r0, 0x0100FFFF;
CHECKREG r1, 0x0200FFFF;
CHECKREG r2, 0x0300FFFF;
CHECKREG r3, 0x0400FFFF;
CHECKREG r4, 0x0500FFFF;
CHECKREG r5, 0x0600FFFF;
CHECKREG r6, 0x0700FFFF;
CHECKREG r7, 0x0800FFFF;

R0 = 0;
R1 = 0;
R2 = 0;
R3 = 0;
R4 = 0;
R5 = 0;
R6 = 0;
R7 = 0;
R0.H = 0x7fff;
R1.H = 0x7ffe;
R2.H = 32767;
R3.H = 32766;
R4.H = -32768;
R5.H = -32767;
CHECKREG r0, 0x7fff0000;
CHECKREG r1, 0x7ffe0000;
CHECKREG r2, 0x7fff0000;
CHECKREG r3, 0x7ffe0000;
CHECKREG r4, 0x80000000;
CHECKREG r5, 0x80010000;

pass
