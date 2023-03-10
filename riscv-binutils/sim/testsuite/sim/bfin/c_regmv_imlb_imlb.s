//Original:/proj/frio/dv/testcases/core/c_regmv_imlb_imlb/c_regmv_imlb_imlb.dsp
// Spec Reference: regmv imlb-imlb
# mach: bfin

.include "testutils.inc"
	start

// initialize source regs
	imm32 i0, 0x11111111;
	imm32 i1, 0x22222222;
	imm32 i2, 0x33333333;
	imm32 i3, 0x44444444;
	imm32 m0, 0x55555555;
	imm32 m1, 0x66666666;
	imm32 m2, 0x77777777;
	imm32 m3, 0x88888888;
	imm32 l0, 0x99999999;
	imm32 l1, 0xAAAAAAAA;
	imm32 l2, 0xBBBBBBBB;
	imm32 l3, 0xCCCCCCCC;
	imm32 b0, 0xDDDDDDDD;
	imm32 b1, 0xEEEEEEEE;
	imm32 b2, 0xFFFFFFFF;
	imm32 b3, 0x12345667;

//*******************i-i & m-m, i-m & m-i,  l-l & b-b, l-b & b-l
// i to i & m to m
	I0 = I0;
	I1 = I1;
	I2 = I2;
	I3 = I3;
	M0 = M0;
	M1 = M1;
	M2 = M2;
	M3 = M3;

	I0 = I1;
	I1 = I2;
	I2 = I3;
	I3 = I0;
	M0 = M1;
	M1 = M2;
	M2 = M3;
	M3 = M0;

	R0 = I0;
	R1 = I1;
	R2 = I2;
	R3 = I3;
	R4 = M0;
	R5 = M1;
	R6 = M2;
	R7 = M3;

	CHECKREG r0, 0x22222222;
	CHECKREG r1, 0x33333333;
	CHECKREG r2, 0x44444444;
	CHECKREG r3, 0x22222222;
	CHECKREG r4, 0x66666666;
	CHECKREG r5, 0x77777777;
	CHECKREG r6, 0x88888888;
	CHECKREG r7, 0x66666666;

	I0 = I2;
	I1 = I3;
	I2 = I0;
	I3 = I1;
	M0 = M2;
	M1 = M3;
	M2 = M0;
	M3 = M1;

	R0 = I0;
	R1 = I1;
	R2 = I2;
	R3 = I3;
	R4 = M0;
	R5 = M1;
	R6 = M2;
	R7 = M3;

	CHECKREG r0, 0x44444444;
	CHECKREG r1, 0x22222222;
	CHECKREG r2, 0x44444444;
	CHECKREG r3, 0x22222222;
	CHECKREG r4, 0x88888888;
	CHECKREG r5, 0x66666666;
	CHECKREG r6, 0x88888888;
	CHECKREG r7, 0x66666666;

	I0 = I3;
	I1 = I0;
	I2 = I1;
	I3 = I2;
	M0 = M3;
	M1 = M0;
	M2 = M1;
	M3 = M2;

	R0 = I0;
	R1 = I1;
	R2 = I2;
	R3 = I3;
	R4 = M0;
	R5 = M1;
	R6 = M2;
	R7 = M3;

	CHECKREG r0, 0x22222222;
	CHECKREG r1, 0x22222222;
	CHECKREG r2, 0x22222222;
	CHECKREG r3, 0x22222222;
	CHECKREG r4, 0x66666666;
	CHECKREG r5, 0x66666666;
	CHECKREG r6, 0x66666666;
	CHECKREG r7, 0x66666666;

	imm32 i0, 0xa1111110;
	imm32 i1, 0xb2222220;
	imm32 i2, 0xc3333330;
	imm32 i3, 0xd4444440;
	imm32 m0, 0xe5555550;
	imm32 m1, 0xf6666660;
	imm32 m2, 0x17777770;
	imm32 m3, 0x28888888;

