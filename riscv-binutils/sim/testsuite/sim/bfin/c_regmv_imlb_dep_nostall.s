//Original:/proj/frio/dv/testcases/core/c_regmv_imlb_dep_nostall/c_regmv_imlb_dep_nostall.dsp
// Spec Reference: regmv imlb-dep no stall
# mach: bfin

.include "testutils.inc"
	start

// P-reg to I,M-reg to R-reg: no stall
//imm32 p0, 0x00001111;
	imm32 p1, 0x12213330;
	imm32 p2, 0x14415550;
	imm32 p3, 0x16617770;
	imm32 p4, 0x18819990;
	imm32 p5, 0x1aa1bbb0;
	imm32 fp, 0x1cc1ddd0;
	imm32 sp, 0x1ee1fff0;
	I0 = P0;
	R0 = I0;
	I1 = P1;
	R1 = I1;
	I2 = P2;
	R2 = I2;
	I3 = P3;
	R3 = I3;
	M0 = P4;
	R4 = M0;
	M1 = P5;
	R5 = M1;
	M2 = SP;
	R6 = M2;
	M3 = FP;
	R7 = M3;

	CHECKREG r1, 0x12213330;
	CHECKREG r2, 0x14415550;
	CHECKREG r3, 0x16617770;
	CHECKREG r4, 0x18819990;
	CHECKREG r5, 0x1aa1bbb0;
	CHECKREG r6, 0x1EE1FFF0;
	CHECKREG r7, 0x1CC1DDD0;

	R0 = M3;
	R1 = M2;
	R2 = M1;
	R3 = M0;
	R4 = I3;
	R5 = I2;
	R6 = I1;
	R7 = I0;
	CHECKREG r0, 0x1CC1DDD0;
	CHECKREG r1, 0x1EE1FFF0;
	CHECKREG r2, 0x1AA1BBB0;
	CHECKREG r3, 0x18819990;
	CHECKREG r4, 0x16617770;
	CHECKREG r5, 0x14415550;
	CHECKREG r6, 0x12213330;

// P-reg to L,B-reg to R-reg: no stall
//imm32 p0, 0x00001111;
	imm32 p1, 0x21213331;
	imm32 p2, 0x21415551;
	imm32 p3, 0x21617771;
	imm32 p4, 0x21819991;
	imm32 p5, 0x21a1bbb1;
	imm32 fp, 0x21c1ddd1;
	imm32 sp, 0x21e1fff1;
	L0 = P0;
	R0 = L0;
	L1 = P1;
	R1 = L1;
	L2 = P2;
	R2 = L2;
	L3 = P3;
	R3 = L3;
	B0 = P4;
	R4 = B0;
	B1 = P5;
	R5 = B1;
	B2 = SP;
	R6 = B2;
	B3 = FP;
	R7 = B3;

	CHECKREG r1, 0x21213331;
	CHECKREG r2, 0x21415551;
	CHECKREG r3, 0x21617771;
	CHECKREG r4, 0x21819991;
	CHECKREG r5, 0x21a1bbb1;
	CHECKREG r6, 0x21E1FFF1;
	CHECKREG r7, 0x21C1DDD1;

	R0 = L3;
	R1 = L2;
	R2 = L1;
	R3 = L0;
	R4 = B3;
	R5 = B2;
	R6 = B1;
	R7 = B0;
	CHECKREG r0, 0x21617771;
	CHECKREG r1, 0x21415551;
	CHECKREG r2, 0x21213331;
	CHECKREG r4, 0x21C1DDD1;
	CHECKREG r5, 0x21E1FFF1;
	CHECKREG r6, 0x21A1BBB1;
	CHECKREG r7, 0x21819991;

