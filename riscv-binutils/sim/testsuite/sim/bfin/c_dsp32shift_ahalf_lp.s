//Original:/testcases/core/c_dsp32shift_ahalf_lp/c_dsp32shift_ahalf_lp.dsp
// Spec Reference: dsp32shift ashift half reg left positive
# mach: bfin

.include "testutils.inc"
	start



// Ashift : positive data, count (+)=left (half reg)
// d_lo = ashft (d_lo BY d_lo)
// RLx by RLx
imm32 r0, 0x00000000;
imm32 r1, 0x00000001;
imm32 r2, 0x00000002;
imm32 r3, 0x00000003;
imm32 r4, 0x00000004;
imm32 r5, 0x00000005;
imm32 r6, 0x00000006;
imm32 r7, 0x00000007;
R0.L = ASHIFT R0.L BY R0.L;
R1.L = ASHIFT R1.L BY R0.L;
R2.L = ASHIFT R2.L BY R0.L;
R3.L = ASHIFT R3.L BY R0.L;
R4.L = ASHIFT R4.L BY R0.L;
R5.L = ASHIFT R5.L BY R0.L;
R6.L = ASHIFT R6.L BY R0.L;
R7.L = ASHIFT R7.L BY R0.L;
CHECKREG r0, 0x00000000;
CHECKREG r1, 0x00000001;
CHECKREG r2, 0x00000002;
CHECKREG r3, 0x00000003;
CHECKREG r4, 0x00000004;
CHECKREG r5, 0x00000005;
CHECKREG r6, 0x00000006;
CHECKREG r7, 0x00000007;

imm32 r0, 0x00000001;
imm32 r1, 0x00000001;
imm32 r2, 0x00000002;
imm32 r3, 0x00000003;
imm32 r4, 0x00000004;
imm32 r5, 0x00000005;
imm32 r6, 0x00000006;
imm32 r7, 0x00000007;
R0.L = ASHIFT R0.L BY R1.L;
//rl1 = ashift (rl1 by rl1);
R2.L = ASHIFT R2.L BY R1.L;
R3.L = ASHIFT R3.L BY R1.L;
R4.L = ASHIFT R4.L BY R1.L;
R5.L = ASHIFT R5.L BY R1.L;
R6.L = ASHIFT R6.L BY R1.L;
R7.L = ASHIFT R7.L BY R1.L;
CHECKREG r0, 0x00000002;
CHECKREG r1, 0x00000001;
CHECKREG r2, 0x00000004;
CHECKREG r3, 0x00000006;
CHECKREG r4, 0x00000008;
CHECKREG r5, 0x0000000a;
CHECKREG r6, 0x0000000c;
CHECKREG r7, 0x0000000e;


imm32 r0, 0x00000001;
imm32 r1, 0x00000001;
imm32 r2, 0x0000000f;
imm32 r3, 0x00000003;
imm32 r4, 0x00000004;
imm32 r5, 0x00000005;
imm32 r6, 0x00000006;
imm32 r7, 0x00000007;
R0.L = ASHIFT R0.L BY R2.L;
R1.L = ASHIFT R1.L BY R2.L;
//rl2 = ashift (rl2 by rl2);
R3.L = ASHIFT R3.L BY R2.L;
R4.L = ASHIFT R4.L BY R2.L;
R5.L = ASHIFT R5.L BY R2.L;
R6.L = ASHIFT R6.L BY R2.L;
R7.L = ASHIFT R7.L BY R2.L;
CHECKREG r0, 0x00008000;
CHECKREG r1, 0x00008000;
CHECKREG r2, 0x0000000f;
CHECKREG r3, 0x00008000;
CHECKREG r4, 0x00000000;
CHECKREG r5, 0x00008000;
CHECKREG r6, 0x00000000;
CHECKREG r7, 0x00008000;

imm32 r0, 0x00000001;
imm32 r1, 0x00000001;
imm32 r2, 0x00000002;
imm32 r3, 0x00000010;
imm32 r4, 0x00000004;
imm32 r5, 0x00000005;
imm32 r6, 0x00000006;
imm32 r7, 0x00000007;
R0.L = ASHIFT R0.L BY R3.L;
R1.L = ASHIFT R1.L BY R3.L;
R2.L = ASHIFT R2.L BY R3.L;
//rl3 = ashift (rl3 by rl3);
R4.L = ASHIFT R4.L BY R3.L;
R5.L = ASHIFT R5.L BY R3.L;
R6.L = ASHIFT R6.L BY R3.L;
R7.L = ASHIFT R7.L BY R3.L;
CHECKREG r0, 0x00000000;
CHECKREG r1, 0x00000000;
CHECKREG r2, 0x00000000;
CHECKREG r3, 0x00000010;
CHECKREG r4, 0x00000000;
CHECKREG r5, 0x00000000;
CHECKREG r6, 0x00000000;
CHECKREG r7, 0x00000000;