// m to i & i to m
	I0 = M0;
	I1 = M1;
	I2 = M2;
	I3 = M3;
	M0 = I0;
	M1 = I1;
	M2 = I2;
	M3 = I3;

	R0 = I0;
	R1 = I1;
	R2 = I2;
	R3 = I3;
	R4 = M0;
	R5 = M1;
	R6 = M2;
	R7 = M3;

	CHECKREG r0, 0xE5555550;
	CHECKREG r1, 0xF6666660;
	CHECKREG r2, 0x17777770;
	CHECKREG r3, 0x28888888;
	CHECKREG r4, 0xE5555550;
	CHECKREG r5, 0xF6666660;
	CHECKREG r6, 0x17777770;
	CHECKREG r7, 0x28888888;

	I0 = M1;
	I1 = M2;
	I2 = M3;
	I3 = M0;
	M0 = I1;
	M1 = I2;
	M2 = I3;
	M3 = I0;

	R0 = I0;
	R1 = I1;
	R2 = I2;
	R3 = I3;
	R4 = M0;
	R5 = M1;
	R6 = M2;
	R7 = M3;

	CHECKREG r0, 0xF6666660;
	CHECKREG r1, 0x17777770;
	CHECKREG r2, 0x28888888;
	CHECKREG r3, 0xE5555550;
	CHECKREG r4, 0x17777770;
	CHECKREG r5, 0x28888888;
	CHECKREG r6, 0xE5555550;
	CHECKREG r7, 0xF6666660;

	I0 = M2;
	I1 = M3;
	I2 = M0;
	I3 = M1;
	M0 = I2;
	M1 = I3;
	M2 = I0;
	M3 = I1;

	R0 = I0;
	R1 = I1;
	R2 = I2;
	R3 = I3;
	R4 = M0;
	R5 = M1;
	R6 = M2;
	R7 = M3;

	CHECKREG r0, 0xE5555550;
	CHECKREG r1, 0xF6666660;
	CHECKREG r2, 0x17777770;
	CHECKREG r3, 0x28888888;
	CHECKREG r4, 0x17777770;
	CHECKREG r5, 0x28888888;
	CHECKREG r6, 0xE5555550;
	CHECKREG r7, 0xF6666660;

	I0 = M3;
	I1 = M0;
	I2 = M1;
	I3 = M2;
	M0 = I3;
	M1 = I0;
	M2 = I1;
	M3 = I2;

	R0 = I0;
	R1 = I1;
	R2 = I2;
	R3 = I3;
	R4 = M0;
	R5 = M1;
	R6 = M2;
	R7 = M3;

	CHECKREG r0, 0xF6666660;
	CHECKREG r1, 0x17777770;
	CHECKREG r2, 0x28888888;
	CHECKREG r3, 0xE5555550;
	CHECKREG r4, 0xE5555550;
	CHECKREG r5, 0xF6666660;
	CHECKREG r6, 0x17777770;
	CHECKREG r7, 0x28888888;