// P-reg to I,M-reg to L,B-reg: no stall
//imm32 p0, 0x00001111;
	imm32 p1, 0x72213337;
	imm32 p2, 0x74415557;
	imm32 p3, 0x76617777;
	imm32 p4, 0x78819997;
	imm32 p5, 0x7aa1bbb7;
	imm32 fp, 0x7cc1ddd7;
	imm32 sp, 0x77e1fff7;
	I0 = P0;
	L0 = I0;
	I1 = P1;
	L1 = I1;
	I2 = P2;
	L2 = I2;
	I3 = P3;
	L3 = I3;
	M0 = P4;
	B0 = M0;
	M1 = P5;
	B1 = M1;
	M2 = SP;
	B2 = M2;
	M3 = FP;
	B3 = M3;

	R0 = L3;
	R1 = L2;
	R2 = L1;
	R3 = L0;
	R4 = B3;
	R5 = B2;
	R6 = B1;
	R7 = B0;
	CHECKREG r0, 0x76617777;
	CHECKREG r1, 0x74415557;
	CHECKREG r2, 0x72213337;
	CHECKREG r4, 0x7CC1DDD7;
	CHECKREG r5, 0x77E1FFF7;
	CHECKREG r6, 0x7AA1BBB7;
	CHECKREG r7, 0x78819997;

	R0 = M3;
	R1 = M2;
	R2 = M1;
	R3 = M0;
	R4 = I3;
	R5 = I2;
	R6 = I1;
	R7 = I0;
	CHECKREG r0, 0x7CC1DDD7;
	CHECKREG r1, 0x77E1FFF7;
	CHECKREG r2, 0x7AA1BBB7;
	CHECKREG r3, 0x78819997;
	CHECKREG r4, 0x76617777;
	CHECKREG r5, 0x74415557;
	CHECKREG r6, 0x72213337;

// P-reg to L,B-reg to I,Mreg: no stall
//imm32 p0, 0x00001111;
	imm32 p1, 0x81213338;
	imm32 p2, 0x81415558;
	imm32 p3, 0x81617778;
	imm32 p4, 0x81819998;
	imm32 p5, 0x81a1bbb8;
	imm32 fp, 0x81c1ddd8;
	imm32 sp, 0x81e1fff8;
	L0 = P0;
	I0 = L0;
	L1 = P1;
	I1 = L1;
	L2 = P2;
	I2 = L2;
	L3 = P3;
	I3 = L3;
	B0 = P4;
	M0 = B0;
	B1 = P5;
	M1 = B1;
	B2 = SP;
	M2 = B2;
	B3 = FP;
	M3 = B3;

	R0 = M0;
	R1 = M1;
	R2 = M2;
	R3 = M3;
	R4 = I0;
	R5 = I1;
	R6 = I2;
	R7 = I3;
	CHECKREG r0, 0x81819998;
	CHECKREG r1, 0x81A1BBB8;
	CHECKREG r2, 0x81E1FFF8;
	CHECKREG r3, 0x81C1DDD8;
	CHECKREG r5, 0x81213338;
	CHECKREG r6, 0x81415558;
	CHECKREG r7, 0x81617778;

	R0 = L3;
	R1 = L2;
	R2 = L1;
	R3 = L0;
	R4 = B3;
	R5 = B2;
	R6 = B1;
	R7 = B0;
	CHECKREG r0, 0x81617778;
	CHECKREG r1, 0x81415558;
	CHECKREG r2, 0x81213338;
	CHECKREG r4, 0x81C1DDD8;
	CHECKREG r5, 0x81E1FFF8;
	CHECKREG r6, 0x81A1BBB8;
	CHECKREG r7, 0x81819998;

// I-to-M, I-to-I and to R-reg: no stall
	imm32 i0, 0x30001111;
	imm32 i1, 0x23213332;
	imm32 i2, 0x14315552;
	imm32 i3, 0x01637772;
	imm32 m0, 0x80113992;
	imm32 m1, 0xaa01b3b2;
	imm32 m2, 0xccc01d32;
	imm32 m3, 0xeee101f3;
	M0 = I0;
	R4 = M0;
	M1 = I1;
	R5 = M1;
	M2 = I2;
	R6 = M2;
	M3 = I3;
	R7 = M3;
	I0 = I3;
	R0 = I0;
	I1 = I2;
	R1 = I1;
	I3 = I0;
	R2 = I3;
	I2 = I1;
	R3 = I2;

	CHECKREG r0, 0x01637772;
	CHECKREG r1, 0x14315552;
	CHECKREG r2, 0x01637772;
	CHECKREG r3, 0x14315552;
	CHECKREG r4, 0x30001111;
	CHECKREG r5, 0x23213332;
	CHECKREG r6, 0x14315552;
	CHECKREG r7, 0x01637772;
	R0 = M0;
	R1 = M1;
	R2 = M2;
	R3 = M3;
	R4 = I0;
	R5 = I1;
	R6 = I2;
	R7 = I3;
	CHECKREG r0, 0x30001111;
	CHECKREG r1, 0x23213332;
	CHECKREG r2, 0x14315552;
	CHECKREG r3, 0x01637772;
	CHECKREG r4, 0x01637772;
	CHECKREG r5, 0x14315552;
	CHECKREG r6, 0x14315552;
	CHECKREG r7, 0x01637772;

