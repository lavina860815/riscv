//Original:/proj/frio/dv/testcases/core/c_dsp32alu_byteop1ew/c_dsp32alu_byteop1ew.dsp
// Spec Reference: dsp32alu byteop1ew
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
	R4 = BYTEOP1P ( R1:0 , R3:2 );
	R5 = BYTEOP1P ( R1:0 , R3:2 ) (R);
	R6 = BYTEOP1P ( R1:0 , R3:2 ) (T);
	R7 = BYTEOP1P ( R1:0 , R3:2 ) (T , R);
	R0 = BYTEOP1P ( R1:0 , R3:2 ) (T , R);
	CHECKREG r4, 0x25566F13;
	CHECKREG r5, 0x3778911A;
	CHECKREG r6, 0x24556F13;
	CHECKREG r7, 0x3677911A;
	CHECKREG r0, 0x3677911A;

	imm32 r0, 0x1567892b;
	imm32 r1, 0x2789ab2d;
	imm32 r2, 0x34445525;
	imm32 r3, 0x46667727;
	imm32 r4, 0x58889929;
	imm32 r5, 0x6aaabb2b;
	imm32 r6, 0x7cccdd2d;
	imm32 r7, 0x8eeeffff;
	R0 = BYTEOP1P ( R3:2 , R1:0 );
	R1 = BYTEOP1P ( R3:2 , R1:0 ) (R);
	R2 = BYTEOP1P ( R3:2 , R1:0 ) (T);
	R3 = BYTEOP1P ( R3:2 , R1:0 ) (T , R);
	R4 = BYTEOP1P ( R3:2 , R1:0 ) (T , R);
	R5 = BYTEOP1P ( R3:2 , R1:0 ) (T , R);
	R6 = BYTEOP1P ( R3:2 , R1:0 ) (T , R);
	R7 = BYTEOP1P ( R3:2 , R1:0 ) (T , R);
	CHECKREG r0, 0x25566F28;
	CHECKREG r1, 0x3778912A;
	CHECKREG r2, 0x2C4D6226;
	CHECKREG r3, 0x3E6F8428;
	CHECKREG r4, 0x3A738A29;
	CHECKREG r5, 0x3A738A29;
	CHECKREG r6, 0x3A738A29;
	CHECKREG r7, 0x3A738A29;

	imm32 r0, 0x416789ab;
	imm32 r1, 0x6289abcd;
	imm32 r2, 0x43445555;
	imm32 r3, 0x64667777;
	imm32 r0, 0x456789ab;
	imm32 r1, 0x6689abcd;
	imm32 r2, 0x47445555;
	imm32 r3, 0x68667777;
	( R1 , R2 ) = BYTEOP16P ( R1:0 , R3:2 );
	( R0 , R3 ) = BYTEOP16P ( R1:0 , R3:2 ) (R);
	( R4 , R5 ) = BYTEOP16P ( R3:2 , R1:0 );
	( R6 , R7 ) = BYTEOP16P ( R3:2 , R1:0 );
	CHECKREG r0, 0x006800F2;
	CHECKREG r1, 0x008C00AB;
	CHECKREG r2, 0x00DE0100;
	CHECKREG r3, 0x00770122;
	CHECKREG r4, 0x00000146;
	CHECKREG r5, 0x000100F2;
	CHECKREG r6, 0x00000146;
	CHECKREG r7, 0x000100F2;

	imm32 r0, 0x416789ab;
	imm32 r1, 0x6289abcd;
	imm32 r2, 0x43445555;
	imm32 r3, 0x64667777;
	imm32 r0, 0x456789ab;
	imm32 r1, 0x6689abcd;
	imm32 r2, 0x47445555;
	imm32 r3, 0x68667777;
	( R7 , R6 ) = BYTEOP16P ( R3:2 , R1:0 );
	( R5 , R4 ) = BYTEOP16P ( R3:2 , R1:0 ) (R);
	( R2 , R3 ) = BYTEOP16P ( R3:2 , R1:0 );
	( R1 , R0 ) = BYTEOP16P ( R3:2 , R1:0 );
	CHECKREG r0, 0x00890156;
	CHECKREG r1, 0x004500F3;
	CHECKREG r2, 0x008C00AB;
	CHECKREG r3, 0x00DE0100;
	CHECKREG r4, 0x01220144;
	CHECKREG r5, 0x00CE00EF;
	CHECKREG r6, 0x00DE0100;
	CHECKREG r7, 0x008C00AB;

	imm32 r0, 0x416789ab;
	imm32 r1, 0x6289abcd;
	imm32 r2, 0x43445555;
	imm32 r3, 0x64667777;
	imm32 r0, 0x456789ab;
	imm32 r1, 0x6689abcd;
	imm32 r2, 0x47445555;
	imm32 r3, 0x68667777;
	( R1 , R2 ) = BYTEOP16M ( R1:0 , R3:2 );
	( R0 , R3 ) = BYTEOP16M ( R1:0 , R3:2 ) (R);
	( R4 , R5 ) = BYTEOP16M ( R3:2 , R1:0 );
	( R6 , R7 ) = BYTEOP16M ( R3:2 , R1:0 );
	CHECKREG r0, 0x00970098;
	CHECKREG r1, 0xFFFE0023;
	CHECKREG r2, 0x00340056;
	CHECKREG r3, 0xFF89FFAC;
	CHECKREG r4, 0x0000FF9D;
	CHECKREG r5, 0x0000FFBE;
	CHECKREG r6, 0x0000FF9D;
	CHECKREG r7, 0x0000FFBE;

	imm32 r0, 0x516789ab;
	imm32 r1, 0x6289abcd;
	imm32 r2, 0x73445555;
	imm32 r3, 0x84667777;
	imm32 r0, 0x956789ab;
	imm32 r1, 0xa689abcd;
	imm32 r2, 0xb7445555;
	imm32 r3, 0xc86def77;
	( R7 , R6 ) = BYTEOP16M ( R3:2 , R1:0 );
	( R5 , R4 ) = BYTEOP16M ( R3:2 , R1:0 ) (R);
	( R2 , R3 ) = BYTEOP16M ( R3:2 , R1:0 );
	( R1 , R0 ) = BYTEOP16M ( R3:2 , R1:0 );
	CHECKREG r0, 0x00760032;
	CHECKREG r1, 0xFF6BFFBB;
	CHECKREG r2, 0x0022FFDD;
	CHECKREG r3, 0xFFCCFFAA;
	CHECKREG r4, 0x0044FFAA;
	CHECKREG r5, 0x0022FFE4;
	CHECKREG r6, 0xFFCCFFAA;
	CHECKREG r7, 0x0022FFDD;

	pass