// l to l & b to b
	L0 = L0;
	L1 = L1;
	L2 = L2;
	L3 = L3;
	B0 = B0;
	B1 = B1;
	B2 = B2;
	B3 = B3;

	L0 = L1;
	L1 = L2;
	L2 = L3;
	L3 = L0;
	B0 = B1;
	B1 = B2;
	B2 = B3;
	B3 = B0;

	R0 = L0;
	R1 = L1;
	R2 = L2;
	R3 = L3;
	R4 = B0;
	R5 = B1;
	R6 = B2;
	R7 = B3;

	CHECKREG r0, 0xAAAAAAAA;
	CHECKREG r1, 0xBBBBBBBB;
	CHECKREG r2, 0xCCCCCCCC;
	CHECKREG r3, 0xAAAAAAAA;
	CHECKREG r4, 0xEEEEEEEE;
	CHECKREG r5, 0xFFFFFFFF;
	CHECKREG r6, 0x12345667;
	CHECKREG r7, 0xEEEEEEEE;

	L0 = L2;
	L1 = L3;
	L2 = L0;
	L3 = L1;
	B0 = B2;
	B1 = B3;
	B2 = B0;
	B3 = B1;

	R0 = L0;
	R1 = L1;
	R2 = L2;
	R3 = L3;
	R4 = B0;
	R5 = B1;
	R6 = B2;
	R7 = B3;

	CHECKREG r0, 0xCCCCCCCC;
	CHECKREG r1, 0xAAAAAAAA;
	CHECKREG r2, 0xCCCCCCCC;
	CHECKREG r3, 0xAAAAAAAA;
	CHECKREG r4, 0x12345667;
	CHECKREG r5, 0xEEEEEEEE;
	CHECKREG r6, 0x12345667;
	CHECKREG r7, 0xEEEEEEEE;

	imm32 l0, 0x09499091;
	imm32 l1, 0x0A55A0A2;
	imm32 l2, 0x0B6BB0B3;
	imm32 l3, 0x0C7CC0C4;
	imm32 b0, 0x0D8DD0D5;
	imm32 b1, 0x0E9EE0E6;
	imm32 b2, 0x0F0FF0F7;
	imm32 b3, 0x12145068;

	L0 = L3;
	L1 = L0;
	L2 = L1;
	L3 = L2;
	B0 = B3;
	B1 = B0;
	B2 = B1;
	B3 = B2;

	R0 = L0;
	R1 = L1;
	R2 = L2;
	R3 = L3;
	R4 = B0;
	R5 = B1;
	R6 = B2;
	R7 = B3;

	CHECKREG r0, 0x0C7CC0C4;
	CHECKREG r1, 0x0C7CC0C4;
	CHECKREG r2, 0x0C7CC0C4;
	CHECKREG r3, 0x0C7CC0C4;
	CHECKREG r4, 0x12145068;
	CHECKREG r5, 0x12145068;
	CHECKREG r6, 0x12145068;
	CHECKREG r7, 0x12145068;

