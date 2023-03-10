//Original:/testcases/core/c_regmv_dr_acc_acc/c_regmv_dr_acc_acc.dsp
// Spec Reference: regmv dreg-acc-acc
# mach: bfin

.include "testutils.inc"
	start



// check R-reg to ACC
	imm32 r0, 0x00000000;
	imm32 r1, 0x12345678;
	imm32 r2, 0x91234567;
	imm32 r3, 0x00060007;
	imm32 r4, 0x00080009;
	imm32 r5, 0x000a000b;
	imm32 r6, 0x000c000d;
	imm32 r7, 0x000e000f;
	A0 = R0;
	A1 = R0;
	A0 = R1;
	A1 = R2;

	R3 = A0.w;
	R4 = A0.x;
	R5 = A1.w;
	R6 = A1.x;
	CHECKREG r0, 0x00000000;
	CHECKREG r1, 0x12345678;
	CHECKREG r2, 0x91234567;
	CHECKREG r3, 0x12345678;
	CHECKREG r4, 0x00000000;
	CHECKREG r5, 0x91234567;
	CHECKREG r6, 0xFFFFFFFF;
	CHECKREG r7, 0x000E000F;

	A1 = A0 = 0;
	R3 = A0.w;
	R4 = A0.x;
	R5 = A1.w;
	R6 = A1.x;
	CHECKREG r3, 0x00000000;
	CHECKREG r4, 0x00000000;
	CHECKREG r5, 0x00000000;
	CHECKREG r6, 0x00000000;

	imm32 r0, 0xa5678901;
	imm32 r1, 0xb0158978;
	imm32 r2, 0x91234567;
	imm32 r3, 0x10060007;
	imm32 r4, 0x02080009;
	imm32 r5, 0x003a000b;
	imm32 r6, 0x0004000d;
	imm32 r7, 0x000e500f;
	A0 = R0;
	A1 = R1;

	R3 = A0.w;
	R4 = A0.x;
	R5 = A1.w;
	R6 = A1.x;
	CHECKREG r0, 0xA5678901;
	CHECKREG r1, 0xB0158978;
	CHECKREG r2, 0x91234567;
	CHECKREG r3, 0xA5678901;
	CHECKREG r4, 0xFFFFFFFF;
	CHECKREG r5, 0xB0158978;
	CHECKREG r6, 0xFFFFFFFF;
	CHECKREG r7, 0x000E500F;

	imm32 r0, 0xe9627911;
	imm32 r1, 0xd0158978;
	imm32 r2, 0xc1234567;
	imm32 r3, 0x10060007;
	imm32 r4, 0x02080009;
	imm32 r5, 0x003a000b;
	imm32 r6, 0x0004000d;
	imm32 r7, 0x000e500f;
	A0 = R0;
	A1 = A0;

	imm32 r0, 0x90ba7911;
	imm32 r1, 0xe3458978;
	imm32 r2, 0xc1234567;
	imm32 r3, 0x10060007;
	imm32 r4, 0x56080009;
	imm32 r5, 0x783a000b;
	imm32 r6, 0xf247890d;
	imm32 r7, 0x489e534f;
	A0.w = R0;
	A0.x = R1;
	A1.w = R2;
	A1.x = R3;

	R4 = A0.w;
	R5 = A0.x;
	R6 = A1.w;
	R7 = A1.x;

	CHECKREG r0, 0x90BA7911;
	CHECKREG r1, 0xE3458978;
	CHECKREG r2, 0xC1234567;
	CHECKREG r3, 0x10060007;
	CHECKREG r4, 0x90BA7911;
	CHECKREG r5, 0x00000078;
	CHECKREG r6, 0xC1234567;
	CHECKREG r7, 0x00000007;

	R3 = A0.w;
	R4 = A0.x;
	R5 = A1.w;
	R6 = A1.x;
	CHECKREG r0, 0x90BA7911;
	CHECKREG r1, 0xE3458978;
	CHECKREG r2, 0xC1234567;
	CHECKREG r3, 0x90BA7911;
	CHECKREG r4, 0x00000078;
	CHECKREG r5, 0xC1234567;
	CHECKREG r6, 0x00000007;
	CHECKREG r7, 0x00000007;

	imm32 r0, 0xf9627911;
	imm32 r1, 0xd0158978;
	imm32 r2, 0xc1234567;
	imm32 r3, 0x10060007;
	imm32 r4, 0x02080009;
	imm32 r5, 0x003a000b;
	imm32 r6, 0xf247890d;
	imm32 r7, 0x789e534f;
	A0 = R6;
	A1.w = A0.w;
	A1.x = A0.x;

	R0 = A0.w;
	R1 = A0.x;
	R2 = A1.w;
	R3 = A1.x;

	A1 = R7;
	A0.w = A1.w;
	A0.x = A1.x;

	R4 = A0.w;
	R5 = A0.x;
	R6 = A1.w;
	R7 = A1.x;

	CHECKREG r0, 0xF247890D;
	CHECKREG r1, 0xFFFFFFFF;
	CHECKREG r2, 0xF247890D;
	CHECKREG r3, 0xFFFFFFFF;
	CHECKREG r4, 0x789E534F;
	CHECKREG r5, 0x00000000;
	CHECKREG r6, 0x789E534F;
	CHECKREG r7, 0x00000000;

	imm32 r0, 0x90ba7911;
	imm32 r1, 0xe3458978;
	imm32 r2, 0xc1234567;
	imm32 r3, 0x10060007;
	imm32 r4, 0x56080009;
	imm32 r5, 0x783a000b;
	imm32 r6, 0xf247890d;
	imm32 r7, 0x489e534f;
	A0.w = A1.x;
	A0.x = A1.x;
	R4 = A0.w;
	R5 = A0.x;

	A0 = R2;
	A1.w = A0.x;
	A1.x = A0.x;

	R6 = A1.w;
	R7 = A1.x;

	A0.x = A1.w;
	A1.x = A0.w;
	R0 = A0.x;
	R1 = A1.x;

	CHECKREG r0, 0xFFFFFFFF;
	CHECKREG r1, 0x00000067;
	CHECKREG r2, 0xC1234567;
	CHECKREG r3, 0x10060007;
	CHECKREG r4, 0x00000000;
	CHECKREG r5, 0x00000000;
	CHECKREG r6, 0xFFFFFFFF;
	CHECKREG r7, 0xFFFFFFFF;

	pass
