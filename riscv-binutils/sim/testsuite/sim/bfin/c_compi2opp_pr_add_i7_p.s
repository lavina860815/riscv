//Original:/proj/frio/dv/testcases/core/c_compi2opp_pr_add_i7_p/c_compi2opp_pr_add_i7_p.dsp
// Spec Reference: compi2opp pregs += imm7 positive
# mach: bfin

.include "testutils.inc"
	start

	INIT_P_REGS 0;

	imm32 fp, 0x00000000;

	P1 += 1;
	P2 += 2;
	P3 += 3;
	P4 += 4;
	P5 += 5;
	FP += 7;
	CHECKREG p1,  0x00000001;
	CHECKREG p2,  0x00000002;
	CHECKREG p3,  0x00000003;
	CHECKREG p4,  0x00000004;
	CHECKREG p5,  0x00000005;
	CHECKREG fp,  0x00000007;

	P1 += 9;
	P2 += 10;
	P3 += 11;
	P4 += 12;
	P5 += 13;
	FP += 15;
	CHECKREG p1,  0x0000000A;
	CHECKREG p2,  0x0000000C;
	CHECKREG p3,  0x0000000E;
	CHECKREG p4,  0x00000010;
	CHECKREG p5,  0x00000012;
	CHECKREG fp,  0x00000016;

	P1 += 17;
	P2 += 18;
	P3 += 19;
	P4 += 20;
	P5 += 21;
	FP += 23;
	CHECKREG p1,  0x0000001B;
	CHECKREG p2,  0x0000001E;
	CHECKREG p3,  0x00000021;
	CHECKREG p4,  0x00000024;
	CHECKREG p5,  0x00000027;
	CHECKREG fp,  0x0000002D;

	P1 += 25;
	P2 += 26;
	P3 += 27;
	P4 += 28;
	P5 += 29;
	FP += 31;
	CHECKREG p1,  0x00000034;
	CHECKREG p2,  0x00000038;
	CHECKREG p3,  0x0000003C;
	CHECKREG p4,  0x00000040;
	CHECKREG p5,  0x00000044;
	CHECKREG fp,  0x0000004C;

	P1 += 33;
	P2 += 34;
	P3 += 35;
	P4 += 36;
	P5 += 37;
	FP += 39;
	CHECKREG p1,  0x00000055;
	CHECKREG p2,  0x0000005A;
	CHECKREG p3,  0x0000005F;
	CHECKREG p4,  0x00000064;
	CHECKREG p5,  0x00000069;
	CHECKREG fp,  0x00000073;

	P1 += 41;
	P2 += 42;
	P3 += 43;
	P4 += 44;
	P5 += 45;
	FP += 47;
	CHECKREG p1,  0x0000007E;
	CHECKREG p2,  0x00000084;
	CHECKREG p3,  0x0000008A;
	CHECKREG p4,  0x00000090;
	CHECKREG p5,  0x00000096;
	CHECKREG fp,  0x000000A2;

	P1 += 49;
	P2 += 50;
	P3 += 51;
	P4 += 52;
	P5 += 53;
	FP += 55;
	CHECKREG p1,  0x000000AF;
	CHECKREG p2,  0x000000B6;
	CHECKREG p3,  0x000000BD;
	CHECKREG p4,  0x000000C4;
	CHECKREG p5,  0x000000CB;
	CHECKREG fp,  0x000000D9;

	P1 += 57;
	P2 += 58;
	P3 += 59;
	P4 += 60;
	P5 += 61;
	FP += 63;
	CHECKREG p1,  0x000000E8;
	CHECKREG p2,  0x000000F0;
	CHECKREG p3,  0x000000F8;
	CHECKREG p4,  0x00000100;
	CHECKREG p5,  0x00000108;
	CHECKREG fp,  0x00000118;

	pass
