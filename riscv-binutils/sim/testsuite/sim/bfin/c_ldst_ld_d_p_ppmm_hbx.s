//Original:/testcases/core/c_ldst_ld_d_p_ppmm_hbx/c_ldst_ld_d_p_ppmm_hbx.dsp
// Spec Reference: c_ldst ld d [p++/--]  h b xh xb
# mach: bfin

.include "testutils.inc"
	start

	INIT_R_REGS 0;

	loadsym p5, DATA_ADDR_1;
	loadsym p1, DATA_ADDR_2;
	loadsym p2, DATA_ADDR_3;
	loadsym p4, DATA_ADDR_5;
	loadsym fp, DATA_ADDR_6;

	R0 = W [ P5 ++ ] (Z);
	R1 = W [ P1 ++ ] (Z);
	R2 = W [ P2 ++ ] (Z);
	R4 = W [ P4 ++ ] (Z);
	R5 = W [ FP ++ ] (Z);
	CHECKREG r0, 0x00000203;
	CHECKREG r1, 0x00002223;
	CHECKREG r2, 0x00004243;
	CHECKREG r4, 0x00008283;
	CHECKREG r5, 0x00000203;
	R1 = W [ P5 ++ ] (Z);
	R2 = W [ P1 ++ ] (Z);
	R3 = W [ P2 ++ ] (Z);
	R5 = W [ P4 ++ ] (Z);
	R6 = W [ FP ++ ] (Z);
	CHECKREG r0, 0x00000203;
	CHECKREG r1, 0x00000001;
	CHECKREG r2, 0x00002021;
	CHECKREG r3, 0x00004041;
	CHECKREG r5, 0x00008081;
	CHECKREG r6, 0x00000001;
	R2 = W [ P5 ++ ] (Z);
	R3 = W [ P1 ++ ] (Z);
	R4 = W [ P2 ++ ] (Z);
	R6 = W [ P4 ++ ] (Z);
	R7 = W [ FP ++ ] (Z);
	CHECKREG r1, 0x00000001;
	CHECKREG r2, 0x00000607;
	CHECKREG r3, 0x00002627;
	CHECKREG r4, 0x00004647;
	CHECKREG r6, 0x00008687;
	CHECKREG r7, 0x00000607;

	R3 = W [ P5 ++ ] (Z);
	R4 = W [ P1 ++ ] (Z);
	R5 = W [ P2 ++ ] (Z);
	R7 = W [ P4 ++ ] (Z);
	R0 = W [ FP ++ ] (Z);
	CHECKREG r0, 0x00000405;
	CHECKREG r2, 0x00000607;
	CHECKREG r3, 0x00000405;
	CHECKREG r4, 0x00002425;
	CHECKREG r5, 0x00004445;
	CHECKREG r7, 0x00008485;

	R4 = W [ P5 ++ ] (X);
	R5 = W [ P1 ++ ] (X);
	R6 = W [ P2 ++ ] (X);
	R0 = W [ P4 ++ ] (X);
	R1 = W [ FP ++ ] (X);
	CHECKREG r0, 0xFFFF8A8B;
	CHECKREG r1, 0x00000A0B;
	CHECKREG r3, 0x00000405;
	CHECKREG r4, 0x00000A0B;
	CHECKREG r5, 0x00002A2B;
	CHECKREG r6, 0x00004A4B;

	R5 = W [ P5 ++ ] (X);
	R6 = W [ P1 ++ ] (X);
	R7 = W [ P2 ++ ] (X);
	R1 = W [ P4 ++ ] (X);
	R2 = W [ FP ++ ] (X);
	CHECKREG r1, 0xFFFF8889;
	CHECKREG r2, 0x00000809;
	CHECKREG r4, 0x00000A0B;
	CHECKREG r5, 0x00000809;
	CHECKREG r6, 0x00002829;
	CHECKREG r7, 0x00004849;

	R6 = W [ P5 ++ ] (X);
	R7 = W [ P1 ++ ] (X);
	R0 = W [ P2 ++ ] (X);
	R2 = W [ P4 ++ ] (X);
	R3 = W [ FP ++ ] (X);
	CHECKREG r0, 0x00004E4F;
	CHECKREG r2, 0xFFFF8E8F;
	CHECKREG r3, 0x00000E0F;
	CHECKREG r5, 0x00000809;
	CHECKREG r6, 0x00000E0F;
	CHECKREG r7, 0x00002E2F;

	R7 = W [ P5 ++ ] (X);
	R0 = W [ P1 ++ ] (X);
	R1 = W [ P2 ++ ] (X);
	R3 = W [ P4 ++ ] (X);
	R4 = W [ FP ++ ] (X);
	CHECKREG r0, 0x00002C2D;
	CHECKREG r1, 0x00004C4D;
	CHECKREG r3, 0xFFFF8C8D;
	CHECKREG r4, 0x00000C0D;
	CHECKREG r6, 0x00000E0F;
	CHECKREG r7, 0x00000C0D;

	R0 = W [ P5 -- ] (Z);
	R1 = W [ P1 -- ] (Z);
	R2 = W [ P2 -- ] (Z);
	R4 = W [ P4 -- ] (Z);
	R5 = W [ FP -- ] (Z);
	CHECKREG r0, 0x00001213;
	CHECKREG r1, 0x00003233;
	CHECKREG r2, 0x00005253;
	CHECKREG r4, 0x00009293;
	CHECKREG r5, 0x00001213;
	R1 = W [ P5 -- ] (Z);
	R2 = W [ P1 -- ] (Z);
	R3 = W [ P2 -- ] (Z);
	R5 = W [ P4 -- ] (Z);
	R6 = W [ FP -- ] (Z);
	CHECKREG r0, 0x00001213;
	CHECKREG r1, 0x00000C0D;
	CHECKREG r2, 0x00002C2D;
	CHECKREG r3, 0x00004C4D;
	CHECKREG r5, 0x00008C8D;
	CHECKREG r6, 0x00000C0D;
	R2 = W [ P5 -- ] (Z);
	R3 = W [ P1 -- ] (Z);
	R4 = W [ P2 -- ] (Z);
	R6 = W [ P4 -- ] (Z);
	R7 = W [ FP -- ] (Z);
	CHECKREG r1, 0x00000C0D;
	CHECKREG r2, 0x00000E0F;
	CHECKREG r3, 0x00002E2F;
	CHECKREG r4, 0x00004E4F;
	CHECKREG r6, 0x00008E8F;
	CHECKREG r7, 0x00000E0F;

	R3 = W [ P5 -- ] (Z);
	R4 = W [ P1 -- ] (Z);
	R5 = W [ P2 -- ] (Z);
	R7 = W [ P4 -- ] (Z);
	R0 = W [ FP -- ] (Z);
	CHECKREG r0, 0x00000809;
	CHECKREG r2, 0x00000E0F;
	CHECKREG r3, 0x00000809;
	CHECKREG r4, 0x00002829;
	CHECKREG r5, 0x00004849;
	CHECKREG r7, 0x00008889;

	R4 = W [ P5 -- ] (X);
	R5 = W [ P1 -- ] (X);
	R6 = W [ P2 -- ] (X);
	R0 = W [ P4 -- ] (X);
	R1 = W [ FP -- ] (X);
	CHECKREG r0, 0xFFFF8A8B;
	CHECKREG r1, 0x00000A0B;
	CHECKREG r3, 0x00000809;
	CHECKREG r4, 0x00000A0B;
	CHECKREG r5, 0x00002A2B;
	CHECKREG r6, 0x00004A4B;

	R5 = W [ P5 -- ] (X);
	R6 = W [ P1 -- ] (X);
	R7 = W [ P2 -- ] (X);
	R1 = W [ P4 -- ] (X);
	R2 = W [ FP -- ] (X);
	CHECKREG r1, 0xFFFF8485;
	CHECKREG r2, 0x00000405;
	CHECKREG r4, 0x00000A0B;
	CHECKREG r5, 0x00000405;
	CHECKREG r6, 0x00002425;
	CHECKREG r7, 0x00004445;

	R6 = W [ P5 -- ] (X);
	R7 = W [ P1 -- ] (X);
	R0 = W [ P2 -- ] (X);
	R2 = W [ P4 -- ] (X);
	R3 = W [ FP -- ] (X);
	CHECKREG r0, 0x00004647;
	CHECKREG r2, 0xFFFF8687;
	CHECKREG r3, 0x00000607;
	CHECKREG r5, 0x00000405;
	CHECKREG r6, 0x00000607;
	CHECKREG r7, 0x00002627;

	R7 = W [ P5 -- ] (X);
	R0 = W [ P1 -- ] (X);
	R1 = W [ P2 -- ] (X);
	R3 = W [ P4 -- ] (X);
	R4 = W [ FP -- ] (X);
	CHECKREG r0, 0x00002021;
	CHECKREG r1, 0x00004041;
	CHECKREG r3, 0xFFFF8081;
	CHECKREG r4, 0x00000001;
	CHECKREG r6, 0x00000607;
	CHECKREG r7, 0x00000001;

	loadsym p5, DATA_ADDR_1;
	loadsym p1, DATA_ADDR_2;
	loadsym p2, DATA_ADDR_3;
	loadsym p4, DATA_ADDR_5;
	loadsym fp, DATA_ADDR_6;

	R0 = B [ P5 ++ ] (Z);
	R1 = B [ P1 ++ ] (Z);
	R2 = B [ P2 ++ ] (Z);
	R4 = B [ P4 ++ ] (Z);
	R5 = B [ FP ++ ] (Z);
	CHECKREG r0, 0x00000003;
	CHECKREG r1, 0x00000023;
	CHECKREG r2, 0x00000043;
	CHECKREG r4, 0x00000083;
	CHECKREG r5, 0x00000003;
	R1 = B [ P5 ++ ] (Z);
	R2 = B [ P1 ++ ] (Z);
	R3 = B [ P2 ++ ] (Z);
	R5 = B [ P4 ++ ] (Z);
	R6 = B [ FP ++ ] (Z);
	CHECKREG r0, 0x00000003;
	CHECKREG r1, 0x00000002;
	CHECKREG r2, 0x00000022;
	CHECKREG r3, 0x00000042;
	CHECKREG r5, 0x00000082;
	CHECKREG r6, 0x00000002;
	R2 = B [ P5 ++ ] (Z);
	R3 = B [ P1 ++ ] (Z);
	R4 = B [ P2 ++ ] (Z);
	R6 = B [ P4 ++ ] (Z);
	R7 = B [ FP ++ ] (Z);
	CHECKREG r1, 0x00000002;
	CHECKREG r2, 0x00000001;
	CHECKREG r3, 0x00000021;
	CHECKREG r4, 0x00000041;
	CHECKREG r6, 0x00000081;
	CHECKREG r7, 0x00000001;

	R3 = B [ P5 ++ ] (Z);
	R4 = B [ P1 ++ ] (Z);
	R5 = B [ P2 ++ ] (Z);
	R7 = B [ P4 ++ ] (Z);
	R0 = B [ FP ++ ] (Z);
	CHECKREG r0, 0x00000000;
	CHECKREG r2, 0x00000001;
	CHECKREG r3, 0x00000000;
	CHECKREG r4, 0x00000020;
	CHECKREG r5, 0x00000040;
	CHECKREG r7, 0x00000080;

	R4 = B [ P5 ++ ] (X);
	R5 = B [ P1 ++ ] (X);
	R6 = B [ P2 ++ ] (X);
	R0 = B [ P4 ++ ] (X);
	R1 = B [ FP ++ ] (X);
	CHECKREG r0, 0xFFFFFF87;
	CHECKREG r1, 0x00000007;
	CHECKREG r3, 0x00000000;
	CHECKREG r4, 0x00000007;
	CHECKREG r5, 0x00000027;
	CHECKREG r6, 0x00000047;

	R5 = B [ P5 ++ ] (X);
	R6 = B [ P1 ++ ] (X);
	R7 = B [ P2 ++ ] (X);
	R1 = B [ P4 ++ ] (X);
	R2 = B [ FP ++ ] (X);
	CHECKREG r1, 0xFFFFFF86;
	CHECKREG r2, 0x00000006;
	CHECKREG r4, 0x00000007;
	CHECKREG r5, 0x00000006;
	CHECKREG r6, 0x00000026;
	CHECKREG r7, 0x00000046;

	R6 = B [ P5 ++ ] (X);
	R7 = B [ P1 ++ ] (X);
	R0 = B [ P2 ++ ] (X);
	R2 = B [ P4 ++ ] (X);
	R3 = B [ FP ++ ] (X);
	CHECKREG r0, 0x00000045;
	CHECKREG r2, 0xFFFFFF85;
	CHECKREG r3, 0x00000005;
	CHECKREG r5, 0x00000006;
	CHECKREG r6, 0x00000005;
	CHECKREG r7, 0x00000025;

	R7 = B [ P5 ++ ] (X);
	R0 = B [ P1 ++ ] (X);
	R1 = B [ P2 ++ ] (X);
	R3 = B [ P4 ++ ] (X);
	R4 = B [ FP ++ ] (X);
	CHECKREG r0, 0x00000024;
	CHECKREG r1, 0x00000044;
	CHECKREG r3, 0xFFFFFF84;
	CHECKREG r4, 0x00000004;
	CHECKREG r6, 0x00000005;
	CHECKREG r7, 0x00000004;

	R0 = B [ P5 -- ] (Z);
	R1 = B [ P1 -- ] (Z);
	R2 = B [ P2 -- ] (Z);
	R4 = B [ P4 -- ] (Z);
	R5 = B [ FP -- ] (Z);
	CHECKREG r0, 0x0000000B;
	CHECKREG r1, 0x0000002B;
	CHECKREG r2, 0x0000004B;
	CHECKREG r4, 0x0000008B;
	CHECKREG r5, 0x0000000B;
	R1 = B [ P5 -- ] (Z);
	R2 = B [ P1 -- ] (Z);
	R3 = B [ P2 -- ] (Z);
	R5 = B [ P4 -- ] (Z);
	R6 = B [ FP -- ] (Z);
	CHECKREG r0, 0x0000000B;
	CHECKREG r1, 0x00000004;
	CHECKREG r2, 0x00000024;
	CHECKREG r3, 0x00000044;
	CHECKREG r5, 0x00000084;
	CHECKREG r6, 0x00000004;
	R2 = B [ P5 -- ] (Z);
	R3 = B [ P1 -- ] (Z);
	R4 = B [ P2 -- ] (Z);
	R6 = B [ P4 -- ] (Z);
	R7 = B [ FP -- ] (Z);
	CHECKREG r1, 0x00000004;
	CHECKREG r2, 0x00000005;
	CHECKREG r3, 0x00000025;
	CHECKREG r4, 0x00000045;
	CHECKREG r6, 0x00000085;
	CHECKREG r7, 0x00000005;

	R3 = B [ P5 -- ] (Z);
	R4 = B [ P1 -- ] (Z);
	R5 = B [ P2 -- ] (Z);
	R7 = B [ P4 -- ] (Z);
	R0 = B [ FP -- ] (Z);
	CHECKREG r0, 0x00000006;
	CHECKREG r2, 0x00000005;
	CHECKREG r3, 0x00000006;
	CHECKREG r4, 0x00000026;
	CHECKREG r5, 0x00000046;
	CHECKREG r7, 0x00000086;

	R4 = B [ P5 -- ] (X);
	R5 = B [ P1 -- ] (X);
	R6 = B [ P2 -- ] (X);
	R0 = B [ P4 -- ] (X);
	R1 = B [ FP -- ] (X);
	CHECKREG r0, 0xFFFFFF87;
	CHECKREG r1, 0x00000007;
	CHECKREG r3, 0x00000006;
	CHECKREG r4, 0x00000007;
	CHECKREG r5, 0x00000027;
	CHECKREG r6, 0x00000047;

	R5 = B [ P5 -- ] (X);
	R6 = B [ P1 -- ] (X);
	R7 = B [ P2 -- ] (X);
	R1 = B [ P4 -- ] (X);
	R2 = B [ FP -- ] (X);
	CHECKREG r1, 0xFFFFFF80;
	CHECKREG r2, 0x00000000;
	CHECKREG r4, 0x00000007;
	CHECKREG r5, 0x00000000;
	CHECKREG r6, 0x00000020;
	CHECKREG r7, 0x00000040;

	R6 = B [ P5 -- ] (X);
	R7 = B [ P1 -- ] (X);
	R0 = B [ P2 -- ] (X);
	R2 = B [ P4 -- ] (X);
	R3 = B [ FP -- ] (X);
	CHECKREG r0, 0x00000041;
	CHECKREG r2, 0xFFFFFF81;
	CHECKREG r3, 0x00000001;
	CHECKREG r5, 0x00000000;
	CHECKREG r6, 0x00000001;
	CHECKREG r7, 0x00000021;

	R7 = B [ P5 -- ] (X);
	R0 = B [ P1 -- ] (X);
	R1 = B [ P2 -- ] (X);
	R3 = B [ P4 -- ] (X);
	R4 = B [ FP -- ] (X);
	CHECKREG r0, 0x00000022;
	CHECKREG r1, 0x00000042;
	CHECKREG r3, 0xFFFFFF82;
	CHECKREG r4, 0x00000002;
	CHECKREG r6, 0x00000001;
	CHECKREG r7, 0x00000002;

	pass

