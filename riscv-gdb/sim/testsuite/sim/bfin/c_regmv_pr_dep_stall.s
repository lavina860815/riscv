//Original:/proj/frio/dv/testcases/core/c_regmv_pr_dep_stall/c_regmv_pr_dep_stall.dsp
// Spec Reference: regmv pr-dependency  stall
# mach: bfin

.include "testutils.inc"
	start

	INIT_M_REGS 0;

// R-reg to P-reg to R reg: stall
	imm32 r0, 0x00001110;
	imm32 r1, 0x00213330;
	imm32 r2, 0x04015550;
	imm32 r3, 0x06607770;
	imm32 r4, 0x08810990;
	imm32 r5, 0x01a1b0b0;
	imm32 r6, 0x01c1dd00;
	imm32 r7, 0x01e1fff0;
	P1 = R1;
	R0 = P1;
	P2 = R2;
	R1 = P2;
	P3 = R3;
	R2 = P3;
	P4 = R4;
	R3 = P4;
	P5 = R5;
	R4 = P5;
	SP = R6;
	R5 = P2;
	FP = R7;
	R6 = P3;

	CHECKREG r0, 0x00213330;
	CHECKREG r1, 0x04015550;
	CHECKREG r2, 0x06607770;
	CHECKREG r3, 0x08810990;
	CHECKREG r4, 0x01A1B0B0;
	CHECKREG r5, 0x04015550;
	CHECKREG r6, 0x06607770;
	CHECKREG r7, 0x01E1FFF0;

// R-reg to P-reg to I,M reg: stall
	imm32 r0, 0x10001111;
	imm32 r1, 0x11213331;
	imm32 r2, 0x14115551;
	imm32 r3, 0x16617771;
	imm32 r4, 0x18811991;
	imm32 r5, 0x11a1b1b1;
	imm32 r6, 0x11c1dd11;
	imm32 r7, 0x11e1fff1;
	P1 = R0;
	I0 = P1;
	P2 = R1;
	I1 = P2;
	P3 = R2;
	I2 = P3;
	P4 = R3;
	I3 = P4;
	P5 = R4;
	M0 = P5;
	SP = R5;
	M1 = SP;
	FP = R6;
	M2 = FP;

	R0 = I3;
	R1 = I2;
	R2 = I1;
	R3 = I0;
	R4 = M3;
	R5 = M2;
	R6 = M1;
	R7 = M0;
	CHECKREG r0, 0x16617771;
	CHECKREG r1, 0x14115551;
	CHECKREG r2, 0x11213331;
	CHECKREG r3, 0x10001111;
	CHECKREG r4, 0x00000000;
	CHECKREG r5, 0x11C1DD11;
	CHECKREG r6, 0x11A1B1B1;
	CHECKREG r7, 0x18811991;

	CHECKREG p1, 0x10001111;
	CHECKREG p2, 0x11213331;
	CHECKREG p3, 0x14115551;
	CHECKREG p4, 0x16617771;
	CHECKREG p5, 0x18811991;
	CHECKREG sp, 0x11A1B1B1;
	CHECKREG fp, 0x11C1DD11;

	imm32 r0, 0x20001112;
	imm32 r1, 0x21213332;
	imm32 r2, 0x24115552;
	imm32 r3, 0x26617772;
	imm32 r4, 0x28811992;
	imm32 r5, 0x21a1b1b2;
	imm32 r6, 0x21c1dd12;
	imm32 r7, 0x21e1fff2;
	P1 = R3;
	I3 = P1;
	P2 = R4;
	I0 = P2;
	P3 = R5;
	I1 = P3;
	P4 = R6;
	I2 = P4;
	P5 = R7;
	M1 = P5;
	SP = R0;
	M2 = SP;
	FP = R1;
	M3 = FP;

	R0 = I3;
	R1 = I2;
	R2 = I1;
	R3 = I0;
	R4 = M3;
	R5 = M2;
	R6 = M1;
	R7 = M0;
	CHECKREG r0, 0x26617772;
	CHECKREG r1, 0x21C1DD12;
	CHECKREG r2, 0x21A1B1B2;
	CHECKREG r3, 0x28811992;
	CHECKREG r4, 0x21213332;
	CHECKREG r5, 0x20001112;
	CHECKREG r6, 0x21E1FFF2;
	CHECKREG r7, 0x18811991;

	CHECKREG p1, 0x26617772;
	CHECKREG p2, 0x28811992;
	CHECKREG p3, 0x21A1B1B2;
	CHECKREG p4, 0x21C1DD12;
	CHECKREG p5, 0x21E1FFF2;
	CHECKREG sp, 0x20001112;
	CHECKREG fp, 0x21213332;

