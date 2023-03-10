//Original:/proj/frio/dv/testcases/core/c_dsp32alu_rrppmm_sft_x/c_dsp32alu_rrppmm_sft_x.dsp
// Spec Reference: dsp32alu (dreg, dreg) = +/+, -/- (dreg, dreg) >>, << X
# mach: bfin

.include "testutils.inc"
	start

	R0 = 0;
	ASTAT = R0;

	imm32 r0, 0x95679911;
	imm32 r1, 0x2789ab1d;
	imm32 r2, 0x34945515;
	imm32 r3, 0x46967717;
	imm32 r4, 0x5597891b;
	imm32 r5, 0x6989ab1d;
	imm32 r6, 0x94445515;
	imm32 r7, 0x96667777;
	R0 = R0 +|+ R0, R7 = R0 -|- R0 (CO , ASR);
	R1 = R0 +|+ R1, R6 = R0 -|- R1 (CO , ASL);
	R2 = R0 +|+ R2, R5 = R0 -|- R2 (CO , ASR);
	R3 = R0 +|+ R3, R4 = R0 -|- R3 (CO , ASR);
	R4 = R0 +|+ R4, R3 = R0 -|- R4 (CO , ASL);
	R5 = R0 +|+ R5, R2 = R0 -|- R5 (CO , ASR);
	R6 = R0 +|+ R6, R1 = R0 -|- R6 (CO , ASL);
	R7 = R0 +|+ R7, R0 = R0 -|- R7 (CO , ASR);
	CHECKREG r0, 0xcC88cAB3;
	CHECKREG r1, 0x7AAA72FE;
	CHECKREG r2, 0xf454f9B4;
	CHECKREG r3, 0xe35208D4;
	CHECKREG r4, 0x4CC880F2;
	CHECKREG r5, 0x9BB2a4BD;
	CHECKREG r6, 0xE29EE99A;
	CHECKREG r7, 0xcAB3cC88;

	imm32 r0, 0x11678911;
	imm32 r1, 0xa719ab1d;
	imm32 r2, 0x3a415515;
	imm32 r3, 0x46a67717;
	imm32 r4, 0x556a891b;
	imm32 r5, 0x6789ab1d;
	imm32 r6, 0x74445a15;
	imm32 r7, 0x866677a7;
	R0 = R1 +|+ R0, R7 = R1 -|- R0 (CO , ASR);
	R1 = R1 +|+ R1, R6 = R1 -|- R1 (CO , ASR);
	R2 = R1 +|+ R2, R5 = R1 -|- R2 (CO , ASL);
	R3 = R1 +|+ R3, R4 = R1 -|- R3 (CO , ASR);
	R4 = R1 +|+ R4, R3 = R1 -|- R4 (CO , ASR);
	R5 = R1 +|+ R5, R2 = R1 -|- R5 (CO , ASR);
	R6 = R1 +|+ R6, R1 = R1 -|- R6 (CO , ASL);
	R7 = R1 +|+ R7, R0 = R1 -|- R7 (CO , ASR);
	CHECKREG r0, 0x41AC229A;
	CHECKREG r1, 0x563A4E32;
	CHECKREG r2, 0xe8B6fD84;
	CHECKREG r3, 0xfD72068B;
	CHECKREG r4, 0xa08EaDAB;
	CHECKREG r5, 0xa994c266;
	CHECKREG r6, 0x4E32563A;
	CHECKREG r7, 0x33A00C85;

	imm32 r0, 0xb567891b;
	imm32 r1, 0x2b89abbd;
	imm32 r2, 0x34b45b15;
	imm32 r3, 0x466bb717;
	imm32 r4, 0x556bb91b;
	imm32 r5, 0x67b9ab1d;
	imm32 r6, 0x7b4455b5;
	imm32 r7, 0xb666777b;
	R0 = R2 +|+ R0, R7 = R2 -|- R0 (CO , ASR);
	R1 = R2 +|+ R1, R6 = R2 -|- R1 (CO , ASR);
	R2 = R2 +|+ R2, R5 = R2 -|- R2 (CO , ASR);
	R3 = R2 +|+ R3, R4 = R2 -|- R3 (CO , ASL);
	R4 = R2 +|+ R4, R3 = R2 -|- R4 (CO , ASR);
	R5 = R2 +|+ R5, R2 = R2 -|- R5 (CO , ASR);
	R6 = R2 +|+ R6, R1 = R2 -|- R6 (CO , ASL);
	R7 = R2 +|+ R7, R0 = R2 -|- R7 (CO , ASR);
	CHECKREG r0, 0xED5Ae246;
	CHECKREG r1, 0x2B8AaBBC;
	CHECKREG r2, 0x2D8A1A5A;
	CHECKREG r3, 0x3F41F65C;
	CHECKREG r4, 0x3E581BD3;
	CHECKREG r5, 0x1A5A2D8A;
	CHECKREG r6, 0x0A6C3DDE;
	CHECKREG r7, 0x4B432D00;

	imm32 r0, 0xbc678c11;
	imm32 r1, 0x27c9cb1d;
	imm32 r2, 0x344c5515;
	imm32 r3, 0x46c6c717;
	imm32 r4, 0x55678c1b;
	imm32 r5, 0x6c89abcd;
	imm32 r6, 0x7444551c;
	imm32 r7, 0x8c667777;
	R0 = R3 +|+ R0, R7 = R3 -|- R0 (CO , ASL);
	R1 = R3 +|+ R1, R6 = R3 -|- R1 (CO , ASR);
	R2 = R3 +|+ R2, R5 = R3 -|- R2 (CO , ASR);
	R3 = R3 +|+ R3, R4 = R3 -|- R3 (CO , ASR);
	R4 = R3 +|+ R4, R3 = R3 -|- R4 (CO , ASL);
	R5 = R3 +|+ R5, R2 = R3 -|- R5 (CO , ASR);
	R6 = R3 +|+ R6, R1 = R3 -|- R6 (CO , ASR);
	R7 = R3 +|+ R7, R0 = R3 -|- R7 (CO , ASL);
	CHECKREG r0, 0xF19C3044;
	CHECKREG r1, 0xbF07C818;
	CHECKREG r2, 0xC227eA96;
	CHECKREG r3, 0x8E2E8D8C;
	CHECKREG r4, 0x8D8C8E2E;
	CHECKREG r5, 0xa397CB64;
	CHECKREG r6, 0xC615CE85;
	CHECKREG r7, 0x08744494;

	imm32 r0, 0xd56789d1;
	imm32 r1, 0x2d89abdd;
	imm32 r2, 0x34d455d5;
	imm32 r3, 0x4d667717;
	imm32 r4, 0x5dd7891b;
	imm32 r5, 0x6789ab1d;
	imm32 r6, 0xd44d5515;
	imm32 r7, 0xd666d777;
	R0 = R4 +|+ R0, R7 = R4 -|- R0 (CO , ASR);
	R1 = R4 +|+ R1, R6 = R4 -|- R1 (CO , ASR);
	R2 = R4 +|+ R2, R5 = R4 -|- R2 (CO , ASR);
	R3 = R4 +|+ R3, R4 = R4 -|- R3 (CO , ASL);
	R4 = R4 +|+ R4, R3 = R4 -|- R4 (CO , ASR);
	R5 = R4 +|+ R5, R2 = R4 -|- R5 (CO , ASL);
	R6 = R4 +|+ R6, R1 = R4 -|- R6 (CO , ASR);
	R7 = R4 +|+ R7, R0 = R4 -|- R7 (CO , ASR);
	CHECKREG r0, 0xeE551231;
	CHECKREG r1, 0x045D1AB4;
	CHECKREG r2, 0x18C214CA;
	CHECKREG r3, 0x00000000;
	CHECKREG r4, 0x240820E2;
	CHECKREG r5, 0x7B566AC6;
	CHECKREG r6, 0x09531C84;
	CHECKREG r7, 0x11D6328D;

	imm32 r0, 0xc567a911;
	imm32 r1, 0x278aab1d;
	imm32 r2, 0x3c445515;
	imm32 r3, 0x46a67717;
	imm32 r4, 0x55c7891b;
	imm32 r5, 0x6a8cab1d;
	imm32 r6, 0x7444c515;
	imm32 r7, 0xa6667c77;
	R0 = R5 +|+ R0, R7 = R5 -|- R0 (CO , ASR);
	R1 = R5 +|+ R1, R6 = R5 -|- R1 (CO , ASL);
	R2 = R5 +|+ R2, R5 = R5 -|- R2 (CO , ASR);
	R3 = R5 +|+ R3, R4 = R5 -|- R3 (CO , ASR);
	R4 = R5 +|+ R4, R3 = R5 -|- R4 (CO , ASR);
	R5 = R5 +|+ R5, R2 = R5 -|- R5 (CO , ASL);
	R6 = R5 +|+ R6, R1 = R5 -|- R6 (CO , ASR);
	R7 = R5 +|+ R7, R0 = R5 -|- R7 (CO , ASR);
	CHECKREG r0, 0x04FFD585;
	CHECKREG r1, 0x6B46D608;
	CHECKREG r2, 0x00000000;
	CHECKREG r3, 0x327AeD7F;
	CHECKREG r4, 0xbD85e4A9;
	CHECKREG r5, 0xAC105C90;
	CHECKREG r6, 0xD608F14A;
	CHECKREG r7, 0xD68B5791;

	imm32 r0, 0xd5678911;
	imm32 r1, 0x2ddddd1d;
	imm32 r2, 0x34ddd515;
	imm32 r3, 0x46d67717;
	imm32 r4, 0x5d6d891b;
	imm32 r5, 0x6789db1d;
	imm32 r6, 0x74445d15;
	imm32 r7, 0xd66677d7;
	R0 = R6 +|+ R0, R7 = R6 -|- R0 (CO , ASR);
	R1 = R6 +|+ R1, R6 = R6 -|- R1 (CO , ASR);
	R2 = R6 +|+ R2, R5 = R6 -|- R2 (CO , ASR);
	R3 = R6 +|+ R3, R4 = R6 -|- R3 (CO , ASL);
	R4 = R6 +|+ R4, R3 = R6 -|- R4 (CO , ASR);
	R5 = R6 +|+ R5, R2 = R6 -|- R5 (CO , ASR);
	R6 = R6 +|+ R6, R1 = R6 -|- R6 (CO , ASL);
	R7 = R6 +|+ R7, R0 = R6 -|- R7 (CO , ASR);
	CHECKREG r0, 0x9EAFcAF7;
	CHECKREG r1, 0x00000000;
	CHECKREG r2, 0x0ED20C76;
	CHECKREG r3, 0x1873F3E2;
	CHECKREG r4, 0x4C1A0ABF;
	CHECKREG r5, 0x33851461;
	CHECKREG r6, 0xFFF08CCC;
	CHECKREG r7, 0x34F9eE1D;

	imm32 r0, 0xf567a911;
	imm32 r1, 0x2f8aab1d;
	imm32 r2, 0x34a45515;
	imm32 r3, 0x4a6f7717;
	imm32 r4, 0x5567f91b;
	imm32 r5, 0xa789af1d;
	imm32 r6, 0x74445515;
	imm32 r7, 0x866677f7;
	R0 = R7 +|+ R0, R7 = R7 -|- R0 (CO , ASR);
	R1 = R7 +|+ R1, R6 = R7 -|- R1 (CO , ASL);
	R2 = R7 +|+ R2, R5 = R7 -|- R2 (CO , ASR);
	R3 = R7 +|+ R3, R4 = R7 -|- R3 (CO , ASR);
	R4 = R7 +|+ R4, R3 = R7 -|- R4 (CO , ASL);
	R5 = R7 +|+ R5, R2 = R7 -|- R5 (CO , ASL);
	R6 = R7 +|+ R6, R1 = R7 -|- R6 (CO , ASR);
	R7 = R7 +|+ R7, R0 = R7 -|- R7 (CO , ASL);
	CHECKREG r0, 0x00000000;
	CHECKREG r1, 0xaC561657;
	CHECKREG r2, 0x5E305B7C;
	CHECKREG r3, 0x73FA7D7E;
	CHECKREG r4, 0x204EaE02;
	CHECKREG r5, 0x4250c3CC;
	CHECKREG r6, 0x511B1C28;
	CHECKREG r7, 0x9DCC21FC;

	imm32 r0, 0xe5678911;
	imm32 r1, 0x2e89ab1d;
	imm32 r2, 0x34e45515;
	imm32 r3, 0x46667717;
	imm32 r4, 0x556e891b;
	imm32 r5, 0x6789ab1d;
	imm32 r6, 0x7444e515;
	imm32 r7, 0x86667e77;
	R4 = R2 +|+ R5, R3 = R2 -|- R5 (CO , ASR);
	R0 = R5 +|+ R3, R5 = R5 -|- R3 (CO , ASL);
	R2 = R6 +|+ R2, R0 = R6 -|- R2 (CO , ASL);
	R3 = R4 +|+ R0, R2 = R4 -|- R0 (CO , ASR);
	R7 = R7 +|+ R6, R6 = R7 -|- R6 (CO , ASL);
	R6 = R1 +|+ R7, R1 = R1 -|- R7 (CO , ASL);
	R5 = R0 +|+ R4, R7 = R0 -|- R4 (CO , ASR);
	R1 = R3 +|+ R1, R4 = R3 -|- R1 (CO , ASR);
	CHECKREG r0, 0x20007EC0;
	CHECKREG r1, 0xfF9258EB;
	CHECKREG r2, 0xC0AC171B;
	CHECKREG r3, 0x371B3F6C;
	CHECKREG r4, 0xE6813788;
	CHECKREG r5, 0x371B3F6C;
	CHECKREG r6, 0x47BAE46A;
	CHECKREG r7, 0x3F53e8E5;

	imm32 r0, 0xd5678911;
	imm32 r1, 0xff89ab1d;
	imm32 r2, 0x34f45515;
	imm32 r3, 0x46667717;
	imm32 r4, 0x556f891b;
	imm32 r5, 0x6789fb1d;
	imm32 r6, 0x74445f15;
	imm32 r7, 0x866677f7;
	R4 = R3 +|+ R3, R5 = R3 -|- R3 (CO , ASR);
	R1 = R6 +|+ R1, R6 = R6 -|- R1 (CO , ASL);
	R6 = R1 +|+ R4, R4 = R1 -|- R4 (CO , ASL);
	R7 = R4 +|+ R2, R0 = R4 -|- R2 (CO , ASR);
	R2 = R2 +|+ R6, R1 = R2 -|- R6 (CO , ASR);
	R3 = R5 +|+ R5, R7 = R5 -|- R5 (CO , ASL);
	R5 = R7 +|+ R7, R3 = R7 -|- R7 (CO , ASL);
	R0 = R0 +|+ R0, R2 = R0 -|- R0 (CO , ASR);
	CHECKREG r0, 0xF6A902D3;
	CHECKREG r1, 0x1F0FEC7A;
	CHECKREG r2, 0x00000000;
	CHECKREG r3, 0x00000000;
	CHECKREG r4, 0x3A9A4268;
	CHECKREG r5, 0x00000000;
	CHECKREG r6, 0x5C0016F6;
	CHECKREG r7, 0x00000000;

	pass