// d_lo = ashft (d_hi BY d_lo)
// RHx by RLx
imm32 r0, 0x00000000;
imm32 r1, 0x00010000;
imm32 r2, 0x00020000;
imm32 r3, 0x00030000;
imm32 r4, 0x00040000;
imm32 r5, 0x00050000;
imm32 r6, 0x00060000;
imm32 r7, 0x00070000;
R0.L = ASHIFT R0.H BY R0.L;
R1.L = ASHIFT R1.H BY R0.L;
R2.L = ASHIFT R2.H BY R0.L;
R3.L = ASHIFT R3.H BY R0.L;
R4.L = ASHIFT R4.H BY R0.L;
R5.L = ASHIFT R5.H BY R0.L;
R6.L = ASHIFT R6.H BY R0.L;
R7.L = ASHIFT R7.H BY R0.L;
CHECKREG r0, 0x00000000;
CHECKREG r1, 0x00010001;
CHECKREG r2, 0x00020002;
CHECKREG r3, 0x00030003;
CHECKREG r4, 0x00040004;
CHECKREG r5, 0x00050005;
CHECKREG r6, 0x00060006;
CHECKREG r7, 0x00070007;

imm32 r0, 0x00010000;
imm32 r1, 0x00010001;
imm32 r2, 0x00020000;
imm32 r3, 0x00030000;
imm32 r4, 0x00040000;
imm32 r5, 0x00050000;
imm32 r6, 0x00060000;
imm32 r7, 0x00070000;
R0.L = ASHIFT R0.H BY R1.L;
//rl1 = ashift (rh1 by rl1);
R2.L = ASHIFT R2.H BY R1.L;
R3.L = ASHIFT R3.H BY R1.L;
R4.L = ASHIFT R4.H BY R1.L;
R5.L = ASHIFT R5.H BY R1.L;
R6.L = ASHIFT R6.H BY R1.L;
R7.L = ASHIFT R7.H BY R1.L;
CHECKREG r0, 0x00010002;
CHECKREG r1, 0x00010001;
CHECKREG r2, 0x00020004;
CHECKREG r3, 0x00030006;
CHECKREG r4, 0x00040008;
CHECKREG r5, 0x0005000a;
CHECKREG r6, 0x0006000c;
CHECKREG r7, 0x0007000e;


imm32 r0, 0x00010000;
imm32 r1, 0x00010000;
imm32 r2, 0x0002000f;
imm32 r3, 0x00030000;
imm32 r4, 0x00040000;
imm32 r5, 0x00050000;
imm32 r6, 0x00060000;
imm32 r7, 0x00070000;
R0.L = ASHIFT R0.H BY R2.L;
R1.L = ASHIFT R1.H BY R2.L;
//rl2 = ashift (rh2 by rl2);
R3.L = ASHIFT R3.H BY R2.L;
R4.L = ASHIFT R4.H BY R2.L;
R5.L = ASHIFT R5.H BY R2.L;
R6.L = ASHIFT R6.H BY R2.L;
R7.L = ASHIFT R7.H BY R2.L;
CHECKREG r0, 0x00018000;
CHECKREG r1, 0x00018000;
CHECKREG r2, 0x0002000f;
CHECKREG r3, 0x00038000;
CHECKREG r4, 0x00040000;
CHECKREG r5, 0x00058000;
CHECKREG r6, 0x00060000;
CHECKREG r7, 0x00078000;

imm32 r0, 0x00010001;
imm32 r1, 0x00010001;
imm32 r2, 0x00020002;
imm32 r3, 0x00030010;
imm32 r4, 0x00040004;
imm32 r5, 0x00050005;
imm32 r6, 0x00060006;
imm32 r7, 0x00070007;
R0.L = ASHIFT R0.H BY R3.L;
R1.L = ASHIFT R1.H BY R3.L;
R2.L = ASHIFT R2.H BY R3.L;
//rl3 = ashift (rh3 by rl3);
R4.L = ASHIFT R4.H BY R3.L;
R5.L = ASHIFT R5.H BY R3.L;
R6.L = ASHIFT R6.H BY R3.L;
R7.L = ASHIFT R7.H BY R3.L;
CHECKREG r0, 0x00010000;
CHECKREG r1, 0x00010000;
CHECKREG r2, 0x00020000;
CHECKREG r3, 0x00030010;
CHECKREG r4, 0x00040000;
CHECKREG r5, 0x00050000;
CHECKREG r6, 0x00060000;
CHECKREG r7, 0x00070000;

