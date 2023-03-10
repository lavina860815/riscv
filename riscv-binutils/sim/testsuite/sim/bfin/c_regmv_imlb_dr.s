//Original:/testcases/core/c_regmv_imlb_dr/c_regmv_imlb_dr.dsp
// Spec Reference: regmv imlb to dr
# mach: bfin

.include "testutils.inc"
	start






// initialize source regs
imm32 i0, 0x11111111;
imm32 i1, 0x22222222;
imm32 i2, 0x33333333;
imm32 i3, 0x44444444;


// i to dreg
R0 = I0;
R1 = I0;
R2 = I0;
R3 = I0;
R4 = I1;
R5 = I1;
R6 = I1;
R7 = I1;
CHECKREG r0, 0x11111111;
CHECKREG r1, 0x11111111;
CHECKREG r2, 0x11111111;
CHECKREG r3, 0x11111111;
CHECKREG r4, 0x22222222;
CHECKREG r5, 0x22222222;
CHECKREG r6, 0x22222222;
CHECKREG r7, 0x22222222;

R0 = I1;
R1 = I1;
R2 = I1;
R3 = I1;
R4 = I0;
R5 = I0;
R6 = I0;
R7 = I0;
CHECKREG r0, 0x22222222;
CHECKREG r1, 0x22222222;
CHECKREG r2, 0x22222222;
CHECKREG r3, 0x22222222;
CHECKREG r4, 0x11111111;
CHECKREG r5, 0x11111111;
CHECKREG r6, 0x11111111;
CHECKREG r7, 0x11111111;


// i to dreg
R0 = I2;
R1 = I2;
R2 = I2;
R3 = I2;
R4 = I3;
R5 = I3;
R6 = I3;
R7 = I3;
CHECKREG r0, 0x33333333;
CHECKREG r1, 0x33333333;
CHECKREG r2, 0x33333333;
CHECKREG r3, 0x33333333;
CHECKREG r4, 0x44444444;
CHECKREG r5, 0x44444444;
CHECKREG r6, 0x44444444;
CHECKREG r7, 0x44444444;

R0 = I3;
R1 = I3;
R2 = I3;
R3 = I3;
R4 = I2;
R5 = I2;
R6 = I2;
R7 = I2;
CHECKREG r0, 0x44444444;
CHECKREG r1, 0x44444444;
CHECKREG r2, 0x44444444;
CHECKREG r3, 0x44444444;
CHECKREG r4, 0x33333333;
CHECKREG r5, 0x33333333;
CHECKREG r6, 0x33333333;
CHECKREG r7, 0x33333333;


imm32 m0, 0x55555555;
imm32 m1, 0x66666666;
imm32 m2, 0x77777777;
imm32 m3, 0x88888888;
// m to dreg
R0 = M0;
R1 = M0;
R2 = M0;
R3 = M0;
R4 = M1;
R5 = M1;
R6 = M1;
R7 = M1;
CHECKREG r0, 0x55555555;
CHECKREG r1, 0x55555555;
CHECKREG r2, 0x55555555;
CHECKREG r3, 0x55555555;
CHECKREG r4, 0x66666666;
CHECKREG r5, 0x66666666;
CHECKREG r6, 0x66666666;
CHECKREG r7, 0x66666666;

R0 = M1;
R1 = M1;
R2 = M1;
R3 = M1;
R4 = M0;
R5 = M0;
R6 = M0;
R7 = M0;
CHECKREG r0, 0x66666666;
CHECKREG r1, 0x66666666;
CHECKREG r2, 0x66666666;
CHECKREG r3, 0x66666666;
CHECKREG r4, 0x55555555;
CHECKREG r5, 0x55555555;
CHECKREG r6, 0x55555555;
CHECKREG r7, 0x55555555;

R0 = M2;
R1 = M2;
R2 = M2;
R3 = M2;
R4 = M3;
R5 = M3;
R6 = M3;
R7 = M3;
CHECKREG r0, 0x77777777;
CHECKREG r1, 0x77777777;
CHECKREG r2, 0x77777777;
CHECKREG r3, 0x77777777;
CHECKREG r4, 0x88888888;
CHECKREG r5, 0x88888888;
CHECKREG r6, 0x88888888;
CHECKREG r7, 0x88888888;

R0 = M3;
R1 = M3;
R2 = M3;
R3 = M3;
R4 = M2;
R5 = M2;
R6 = M2;
R7 = M2;
CHECKREG r0, 0x88888888;
CHECKREG r1, 0x88888888;
CHECKREG r2, 0x88888888;
CHECKREG r3, 0x88888888;
CHECKREG r4, 0x77777777;
CHECKREG r5, 0x77777777;
CHECKREG r6, 0x77777777;
CHECKREG r7, 0x77777777;

