//Original:/proj/frio/dv/testcases/core/c_dsp32mac_pair_a1_s/c_dsp32mac_pair_a1_s.dsp
// Spec Reference: dsp32mac pair a1 S
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
	R7 = ( A1 += R5.L * R0.L ), A0 = R5.L * R0.L (S2RND);
	P1 = A1.w;
	R1 = ( A1 -= R4.L * R3.L ), A0 = R4.H * R3.L (S2RND);
	P2 = A1.w;
	R3 = ( A1 -= R7.L * R2.L ), A0 += R7.H * R2.H (S2RND);
	P3 = A1.w;
	R5 = ( A1 += R6.L * R1.L ), A0 += R6.L * R1.H (S2RND);
	P4 = A1.w;
	CHECKREG r0, 0x93545ABD;
	CHECKREG r1, 0x80000000;
	CHECKREG r2, 0xA8945679;
	CHECKREG r3, 0x80000000;
	CHECKREG r4, 0xEFB89569;
	CHECKREG r5, 0x80000000;
	CHECKREG r6, 0x000C089D;
	CHECKREG r7, 0x80000000;
	CHECKREG p1, 0xABAC163E;
	CHECKREG p2, 0xABB1EA80;
	CHECKREG p3, 0xABB1EA80;
	CHECKREG p4, 0xABB1EA80;

	imm32 r0, 0x98464abd;
	imm32 r1, 0xa1b5f4c7;
	imm32 r2, 0xa1146649;
	imm32 r3, 0x00010805;
	imm32 r4, 0xefbc1599;
	imm32 r5, 0x12350100;
	imm32 r6, 0x200c001d;
	imm32 r7, 0x628e0001;
	R5 = ( A1 += R1.L * R0.H ), A0 = R1.L * R0.L (S2RND);
	P1 = A1.w;
	R1 = ( A1 = R5.L * R3.H ), A0 -= R5.H * R3.L (S2RND);
	P2 = A1.w;
	R3 = ( A1 = R4.L * R2.H ), A0 += R4.H * R2.H (S2RND);
	P3 = A1.w;
	R1 = ( A1 += R6.L * R7.H ), A0 += R6.L * R7.H (S2RND);
	P4 = A1.w;
	CHECKREG r0, 0x98464ABD;
	CHECKREG r1, 0xE0244C28;
	CHECKREG r2, 0xA1146649;
	CHECKREG r3, 0xDFF7A3D0;
	CHECKREG r4, 0xEFBC1599;
	CHECKREG r5, 0x80000000;
	CHECKREG r6, 0x200C001D;
	CHECKREG r7, 0x628E0001;
	CHECKREG p1, 0xB4CA1754;
	CHECKREG p2, 0x00000000;
	CHECKREG p3, 0xEFFBD1E8;
	CHECKREG p4, 0xF0122614;

	imm32 r0, 0x713a459d;
	imm32 r1, 0xabd6aec7;
	imm32 r2, 0x7a145a79;
	imm32 r3, 0x08a100a7;
	imm32 r4, 0xef9a156a;
	imm32 r5, 0x1225a10b;
	imm32 r6, 0x0003401d;
	imm32 r7, 0x678e0a61;
	R5 = ( A1 += R1.H * R0.L ), A0 -= R1.L * R0.L (S2RND);
	P1 = A1.w;
	R7 = ( A1 = R2.H * R3.L ), A0 -= R2.H * R3.L (S2RND);
	P2 = A1.w;
	R1 = ( A1 = R7.H * R5.L ), A0 += R7.H * R5.H (S2RND);
	P3 = A1.w;
	R5 = ( A1 += R6.H * R4.L ), A0 += R6.L * R4.H (S2RND);
	P4 = A1.w;
	CHECKREG r0, 0x713A459D;
	CHECKREG r1, 0xFDC53700;
	CHECKREG r2, 0x7A145A79;
	CHECKREG r3, 0x08A100A7;
	CHECKREG r4, 0xEF9A156A;
	CHECKREG r5, 0xFDC637F8;
	CHECKREG r6, 0x0003401D;
	CHECKREG r7, 0x013E8C30;
	CHECKREG p1, 0xC24C4690;
	CHECKREG p2, 0x009F4618;
	CHECKREG p3, 0xFEE29B80;
	CHECKREG p4, 0xFEE31BFC;

	imm32 r0, 0x773489bd;
	imm32 r1, 0x917cfec7;
	imm32 r2, 0xa9177679;
	imm32 r3, 0xd0910777;
	imm32 r4, 0xedb91579;
	imm32 r5, 0xd235910b;
	imm32 r6, 0x0d077999;
	imm32 r7, 0x677e0709;
	R1 = ( A1 += R5.H * R3.H ), A0 = R5.L * R3.L (S2RND);
	P1 = A1.w;
	R3 = ( A1 -= R2.H * R1.H ), A0 = R2.H * R1.L (S2RND);
	P2 = A1.w;
	R5 = ( A1 = R7.H * R0.H ), A0 += R7.H * R0.H (S2RND);
	P3 = A1.w;
	R7 = ( A1 += R4.H * R6.H ), A0 += R4.L * R6.H (S2RND);
	P4 = A1.w;
	CHECKREG r0, 0x773489BD;
	CHECKREG r1, 0x1FB6B80C;
	CHECKREG r2, 0xA9177679;
	CHECKREG r3, 0x4AC6BAA4;
	CHECKREG r4, 0xEDB91579;
	CHECKREG r5, 0x7FFFFFFF;
	CHECKREG r6, 0x0D077999;
	CHECKREG r7, 0x7FFFFFFF;
	CHECKREG p1, 0x0FDB5C06;
	CHECKREG p2, 0x25635D52;
	CHECKREG p3, 0x60612F30;
	CHECKREG p4, 0x5E84F94E;

	imm32 r0, 0x83547abd;
	imm32 r1, 0x88bc8ec7;
	imm32 r2, 0xa8895679;
	imm32 r3, 0x00080007;
	imm32 r4, 0xe6b86569;
	imm32 r5, 0x1A35860b;
	imm32 r6, 0x000c896d;
	imm32 r7, 0x67Be0096;
	R7 = ( A1 += R1.L * R0.L ) (S2RND);
	P1 = A1.w;
	R1 = ( A1 -= R2.H * R3.L ) (S2RND);
	P2 = A1.w;
	R3 = ( A1 = R7.L * R4.H ) (S2RND);
	P3 = A1.w;
	R5 = ( A1 += R6.H * R5.H ) (S2RND);
	P4 = A1.w;
	CHECKREG r0, 0x83547ABD;
	CHECKREG r1, 0xE3F07F4C;
	CHECKREG r2, 0xA8895679;
	CHECKREG r3, 0x06FFCF00;
	CHECKREG r4, 0xE6B86569;
	CHECKREG r5, 0x0704B8F0;
	CHECKREG r6, 0x000C896D;
	CHECKREG r7, 0xE3E6EE48;
	CHECKREG p1, 0xF1F37724;
	CHECKREG p2, 0xF1F83FA6;
	CHECKREG p3, 0x037FE780;
	CHECKREG p4, 0x03825C78;

	imm32 r0, 0x9aa64abd;
	imm32 r1, 0xa1baf4c7;
	imm32 r2, 0xb114a649;
	imm32 r3, 0x0b010005;
	imm32 r4, 0xefbcdb69;
	imm32 r5, 0x123501bb;
	imm32 r6, 0x000c0d1b;
	imm32 r7, 0x678e0d01;
	R5 = ( A1 += R1.L * R0.H ) (M), A0 = R1.L * R0.L (S2RND);
	P1 = A1.w;
	R1 = ( A1 -= R2.L * R3.H ) (M), A0 = R2.H * R3.L (S2RND);
	P2 = A1.w;
	R3 = ( A1 -= R4.L * R5.H ) (M), A0 -= R4.H * R5.H (S2RND);
	P3 = A1.w;
	R1 = ( A1 += R6.L * R7.H ) (M), A0 += R6.L * R7.H (S2RND);
	P4 = A1.w;
	CHECKREG r0, 0x9AA64ABD;
	CHECKREG r1, 0x5315786C;
	CHECKREG r2, 0xB114A649;
	CHECKREG r3, 0x487B3478;
	CHECKREG r4, 0xEFBCDB69;
	CHECKREG r5, 0xF9759704;
	CHECKREG r6, 0x000C0D1B;
	CHECKREG r7, 0x678E0D01;
	CHECKREG p1, 0xFCBACB82;
	CHECKREG p2, 0x00960239;
	CHECKREG p3, 0x243D9A3C;
	CHECKREG p4, 0x298ABC36;

	imm32 r0, 0xd136459d;
	imm32 r1, 0xabd69ec7;
	imm32 r2, 0x71145679;
	imm32 r3, 0xdd010007;
	imm32 r4, 0xeddc1569;
	imm32 r5, 0x122d010b;
	imm32 r6, 0x00e3d01d;
	imm32 r7, 0x678e0d61;
	R5 = A1 , A0 -= R1.L * R0.L (S2RND);
	P1 = A1.w;
	R7 = A1 , A0 = R2.H * R3.L (S2RND);
	P2 = A1.w;
	R1 = A1 , A0 -= R4.H * R5.H (S2RND);
	P3 = A1.w;
	R5 = A1 , A0 += R6.L * R7.H (S2RND);
	P4 = A1.w;
	CHECKREG r0, 0xD136459D;
	CHECKREG r1, 0x5315786C;
	CHECKREG r2, 0x71145679;
	CHECKREG r3, 0xDD010007;
	CHECKREG r4, 0xEDDC1569;
	CHECKREG r5, 0x5315786C;
	CHECKREG r6, 0x00E3D01D;
	CHECKREG r7, 0x5315786C;
	CHECKREG p1, 0x298ABC36;
	CHECKREG p2, 0x298ABC36;
	CHECKREG p3, 0x298ABC36;
	CHECKREG p4, 0x298ABC36;

	imm32 r0, 0x125489bd;
	imm32 r1, 0x91b5fec7;
	imm32 r2, 0xa9145679;
	imm32 r3, 0xd0910507;
	imm32 r4, 0x34567859;
	imm32 r5, 0xd2359105;
	imm32 r6, 0x0d0c0999;
	imm32 r7, 0x67de0009;
	R1 = ( A1 += R5.H * R3.H ) (M,S2RND);
	P1 = A1.w;
	R3 = ( A1 -= R2.H * R1.H ) (M,S2RND);
	P2 = A1.w;
	R5 = ( A1 = R7.H * R0.H ) (M,S2RND);
	P3 = A1.w;
	R7 = ( A1 += R4.H * R6.H ) (M,S2RND);
	P4 = A1.w;
	CHECKREG r0, 0x125489BD;
	CHECKREG r1, 0x0877B876;
	CHECKREG r2, 0xA9145679;
	CHECKREG r3, 0x0E3747DE;
	CHECKREG r4, 0x34567859;
	CHECKREG r5, 0x0EDF61B0;
	CHECKREG r6, 0x0D0C0999;
	CHECKREG r7, 0x143505C0;
	CHECKREG p1, 0x043BDC3B;
	CHECKREG p2, 0x071BA3EF;
	CHECKREG p3, 0x076FB0D8;
	CHECKREG p4, 0x0A1A82E0;

	pass