// d_hi = ashft (d_lo BY d_lo)
// RLx by RLx
imm32 r0, 0x00000000;
imm32 r1, 0x00000001;
imm32 r2, 0x00000002;
imm32 r3, 0x00000003;
imm32 r4, 0x00000004;
imm32 r5, 0x00000005;
imm32 r6, 0x00000006;
imm32 r7, 0x00000007;
R0.H = ASHIFT R0.L BY R0.L;
R1.H = ASHIFT R1.L BY R0.L;
R2.H = ASHIFT R2.L BY R0.L;
R3.H = ASHIFT R3.L BY R0.L;
R4.H = ASHIFT R4.L BY R0.L;
R5.H = ASHIFT R5.L BY R0.L;
R6.H = ASHIFT R6.L BY R0.L;
R7.H = ASHIFT R7.L BY R0.L;
CHECKREG r0, 0x00000000;
CHECKREG r1, 0x00010001;
CHECKREG r2, 0x00020002;
CHECKREG r3, 0x00030003;
CHECKREG r4, 0x00040004;
CHECKREG r5, 0x00050005;
CHECKREG r6, 0x00060006;
CHECKREG r7, 0x00070007;

imm32 r0, 0x00000001;
imm32 r1, 0x00000001;
imm32 r2, 0x00000002;
imm32 r3, 0x00000003;
imm32 r4, 0x00000004;
imm32 r5, 0x00000005;
imm32 r6, 0x00000006;
imm32 r7, 0x00000007;
R0.H = ASHIFT R0.L BY R1.L;
R1.H = ASHIFT R1.L BY R1.L;
R2.H = ASHIFT R2.L BY R1.L;
R3.H = ASHIFT R3.L BY R1.L;
R4.H = ASHIFT R4.L BY R1.L;
R5.H = ASHIFT R5.L BY R1.L;
R6.H = ASHIFT R6.L BY R1.L;
R7.H = ASHIFT R7.L BY R1.L;
CHECKREG r0, 0x00020001;
CHECKREG r1, 0x00020001;
CHECKREG r2, 0x00040002;
CHECKREG r3, 0x00060003;
CHECKREG r4, 0x00080004;
CHECKREG r5, 0x000a0005;
CHECKREG r6, 0x000c0006;
CHECKREG r7, 0x000e0007;


imm32 r0, 0x00000001;
imm32 r1, 0x00000001;
imm32 r2, 0x0000000f;
imm32 r3, 0x00000003;
imm32 r4, 0x00000004;
imm32 r5, 0x00000005;
imm32 r6, 0x00000006;
imm32 r7, 0x00000007;
R0.H = ASHIFT R0.L BY R2.L;
R1.H = ASHIFT R1.L BY R2.L;
//rh2 = ashift (rl2 by rl2);
R3.H = ASHIFT R3.L BY R2.L;
R4.H = ASHIFT R4.L BY R2.L;
R5.H = ASHIFT R5.L BY R2.L;
R6.H = ASHIFT R6.L BY R2.L;
R7.H = ASHIFT R7.L BY R2.L;
CHECKREG r0, 0x80000001;
CHECKREG r1, 0x80000001;
CHECKREG r2, 0x0000000f;
CHECKREG r3, 0x80000003;
CHECKREG r4, 0x00000004;
CHECKREG r5, 0x80000005;
CHECKREG r6, 0x00000006;
CHECKREG r7, 0x80000007;

imm32 r0, 0x00000001;
imm32 r1, 0x00000001;
imm32 r2, 0x00000002;
imm32 r3, 0x00000010;
imm32 r4, 0x00000004;
imm32 r5, 0x00000005;
imm32 r6, 0x00000006;
imm32 r7, 0x00000007;
R0.H = ASHIFT R0.L BY R3.L;
R1.H = ASHIFT R1.L BY R3.L;
R2.H = ASHIFT R2.L BY R3.L;
R3.H = ASHIFT R3.L BY R3.L;
R4.H = ASHIFT R4.L BY R3.L;
R5.H = ASHIFT R5.L BY R3.L;
R6.H = ASHIFT R6.L BY R3.L;
R7.H = ASHIFT R7.L BY R3.L;
CHECKREG r0, 0x00000001;
CHECKREG r1, 0x00000001;
CHECKREG r2, 0x00000002;
CHECKREG r3, 0x00000010;
CHECKREG r4, 0x00000004;
CHECKREG r5, 0x00000005;
CHECKREG r6, 0x00000006;
CHECKREG r7, 0x00000007;

