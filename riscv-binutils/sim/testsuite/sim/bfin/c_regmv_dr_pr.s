//Original:/testcases/core/c_regmv_dr_pr/c_regmv_dr_pr.dsp
// Spec Reference: regmv dreg-to-preg
# mach: bfin

.include "testutils.inc"
	start

// check R-reg to R-reg move
	imm32 r0, 0x20001001;
	imm32 r1, 0x20021003;
	imm32 r2, 0x20041005;
	imm32 r3, 0x20061007;
	imm32 r4, 0x20081009;
	imm32 r5, 0x200a100b;
	imm32 r6, 0x200c100d;
	imm32 r7, 0x200e100f;

	P1 = R0;
	P2 = R0;
	P4 = R0;
	P5 = R0;
	FP = R0;
	CHECKREG p1, 0x20001001;
	CHECKREG p2, 0x20001001;
	CHECKREG p4, 0x20001001;
	CHECKREG p5, 0x20001001;
	CHECKREG fp, 0x20001001;

	P1 = R1;
	P2 = R1;
	P4 = R1;
	P5 = R1;
	FP = R1;
	CHECKREG p1, 0x20021003;
	CHECKREG p2, 0x20021003;
	CHECKREG p4, 0x20021003;
	CHECKREG p5, 0x20021003;
	CHECKREG fp, 0x20021003;

	P1 = R2;
	P2 = R2;
	P4 = R2;
	P5 = R2;
	FP = R2;
	CHECKREG p1, 0x20041005;
	CHECKREG p2, 0x20041005;
	CHECKREG p4, 0x20041005;
	CHECKREG p5, 0x20041005;
	CHECKREG fp, 0x20041005;

	P1 = R3;
	P2 = R3;
	P4 = R3;
	P5 = R3;
	FP = R3;
	CHECKREG p1, 0x20061007;
	CHECKREG p2, 0x20061007;
	CHECKREG p4, 0x20061007;
	CHECKREG p5, 0x20061007;
	CHECKREG fp, 0x20061007;

	P1 = R4;
	P2 = R4;
	P4 = R4;
	P5 = R4;
	FP = R4;
	CHECKREG p1, 0x20081009;
	CHECKREG p2, 0x20081009;
	CHECKREG p4, 0x20081009;
	CHECKREG p5, 0x20081009;
	CHECKREG fp, 0x20081009;

	P1 = R5;
	P2 = R5;
	P4 = R5;
	P5 = R5;
	FP = R5;
	CHECKREG p1, 0x200a100b;
	CHECKREG p2, 0x200a100b;
	CHECKREG p4, 0x200a100b;
	CHECKREG p5, 0x200a100b;
	CHECKREG fp, 0x200a100b;

	P1 = R6;
	P2 = R6;
	P4 = R6;
	P5 = R6;
	FP = R6;
	CHECKREG p1, 0x200c100d;
	CHECKREG p2, 0x200c100d;
	CHECKREG p4, 0x200c100d;
	CHECKREG p5, 0x200c100d;
	CHECKREG fp, 0x200c100d;

	P1 = R7;
	P2 = R7;
	P4 = R7;
	P5 = R7;
	FP = R7;
	CHECKREG p1, 0x200e100f;
	CHECKREG p2, 0x200e100f;
	CHECKREG p4, 0x200e100f;
	CHECKREG p5, 0x200e100f;
	CHECKREG fp, 0x200e100f;

End:
	pass