// Pre-load memory with known data
// More data is defined than will actually be used

	.data
DATA_ADDR_1:
	.dd 0x00010203
	.dd 0x04050607
	.dd 0x08090A0B
	.dd 0x0C0D0E0F
	.dd 0x10111213
	.dd 0x14151617
	.dd 0x18191A1B
	.dd 0x1C1D1E1F
	.dd 0x11223344
	.dd 0x55667788
	.dd 0x99717273
	.dd 0x74757677
	.dd 0x82838485
	.dd 0x86878889
	.dd 0x80818283
	.dd 0x84858687
	.dd 0x01020304
	.dd 0x05060708
	.dd 0x09101112
	.dd 0x14151617
	.dd 0x18192021
	.dd 0x22232425
	.dd 0x26272829
	.dd 0x30313233
	.dd 0x34353637
	.dd 0x38394041
	.dd 0x42434445
	.dd 0x46474849
	.dd 0x50515253
	.dd 0x54555657
	.dd 0x58596061
	.dd 0x62636465
	.dd 0x66676869
	.dd 0x74555657
	.dd 0x78596067
	.dd 0x72636467
	.dd 0x76676867

DATA_ADDR_2:
	.dd 0x20212223
	.dd 0x24252627
	.dd 0x28292A2B
	.dd 0x2C2D2E2F
	.dd 0x30313233
	.dd 0x34353637
	.dd 0x38393A3B
	.dd 0x3C3D3E3F
	.dd 0x91929394
	.dd 0x95969798
	.dd 0x99A1A2A3
	.dd 0xA5A6A7A8
	.dd 0xA9B0B1B2
	.dd 0xB3B4B5B6
	.dd 0xB7B8B9C0
	.dd 0x70717273
	.dd 0x74757677
	.dd 0x78798081
	.dd 0x82838485
	.dd 0x86C283C4
	.dd 0x81C283C4
	.dd 0x82C283C4
	.dd 0x83C283C4
	.dd 0x84C283C4
	.dd 0x85C283C4
	.dd 0x86C283C4
	.dd 0x87C288C4
	.dd 0x88C283C4
	.dd 0x89C283C4
	.dd 0x80C283C4
	.dd 0x81C283C4
	.dd 0x82C288C4
	.dd 0x94555659
	.dd 0x98596069
	.dd 0x92636469
	.dd 0x96676869

