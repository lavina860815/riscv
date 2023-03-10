//Original:/proj/frio/dv/testcases/core/c_dsp32shift_af_s/c_dsp32shift_af_s.dsp
// Spec Reference: dsp32shift ashift s
# mach: bfin

.include "testutils.inc"
	start

// ashift : mix data,  count (+)= (half reg)
//                           d_reg = ashift (d BY d_lo)
//                                                  Rx  by RLx
	imm32 r0, 0x01230001;
	imm32 r1, 0x12345678;
	imm32 r2, 0x23456789;
	imm32 r3, 0x3456789a;
	imm32 r4, 0x856789ab;
	imm32 r5, 0x96789abc;
	imm32 r6, 0xa789abcd;
	imm32 r7, 0xb89abcde;
	R4 = ASHIFT R0 BY R0.L (S);
	R5 = ASHIFT R1 BY R0.L (S);
	R6 = ASHIFT R2 BY R0.L (S);
	R7 = ASHIFT R3 BY R0.L (S);
	CHECKREG r4, 0x02460002;
	CHECKREG r5, 0x2468ACF0;
	CHECKREG r6, 0x468ACF12;
	CHECKREG r7, 0x68ACF134;

	imm32 r0, 0x01230002;
	imm32 r1, 0x12345678;
	imm32 r2, 0x23456789;
	imm32 r3, 0x3456789a;
	imm32 r4, 0x956789ab;
	imm32 r5, 0xa6789abc;
	imm32 r6, 0xb789abcd;
	imm32 r7, 0xc89abcde;
	R1.L = 5;
	R5 = ASHIFT R0 BY R1.L (S);
	R6 = ASHIFT R1 BY R1.L (S);
	R7 = ASHIFT R2 BY R1.L (S);
	R4 = ASHIFT R3 BY R1.L (S);
	CHECKREG r4, 0x7FFFFFFF;
	CHECKREG r5, 0x24600040;
	CHECKREG r6, 0x7FFFFFFF;
	CHECKREG r7, 0x7FFFFFFF;

	imm32 r0, 0x01230002;
	imm32 r1, 0x12345678;
	imm32 r2, 0x23456789;
	imm32 r3, 0x3456789a;
	imm32 r4, 0x456789ab;
	imm32 r5, 0x56789abc;
	imm32 r6, 0x6789abcd;
	imm32 r7, 0x789abcde;
	R2 = 14;
	R6 = ASHIFT R0 BY R2.L (S);
	R7 = ASHIFT R1 BY R2.L (S);
	R4 = ASHIFT R2 BY R2.L (S);
	R5 = ASHIFT R3 BY R2.L (S);
	CHECKREG r4, 0x00038000;
	CHECKREG r5, 0x7FFFFFFF;
	CHECKREG r6, 0x7FFFFFFF;
	CHECKREG r7, 0x7FFFFFFF;

	imm32 r0, 0x01230002;
	imm32 r1, 0x12345678;
	imm32 r2, 0x23456789;
	imm32 r3, 0x3456789a;
	imm32 r4, 0xa56789ab;
	imm32 r5, 0xb6789abc;
	imm32 r6, 0xc789abcd;
	imm32 r7, 0xd89abcde;
	R3.L = 15;
	R7 = ASHIFT R0 BY R3.L (S);
	R6 = ASHIFT R1 BY R3.L (S);
	R5 = ASHIFT R2 BY R3.L (S);
	R4 = ASHIFT R3 BY R3.L (S);
	CHECKREG r4, 0x7FFFFFFF;
	CHECKREG r5, 0x7FFFFFFF;
	CHECKREG r6, 0x7FFFFFFF;
	CHECKREG r7, 0x7FFFFFFF;

	imm32 r0, 0x01230002;
	imm32 r1, 0x12345678;
	imm32 r2, 0x23456789;
	imm32 r3, 0x3456789a;
	imm32 r4, 0x456789ab;
	imm32 r5, 0x56789abc;
	imm32 r6, 0x6789abcd;
	imm32 r7, 0x789abcde;
	R4.L = -1;
	R7 = ASHIFT R0 BY R4.L;
	R0 = ASHIFT R1 BY R4.L;
	R1 = ASHIFT R2 BY R4.L;
	R2 = ASHIFT R3 BY R4.L;
	R3 = ASHIFT R4 BY R4.L;
	R4 = ASHIFT R5 BY R4.L;
	R5 = ASHIFT R6 BY R4.L;
	R6 = ASHIFT R7 BY R4.L;
	CHECKREG r0, 0x091A2B3C;
	CHECKREG r1, 0x11A2B3C4;
	CHECKREG r2, 0x1A2B3C4D;
	CHECKREG r3, 0x22B3FFFF;
	CHECKREG r4, 0x2B3C4D5E;
	CHECKREG r5, 0x40000000;
	CHECKREG r6, 0x40000000;
	CHECKREG r7, 0x00918001;

	imm32 r0, 0x01230002;
	imm32 r1, 0x82345678;
	imm32 r2, 0x93456789;
	imm32 r3, 0xa456789a;
	imm32 r4, 0xb56789ab;
	imm32 r5, 0xc6789abc;
	imm32 r6, 0xd789abcd;
	imm32 r7, 0xe89abcde;
	R5.L = -6;
	R6 = ASHIFT R0 BY R5.L (S);
	R7 = ASHIFT R1 BY R5.L (S);
	R0 = ASHIFT R2 BY R5.L (S);
	R1 = ASHIFT R3 BY R5.L (S);
	R2 = ASHIFT R4 BY R5.L (S);
	R3 = ASHIFT R5 BY R5.L (S);
	R4 = ASHIFT R6 BY R5.L (S);
	R5 = ASHIFT R7 BY R5.L (S);
	CHECKREG r0, 0xFE4D159E;
	CHECKREG r1, 0xFE9159E2;
	CHECKREG r2, 0xFED59E26;
	CHECKREG r3, 0xFF19E3FF;
	CHECKREG r4, 0x00001230;
	CHECKREG r5, 0xFFF82345;
	CHECKREG r6, 0x00048C00;
	CHECKREG r7, 0xFE08D159;

	imm32 r0, 0x01230002;
	imm32 r1, 0x12345678;
	imm32 r2, 0x23456789;
	imm32 r3, 0x3456789a;
	imm32 r4, 0x456789ab;
	imm32 r5, 0x56789abc;
	imm32 r6, 0x6789abcd;
	imm32 r7, 0x789abcde;
	R6.L = -15;
	R5 = ASHIFT R0 BY R6.L (S);
	R0 = ASHIFT R1 BY R6.L (S);
	R7 = ASHIFT R2 BY R6.L (S);
	R0 = ASHIFT R3 BY R6.L (S);
	R1 = ASHIFT R4 BY R6.L (S);
	R2 = ASHIFT R5 BY R6.L (S);
	R3 = ASHIFT R6 BY R6.L (S);
	R6 = ASHIFT R7 BY R6.L (S);
	CHECKREG r0, 0x000068AC;
	CHECKREG r1, 0x00008ACF;
	CHECKREG r2, 0x00000000;
	CHECKREG r3, 0x0000CF13;
	CHECKREG r4, 0x456789AB;
	CHECKREG r5, 0x00000246;
	CHECKREG r6, 0x00000000;
	CHECKREG r7, 0x0000468A;

	imm32 r0, 0x01230002;
	imm32 r1, 0x82345678;
	imm32 r2, 0x93456789;
	imm32 r3, 0xa456789a;
	imm32 r4, 0xb56789ab;
	imm32 r5, 0xc6789abc;
	imm32 r6, 0xd789abcd;
	imm32 r7, 0xe89abcde;
	R7.L = -14;
	R0 = ASHIFT R0 BY R7.L (S);
	R1 = ASHIFT R1 BY R7.L (S);
	R2 = ASHIFT R2 BY R7.L (S);
	R3 = ASHIFT R3 BY R7.L (S);
	R4 = ASHIFT R4 BY R7.L (S);
	R5 = ASHIFT R5 BY R7.L (S);
	R6 = ASHIFT R6 BY R7.L (S);
	R7 = ASHIFT R7 BY R7.L (S);
	CHECKREG r0, 0x0000048C;
	CHECKREG r1, 0xFFFE08D1;
	CHECKREG r2, 0xFFFE4D15;
	CHECKREG r3, 0xFFFE9159;
	CHECKREG r4, 0xFFFED59E;
	CHECKREG r5, 0xFFFF19E2;
	CHECKREG r6, 0xFFFF5E26;
	CHECKREG r7, 0xFFFFA26B;

	pass