// b to l & l to b
	L0 = B0;
	L1 = B1;
	L2 = B2;
	L3 = B3;
	B0 = L0;
	B1 = L1;
	B2 = L2;
	B3 = L3;

	R0 = I0;
	R1 = I1;
	R2 = I2;
	R3 = I3;
	R4 = M0;
	R5 = M1;
	R6 = M2;
	R7 = M3;

	CHECKREG r0, 0xF6666660;
	CHECKREG r1, 0x17777770;
	CHECKREG r2, 0x28888888;
	CHECKREG r3, 0xE5555550;
	CHECKREG r4, 0xE5555550;
	CHECKREG r5, 0xF6666660;
	CHECKREG r6, 0x17777770;
	CHECKREG r7, 0x28888888;

	imm32 l0, 0x01909910;
	imm32 l1, 0x12A11220;
	imm32 l2, 0x23B25530;
	imm32 l3, 0x34C36640;
	imm32 b0, 0x45D47750;
	imm32 b1, 0x56E58860;
	imm32 b2, 0x67F66676;
	imm32 b3, 0x78375680;

	L0 = B1;
	L1 = B2;
	L2 = B3;
	L3 = B0;
	B0 = L1;
	B1 = L2;
	B2 = L3;
	B3 = L0;

	R0 = L0;
	R1 = L1;
	R2 = L2;
	R3 = L3;
	R4 = B0;
	R5 = B1;
	R6 = B2;
	R7 = B3;

	CHECKREG r0, 0x56E58860;
	CHECKREG r1, 0x67F66676;
	CHECKREG r2, 0x78375680;
	CHECKREG r3, 0x45D47750;
	CHECKREG r4, 0x67F66676;
	CHECKREG r5, 0x78375680;
	CHECKREG r6, 0x45D47750;
	CHECKREG r7, 0x56E58860;

	imm32 l0, 0x09909990;
	imm32 l1, 0x1AA11230;
	imm32 l2, 0x2BB25550;
	imm32 l3, 0x3CC36660;
	imm32 b0, 0x4DD47770;
	imm32 b1, 0x5EE58880;
	imm32 b2, 0x6FF66666;
	imm32 b3, 0x72375660;

	L0 = B2;
	L1 = B3;
	L2 = B0;
	L3 = B1;
	B0 = L2;
	B1 = L3;
	B2 = L0;
	B3 = L1;

	R0 = L0;
	R1 = L1;
	R2 = L2;
	R3 = L3;
	R4 = B0;
	R5 = B1;
	R6 = B2;
	R7 = B3;

	CHECKREG r0, 0x6FF66666;
	CHECKREG r1, 0x72375660;
	CHECKREG r2, 0x4DD47770;
	CHECKREG r3, 0x5EE58880;
	CHECKREG r4, 0x4DD47770;
	CHECKREG r5, 0x5EE58880;
	CHECKREG r6, 0x6FF66666;
	CHECKREG r7, 0x72375660;

	L0 = B3;
	L1 = B0;
	L2 = B1;
	L3 = B2;
	B0 = L3;
	B1 = L0;
	B2 = L1;
	B3 = L2;

	R0 = L0;
	R1 = L1;
	R2 = L2;
	R3 = L3;
	R4 = B0;
	R5 = B1;
	R6 = B2;
	R7 = B3;

	CHECKREG r0, 0x72375660;
	CHECKREG r1, 0x4DD47770;
	CHECKREG r2, 0x5EE58880;
	CHECKREG r3, 0x6FF66666;
	CHECKREG r4, 0x6FF66666;
	CHECKREG r5, 0x72375660;
	CHECKREG r6, 0x4DD47770;
	CHECKREG r7, 0x5EE58880;

	imm32 l0, 0x09999990;
	imm32 l1, 0x1AAAAAA0;
	imm32 l2, 0x2BBBBBB0;
	imm32 l3, 0x3CCCCCC0;
	imm32 b0, 0x4DDDDDD0;
	imm32 b1, 0x5EEEEEE0;
	imm32 b2, 0x6FFFFFF0;
	imm32 b3, 0x72345660;

//*******************l-i & l-m, b-i & b-m,  i-l & i-b, m-l & m-b
// l to i & l to m
	I0 = L0;
	I1 = L1;
	I2 = L2;
	I3 = L3;
	M0 = L0;
	M1 = L1;
	M2 = L2;
	M3 = L3;

	R0 = I0;
	R1 = I1;
	R2 = I2;
	R3 = I3;
	R4 = M0;
	R5 = M1;
	R6 = M2;
	R7 = M3;

	CHECKREG r0, 0x09999990;
	CHECKREG r1, 0x1AAAAAA0;
	CHECKREG r2, 0x2BBBBBB0;
	CHECKREG r3, 0x3CCCCCC0;
	CHECKREG r4, 0x09999990;
	CHECKREG r5, 0x1AAAAAA0;
	CHECKREG r6, 0x2BBBBBB0;
	CHECKREG r7, 0x3CCCCCC0;

	I0 = L1;
	I1 = L2;
	I2 = L3;
	I3 = L0;
	M0 = L1;
	M1 = L2;
	M2 = L3;
	M3 = L0;

	R0 = I0;
	R1 = I1;
	R2 = I2;
	R3 = I3;
	R4 = M0;
	R5 = M1;
	R6 = M2;
	R7 = M3;

	CHECKREG r0, 0x1AAAAAA0;
	CHECKREG r1, 0x2BBBBBB0;
	CHECKREG r2, 0x3CCCCCC0;
	CHECKREG r3, 0x09999990;
	CHECKREG r4, 0x1AAAAAA0;
	CHECKREG r5, 0x2BBBBBB0;
	CHECKREG r6, 0x3CCCCCC0;
	CHECKREG r7, 0x09999990;

	I0 = L2;
	I1 = L3;
	I2 = L0;
	I3 = L1;
	M0 = L2;
	M1 = L3;
	M2 = L0;
	M3 = L1;

	R4 = I0;
	R5 = I1;
	R6 = I2;
	R7 = I3;
	R4 = M0;
	R5 = M1;
	R6 = M2;
	R7 = M3;

	CHECKREG r0, 0x1AAAAAA0;
	CHECKREG r1, 0x2BBBBBB0;
	CHECKREG r2, 0x3CCCCCC0;
	CHECKREG r3, 0x09999990;
	CHECKREG r4, 0x2BBBBBB0;
	CHECKREG r5, 0x3CCCCCC0;
	CHECKREG r6, 0x09999990;
	CHECKREG r7, 0x1AAAAAA0;

	I0 = L3;
	I1 = L0;
	I2 = L1;
	I3 = L2;
	M0 = L3;
	M1 = L0;
	M2 = L1;
	M3 = L2;

	R0 = I0;
	R1 = I1;
	R2 = I2;
	R3 = I3;
	R4 = M0;
	R5 = M1;
	R6 = M2;
	R7 = M3;

	CHECKREG r0, 0x3CCCCCC0;
	CHECKREG r1, 0x09999990;
	CHECKREG r2, 0x1AAAAAA0;
	CHECKREG r3, 0x2BBBBBB0;
	CHECKREG r4, 0x3CCCCCC0;
	CHECKREG r5, 0x09999990;
	CHECKREG r6, 0x1AAAAAA0;
	CHECKREG r7, 0x2BBBBBB0;

