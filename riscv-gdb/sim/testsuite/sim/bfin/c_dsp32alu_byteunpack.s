//Original:/proj/frio/dv/testcases/core/c_dsp32alu_byteunpack/c_dsp32alu_byteunpack.dsp
// Spec Reference: dsp32alu byteunpack
# mach: bfin

.include "testutils.inc"
	start

	imm32 r0, 0x15678911;
	imm32 r1, 0x2789ab1d;
	imm32 r2, 0x34445515;
	imm32 r3, 0x46667717;
	imm32 r4, 0x5567891b;
	imm32 r5, 0x6789ab1d;
	imm32 r6, 0x74445515;
	imm32 r7, 0x86667777;
	( R4 , R5 ) = BYTEUNPACK R1:0;
	( R1 , R3 ) = BYTEUNPACK R1:0;
	( R0 , R7 ) = BYTEUNPACK R1:0;
	( R6 , R2 ) = BYTEUNPACK R1:0;
	CHECKREG r0, 0x00150067;
	CHECKREG r1, 0x00150067;
	CHECKREG r2, 0x00000067;
	CHECKREG r3, 0x00890011;
	CHECKREG r4, 0x00150067;
	CHECKREG r5, 0x00890011;
	CHECKREG r6, 0x00000015;
	CHECKREG r7, 0x00890011;

	imm32 r0, 0x1567892b;
	imm32 r1, 0x2789ab2d;
	imm32 r2, 0x34445525;
	imm32 r3, 0x46667727;
	imm32 r4, 0x58889929;
	imm32 r5, 0x6aaabb2b;
	imm32 r6, 0x7cccdd2d;
	imm32 r7, 0x8eeeffff;
	( R1 , R0 ) = BYTEUNPACK R3:2;
	( R3 , R4 ) = BYTEUNPACK R3:2;
	( R5 , R2 ) = BYTEUNPACK R3:2;
	( R7 , R6 ) = BYTEUNPACK R3:2;
	CHECKREG r0, 0x00550025;
	CHECKREG r1, 0x00340044;
	CHECKREG r2, 0x00550025;
	CHECKREG r3, 0x00340044;
	CHECKREG r4, 0x00550025;
	CHECKREG r5, 0x00340044;
	CHECKREG r6, 0x00000025;
	CHECKREG r7, 0x00000055;

	imm32 r0, 0x416789ab;
	imm32 r1, 0x6289abcd;
	imm32 r2, 0x43445555;
	imm32 r3, 0x64667777;
	imm32 r0, 0x456789ab;
	imm32 r1, 0x6689abcd;
	imm32 r2, 0x47445555;
	imm32 r3, 0x68667777;
	( R1 , R2 ) = BYTEUNPACK R1:0 (R);
	( R3 , R6 ) = BYTEUNPACK R1:0 (R);
	( R4 , R0 ) = BYTEUNPACK R1:0 (R);
	( R5 , R7 ) = BYTEUNPACK R1:0 (R);
	CHECKREG r0, 0x00000089;
	CHECKREG r1, 0x00660089;
	CHECKREG r2, 0x00AB00CD;
	CHECKREG r3, 0x00000066;
	CHECKREG r4, 0x00000066;
	CHECKREG r5, 0x00000066;
	CHECKREG r6, 0x00000089;
	CHECKREG r7, 0x00000089;

	imm32 r0, 0x496789ab;
	imm32 r1, 0x6489abcd;
	imm32 r2, 0x4b445555;
	imm32 r3, 0x6c647777;
	imm32 r4, 0x8d889999;
	imm32 r5, 0xaeaa4bbb;
	imm32 r6, 0xcfccd44d;
	imm32 r7, 0xe1eefff4;
	( R0 , R1 ) = BYTEUNPACK R3:2 (R);
	( R2 , R3 ) = BYTEUNPACK R3:2 (R);
	( R4 , R5 ) = BYTEUNPACK R3:2 (R);
	( R6 , R7 ) = BYTEUNPACK R3:2 (R);
	CHECKREG r0, 0x006C0064;
	CHECKREG r1, 0x00770077;
	CHECKREG r2, 0x006C0064;
	CHECKREG r3, 0x00770077;
	CHECKREG r4, 0x00000077;
	CHECKREG r5, 0x00000077;
	CHECKREG r6, 0x00000077;
	CHECKREG r7, 0x00000077;

	imm32 r0, 0x4537891b;
	imm32 r1, 0x6759ab2d;
	imm32 r2, 0x44555535;
	imm32 r3, 0x66665747;
	imm32 r4, 0x88789565;
	imm32 r5, 0xaa8abb5b;
	imm32 r6, 0xcc9cdd85;
	imm32 r7, 0xeeaeff9f;
	( R0 , R1 ) = BYTEUNPACK R1:0;
	( R2 , R3 ) = BYTEUNPACK R3:2 (R);
	( R4 , R5 ) = BYTEUNPACK R1:0 (R);
	( R6 , R7 ) = BYTEUNPACK R3:2;
	CHECKREG r0, 0x00450037;
	CHECKREG r1, 0x0089001B;
	CHECKREG r2, 0x00660066;
	CHECKREG r3, 0x00570047;
	CHECKREG r4, 0x00000089;
	CHECKREG r5, 0x0000001B;
	CHECKREG r6, 0x00000066;
	CHECKREG r7, 0x00000066;

	pass
