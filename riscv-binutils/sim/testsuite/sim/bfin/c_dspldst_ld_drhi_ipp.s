//Original:/testcases/core/c_dspldst_ld_drhi_ipp/c_dspldst_ld_drhi_ipp.dsp
// Spec Reference: c_dspldst ld_drhi_i++/--
# mach: bfin

.include "testutils.inc"
	start

// set all regs

	INIT_R_REGS 0;

// initial values
//i0=0x3000;
//i1=0x4000;
//i2=0x5000;
//i3=0x6000;
	loadsym I0, DATA_ADDR_3;
	loadsym I1, DATA_ADDR_4;
	loadsym I2, DATA_ADDR_5;
	loadsym I3, DATA_ADDR_6;

// Load Upper half of Dregs
	R0.H = W [ I0 ++ ];
	R1.H = W [ I1 ++ ];
	R2.H = W [ I2 ++ ];
	R3.H = W [ I3 ++ ];
	R4.H = W [ I0 ++ ];
	R5.H = W [ I1 ++ ];
	R6.H = W [ I2 ++ ];
	R7.H = W [ I3 ++ ];
	CHECKREG r0, 0x02030000;
	CHECKREG r1, 0x22230000;
	CHECKREG r2, 0x42430000;
	CHECKREG r3, 0x62630000;
	CHECKREG r4, 0x00010000;
	CHECKREG r5, 0x20210000;
	CHECKREG r6, 0x40410000;
	CHECKREG r7, 0x60610000;

	R1.H = W [ I0 ++ ];
	R2.H = W [ I1 ++ ];
	R3.H = W [ I2 ++ ];
	R4.H = W [ I3 ++ ];
	R5.H = W [ I0 ++ ];
	R6.H = W [ I1 ++ ];
	R7.H = W [ I2 ++ ];
	R0.H = W [ I3 ++ ];
	CHECKREG r0, 0x64650000;
	CHECKREG r1, 0x06070000;
	CHECKREG r2, 0x26270000;
	CHECKREG r3, 0x46470000;
	CHECKREG r4, 0x66670000;
	CHECKREG r5, 0x04050000;
	CHECKREG r6, 0x24250000;
	CHECKREG r7, 0x44450000;

	R2.H = W [ I0 ++ ];
	R3.H = W [ I1 ++ ];
	R4.H = W [ I2 ++ ];
	R5.H = W [ I3 ++ ];
	R6.H = W [ I0 ++ ];
	R7.H = W [ I1 ++ ];
	R0.H = W [ I2 ++ ];
	R1.H = W [ I3 ++ ];
	CHECKREG r0, 0x48490000;
	CHECKREG r1, 0x68690000;
	CHECKREG r2, 0x0A0B0000;
	CHECKREG r3, 0x2A2B0000;
	CHECKREG r4, 0x4A4B0000;
	CHECKREG r5, 0x6A6B0000;
	CHECKREG r6, 0x08090000;
	CHECKREG r7, 0x28290000;

	R3.H = W [ I0 ++ ];
	R4.H = W [ I1 ++ ];
	R5.H = W [ I2 ++ ];
	R6.H = W [ I3 ++ ];
	R7.H = W [ I0 ++ ];
	R0.H = W [ I1 ++ ];
	R1.H = W [ I2 ++ ];
	R2.H = W [ I3 ++ ];

	CHECKREG r0, 0x2C2D0000;
	CHECKREG r1, 0x4C4D0000;
	CHECKREG r2, 0x6C6D0000;
	CHECKREG r3, 0x0E0F0000;
	CHECKREG r4, 0x2E2F0000;
	CHECKREG r5, 0x4E4F0000;
	CHECKREG r6, 0x6E6F0000;
	CHECKREG r7, 0x0C0D0000;

// reverse to minus mninus i--
// Load Upper half of Dregs
	R0.H = W [ I0 -- ];
	R1.H = W [ I1 -- ];
	R2.H = W [ I2 -- ];
	R3.H = W [ I3 -- ];
	R4.H = W [ I0 -- ];
	R5.H = W [ I1 -- ];
	R6.H = W [ I2 -- ];
	R7.H = W [ I3 -- ];
	CHECKREG r0, 0x12130000;
	CHECKREG r1, 0x32330000;
	CHECKREG r2, 0x52530000;
	CHECKREG r3, 0x72730000;
	CHECKREG r4, 0x0C0D0000;
	CHECKREG r5, 0x2C2D0000;
	CHECKREG r6, 0x4C4D0000;
	CHECKREG r7, 0x6C6D0000;

	R1.H = W [ I0 -- ];
	R2.H = W [ I1 -- ];
	R3.H = W [ I2 -- ];
	R4.H = W [ I3 -- ];
	R5.H = W [ I0 -- ];
	R6.H = W [ I1 -- ];
	R7.H = W [ I2 -- ];
	R0.H = W [ I3 -- ];
	CHECKREG r0, 0x68690000;
	CHECKREG r1, 0x0E0F0000;
	CHECKREG r2, 0x2E2F0000;
	CHECKREG r3, 0x4E4F0000;
	CHECKREG r4, 0x6E6F0000;
	CHECKREG r5, 0x08090000;
	CHECKREG r6, 0x28290000;
	CHECKREG r7, 0x48490000;

	R2.H = W [ I0 -- ];
	R3.H = W [ I1 -- ];
	R4.H = W [ I2 -- ];
	R5.H = W [ I3 -- ];
	R6.H = W [ I0 -- ];
	R7.H = W [ I1 -- ];
	R0.H = W [ I2 -- ];
	R1.H = W [ I3 -- ];
	CHECKREG r0, 0x44450000;
	CHECKREG r1, 0x64650000;
	CHECKREG r2, 0x0A0B0000;
	CHECKREG r3, 0x2A2B0000;
	CHECKREG r4, 0x4A4B0000;
	CHECKREG r5, 0x6A6B0000;
	CHECKREG r6, 0x04050000;
	CHECKREG r7, 0x24250000;

	R3.H = W [ I0 -- ];
	R4.H = W [ I1 -- ];
	R5.H = W [ I2 -- ];
	R6.H = W [ I3 -- ];
	R7.H = W [ I0 -- ];
	R0.H = W [ I1 -- ];
	R1.H = W [ I2 -- ];
	R2.H = W [ I3 -- ];

	CHECKREG r0, 0x20210000;
	CHECKREG r1, 0x40410000;
	CHECKREG r2, 0x60610000;
	CHECKREG r3, 0x06070000;
	CHECKREG r4, 0x26270000;
	CHECKREG r5, 0x46470000;
	CHECKREG r6, 0x66670000;
	CHECKREG r7, 0x00010000;

	pass

// Pre-load memory with known data
// More data is defined than will actually be used

	.data

DATA_ADDR_3:
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

DATA_ADDR_4:
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

DATA_ADDR_5:
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

DATA_ADDR_6:
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

DATA_ADDR_7:
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
	.dd 0xBC0DBE26

DATA_ADDR_8:
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