// I-to-M, I-to-I and to P-reg: no stall
	imm32 i0, 0x00001111;
	imm32 i1, 0x42213342;
	imm32 i2, 0x44415542;
	imm32 i3, 0x46617742;
	imm32 m0, 0x48819942;
	imm32 m1, 0x4aa1bb42;
	imm32 m2, 0x4cc1dd42;
	imm32 m3, 0x4ee1ff42;
	M0 = I0;
	R0 = M0;
	M1 = I1;
	P1 = M1;
	M2 = I2;
	P2 = M2;
	M3 = I3;
	P3 = M3;
	I0 = I3;
	P4 = I0;
	I1 = I2;
	P5 = I1;
	I2 = I0;
	SP = I2;
	I3 = I1;
	FP = I3;

	CHECKREG r0, 0x00001111;
	CHECKREG p1, 0x42213342;
	CHECKREG p2, 0x44415542;
	CHECKREG p3, 0x46617742;
	CHECKREG p4, 0x46617742;
	CHECKREG p5, 0x44415542;
	CHECKREG sp, 0x46617742;
	CHECKREG fp, 0x44415542;
	R0 = M0;
	R1 = M1;
	R2 = M2;
	R3 = M3;
	R4 = I0;
	R5 = I1;
	R6 = I2;
	R7 = I3;
	CHECKREG r0, 0x00001111;
	CHECKREG r1, 0x42213342;
	CHECKREG r2, 0x44415542;
	CHECKREG r3, 0x46617742;
	CHECKREG r4, 0x46617742;
	CHECKREG r5, 0x44415542;
	CHECKREG r6, 0x46617742;
	CHECKREG r7, 0x44415542;

// L-to-B, L-to-L and to R-reg: no stall
	imm32 l0, 0x40001114;
	imm32 l1, 0x24213334;
	imm32 l2, 0x54415554;
	imm32 l3, 0x05647774;
	imm32 b0, 0x60514994;
	imm32 b1, 0xa605b4b4;
	imm32 b2, 0xcc605d44;
	imm32 b3, 0xeee605f4;
	B0 = L0;
	R4 = B0;
	B1 = L1;
	R5 = B1;
	B2 = L2;
	R6 = B2;
	B3 = L3;
	R7 = B3;
	L0 = L3;
	R0 = L0;
	L1 = L2;
	R1 = L1;
	L3 = L0;
	R2 = L3;
	L2 = L1;
	R3 = L2;

	CHECKREG r0, 0x05647774;
	CHECKREG r1, 0x54415554;
	CHECKREG r2, 0x05647774;
	CHECKREG r3, 0x54415554;
	CHECKREG r4, 0x40001114;
	CHECKREG r5, 0x24213334;
	CHECKREG r6, 0x54415554;
	CHECKREG r7, 0x05647774;
	R0 = L0;
	R1 = L1;
	R2 = L2;
	R3 = L3;
	R4 = B0;
	R5 = B1;
	R6 = B2;
	R7 = B3;
	CHECKREG r0, 0x05647774;
	CHECKREG r1, 0x54415554;
	CHECKREG r2, 0x54415554;
	CHECKREG r3, 0x05647774;
	CHECKREG r4, 0x40001114;
	CHECKREG r5, 0x24213334;
	CHECKREG r6, 0x54415554;
	CHECKREG r7, 0x05647774;