// d_lo = ashft (d_hi BY d_lo)
// RHx by RLx
imm32 r0, 0x00000000;
imm32 r1, 0x00010000;
imm32 r2, 0x00020000;
imm32 r3, 0x00030000;
imm32 r4, 0x00040000;
imm32 r5, 0x00050000;
imm32 r6, 0x00060000;
imm32 r7, 0x00070000;
R0.H = ASHIFT R0.H BY R0.L;
R1.H = ASHIFT R1.H BY R0.L;
R2.H = ASHIFT R2.H BY R0.L;
R3.H = ASHIFT R3.H BY R0.L;
R4.H = ASHIFT R4.H BY R0.L;
R5.H = ASHIFT R5.H BY R0.L;
R6.H = ASHIFT R6.H BY R0.L;
R7.H = ASHIFT R7.H BY R0.L;
CHECKREG r0, 0x00000000;
CHECKREG r1, 0x00010000;
CHECKREG r2, 0x00020000;
CHECKREG r3, 0x00030000;
CHECKREG r4, 0x00040000;
CHECKREG r5, 0x00050000;
CHECKREG r6, 0x00060000;
CHECKREG r7, 0x00070000;

imm32 r0, 0x00010000;
imm32 r1, 0x00010001;
imm32 r2, 0x00020000;
imm32 r3, 0x00030000;
imm32 r4, 0x00040000;
imm32 r5, 0x00050000;
imm32 r6, 0x00060000;
imm32 r7, 0x00070000;
R0.H = ASHIFT R0.H BY R1.L;
R1.H = ASHIFT R1.H BY R1.L;
R2.H = ASHIFT R2.H BY R1.L;
R3.H = ASHIFT R3.H BY R1.L;
R4.H = ASHIFT R4.H BY R1.L;
R5.H = ASHIFT R5.H BY R1.L;
R6.H = ASHIFT R6.H BY R1.L;
R7.H = ASHIFT R7.H BY R1.L;
CHECKREG r0, 0x00020000;
CHECKREG r1, 0x00020001;
CHECKREG r2, 0x00040000;
CHECKREG r3, 0x00060000;
CHECKREG r4, 0x00080000;
CHECKREG r5, 0x000a0000;
CHECKREG r6, 0x000c0000;
CHECKREG r7, 0x000e0000;


imm32 r0, 0x00010000;
imm32 r1, 0x00010000;
imm32 r2, 0x0002000f;
imm32 r3, 0x00030000;
imm32 r4, 0x00040000;
imm32 r5, 0x00050000;
imm32 r6, 0x00060000;
imm32 r7, 0x00070000;
R0.L = ASHIFT R0.H BY R2.L;
R1.L = ASHIFT R1.H BY R2.L;
//rl2 = ashift (rh2 by rl2);
R3.L = ASHIFT R3.H BY R2.L;
R4.L = ASHIFT R4.H BY R2.L;
R5.L = ASHIFT R5.H BY R2.L;
R6.L = ASHIFT R6.H BY R2.L;
R7.L = ASHIFT R7.H BY R2.L;
CHECKREG r0, 0x00018000;
CHECKREG r1, 0x00018000;
CHECKREG r2, 0x0002000f;
CHECKREG r3, 0x00038000;
CHECKREG r4, 0x00040000;
CHECKREG r5, 0x00058000;
CHECKREG r6, 0x00060000;
CHECKREG r7, 0x00078000;

imm32 r0, 0x00010000;
imm32 r1, 0x00010000;
imm32 r2, 0x00020000;
imm32 r3, 0x00030010;
imm32 r4, 0x00040000;
imm32 r5, 0x00050000;
imm32 r6, 0x00060000;
imm32 r7, 0x00070000;
R0.H = ASHIFT R0.H BY R3.L;
R1.H = ASHIFT R1.H BY R3.L;
R2.H = ASHIFT R2.H BY R3.L;
R3.H = ASHIFT R3.H BY R3.L;
R4.H = ASHIFT R4.H BY R3.L;
R5.H = ASHIFT R5.H BY R3.L;
R6.H = ASHIFT R6.H BY R3.L;
R7.H = ASHIFT R7.H BY R3.L;
CHECKREG r0, 0x00000000;
CHECKREG r1, 0x00000000;
CHECKREG r2, 0x00000000;
CHECKREG r3, 0x00000010;
CHECKREG r4, 0x00000000;
CHECKREG r5, 0x00000000;
CHECKREG r6, 0x00000000;
CHECKREG r7, 0x00000000;

pass