imm32 l0, 0x99999999;
imm32 l1, 0xaaaaaaaa;
imm32 l2, 0xbbbbbbbb;
imm32 l3, 0xcccccccc;
// l to dreg
R0 = L0;
R1 = L0;
R2 = L0;
R3 = L0;
R4 = L1;
R5 = L1;
R6 = L1;
R7 = L1;
CHECKREG r0, 0x99999999;
CHECKREG r1, 0x99999999;
CHECKREG r2, 0x99999999;
CHECKREG r3, 0x99999999;
CHECKREG r4, 0xaaaaaaaa;
CHECKREG r5, 0xaaaaaaaa;
CHECKREG r6, 0xaaaaaaaa;
CHECKREG r7, 0xaaaaaaaa;

R0 = L1;
R1 = L1;
R2 = L1;
R3 = L1;
R4 = L0;
R5 = L0;
R6 = L0;
R7 = L0;
CHECKREG r0, 0xaaaaaaaa;
CHECKREG r1, 0xaaaaaaaa;
CHECKREG r2, 0xaaaaaaaa;
CHECKREG r3, 0xaaaaaaaa;
CHECKREG r4, 0x99999999;
CHECKREG r5, 0x99999999;
CHECKREG r6, 0x99999999;
CHECKREG r7, 0x99999999;


R0 = L2;
R1 = L2;
R2 = L2;
R3 = L2;
R4 = L3;
R5 = L3;
R6 = L3;
R7 = L3;
CHECKREG r0, 0xbbbbbbbb;
CHECKREG r1, 0xbbbbbbbb;
CHECKREG r2, 0xbbbbbbbb;
CHECKREG r3, 0xbbbbbbbb;
CHECKREG r4, 0xcccccccc;
CHECKREG r5, 0xcccccccc;
CHECKREG r6, 0xcccccccc;
CHECKREG r7, 0xcccccccc;

R0 = L3;
R1 = L3;
R2 = L3;
R3 = L3;
R4 = L2;
R5 = L2;
R6 = L2;
R7 = L2;
CHECKREG r0, 0xcccccccc;
CHECKREG r1, 0xcccccccc;
CHECKREG r2, 0xcccccccc;
CHECKREG r3, 0xcccccccc;
CHECKREG r4, 0xbbbbbbbb;
CHECKREG r5, 0xbbbbbbbb;
CHECKREG r6, 0xbbbbbbbb;
CHECKREG r7, 0xbbbbbbbb;


imm32 b0, 0xdddddddd;
imm32 b1, 0xeeeeeeee;
imm32 b2, 0xffffffff;
imm32 b3, 0x12345678;
// b to dreg
R0 = B0;
R1 = B0;
R2 = B0;
R3 = B0;
R4 = B1;
R5 = B1;
R6 = B1;
R7 = B1;
CHECKREG r0, 0xdddddddd;
CHECKREG r1, 0xdddddddd;
CHECKREG r2, 0xdddddddd;
CHECKREG r3, 0xdddddddd;
CHECKREG r4, 0xeeeeeeee;
CHECKREG r5, 0xeeeeeeee;
CHECKREG r6, 0xeeeeeeee;
CHECKREG r7, 0xeeeeeeee;

R0 = B1;
R1 = B1;
R2 = B1;
R3 = B1;
R4 = B0;
R5 = B0;
R6 = B0;
R7 = B0;
CHECKREG r0, 0xeeeeeeee;
CHECKREG r1, 0xeeeeeeee;
CHECKREG r2, 0xeeeeeeee;
CHECKREG r3, 0xeeeeeeee;
CHECKREG r4, 0xdddddddd;
CHECKREG r5, 0xdddddddd;
CHECKREG r6, 0xdddddddd;
CHECKREG r7, 0xdddddddd;

R0 = B2;
R1 = B2;
R2 = B2;
R3 = B2;
R4 = B3;
R5 = B3;
R6 = B3;
R7 = B3;
CHECKREG r0, 0xffffffff;
CHECKREG r1, 0xffffffff;
CHECKREG r2, 0xffffffff;
CHECKREG r3, 0xffffffff;
CHECKREG r4, 0x12345678;
CHECKREG r5, 0x12345678;
CHECKREG r6, 0x12345678;
CHECKREG r7, 0x12345678;

R0 = B3;
R1 = B3;
R2 = B3;
R3 = B3;
R4 = B2;
R5 = B2;
R6 = B2;
R7 = B2;
CHECKREG r0, 0x12345678;
CHECKREG r1, 0x12345678;
CHECKREG r2, 0x12345678;
CHECKREG r3, 0x12345678;
CHECKREG r4, 0xffffffff;
CHECKREG r5, 0xffffffff;
CHECKREG r6, 0xffffffff;
CHECKREG r7, 0xffffffff;

pass
