//Original:testcases/core/c_ldstidxl_st_dr_h/c_ldstidxl_st_dr_h.dsp
// Spec Reference: c_ldstidxl store dreg
# mach: bfin

.include "testutils.inc"
	start

// set all regs
init_i_regs 0;
init_b_regs 0;
init_l_regs 0;
init_m_regs 0;
I0 = P3;
I2 = SP;

// initial values
	imm32 r0, 0x105f50a0;
	imm32 r1, 0x204e60a1;
	imm32 r2, 0x300370a2;
	imm32 r3, 0x402c80a3;
	imm32 r4, 0x501b90a4;
	imm32 r5, 0x600aa0a5;
	imm32 r6, 0x7019b0a6;
	imm32 r7, 0xd028c0a7;
	I1 = P3; P3 = I0; I3 = SP; SP = I2;
	loadsym p1, DATA_ADDR_1, 0x00;
	loadsym p2, DATA_ADDR_2, 0xc8;
	loadsym i1, DATA_ADDR_1, 0x10;
	loadsym p4, DATA_ADDR_2, 0xc8;
	loadsym p5, DATA_ADDR_1, 0x00;
	loadsym fp, DATA_ADDR_2, 0xc8;
	loadsym i3, DATA_ADDR_1, 0x00;
	P3 = I1; SP = I3;

	W [ P1 + 0x1002 ] = R0;
	W [ P1 + 0x1004 ] = R1;
	W [ P1 + 0x1006 ] = R2;
	W [ P1 + 0x1008 ] = R3;
	W [ P2 + -0x1010 ] = R4;
	W [ P2 + -0x1022 ] = R5;
	W [ P2 + -0x1034 ] = R6;
	W [ P2 + -0x1046 ] = R7;
	R6 = W [ P1 + 0x1002 ] (Z);
	R5 = W [ P1 + 0x1004 ] (Z);
	R4 = W [ P1 + 0x1006 ] (Z);
	R3 = W [ P1 + 0x1008 ] (Z);
	R2 = W [ P2 + -0x1010 ] (Z);
	R7 = W [ P2 + -0x1022 ] (Z);
	R0 = W [ P2 + -0x1034 ] (Z);
	R1 = W [ P2 + -0x1046 ] (Z);
	CHECKREG r0, 0x0000B0A6;
	CHECKREG r1, 0x0000C0A7;
	CHECKREG r2, 0x000090A4;
	CHECKREG r3, 0x000080A3;
	CHECKREG r4, 0x000070A2;
	CHECKREG r5, 0x000060A1;
	CHECKREG r6, 0x000050A0;
	CHECKREG r7, 0x0000A0A5;

	imm32 r0, 0x10bf50b0;
	imm32 r1, 0x20be60b1;
	imm32 r2, 0x30bd70b2;
	imm32 r3, 0x40bc80b3;
	imm32 r4, 0x55bb90b4;
	imm32 r5, 0x60baa0b5;
	imm32 r6, 0x70b9b0b6;
	imm32 r7, 0x80b8c0b7;
	W [ P3 + 0x1018 ] = R0;
	W [ P3 + 0x1020 ] = R1;
	W [ P3 + 0x1022 ] = R2;
	W [ P3 + 0x1024 ] = R3;
	W [ P4 + -0x1026 ] = R4;
	W [ P4 + -0x1028 ] = R5;
	W [ P4 + -0x1030 ] = R6;
	W [ P4 + -0x1052 ] = R7;
	R3 = W [ P3 + 0x1018 ] (Z);
	R4 = W [ P3 + 0x1020 ] (Z);
	R0 = W [ P3 + 0x1022 ] (Z);
	R1 = W [ P3 + 0x1024 ] (Z);
	R2 = W [ P4 + -0x1026 ] (Z);
	R5 = W [ P4 + -0x1028 ] (Z);
	R6 = W [ P4 + -0x1030 ] (Z);
	R7 = W [ P4 + -0x1052 ] (Z);
	CHECKREG r0, 0x000070B2;
	CHECKREG r1, 0x000080B3;
	CHECKREG r2, 0x000090B4;
	CHECKREG r3, 0x000050B0;
	CHECKREG r4, 0x000060B1;
	CHECKREG r5, 0x0000A0B5;
	CHECKREG r6, 0x0000B0B6;
	CHECKREG r7, 0x0000C0B7;

