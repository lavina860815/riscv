//Original:testcases/core/c_ldstii_ld_preg/c_ldstii_ld_preg.dsp
// Spec Reference: c_ldstii load preg
# mach: bfin

.include "testutils.inc"
	start

// set all regs
init_i_regs 0;
init_b_regs 0;
init_l_regs 0;
init_m_regs 0;
INIT_R_REGS 0;
I0 = P3;
I2 = SP;

// initial values
	I1 = P3; P3 = I0; I3 = SP; SP = I2;
	loadsym p1, DATA_ADDR_1, 0x00;
	loadsym p2, DATA_ADDR_2, 0x04;
	loadsym i1, DATA_ADDR_3, 0x04;
	loadsym p4, DATA_ADDR_1, 0x00;
	loadsym p5, DATA_ADDR_2, 0x00;
	loadsym fp, DATA_ADDR_3, 0x00;
	loadsym i3, DATA_ADDR_4, 0x00;
	P3 = I1; SP = I3;

	P2 = [ P1 + 0 ];
	P3 = [ P1 + 4 ];
	P4 = [ P1 + 8 ];
	P5 = [ P1 + 12 ];
	SP = [ P1 + 16 ];
	FP = [ P1 + 20 ];
	P1 = [ P1 + 24 ];
	CHECKREG p1, 0x18191A1B;
	CHECKREG p2, 0x00010203;
	CHECKREG p3, 0x04050607;
	CHECKREG p4, 0x08090A0B;
	CHECKREG p5, 0x0C0D0E0F;
	CHECKREG sp, 0x10111213;
	CHECKREG fp, 0x14151617;

	I1 = P3; P3 = I0; I3 = SP; SP = I2;
	loadsym p2, DATA_ADDR_2, 0x04;
	P3 = I1; SP = I3;

	P1 = [ P2 + 28 ];
	P3 = [ P2 + 36 ];
	P4 = [ P2 + 40 ];
	P5 = [ P2 + 44 ];
	SP = [ P2 + 48 ];
	FP = [ P2 + 52 ];
	P2 = [ P2 + 32 ];
	CHECKREG p1, 0x91929394;
	CHECKREG p2, 0x95969798;
	CHECKREG p3, 0x99A1A2A3;
	CHECKREG p4, 0xA5A6A7A8;
	CHECKREG p5, 0xA9B0B1B2;
	CHECKREG sp, 0xB3B4B5B6;
	CHECKREG fp, 0xB7B8B9C0;

	I1 = P3; P3 = I0; I3 = SP; SP = I2;
	loadsym i1, DATA_ADDR_3, 0x00;
	P3 = I1; SP = I3;

	P1 = [ P3 + 56 ];
	P2 = [ P3 + 60 ];
	P4 = [ P3 + 60 ];
	P5 = [ P3 + 56 ];
	SP = [ P3 + 52 ];
	FP = [ P3 + 48 ];
	P3 = [ P3 + 64 ];
	CHECKREG p1, 0xE3E4E5E6;
	CHECKREG p2, 0x91E899EA;
	CHECKREG p3, 0x92E899EA;
	CHECKREG p4, 0x91E899EA;
	CHECKREG p5, 0xE3E4E5E6;
	CHECKREG sp, 0xDFE0E1E2;
	CHECKREG fp, 0xDBDCDDDE;

	I1 = P3; P3 = I0; I3 = SP; SP = I2;
	loadsym p4, DATA_ADDR_4, 0x00;
	P3 = I1; SP = I3;

	P1 = [ P4 + 44 ];
	P2 = [ P4 + 40 ];
	P3 = [ P4 + 36 ];
	P5 = [ P4 + 28 ];
	SP = [ P4 + 24 ];
	FP = [ P4 + 20 ];
	P4 = [ P4 + 32 ];
	CHECKREG p1, 0xFBFCFDFE;
	CHECKREG p2, 0xF7F8F9FA;
	CHECKREG p3, 0xF3F4F5F6;
	CHECKREG p4, 0xEBECEDEE;
	CHECKREG p5, 0x7C7D7E7F;
	CHECKREG sp, 0x78797A7B;
	CHECKREG fp, 0x74757677;

	I1 = P3; P3 = I0; I3 = SP; SP = I2;
	loadsym p5, DATA_ADDR_1, 0x00;
	P3 = I1; SP = I3;

	P1 = [ P5 + 16 ];
	P2 = [ P5 + 12 ];
	P3 = [ P5 + 8 ];
	P4 = [ P5 + 0 ];
	SP = [ P5 + 4 ];
	FP = [ P5 + 8 ];
	P5 = [ P5 + 4 ];
	CHECKREG p1, 0x10111213;
	CHECKREG p2, 0x0C0D0E0F;
	CHECKREG p3, 0x08090A0B;
	CHECKREG p4, 0x00010203;
	CHECKREG p5, 0x04050607;
	CHECKREG sp, 0x04050607;
	CHECKREG fp, 0x08090A0B;

	I1 = P3; P3 = I0; I3 = SP; SP = I2;
	loadsym i3, DATA_ADDR_2, 0x00;
	P3 = I1; SP = I3;

	P1 = [ SP + 12 ];
	P2 = [ SP + 16 ];
	P3 = [ SP + 20 ];
	P4 = [ SP + 24 ];
	P5 = [ SP + 28 ];
	FP = [ SP + 32 ];
	SP = [ SP + 36 ];
	CHECKREG p1, 0x2C2D2E2F;
	CHECKREG p2, 0x30313233;
	CHECKREG p3, 0x34353637;
	CHECKREG p4, 0x38393A3B;
	CHECKREG p5, 0x3C3D3E3F;
	CHECKREG sp, 0x95969798;
	CHECKREG fp, 0x91929394;

	I1 = P3; P3 = I0; I3 = SP; SP = I2;
	loadsym fp, DATA_ADDR_3, 0x00;
	P3 = I1; SP = I3;

	P1 = [ FP + 40 ];
	P2 = [ FP + 44 ];
	P3 = [ FP + 48 ];
	P4 = [ FP + 52 ];
	P5 = [ FP + 56 ];
	SP = [ FP + 60 ];
	FP = [ FP + 64 ];
	CHECKREG p1, 0xD3D4D5D6;
	CHECKREG p2, 0xD7D8D9DA;
	CHECKREG p3, 0xDBDCDDDE;
	CHECKREG p4, 0xDFE0E1E2;
	CHECKREG p5, 0xE3E4E5E6;
	CHECKREG sp, 0x91E899EA;
	CHECKREG fp, 0x92E899EA;

	P3 = I0; SP = I2;
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