// b to i & b to m
	I0 = B0;
	I1 = B1;
	I2 = B2;
	I3 = B3;
	M0 = B0;
	M1 = B1;
	M2 = B2;
	M3 = B3;

	R0 = I0;
	R1 = I1;
	R2 = I2;
	R3 = I3;
	R4 = M0;
	R5 = M1;
	R6 = M2;
	R7 = M3;

	CHECKREG r0, 0x4DDDDDD0;
	CHECKREG r1, 0x5EEEEEE0;
	CHECKREG r2, 0x6FFFFFF0;
	CHECKREG r3, 0x72345660;
	CHECKREG r4, 0x4DDDDDD0;
	CHECKREG r5, 0x5EEEEEE0;
	CHECKREG r6, 0x6FFFFFF0;
	CHECKREG r7, 0x72345660;

	I0 = B1;
	I1 = B2;
	I2 = B3;
	I3 = B0;
	M0 = B1;
	M1 = B2;
	M2 = B3;
	M3 = B0;

	R0 = I0;
	R1 = I1;
	R2 = I2;
	R3 = I3;
	R4 = M0;
	R5 = M1;
	R6 = M2;
	R7 = M3;

	CHECKREG r0, 0x5EEEEEE0;
	CHECKREG r1, 0x6FFFFFF0;
	CHECKREG r2, 0x72345660;
	CHECKREG r3, 0x4DDDDDD0;
	CHECKREG r4, 0x5EEEEEE0;
	CHECKREG r5, 0x6FFFFFF0;
	CHECKREG r6, 0x72345660;
	CHECKREG r7, 0x4DDDDDD0;

	I0 = B2;
	I1 = B3;
	I2 = B0;
	I3 = B1;
	M0 = B2;
	M1 = B3;
	M2 = B0;
	M3 = B1;

	R0 = I0;
	R1 = I1;
	R2 = I2;
	R3 = I3;
	R4 = M0;
	R5 = M1;
	R6 = M2;
	R7 = M3;

	CHECKREG r0, 0x6FFFFFF0;
	CHECKREG r1, 0x72345660;
	CHECKREG r2, 0x4DDDDDD0;
	CHECKREG r3, 0x5EEEEEE0;
	CHECKREG r4, 0x6FFFFFF0;
	CHECKREG r5, 0x72345660;
	CHECKREG r6, 0x4DDDDDD0;
	CHECKREG r7, 0x5EEEEEE0;

	I0 = B3;
	I1 = B0;
	I2 = B1;
	I3 = B2;
	M0 = B3;
	M1 = B0;
	M2 = B1;
	M3 = B2;

	P1 = I1;
	P2 = I2;
	P3 = I3;
	P4 = M0;
	P5 = M1;
	FP = M2;
	SP = M3;

	CHECKREG p1, 0x4DDDDDD0;
	CHECKREG p2, 0x5EEEEEE0;
	CHECKREG p3, 0x6FFFFFF0;
	CHECKREG p4, 0x72345660;
	CHECKREG p5, 0x4DDDDDD0;
	CHECKREG fp, 0x5EEEEEE0;
	CHECKREG sp, 0x6FFFFFF0;