// R-reg to P-reg to L,B reg: stall
	imm32 r0, 0x30001113;
	imm32 r1, 0x31213333;
	imm32 r2, 0x34115553;
	imm32 r3, 0x36617773;
	imm32 r4, 0x38811993;
	imm32 r5, 0x31a1b1b3;
	imm32 r6, 0x31c1dd13;
	imm32 r7, 0x31e1fff3;
	P1 = R4;
	L0 = P1;
	P2 = R5;
	L1 = P2;
	P3 = R6;
	L2 = P3;
	P4 = R7;
	L3 = P4;
	P5 = R0;
	B0 = P5;
	SP = R1;
	B1 = SP;
	FP = R2;
	B2 = FP;

	R0 = L3;
	R1 = L2;
	R2 = L1;
	R3 = L0;
	R4 = B3;
	R5 = B2;
	R6 = B1;
	R7 = B0;
	CHECKREG r0, 0x31E1FFF3;
	CHECKREG r1, 0x31C1DD13;
	CHECKREG r2, 0x31A1B1B3;
	CHECKREG r3, 0x38811993;
	CHECKREG r4, 0x00000000;
	CHECKREG r5, 0x34115553;
	CHECKREG r6, 0x31213333;
	CHECKREG r7, 0x30001113;

	CHECKREG p1, 0x38811993;
	CHECKREG p2, 0x31A1B1B3;
	CHECKREG p3, 0x31C1DD13;
	CHECKREG p4, 0x31E1FFF3;
	CHECKREG p5, 0x30001113;
	CHECKREG sp, 0x31213333;
	CHECKREG fp, 0x34115553;

	imm32 r0, 0x40001114;
	imm32 r1, 0x44213334;
	imm32 r2, 0x44415554;
	imm32 r3, 0x46647774;
	imm32 r4, 0x48814994;
	imm32 r5, 0x41a1b4b4;
	imm32 r6, 0x41c1dd44;
	imm32 r7, 0x41e1fff4;
	P1 = R5;
	L2 = P1;
	P2 = R6;
	L3 = P2;
	P3 = R7;
	L0 = P3;
	P4 = R0;
	L1 = P4;
	P5 = R1;
	B2 = P5;
	SP = R2;
	B3 = SP;
	FP = R3;
	B0 = FP;

	R0 = L3;
	R1 = L2;
	R2 = L1;
	R3 = L0;
	R4 = B3;
	R5 = B2;
	R6 = B1;
	R7 = B0;
	CHECKREG r0, 0x41C1DD44;
	CHECKREG r1, 0x41A1B4B4;
	CHECKREG r2, 0x40001114;
	CHECKREG r3, 0x41E1FFF4;
	CHECKREG r4, 0x44415554;
	CHECKREG r5, 0x44213334;
	CHECKREG r6, 0x31213333;
	CHECKREG r7, 0x46647774;

	CHECKREG p1, 0x41A1B4B4;
	CHECKREG p2, 0x41C1DD44;
	CHECKREG p3, 0x41E1FFF4;
	CHECKREG p4, 0x40001114;
	CHECKREG p5, 0x44213334;
	CHECKREG sp, 0x44415554;
	CHECKREG fp, 0x46647774;

	pass