// initial values
	imm32 r0, 0x10cf50c0;
	imm32 r1, 0x20ce60c1;
	imm32 r2, 0x30c370c2;
	imm32 r3, 0x40cc80c3;
	imm32 r4, 0x50cb90c4;
	imm32 r5, 0x60caa0c5;
	imm32 r6, 0x70c9b0c6;
	imm32 r7, 0xd0c8c0c7;
	W [ P5 + 0x1034 ] = R0;
	W [ P5 + 0x1036 ] = R1;
	W [ P5 + 0x1038 ] = R2;
	W [ P5 + 0x1040 ] = R3;
	W [ SP + -0x1042 ] = R4;
	W [ SP + -0x1054 ] = R5;
	W [ SP + -0x1066 ] = R6;
	W [ SP + -0x1078 ] = R7;
	R6 = W [ P5 + 0x1034 ] (Z);
	R5 = W [ P5 + 0x1036 ] (Z);
	R4 = W [ P5 + 0x1038 ] (Z);
	R3 = W [ P5 + 0x1040 ] (Z);
	R2 = W [ SP + -0x1042 ] (Z);
	R0 = W [ SP + -0x1054 ] (Z);
	R7 = W [ SP + -0x1066 ] (Z);
	R1 = W [ SP + -0x1078 ] (Z);
	CHECKREG r0, 0x0000A0C5;
	CHECKREG r1, 0x0000C0C7;
	CHECKREG r2, 0x000090C4;
	CHECKREG r3, 0x000080C3;
	CHECKREG r4, 0x000070C2;
	CHECKREG r5, 0x000060C1;
	CHECKREG r6, 0x000050C0;

// initial values
	imm32 r0, 0x60df50d0;
	imm32 r1, 0x70de60d1;
	imm32 r2, 0x80dd70d2;
	imm32 r3, 0x90dc80d3;
	imm32 r4, 0xa0db90d4;
	imm32 r5, 0xb0daa0d5;
	imm32 r6, 0xc0d9b0d6;
	imm32 r7, 0xd0d8c0d7;
	W [ FP + 0x1050 ] = R0;
	W [ FP + 0x1052 ] = R1;
	W [ FP + 0x1054 ] = R2;
	W [ FP + 0x1056 ] = R3;
	W [ FP + 0x1058 ] = R4;
	W [ FP + 0x1060 ] = R5;
	W [ FP + 0x1062 ] = R6;
	W [ FP + 0x1064 ] = R7;
	R3 = W [ FP + 0x1050 ] (Z);
	R4 = W [ FP + 0x1052 ] (Z);
	R0 = W [ FP + 0x1054 ] (Z);
	R1 = W [ FP + 0x1056 ] (Z);
	R2 = W [ FP + 0x1058 ] (Z);
	R5 = W [ FP + 0x1060 ] (Z);
	R6 = W [ FP + 0x1062 ] (Z);
	R7 = W [ FP + 0x1064 ] (Z);
	CHECKREG r0, 0x000070D2;
	CHECKREG r1, 0x000080D3;
	CHECKREG r2, 0x000090D4;
	CHECKREG r3, 0x000050D0;
	CHECKREG r4, 0x000060D1;
	CHECKREG r5, 0x0000A0D5;
	CHECKREG r6, 0x0000B0D6;
	CHECKREG r7, 0x0000C0D7;

	P3 = I0; SP = I2;
	pass

// Pre-load memory with known data
// More data is defined than will actually be used

	.data
	.space (0x2000);
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
	.dd 0xA00CAD1E
	.dd 0xA10CAD2E
	.dd 0xA20CAD3E
	.dd 0xA30CAD4E
	.dd 0xA40CAD5E
	.dd 0xA50CAD6E
	.dd 0xA60CAD7E
	.dd 0xB455565B
	.dd 0xB859606B
	.dd 0xB263646B
	.dd 0xB667686B
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
	.dd 0xA00CAD1E
	.dd 0xA10CAD2E
	.dd 0xA20CAD3E
	.dd 0xA30CAD4E
	.dd 0xA40CAD5E
	.dd 0xA50CAD6E
	.dd 0xA60CAD7E
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

// Make sure there is space for us to scribble
	.space (0x2000);