// L-to-B, L-to-L and to P-reg: no stall
	imm32 l0, 0x60001116;
	imm32 l1, 0x46213346;
	imm32 l2, 0x74615546;
	imm32 l3, 0x47667746;
	imm32 b0, 0x48716946;
	imm32 b1, 0x8aa7b646;
	imm32 b2, 0x48c17d66;
	imm32 b3, 0x4e81f746;
	M0 = I0;
	R0 = M0;
	M1 = I1;
	P1 = M1;
	M2 = I2;
	P2 = M2;
	M3 = I3;
	P3 = M3;
	I0 = I3;
	P4 = I0;
	I1 = I2;
	P5 = I1;
	I2 = I0;
	SP = I2;
	I3 = I1;
	FP = I3;

	CHECKREG r0, 0x46617742;
	CHECKREG p1, 0x44415542;
	CHECKREG p2, 0x46617742;
	CHECKREG p3, 0x44415542;
	CHECKREG p4, 0x44415542;
	CHECKREG p5, 0x46617742;
	CHECKREG sp, 0x44415542;
	CHECKREG fp, 0x46617742;
	R0 = M0;
	R1 = M1;
	R2 = M2;
	R3 = M3;
	R4 = I0;
	R5 = I1;
	R6 = I2;
	R7 = I3;
	CHECKREG r0, 0x46617742;
	CHECKREG r1, 0x44415542;
	CHECKREG r2, 0x46617742;
	CHECKREG r3, 0x44415542;
	CHECKREG r4, 0x44415542;
	CHECKREG r5, 0x46617742;
	CHECKREG r6, 0x44415542;
	CHECKREG r7, 0x46617742;

// I-to-M-to-L, I-to-I-to-B -reg: no stall
	imm32 i0, 0x90001119;
	imm32 i1, 0x93213339;
	imm32 i2, 0x94315559;
	imm32 i3, 0x91637779;
	imm32 m0, 0x90113999;
	imm32 m1, 0x9a01b3b9;
	imm32 m2, 0x9cc01d39;
	imm32 m3, 0x9ee101f9;
	M0 = I0;
	L0 = M0;
	M1 = I1;
	L1 = M1;
	M2 = I2;
	L2 = M2;
	M3 = I3;
	L3 = M3;
	I0 = I3;
	B0 = I0;
	I1 = I2;
	B1 = I1;
	I3 = I0;
	B2 = I3;
	I2 = I1;
	B3 = I2;

	R0 = L0;
	R1 = L1;
	R2 = L2;
	R3 = L3;
	R4 = B0;
	R5 = B1;
	R6 = B2;
	R7 = B3;
	CHECKREG r0, 0x90001119;
	CHECKREG r1, 0x93213339;
	CHECKREG r2, 0x94315559;
	CHECKREG r3, 0x91637779;
	CHECKREG r4, 0x91637779;
	CHECKREG r5, 0x94315559;
	CHECKREG r6, 0x91637779;
	CHECKREG r7, 0x94315559;
	R0 = M0;
	R1 = M1;
	R2 = M2;
	R3 = M3;
	R4 = I0;
	R5 = I1;
	R6 = I2;
	R7 = I3;
	CHECKREG r0, 0x90001119;
	CHECKREG r1, 0x93213339;
	CHECKREG r2, 0x94315559;
	CHECKREG r3, 0x91637779;
	CHECKREG r4, 0x91637779;
	CHECKREG r5, 0x94315559;
	CHECKREG r6, 0x94315559;
	CHECKREG r7, 0x91637779;

// I-to-M-B, I-to-I-L reg: no stall
	imm32 i0, 0xa000111a;
	imm32 i1, 0xaa21334a;
	imm32 i2, 0xa4a1554a;
	imm32 i3, 0xa66a774a;
	imm32 m0, 0xa881a94a;
	imm32 m1, 0xaaa1ba4a;
	imm32 m2, 0xacc1ddaa;
	imm32 m3, 0xaee1ff4a;
	M0 = I0;
	B3 = M0;
	M1 = I1;
	B2 = M1;
	M2 = I2;
	B1 = M2;
	M3 = I3;
	B0 = M3;
	I0 = I3;
	L1 = I0;
	I1 = I2;
	L2 = I1;
	I2 = I0;
	L3 = I2;
	I3 = I1;
	L0 = I3;

	R0 = L0;
	R1 = L1;
	R2 = L2;
	R3 = L3;
	R4 = B0;
	R5 = B1;
	R6 = B2;
	R7 = B3;
	CHECKREG r0, 0xA4A1554A;
	CHECKREG r1, 0xA66A774A;
	CHECKREG r2, 0xA4A1554A;
	CHECKREG r3, 0xA66A774A;
	CHECKREG r4, 0xA66A774A;
	CHECKREG r5, 0xA4A1554A;
	CHECKREG r6, 0xAA21334A;
	CHECKREG r7, 0xA000111A;
	R0 = M0;
	R1 = M1;
	R2 = M2;
	R3 = M3;
	R4 = I0;
	R5 = I1;
	R6 = I2;
	R7 = I3;
	CHECKREG r0, 0xA000111A;
	CHECKREG r1, 0xAA21334A;
	CHECKREG r2, 0xA4A1554A;
	CHECKREG r3, 0xA66A774A;
	CHECKREG r4, 0xA66A774A;
	CHECKREG r5, 0xA4A1554A;
	CHECKREG r6, 0xA66A774A;
	CHECKREG r7, 0xA4A1554A;