DATA_ADDR_3:
	.dd 0x40414243
	.dd 0x44454647
	.dd 0x48494A4B
	.dd 0x4C4D4E4F
	.dd 0x50515253
	.dd 0x54555657
	.dd 0x58595A5B
	.dd 0xC5C6C7C8
	.dd 0xC9CACBCD
	.dd 0xCFD0D1D2
	.dd 0xD3D4D5D6
	.dd 0xD7D8D9DA
	.dd 0xDBDCDDDE
	.dd 0xDFE0E1E2
	.dd 0xE3E4E5E6
	.dd 0x91E899EA
	.dd 0x92E899EA
	.dd 0x93E899EA
	.dd 0x94E899EA
	.dd 0x95E899EA
	.dd 0x96E899EA
	.dd 0x97E899EA
	.dd 0x98E899EA
	.dd 0x99E899EA
	.dd 0x91E899EA
	.dd 0x92E899EA
	.dd 0x93E899EA
	.dd 0x94E899EA
	.dd 0x95E899EA
	.dd 0x96E899EA
	.dd 0x977899EA
	.dd 0xa455565a
	.dd 0xa859606a
	.dd 0xa263646a
	.dd 0xa667686a

DATA_ADDR_4:
	.dd 0x60616263
	.dd 0x64656667
	.dd 0x68696A6B
	.dd 0x6C6D6E6F
	.dd 0x70717273
	.dd 0x74757677
	.dd 0x78797A7B
	.dd 0x7C7D7E7F
	.dd 0xEBECEDEE
	.dd 0xF3F4F5F6
	.dd 0xF7F8F9FA
	.dd 0xFBFCFDFE
	.dd 0xFF000102
	.dd 0x03040506
	.dd 0x0708090A
	.dd 0x0B0CAD0E
	.dd 0xAB0CAD01
	.dd 0xAB0CAD02
	.dd 0xAB0CAD03
	.dd 0xAB0CAD04
	.dd 0xAB0CAD05
	.dd 0xAB0CAD06
	.dd 0xAB0CAA07
	.dd 0xAB0CAD08
	.dd 0xAB0CAD09
	.dd 0xAB0CAD0E
	.dd 0xAB0CAD0E
	.dd 0xAB0CAD0E
	.dd 0xAB0CAD0E
	.dd 0xAB0CAD0E
	.dd 0xAB0CAD0E
	.dd 0xAB0CAD0E
	.dd 0xB455565B
	.dd 0xB859606B
	.dd 0xB263646B
	.dd 0xB667686B

