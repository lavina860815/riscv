//Original:/testcases/core/c_pushpopmultiple_dreg/c_pushpopmultiple_dreg.dsp
// Spec Reference: pushpopmultiple dreg
# mach: bfin

.include "testutils.inc"
	start

	FP = SP;

	imm32 r0, 0x00000000;
	ASTAT = r0;

	R0 = 0x01;
	R1 = 0x02;
	R2 = 0x03;
	R3 = 0x04;
	R4 = 0x05;
	R5 = 0x06;
	R6 = 0x07;
	R7 = 0x08;
	[ -- SP ] = ( R7:0 );
	R0 = 0;
	R1 = 0;
	R2 = 0;
	R3 = 0;
	R4 = 0;
	R5 = 0;
	R6 = 0;
	R7 = 0;
	( R7:0 ) = [ SP ++ ];
	CHECKREG r0, 0x00000001;
	CHECKREG r1, 0x00000002;
	CHECKREG r2, 0x00000003;
	CHECKREG r3, 0x00000004;
	CHECKREG r4, 0x00000005;
	CHECKREG r5, 0x00000006;
	CHECKREG r6, 0x00000007;
	CHECKREG r7, 0x00000008;

	R1 = 0x12;
	R2 = 0x13;
	R3 = 0x14;
	R4 = 0x15;
	R5 = 0x16;
	R6 = 0x17;
	R7 = 0x18;
	[ -- SP ] = ( R7:1 );
	R1 = 0;
	R2 = 0;
	R3 = 0;
	R4 = 0;
	R5 = 0;
	R6 = 0;
	R7 = 0;
	( R7:1 ) = [ SP ++ ];
	CHECKREG r0, 0x00000001;
	CHECKREG r1, 0x00000012;
	CHECKREG r2, 0x00000013;
	CHECKREG r3, 0x00000014;
	CHECKREG r4, 0x00000015;
	CHECKREG r5, 0x00000016;
	CHECKREG r6, 0x00000017;
	CHECKREG r7, 0x00000018;

	R2 = 0x23;
	R3 = 0x24;
	R4 = 0x25;
	R5 = 0x26;
	R6 = 0x27;
	R7 = 0x28;
	[ -- SP ] = ( R7:2 );
	R2 = 0;
	R3 = 0;
	R4 = 0;
	R5 = 0;
	R6 = 0;
	R7 = 0;
	( R7:2 ) = [ SP ++ ];
	CHECKREG r0, 0x00000001;
	CHECKREG r1, 0x00000012;
	CHECKREG r2, 0x00000023;
	CHECKREG r3, 0x00000024;
	CHECKREG r4, 0x00000025;
	CHECKREG r5, 0x00000026;
	CHECKREG r6, 0x00000027;
	CHECKREG r7, 0x00000028;

	R3 = 0x34;
	R4 = 0x35;
	R5 = 0x36;
	R6 = 0x37;
	R7 = 0x38;
	[ -- SP ] = ( R7:3 );
	R3 = 0;
	R4 = 0;
	R5 = 0;
	R6 = 0;
	R7 = 0;
	( R7:3 ) = [ SP ++ ];
	CHECKREG r0, 0x00000001;
	CHECKREG r1, 0x00000012;
	CHECKREG r2, 0x00000023;
	CHECKREG r3, 0x00000034;
	CHECKREG r4, 0x00000035;
	CHECKREG r5, 0x00000036;
	CHECKREG r6, 0x00000037;
	CHECKREG r7, 0x00000038;

	R4 = 0x45 (X);
	R5 = 0x46 (X);
	R6 = 0x47 (X);
	R7 = 0x48 (X);
	[ -- SP ] = ( R7:4 );
	R4 = 0;
	R5 = 0;
	R6 = 0;
	R7 = 0;
	( R7:4 ) = [ SP ++ ];
	CHECKREG r0, 0x00000001;
	CHECKREG r1, 0x00000012;
	CHECKREG r2, 0x00000023;
	CHECKREG r3, 0x00000034;
	CHECKREG r4, 0x00000045;
	CHECKREG r5, 0x00000046;
	CHECKREG r6, 0x00000047;
	CHECKREG r7, 0x00000048;

	R5 = 0x56 (X);
	R6 = 0x57 (X);
	R7 = 0x58 (X);
	[ -- SP ] = ( R7:5 );
	R5 = 0;
	R6 = 0;
	R7 = 0;
	( R7:5 ) = [ SP ++ ];
	CHECKREG r0, 0x00000001;
	CHECKREG r1, 0x00000012;
	CHECKREG r2, 0x00000023;
	CHECKREG r3, 0x00000034;
	CHECKREG r4, 0x00000045;
	CHECKREG r5, 0x00000056;
	CHECKREG r6, 0x00000057;
	CHECKREG r7, 0x00000058;

	R6 = 0x67 (X);
	R7 = 0x68 (X);
	[ -- SP ] = ( R7:6 );
	R6 = 0;
	R7 = 0;
	( R7:6 ) = [ SP ++ ];
	CHECKREG r0, 0x00000001;
	CHECKREG r1, 0x00000012;
	CHECKREG r2, 0x00000023;
	CHECKREG r3, 0x00000034;
	CHECKREG r4, 0x00000045;
	CHECKREG r5, 0x00000056;
	CHECKREG r6, 0x00000067;
	CHECKREG r7, 0x00000068;

	R7 = 0x78 (X);
	[ -- SP ] = ( R7:7 );
	R7 = 0;
	( R7:7 ) = [ SP ++ ];
	CHECKREG r0, 0x00000001;
	CHECKREG r1, 0x00000012;
	CHECKREG r2, 0x00000023;
	CHECKREG r3, 0x00000034;
	CHECKREG r4, 0x00000045;
	CHECKREG r5, 0x00000056;
	CHECKREG r6, 0x00000067;
	CHECKREG r7, 0x00000078;

	pass
