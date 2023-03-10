//Original:/testcases/core/c_alu2op_conv_mix/c_alu2op_conv_mix.dsp
// Spec Reference: alu2op convert mix
# mach: bfin

.include "testutils.inc"
	start



imm32 r0, 0x00789abc;
imm32 r1, 0x12345678;
imm32 r2, 0x23456789;
imm32 r3, 0x3456789a;
imm32 r4, 0x856789ab;
imm32 r5, 0x96789abc;
imm32 r6, 0xa789abcd;
imm32 r7, 0xb89abcde;
R0 = R0.B (X);
R1 = R1.L (X);
R2 = R2.L (Z);
R3 = R3.B (X);
R4 = R4.B (Z);
R5 = - R5;
R6 = ~ R6;
R7 = R7.L (X);
CHECKREG r0, 0xFFFFFFBC;
CHECKREG r1, 0x00005678;
CHECKREG r2, 0x00006789;
CHECKREG r3, 0xFFFFFF9A;
CHECKREG r4, 0x000000AB;
CHECKREG r5, 0x69876544;
CHECKREG r6, 0x58765432;
CHECKREG r7, 0xFFFFBCDE;

imm32 r0, 0x01230002;
imm32 r1, 0x00374659;
imm32 r2, 0x93456789;
imm32 r3, 0xa456789a;
imm32 r4, 0xb56789ab;
imm32 r5, 0xc6789abc;
imm32 r6, 0xd789abcd;
imm32 r7, 0xe89abcde;
R6 = R0.B (X);
R7 = R1.L (X);
R0 = R2.L (Z);
R1 = R3.B (X);
R2 = R4.B (Z);
R3 = - R5;
R4 = ~ R6;
R5 = R7.L (X);
CHECKREG r0, 0x00006789;
CHECKREG r1, 0xFFFFFF9A;
CHECKREG r2, 0x000000AB;
CHECKREG r3, 0x39876544;
CHECKREG r4, 0xFFFFFFFD;
CHECKREG r5, 0x00004659;
CHECKREG r6, 0x00000002;
CHECKREG r7, 0x00004659;

imm32 r0, 0x51230002;
imm32 r1, 0x12345678;
imm32 r2, 0x91203450;
imm32 r3, 0x3456789a;
imm32 r4, 0x956789ab;
imm32 r5, 0x86789abc;
imm32 r6, 0xa789abcd;
imm32 r7, 0x789abcde;
R5 = R0.B (X);
R6 = R1.L (X);
R7 = R2.L (Z);
R0 = R3.B (X);
R1 = R4.B (Z);
R2 = - R5;
R3 = ~ R6;
R4 = R7.L (X);
CHECKREG r0, 0xFFFFFF9A;
CHECKREG r1, 0x000000AB;
CHECKREG r2, 0xFFFFFFFE;
CHECKREG r3, 0xFFFFA987;
CHECKREG r4, 0x00003450;
CHECKREG r5, 0x00000002;
CHECKREG r6, 0x00005678;
CHECKREG r7, 0x00003450;

imm32 r0, 0x01230002;
imm32 r1, 0x82345678;
imm32 r2, 0x93456789;
imm32 r3, 0x00000000;
imm32 r4, 0xb56789ab;
imm32 r5, 0xc6789abc;
imm32 r6, 0xd789abcd;
imm32 r7, 0xe89abcde;
R4 = R0.B (X);
R5 = R1.L (X);
R6 = R2.L (Z);
R7 = R3.B (X);
R0 = R4.B (Z);
R1 = - R5;
R2 = ~ R6;
R3 = R7.L (X);
CHECKREG r0, 0x00000002;
CHECKREG r1, 0xFFFFA988;
CHECKREG r2, 0xFFFF9876;
CHECKREG r3, 0x00000000;
CHECKREG r4, 0x00000002;
CHECKREG r5, 0x00005678;
CHECKREG r6, 0x00006789;
CHECKREG r7, 0x00000000;

imm32 r0, 0xadf00001;
imm32 r1, 0x12345678;
imm32 r2, 0x23456789;
imm32 r3, 0x3456789a;
imm32 r4, 0x00000000;
imm32 r5, 0x96789abc;
imm32 r6, 0xa789abcd;
imm32 r7, 0xb89abcde;
R3 = R0.B (X);
R4 = R1.L (X);
R5 = R2.L (Z);
R6 = R3.B (X);
R7 = R4.B (Z);
R0 = - R5;
R1 = ~ R6;
R2 = R7.L (X);
CHECKREG r0, 0xFFFF9877;
CHECKREG r1, 0xFFFFFFFE;
CHECKREG r2, 0x00000078;
CHECKREG r3, 0x00000001;
CHECKREG r4, 0x00005678;
CHECKREG r5, 0x00006789;
CHECKREG r6, 0x00000001;
CHECKREG r7, 0x00000078;

imm32 r0, 0x01230002;
imm32 r1, 0x00000000;
imm32 r2, 0x93456789;
imm32 r3, 0xa456789a;
imm32 r4, 0xb56789ab;
imm32 r5, 0x54238900;
imm32 r6, 0xd789abcd;
imm32 r7, 0xe89abcde;
R2 = R0.B (X);
R3 = R1.L (X);
R4 = R2.L (Z);
R5 = R3.B (X);
R6 = R4.B (Z);
R7 = - R5;
R0 = ~ R6;
R1 = R7.L (X);
CHECKREG r0, 0xFFFFFFFD;
CHECKREG r1, 0x00000000;
CHECKREG r2, 0x00000002;
CHECKREG r3, 0x00000000;
CHECKREG r4, 0x00000002;
CHECKREG r5, 0x00000000;
CHECKREG r6, 0x00000002;
CHECKREG r7, 0x00000000;

imm32 r0, 0x51230002;
imm32 r1, 0x12345678;
imm32 r2, 0x00000000;
imm32 r3, 0x3456789a;
imm32 r4, 0x956789ab;
imm32 r5, 0x86789abc;
imm32 r6, 0x00000000;
imm32 r7, 0x789abcde;
R1 = R0.B (X);
R2 = R1.L (X);
R3 = R2.L (Z);
R4 = R3.B (X);
R5 = R4.B (Z);
R6 = - R5;
R0 = ~ R6;
R7 = R7.L (X);
CHECKREG r0, 0x00000001;
CHECKREG r1, 0x00000002;
CHECKREG r2, 0x00000002;
CHECKREG r3, 0x00000002;
CHECKREG r4, 0x00000002;
CHECKREG r5, 0x00000002;
CHECKREG r6, 0xFFFFFFFE;
CHECKREG r7, 0xFFFFBCDE;


pass
