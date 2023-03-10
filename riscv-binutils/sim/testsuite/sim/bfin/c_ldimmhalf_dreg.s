//Original:/testcases/core/c_ldimmhalf_dreg/c_ldimmhalf_dreg.dsp
// Spec Reference: ldimmhalf dreg imm16
# mach: bfin

.include "testutils.inc"
	start



INIT_R_REGS -1;

// test Dreg
R0 = 0x0123 (X);
R1 = 0x1234 (X);
R2 = 0x2345 (X);
R3 = 0x3456 (X);
R4 = 0x4567 (X);
R5 = 0x5678 (X);
R6 = 0x6789 (X);
R7 = 0x789a (X);
CHECKREG r0, 0x00000123;
CHECKREG r1, 0x00001234;
CHECKREG r2, 0x00002345;
CHECKREG r3, 0x00003456;
CHECKREG r4, 0x00004567;
CHECKREG r5, 0x00005678;
CHECKREG r6, 0x00006789;
CHECKREG r7, 0x0000789A;

R0 = -32768 (X);
R1 = -1111 (X);
R2 = -2222 (X);
R3 = -3333 (X);
R4 = -4444 (X);
R5 = -5555 (X);
R6 = -6666 (X);
R7 = -7777 (X);
CHECKREG r0, 0xFFFF8000;
CHECKREG r1, 0xFFFFFBA9;
CHECKREG r2, 0xFFFFF752;
CHECKREG r3, 0xFFFFF2FB;
CHECKREG r4, 0xFFFFEEA4;
CHECKREG r5, 0xFFFFEA4D;
CHECKREG r6, 0xFFFFE5F6;
CHECKREG r7, 0xFFFFE19F;

R0 = 0x7fff (X);
R1 = 0x7ffe (X);
R2 = 32767 (X);
R3 = 32766 (X);
R4 = -32768 (X);
R5 = -32767 (X);
CHECKREG r0, 0x00007fff;
CHECKREG r1, 0x00007ffe;
CHECKREG r2, 0x00007fff;
CHECKREG r3, 0x00007ffe;
CHECKREG r4, 0xFFFF8000;
CHECKREG r5, 0xFFFF8001;

pass
