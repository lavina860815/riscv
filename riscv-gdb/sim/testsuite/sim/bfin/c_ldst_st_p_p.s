//Original:/testcases/core/c_ldst_st_p_p/c_ldst_st_p_p.dsp
// Spec Reference: c_ldst st_p_p
# mach: bfin

.include "testutils.inc"
	start

	imm32 r0, 0x0a231507;
	imm32 r1, 0x1b342618;
	imm32 r2, 0x2c453729;
	imm32 r3, 0x3d56483a;
	imm32 r4, 0x4e67594b;
	imm32 r5, 0x5f786a5c;
	imm32 r6, 0x60897b6d;
	imm32 r7, 0x719a8c7e;

// initial values  p-p
	imm32 p5, 0x0a231507;
	imm32 p1, 0x1b342618;
	imm32 p2, 0x2c453729;

	loadsym p4, DATA_ADDR_5;
	loadsym fp, DATA_ADDR_6;

	[ P4 ] = P1;
	[ FP ] = P2;
	R5 = [ P4 ];
	R6 = [ FP ];
	CHECKREG r5, 0x1B342618;
	CHECKREG r6, 0x2C453729;

	[ P4 ] = P2;
	[ FP ] = R3;
	R5 = [ P4 ];
	R6 = [ FP ];
	CHECKREG r5, 0x2C453729;
	CHECKREG r6, 0x3D56483A;

	[ P4 ] = R3;
	[ FP ] = P5;
	R5 = [ P4 ];
	R6 = [ FP ];
	CHECKREG r5, 0x3D56483A;
	CHECKREG r6, 0x0A231507;

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

DATA_ADDR_2:
	.dd 0x20212223
	.dd 0x24252627
	.dd 0x28292A2B
	.dd 0x2C2D2E2F
	.dd 0x30313233
	.dd 0x34353637
	.dd 0x38393A3B
	.dd 0x3C3D3E3F

DATA_ADDR_3:
	.dd 0x40414243
	.dd 0x44454647
	.dd 0x48494A4B
	.dd 0x4C4D4E4F
	.dd 0x50515253
	.dd 0x54555657
	.dd 0x58595A5B
	.dd 0x5C5D5E5F

DATA_ADDR_4:
	.dd 0x60616263
	.dd 0x64656667
	.dd 0x68696A6B
	.dd 0x6C6D6E6F
	.dd 0x70717273
	.dd 0x74757677
	.dd 0x78797A7B
	.dd 0x7C7D7E7F

DATA_ADDR_5:
	.dd 0x80818283
	.dd 0x84858687
	.dd 0x88898A8B
	.dd 0x8C8D8E8F
	.dd 0x90919293
	.dd 0x94959697
	.dd 0x98999A9B
	.dd 0x9C9D9E9F

DATA_ADDR_6:
	.dd 0xA0A1A2A3
	.dd 0xA4A5A6A7
	.dd 0xA8A9AAAB
	.dd 0xACADAEAF
	.dd 0xB0B1B2B3
	.dd 0xB4B5B6B7
	.dd 0xB8B9BABB
	.dd 0xBCBDBEBF

DATA_ADDR_7:
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
