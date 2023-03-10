//Original:/proj/frio/dv/testcases/core/c_dsp32mac_pair_a1_is/c_dsp32mac_pair_a1_is.dsp
// Spec Reference: dsp32mac pair a1  IS
# mach: bfin

.include "testutils.inc"
	start

	A1 = A0 = 0;

// The result accumulated in A1      , and stored to a reg half
	imm32 r0, 0x93545abd;
	imm32 r1, 0x89bcfec7;
	imm32 r2, 0xa8945679;
	imm32 r3, 0x00890007;
	imm32 r4, 0xefb89569;
	imm32 r5, 0x1235890b;
	imm32 r6, 0x000c089d;
	imm32 r7, 0x678e0089;
	R7 = ( A1 += R5.L * R0.L ), A0 = R5.L * R0.L (ISS2);
	P1 = A1.w;
	R1 = ( A1 = R4.L * R3.L ), A0 = R4.H * R3.L (ISS2);
	P2 = A1.w;
	R3 = ( A1 = R7.L * R2.L ), A0 += R7.H * R2.H (ISS2);
	P3 = A1.w;
	R5 = ( A1 += R6.L * R1.L ), A0 += R6.L * R1.H (ISS2);
	P4 = A1.w;
	CHECKREG r0, 0x93545ABD;
	CHECKREG r1, 0xFFFA2BBE;
	CHECKREG r2, 0xA8945679;
	CHECKREG r3, 0x0F06AE9C;
	CHECKREG r4, 0xEFB89569;
	CHECKREG r5, 0x11F835A8;
	CHECKREG r6, 0x000C089D;
	CHECKREG r7, 0xABAC163E;
	CHECKREG p1, 0xD5D60B1F;
	CHECKREG p2, 0xFFFD15DF;
	CHECKREG p3, 0x0783574E;
	CHECKREG p4, 0x08FC1AD4;

	imm32 r0, 0x98464abd;
	imm32 r1, 0xa1b5f4c7;
	imm32 r2, 0xa1146649;
	imm32 r3, 0x00010805;
	imm32 r4, 0xefbc1599;
	imm32 r5, 0x12350100;
	imm32 r6, 0x200c001d;
	imm32 r7, 0x628e0001;
	R5 = ( A1 += R1.L * R0.H ), A0 = R1.L * R0.L (ISS2);
	P1 = A1.w;
	R1 = ( A1 -= R5.L * R3.H ), A0 = R5.H * R3.L (ISS2);
	P2 = A1.w;
	R3 = ( A1 -= R4.L * R2.H ), A0 += R4.H * R2.H (ISS2);
	P3 = A1.w;
	R1 = ( A1 += R6.L * R7.H ), A0 += R6.L * R7.H (ISS2);
	P4 = A1.w;
	CHECKREG r0, 0x98464ABD;
	CHECKREG r1, 0x2B2A1FC8;
	CHECKREG r2, 0xA1146649;
	CHECKREG r3, 0x2B13CB9C;
	CHECKREG r4, 0xEFBC1599;
	CHECKREG r5, 0x1B10627C;
	CHECKREG r6, 0x200C001D;
	CHECKREG r7, 0x628E0001;
	CHECKREG p1, 0x0D88313E;
	CHECKREG p2, 0x0D87CEC2;
	CHECKREG p3, 0x1589E5CE;
	CHECKREG p4, 0x15950FE4;

	imm32 r0, 0x713a459d;
	imm32 r1, 0xabd6aec7;
	imm32 r2, 0x7a145a79;
	imm32 r3, 0x08a100a7;
	imm32 r4, 0xef9a156a;
	imm32 r5, 0x1225a10b;
	imm32 r6, 0x0003401d;
	imm32 r7, 0x678e0a61;
	R5 = ( A1 += R1.H * R0.L ), A0 -= R1.L * R0.L (ISS2);
	P1 = A1.w;
	R7 = ( A1 -= R2.H * R3.L ), A0 -= R2.H * R3.L (ISS2);
	P2 = A1.w;
	R1 = ( A1 = R7.H * R5.L ), A0 += R7.H * R5.H (ISS2);
	P3 = A1.w;
	R5 = ( A1 += R6.H * R4.L ), A0 += R6.L * R4.H (ISS2);
	P4 = A1.w;
	CHECKREG r0, 0x713A459D;
	CHECKREG r1, 0xFE604820;
	CHECKREG r2, 0x7A145A79;
	CHECKREG r3, 0x08A100A7;
	CHECKREG r4, 0xEF9A156A;
	CHECKREG r5, 0xFE60C89C;
	CHECKREG r6, 0x0003401D;
	CHECKREG r7, 0xFCC4FA2C;
	CHECKREG p1, 0xFEB22022;
	CHECKREG p2, 0xFE627D16;
	CHECKREG p3, 0xFF302410;
	CHECKREG p4, 0xFF30644E;

	imm32 r0, 0x773489bd;
	imm32 r1, 0x917cfec7;
	imm32 r2, 0xa9177679;
	imm32 r3, 0xd0910777;
	imm32 r4, 0xedb91579;
	imm32 r5, 0xd235910b;
	imm32 r6, 0x0d077999;
	imm32 r7, 0x677e0709;
	R1 = ( A1 += R5.H * R3.H ), A0 = R5.L * R3.L (ISS2);
	P1 = A1.w;
	R3 = ( A1 = R2.H * R1.H ), A0 = R2.H * R1.L (ISS2);
	P2 = A1.w;
	R5 = ( A1 -= R7.H * R0.H ), A0 += R7.H * R0.H (ISS2);
	P3 = A1.w;
	R7 = ( A1 += R4.H * R6.H ), A0 += R4.L * R6.H (ISS2);
	P4 = A1.w;
	CHECKREG r0, 0x773489BD;
	CHECKREG r1, 0x0F5908A6;
	CHECKREG r2, 0xA9177679;
	CHECKREG r3, 0xF59443FE;
	CHECKREG r4, 0xEDB91579;
	CHECKREG r5, 0x953314CE;
	CHECKREG r6, 0x0D077999;
	CHECKREG r7, 0x9356DEEC;
	CHECKREG p1, 0x07AC8453;
	CHECKREG p2, 0xFACA21FF;
	CHECKREG p3, 0xCA998A67;
	CHECKREG p4, 0xC9AB6F76;

	imm32 r0, 0x83547abd;
	imm32 r1, 0x88bc8ec7;
	imm32 r2, 0xa8895679;
	imm32 r3, 0x00080007;
	imm32 r4, 0xe6b86569;
	imm32 r5, 0x1A35860b;
	imm32 r6, 0x000c896d;
	imm32 r7, 0x67Be0096;
	R7 = ( A1 += R1.L * R0.L ) (ISS2);
	P1 = A1.w;
	R1 = ( A1 = R2.H * R3.L ) (ISS2);
	P2 = A1.w;
	R3 = ( A1 -= R7.L * R4.H ) (ISS2);
	P3 = A1.w;
	R5 = ( A1 += R6.H * R5.H ) (ISS2);
	P4 = A1.w;
	CHECKREG r0, 0x83547ABD;
	CHECKREG r1, 0xFFFB377E;
	CHECKREG r2, 0xA8895679;
	CHECKREG r3, 0xFFFB377E;
	CHECKREG r4, 0xE6B86569;
	CHECKREG r5, 0xFFFDAC76;
	CHECKREG r6, 0x000C896D;
	CHECKREG r7, 0x80000000;
	CHECKREG p1, 0x9362AE61;
	CHECKREG p2, 0xFFFD9BBF;
	CHECKREG p3, 0xFFFD9BBF;
	CHECKREG p4, 0xFFFED63B;

	imm32 r0, 0x9aa64abd;
	imm32 r1, 0xa1baf4c7;
	imm32 r2, 0xb114a649;
	imm32 r3, 0x0b010005;
	imm32 r4, 0xefbcdb69;
	imm32 r5, 0x123501bb;
	imm32 r6, 0x000c0d1b;
	imm32 r7, 0x678e0d01;
	R5 = ( A1 += R1.L * R0.H ) (M), A0 = R1.L * R0.L (ISS2);
	P1 = A1.w;
	R1 = ( A1 -= R2.L * R3.H ) (M), A0 = R2.H * R3.L (ISS2);
	P2 = A1.w;
	R3 = ( A1 = R4.L * R5.H ) (M), A0 += R4.H * R5.H (ISS2);
	P3 = A1.w;
	R1 = ( A1 += R6.L * R7.H ) (M), A0 += R6.L * R7.H (ISS2);
	P4 = A1.w;
	CHECKREG r0, 0x9AA64ABD;
	CHECKREG r1, 0xC54D5630;
	CHECKREG r2, 0xB114A649;
	CHECKREG r3, 0xBAB3123C;
	CHECKREG r4, 0xEFBCDB69;
	CHECKREG r5, 0xF26E8A8A;
	CHECKREG r6, 0x000C0D1B;
	CHECKREG r7, 0x678E0D01;
	CHECKREG p1, 0xF9374545;
	CHECKREG p2, 0xFD127BFC;
	CHECKREG p3, 0xDD59891E;
	CHECKREG p4, 0xE2A6AB18;

	imm32 r0, 0xd136459d;
	imm32 r1, 0xabd69ec7;
	imm32 r2, 0x71145679;
	imm32 r3, 0xdd010007;
	imm32 r4, 0xeddc1569;
	imm32 r5, 0x122d010b;
	imm32 r6, 0x00e3d01d;
	imm32 r7, 0x678e0d61;
	R5 = A1 , A0 -= R1.L * R0.L (ISS2);
	P1 = A1.w;
	R7 = A1 , A0 = R2.H * R3.L (ISS2);
	P2 = A1.w;
	R1 = A1 , A0 += R4.H * R5.H (ISS2);
	P3 = A1.w;
	R5 = A1 , A0 += R6.L * R7.H (ISS2);
	P4 = A1.w;
	CHECKREG r0, 0xD136459D;
	CHECKREG r1, 0xC54D5630;
	CHECKREG r2, 0x71145679;
	CHECKREG r3, 0xDD010007;
	CHECKREG r4, 0xEDDC1569;
	CHECKREG r5, 0xC54D5630;
	CHECKREG r6, 0x00E3D01D;
	CHECKREG r7, 0xC54D5630;
	CHECKREG p1, 0xE2A6AB18;
	CHECKREG p2, 0xE2A6AB18;
	CHECKREG p3, 0xE2A6AB18;
	CHECKREG p4, 0xE2A6AB18;

	imm32 r0, 0x125489bd;
	imm32 r1, 0x91b5fec7;
	imm32 r2, 0xa9145679;
	imm32 r3, 0xd0910507;
	imm32 r4, 0x34567859;
	imm32 r5, 0xd2359105;
	imm32 r6, 0x0d0c0999;
	imm32 r7, 0x67de0009;
	R1 = ( A1 += R5.H * R3.H ) (M,ISS2);
	P1 = A1.w;
	R3 = ( A1 = R2.H * R1.H ) (M,ISS2);
	P2 = A1.w;
	R5 = ( A1 -= R7.H * R0.H ) (M,ISS2);
	P3 = A1.w;
	R7 = ( A1 += R4.H * R6.H ) (M,ISS2);
	P4 = A1.w;
	CHECKREG r0, 0x125489BD;
	CHECKREG r1, 0x80000000;
	CHECKREG r2, 0xA9145679;
	CHECKREG r3, 0xA9140000;
	CHECKREG r4, 0x34567859;
	CHECKREG r5, 0x9A349E50;
	CHECKREG r6, 0x0D0C0999;
	CHECKREG r7, 0x9F8A4260;
	CHECKREG p1, 0xBD57CB1D;
	CHECKREG p2, 0xD48A0000;
	CHECKREG p3, 0xCD1A4F28;
	CHECKREG p4, 0xCFC52130;

	pass