// L-to-B-to-I, L-to-L-to-M reg: no stall
	imm32 l0, 0xb000111b;
	imm32 l1, 0xb421333b;
	imm32 l2, 0xb441555b;
	imm32 l3, 0xb564777b;
	imm32 b0, 0xb051499b;
	imm32 b1, 0xb605b4bb;
	imm32 b2, 0xbc605d4b;
	imm32 b3, 0xbee605fb;
	B0 = L0;
	I2 = B0;
	B1 = L1;
	I3 = B1;
	B2 = L2;
	I0 = B2;
	B3 = L3;
	I1 = B3;
	L0 = L3;
	M0 = L0;
	L1 = L2;
	M1 = L1;
	L3 = L0;
	M2 = L3;
	L2 = L1;
	M3 = L2;

	R0 = I0;
	R1 = I1;
	R2 = I2;
	R3 = I3;
	R4 = M0;
	R5 = M1;
	R6 = M2;
	R7 = M3;
	CHECKREG r0, 0xB441555B;
	CHECKREG r1, 0xB564777B;
	CHECKREG r2, 0xB000111B;
	CHECKREG r3, 0xB421333B;
	CHECKREG r4, 0xB564777B;
	CHECKREG r5, 0xB441555B;
	CHECKREG r6, 0xB564777B;
	CHECKREG r7, 0xB441555B;
	R0 = L0;
	R1 = L1;
	R2 = L2;
	R3 = L3;
	R4 = B0;
	R5 = B1;
	R6 = B2;
	R7 = B3;
	CHECKREG r0, 0xB564777B;
	CHECKREG r1, 0xB441555B;
	CHECKREG r2, 0xB441555B;
	CHECKREG r3, 0xB564777B;
	CHECKREG r4, 0xB000111B;
	CHECKREG r5, 0xB421333B;
	CHECKREG r6, 0xB441555B;
	CHECKREG r7, 0xB564777B;

// B-to-L-to-M, B-to-B-to-I reg: no stall
	imm32 l0, 0xc000111c;
	imm32 l1, 0xc621334c;
	imm32 l2, 0xc461554c;
	imm32 l3, 0xc766774c;
	imm32 b0, 0xc871694c;
	imm32 b1, 0xcaa7b64c;
	imm32 b2, 0xc8c17d6c;
	imm32 b3, 0xce81f74c;
	L0 = B0;
	M1 = L0;
	L1 = B1;
	M2 = L1;
	L2 = B2;
	M3 = L2;
	L3 = B3;
	M0 = L3;
	B3 = B0;
	I0 = B3;
	B0 = B1;
	I1 = B0;
	B1 = B2;
	I2 = B1;
	B2 = B3;
	I3 = B2;

	R0 = L0;
	R1 = L1;
	R2 = L2;
	R3 = L3;
	R4 = B0;
	R5 = B1;
	R6 = B2;
	R7 = B3;
	CHECKREG r0, 0xC871694C;
	CHECKREG r1, 0xCAA7B64C;
	CHECKREG r2, 0xC8C17D6C;
	CHECKREG r3, 0xCE81F74C;
	CHECKREG r4, 0xCAA7B64C;
	CHECKREG r5, 0xC8C17D6C;
	CHECKREG r6, 0xC871694C;
	CHECKREG r7, 0xC871694C;
	R0 = M0;
	R1 = M1;
	R2 = M2;
	R3 = M3;
	R4 = I0;
	R5 = I1;
	R6 = I2;
	R7 = I3;
	CHECKREG r0, 0xCE81F74C;
	CHECKREG r1, 0xC871694C;
	CHECKREG r2, 0xCAA7B64C;
	CHECKREG r3, 0xC8C17D6C;
	CHECKREG r4, 0xC871694C;
	CHECKREG r5, 0xCAA7B64C;
	CHECKREG r6, 0xC8C17D6C;
	CHECKREG r7, 0xC871694C;

	pass