// i to l & i to b
	imm32 i0, 0x09999990;
	imm32 i1, 0x1AAAAAA0;
	imm32 i2, 0x2BBBBBB0;
	imm32 i3, 0x3CCCCCC0;

	L0 = I0;
	L1 = I1;
	L2 = I2;
	L3 = I3;
	B0 = I0;
	B1 = I1;
	B2 = I2;
	B3 = I3;

	L0 = I1;
	L1 = I2;
	L2 = I3;
	L3 = I0;
	B0 = I1;
	B1 = I2;
	B2 = I3;
	B3 = I0;

	R0 = L0;
	R1 = L1;
	R2 = L2;
	R3 = L3;
	R4 = B0;
	R5 = B1;
	R6 = B2;
	R7 = B3;

	CHECKREG r0, 0x1AAAAAA0;
	CHECKREG r1, 0x2BBBBBB0;
	CHECKREG r2, 0x3CCCCCC0;
	CHECKREG r3, 0x09999990;
	CHECKREG r4, 0x1AAAAAA0;
	CHECKREG r5, 0x2BBBBBB0;
	CHECKREG r6, 0x3CCCCCC0;
	CHECKREG r7, 0x09999990;

	L0 = I2;
	L1 = I3;
	L2 = I0;
	L3 = I1;
	B0 = I2;
	B1 = I3;
	B2 = I0;
	B3 = I1;

	R0 = L0;
	R1 = L1;
	R2 = L2;
	R3 = L3;
	R4 = B0;
	R5 = B1;
	R6 = B2;
	R7 = B3;

	CHECKREG r0, 0x2BBBBBB0;
	CHECKREG r1, 0x3CCCCCC0;
	CHECKREG r2, 0x09999990;
	CHECKREG r3, 0x1AAAAAA0;
	CHECKREG r4, 0x2BBBBBB0;
	CHECKREG r5, 0x3CCCCCC0;
	CHECKREG r6, 0x09999990;
	CHECKREG r7, 0x1AAAAAA0;

	imm32 l0, 0x09499091;
	imm32 l1, 0x0A55A0A2;
	imm32 l2, 0x0B6BB0B3;
	imm32 l3, 0x0C7CC0C4;
	imm32 b0, 0x0D8DD0D5;
	imm32 b1, 0x0E9EE0E6;
	imm32 b2, 0x0F0FF0F7;
	imm32 b3, 0x12145068;

	L0 = I3;
	L1 = I0;
	L2 = I1;
	L3 = I2;
	B0 = I3;
	B1 = I0;
	B2 = I1;
	B3 = I2;

	R0 = L0;
	R1 = L1;
	R2 = L2;
	R3 = L3;
	R4 = B0;
	R5 = B1;
	R6 = B2;
	R7 = B3;

	CHECKREG r0, 0x3CCCCCC0;
	CHECKREG r1, 0x09999990;
	CHECKREG r2, 0x1AAAAAA0;
	CHECKREG r3, 0x2BBBBBB0;
	CHECKREG r4, 0x3CCCCCC0;
	CHECKREG r5, 0x09999990;
	CHECKREG r6, 0x1AAAAAA0;
	CHECKREG r7, 0x2BBBBBB0;