DATA_ADDR_5:
	.dd 0x80818283
	.dd 0x84858687
	.dd 0x88898A8B
	.dd 0x8C8D8E8F
	.dd 0x90919293
	.dd 0x94959697
	.dd 0x98999A9B
	.dd 0x9C9D9E9F
	.dd 0x0F101213
	.dd 0x14151617
	.dd 0x18191A1B
	.dd 0x1C1D1E1F
	.dd 0x20212223
	.dd 0x24252627
	.dd 0x28292A2B
	.dd 0x2C2D2E2F
	.dd 0xBC0DBE21
	.dd 0xBC1DBE22
	.dd 0xBC2DBE23
	.dd 0xBC3DBE24
	.dd 0xBC4DBE65
	.dd 0xBC5DBE27
	.dd 0xBC6DBE28
	.dd 0xBC7DBE29
	.dd 0xBC8DBE2F
	.dd 0xBC9DBE20
	.dd 0xBCADBE21
	.dd 0xBCBDBE2F
	.dd 0xBCCDBE23
	.dd 0xBCDDBE24
	.dd 0xBCFDBE25
	.dd 0xC455565C
	.dd 0xC859606C
	.dd 0xC263646C
	.dd 0xC667686C
	.dd 0xCC0DBE2C

DATA_ADDR_6:
	.dd 0x00010203
	.dd 0x04050607
	.dd 0x08090A0B
	.dd 0x0C0D0E0F
	.dd 0x10111213
	.dd 0x14151617
	.dd 0x18191A1B
	.dd 0x1C1D1E1F
	.dd 0x20212223
	.dd 0x24252627
	.dd 0x28292A2B
	.dd 0x2C2D2E2F
	.dd 0x30313233
	.dd 0x34353637
	.dd 0x38393A3B
	.dd 0x3C3D3E3F
	.dd 0x40414243
	.dd 0x44454647
	.dd 0x48494A4B
	.dd 0x4C4D4E4F
	.dd 0x50515253
	.dd 0x54555657
	.dd 0x58595A5B
	.dd 0x5C5D5E5F
	.dd 0x60616263
	.dd 0x64656667
	.dd 0x68696A6B
	.dd 0x6C6D6E6F
	.dd 0x70717273
	.dd 0x74757677
	.dd 0x78797A7B
	.dd 0x7C7D7E7F

DATA_ADDR_7:
	.dd 0x80818283
	.dd 0x84858687
	.dd 0x88898A8B
	.dd 0x8C8D8E8F
	.dd 0x90919293
	.dd 0x94959697
	.dd 0x98999A9B
	.dd 0x9C9D9E9F
	.dd 0xA0A1A2A3
	.dd 0xA4A5A6A7
	.dd 0xA8A9AAAB
	.dd 0xACADAEAF
	.dd 0xB0B1B2B3
	.dd 0xB4B5B6B7
	.dd 0xB8B9BABB
	.dd 0xBCBDBEBF
	.dd 0xC0C1C2C3
	.dd 0xC4C5C6C7
	.dd 0xC8C9CACB
	.dd 0xCCCDCECF
	.dd 0xD0D1D2D3
	.dd 0xD4D5D6D7
	.dd 0xD8D9DADB
	.dd 0xDCDDDEDF
	.dd 0xE0E1E2E3
	.dd 0xE4E5E6E7
	.dd 0xE8E9EAEB
	.dd 0xECEDEEEF
	.dd 0xF0F1F2F3
	.dd 0xF4F5F6F7
	.dd 0xF8F9FAFB
	.dd 0xFCFDFEFF
