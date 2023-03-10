//Original:/proj/frio/dv/testcases/core/c_compi2opp_pr_add_i7_n/c_compi2opp_pr_add_i7_n.dsp
// Spec Reference: compi2opp pregs += imm7 negative
# mach: bfin

.include "testutils.inc"
	start

	INIT_R_REGS 0;
	INIT_P_REGS 0;

	imm32 sp, 0x00000000;
	imm32 fp, 0x00000000;

	P1 += -1;
	P2 += -2;
	P3 += -3;
	P4 += -4;
	P5 += -5;
	SP += -6;
	FP += -7;
	CHECKREG p1,  0xFFFFFFFF;
	CHECKREG p2,  0xFFFFFFFE;
	CHECKREG p3,  0xFFFFFFFD;
	CHECKREG p4,  0xFFFFFFFC;
	CHECKREG p5,  0xFFFFFFFB;
	CHECKREG sp,  0xFFFFFFFA;
	CHECKREG fp,  0xFFFFFFF9;

	P1 += -9;
	P2 += -10;
	P3 += -11;
	P4 += -12;
	P5 += -13;
	SP += -14;
	FP += -15;
	CHECKREG p1,  0xFFFFFFF6;
	CHECKREG p2,  0xFFFFFFF4;
	CHECKREG p3,  0xFFFFFFF2;
	CHECKREG p4,  0xFFFFFFF0;
	CHECKREG p5,  0xFFFFFFEE;
	CHECKREG sp,  0xFFFFFFEC;
	CHECKREG fp,  0xFFFFFFEA;

	P1 += -17;
	P2 += -18;
	P3 += -19;
	P4 += -20;
	P5 += -21;
	SP += -22;
	FP += -23;
	CHECKREG p1,  0xFFFFFFE5;
	CHECKREG p2,  0xFFFFFFE2;
	CHECKREG p3,  0xFFFFFFDF;
	CHECKREG p4,  0xFFFFFFDC;
	CHECKREG p5,  0xFFFFFFD9;
	CHECKREG sp,  0xFFFFFFD6;
	CHECKREG fp,  0xFFFFFFD3;

	P1 += -25;
	P2 += -26;
	P3 += -27;
	P4 += -28;
	P5 += -29;
	SP += -30;
	FP += -31;
	CHECKREG p1,  0xFFFFFFCC;
	CHECKREG p2,  0xFFFFFFC8;
	CHECKREG p3,  0xFFFFFFC4;
	CHECKREG p4,  0xFFFFFFC0;
	CHECKREG p5,  0xFFFFFFBC;
	CHECKREG sp,  0xFFFFFFB8;
	CHECKREG fp,  0xFFFFFFB4;

	P1 += -33;
	P2 += -34;
	P3 += -35;
	P4 += -36;
	P5 += -37;
	SP += -38;
	FP += -39;
	CHECKREG p1,  0xFFFFFFAB;
	CHECKREG p2,  0xFFFFFFA6;
	CHECKREG p3,  0xFFFFFFA1;
	CHECKREG p4,  0xFFFFFF9C;
	CHECKREG p5,  0xFFFFFF97;
	CHECKREG sp,  0xFFFFFF92;
	CHECKREG fp,  0xFFFFFF8D;

	P1 += -41;
	P2 += -42;
	P3 += -43;
	P4 += -44;
	P5 += -45;
	SP += -46;
	FP += -47;
	CHECKREG p1,  0xFFFFFF82;
	CHECKREG p2,  0xFFFFFF7C;
	CHECKREG p3,  0xFFFFFF76;
	CHECKREG p4,  0xFFFFFF70;
	CHECKREG p5,  0xFFFFFF6A;
	CHECKREG sp,  0xFFFFFF64;
	CHECKREG fp,  0xFFFFFF5E;

	P1 += -49;
	P2 += -50;
	P3 += -51;
	P4 += -52;
	P5 += -53;
	SP += -54;
	FP += -55;
	CHECKREG p1,  0xFFFFFF51;
	CHECKREG p2,  0xFFFFFF4A;
	CHECKREG p3,  0xFFFFFF43;
	CHECKREG p4,  0xFFFFFF3C;
	CHECKREG p5,  0xFFFFFF35;
	CHECKREG sp,  0xFFFFFF2E;
	CHECKREG fp,  0xFFFFFF27;

	P1 += -57;
	P2 += -58;
	P3 += -59;
	P4 += -60;
	P5 += -61;
	SP += -62;
	FP += -63;
	CHECKREG p1,  0xFFFFFF18;
	CHECKREG p2,  0xFFFFFF10;
	CHECKREG p3,  0xFFFFFF08;
	CHECKREG p4,  0xFFFFFF00;
	CHECKREG p5,  0xFFFFFEF8;
	CHECKREG sp,  0xFFFFFEF0;
	CHECKREG fp,  0xFFFFFEE8;

	P1 += -64;
	P2 += -64;
	P3 += -64;
	P4 += -64;
	P5 += -64;
	SP += -64;
	FP += -64;
	CHECKREG p1,  0xFFFFFED8;
	CHECKREG p2,  0xFFFFFED0;
	CHECKREG p3,  0xFFFFFEC8;
	CHECKREG p4,  0xFFFFFEC0;
	CHECKREG p5,  0xFFFFFEB8;
	CHECKREG sp,  0xFFFFFEB0;
	CHECKREG fp,  0xFFFFFEA8;

	pass