// m to l & m to b
	imm32 m0, 0x4DDDDDD0;
	imm32 m1, 0x5EEEEEE0;
	imm32 m2, 0x6FFFFFF0;
	imm32 m3, 0x72345660;
	L0 = M0;
	L1 = M1;
	L2 = M2;
	L3 = M3;
	B0 = M0;
	B1 = M1;
	B2 = M2;
	B3 = M3;

	R0 = I0;
	R1 = I1;
	R2 = I2;
	R3 = I3;
	R4 = M0;
	R5 = M1;
	R6 = M2;
	R7 = M3;

	CHECKREG r0, 0x09999990;
	CHECKREG r1, 0x1AAAAAA0;
	CHECKREG r2, 0x2BBBBBB0;
	CHECKREG r3, 0x3CCCCCC0;
	CHECKREG r4, 0x4DDDDDD0;
	CHECKREG r5, 0x5EEEEEE0;
	CHECKREG r6, 0x6FFFFFF0;
	CHECKREG r7, 0x72345660;

	imm32 l0, 0x01909910;
	imm32 l1, 0x12A11220;
	imm32 l2, 0x23B25530;
	imm32 l3, 0x34C36640;
	imm32 b0, 0x45D47750;
	imm32 b1, 0x56E58860;
	imm32 b2, 0x67F66676;
	imm32 b3, 0x78375680;

	L0 = M1;
	L1 = M2;
	L2 = M3;
	L3 = M0;
	B0 = M1;
	B1 = M2;
	B2 = M3;
	B3 = M0;

	R0 = L0;
	R1 = L1;
	R2 = L2;
	R3 = L3;
	R4 = B0;
	R5 = B1;
	R6 = B2;
	R7 = B3;

	CHECKREG r0, 0x5EEEEEE0;
	CHECKREG r1, 0x6FFFFFF0;
	CHECKREG r2, 0x72345660;
	CHECKREG r3, 0x4DDDDDD0;
	CHECKREG r4, 0x5EEEEEE0;
	CHECKREG r5, 0x6FFFFFF0;
	CHECKREG r6, 0x72345660;
	CHECKREG r7, 0x4DDDDDD0;

	imm32 l0, 0x09909990;
	imm32 l1, 0x1AA11230;
	imm32 l2, 0x2BB25550;
	imm32 l3, 0x3CC36660;
	imm32 b0, 0x4DD47770;
	imm32 b1, 0x5EE58880;
	imm32 b2, 0x6FF66666;
	imm32 b3, 0x72375660;

	L0 = M2;
	L1 = M3;
	L2 = M0;
	L3 = M1;
	B0 = M2;
	B1 = M3;
	B2 = M0;
	B3 = M1;

	R0 = L0;
	R1 = L1;
	R2 = L2;
	R3 = L3;
	R4 = B0;
	R5 = B1;
	R6 = B2;
	R7 = B3;

	CHECKREG r0, 0x6FFFFFF0;
	CHECKREG r1, 0x72345660;
	CHECKREG r2, 0x4DDDDDD0;
	CHECKREG r3, 0x5EEEEEE0;
	CHECKREG r4, 0x6FFFFFF0;
	CHECKREG r5, 0x72345660;
	CHECKREG r6, 0x4DDDDDD0;
	CHECKREG r7, 0x5EEEEEE0;

	L0 = M3;
	L1 = M0;
	L2 = M1;
	L3 = M2;
	B0 = M3;
	B1 = M0;
	B2 = M1;
	B3 = M2;

	R0 = L0;
	R1 = L1;
	R2 = L2;
	R3 = L3;
	R4 = B0;
	R5 = B1;
	R6 = B2;
	R7 = B3;

	CHECKREG r0, 0x72345660;
	CHECKREG r1, 0x4DDDDDD0;
	CHECKREG r2, 0x5EEEEEE0;
	CHECKREG r3, 0x6FFFFFF0;
	CHECKREG r4, 0x72345660;
	CHECKREG r5, 0x4DDDDDD0;
	CHECKREG r6, 0x5EEEEEE0;
	CHECKREG r7, 0x6FFFFFF0;

	pass
