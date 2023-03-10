//Original:/testcases/core/c_dsp32mult_dr_s/c_dsp32mult_dr_s.dsp
// Spec Reference: dsp32mult single dr s
# mach: bfin

.include "testutils.inc"
	start

imm32 r0, 0x8b235625;
imm32 r1, 0x98ba5127;
imm32 r2, 0xa3846725;
imm32 r3, 0x00080027;
imm32 r4, 0xb0ab8d29;
imm32 r5, 0x10ace82b;
imm32 r6, 0xc00c008d;
imm32 r7, 0xd2467028;
R4.H = R0.L * R0.L, R4.L = R0.L * R0.L (S2RND);
R5.H = R0.L * R1.L, R5.L = R0.L * R1.H (S2RND);
R6.H = R1.L * R0.L, R6.L = R1.H * R0.L (S2RND);
R7.H = R1.L * R1.L, R7.L = R1.H * R1.H (S2RND);
R0.H = R0.L * R0.L, R0.L = R0.L * R0.L (S2RND);
R1.H = R0.L * R1.L, R1.L = R0.L * R1.H (S2RND);
R2.H = R1.L * R0.L, R2.L = R1.H * R0.L (S2RND);
R3.H = R1.L * R1.L, R3.L = R1.H * R1.H (S2RND);
CHECKREG r0, 0x73F473F4;
CHECKREG r1, 0x7FFF8000;
CHECKREG r2, 0x80007FFF;
CHECKREG r3, 0x7FFF7FFF;
CHECKREG r4, 0x73F473F4;
CHECKREG r5, 0x6D3B8000;
CHECKREG r6, 0x6D3B8000;
CHECKREG r7, 0x66E77FFF;

imm32 r0, 0x9923a635;
imm32 r1, 0x6f995137;
imm32 r2, 0x1324b735;
imm32 r3, 0x99060037;
imm32 r4, 0x809bcd39;
imm32 r5, 0xb0a99f3b;
imm32 r6, 0xa00c093d;
imm32 r7, 0x12467093;
R4.H = R2.L * R2.H, R4.L = R2.H * R2.L (S2RND);
R5.H = R2.L * R3.H, R5.L = R2.H * R3.H (S2RND);
R6.H = R3.L * R2.L, R6.L = R3.L * R2.H (S2RND);
R7.H = R3.L * R3.H, R7.L = R3.L * R3.H (S2RND);
R2.H = R2.L * R2.H, R2.L = R2.H * R2.L (S2RND);
R3.H = R2.L * R3.H, R3.L = R2.H * R3.H (S2RND);
R0.H = R3.L * R2.H, R0.L = R3.L * R2.L (S2RND);
R1.H = R3.L * R3.H, R1.L = R3.L * R3.H (S2RND);
CHECKREG r0, 0xF416F416;
CHECKREG r1, 0x132C132C;
CHECKREG r2, 0xEA3BEA3B;
CHECKREG r3, 0x23072307;
CHECKREG r4, 0xEA3BEA3B;
CHECKREG r5, 0x7520E134;
CHECKREG r6, 0xFFC10010;
CHECKREG r7, 0xFFA8FFA8;

imm32 r0, 0x19235655;
imm32 r1, 0xc9ba5157;
imm32 r2, 0x63246755;
imm32 r3, 0x0a060055;
imm32 r4, 0x90abc509;
imm32 r5, 0x10acef5b;
imm32 r6, 0xb00a005d;
imm32 r7, 0x1246a05f;
R0.H = R4.H * R4.L, R0.L = R4.L * R4.L (S2RND);
R1.H = R4.H * R5.L, R1.L = R4.L * R5.H (S2RND);
R2.H = R5.H * R4.L, R2.L = R5.H * R4.L (S2RND);
R3.H = R5.L * R5.L, R3.L = R5.H * R5.H (S2RND);
R4.H = R4.H * R4.L, R4.L = R4.L * R4.L (S2RND);
R5.H = R4.H * R5.L, R5.L = R4.L * R5.L (S2RND);
R6.H = R5.L * R4.L, R6.L = R5.H * R4.L (S2RND);
R7.H = R5.H * R5.L, R7.L = R5.H * R5.H (S2RND);
CHECKREG r0, 0x66933653;
CHECKREG r1, 0x1CF4F0A4;
CHECKREG r2, 0xF0A4F0A4;
CHECKREG r3, 0x04540458;
CHECKREG r4, 0x66933653;
CHECKREG r5, 0xE553F1DF;
CHECKREG r6, 0xF402E95B;
CHECKREG r7, 0x05E40B1E;

imm32 r0, 0xbb235666;
imm32 r1, 0xefba5166;
imm32 r2, 0x13248766;
imm32 r3, 0xe0060066;
imm32 r4, 0x9eab9d69;
imm32 r5, 0x10ecef6b;
imm32 r6, 0x800ee06d;
imm32 r7, 0x12467e6f;
// test the unsigned U=1
R0.H = R6.H * R6.H, R0.L = R6.L * R6.L (S2RND);
R1.H = R6.H * R7.H, R1.L = R6.L * R7.H (S2RND);
R2.H = R7.H * R6.H, R2.L = R7.H * R6.L (S2RND);
R3.H = R7.H * R7.H, R3.L = R7.H * R7.H (S2RND);
R6.H = R6.H * R6.H, R6.L = R6.L * R6.L (S2RND);
R7.H = R6.H * R7.H, R7.L = R6.L * R7.H (S2RND);
R4.H = R7.H * R6.H, R4.L = R7.H * R6.L (S2RND);
R5.H = R7.H * R7.H, R5.L = R7.H * R7.H (S2RND);
CHECKREG r0, 0x7FFF0F94;
CHECKREG r1, 0xDB78F6FC;
CHECKREG r2, 0xDB78F6FC;
CHECKREG r3, 0x05380538;
CHECKREG r4, 0x491708E5;
CHECKREG r5, 0x14DF14DF;
CHECKREG r6, 0x7FFF0F94;
CHECKREG r7, 0x248C0473;

// mix order
imm32 r0, 0xac23a675;
imm32 r1, 0xcfba5127;
imm32 r2, 0x13c46705;
imm32 r3, 0x00060007;
imm32 r4, 0x90accd09;
imm32 r5, 0x10acdfdb;
imm32 r6, 0x000cc00d;
imm32 r7, 0x1246fc0f;
R0.H = R0.L * R7.L, R0.L = R0.H * R7.H (S2RND);
R1.H = R1.L * R6.L, R1.L = R1.L * R6.H (S2RND);
R2.H = R2.H * R5.L, R2.L = R2.H * R5.L (S2RND);
R3.H = R3.L * R4.L, R3.L = R3.L * R4.L (S2RND);
R4.H = R4.L * R3.L, R4.L = R4.L * R3.L (S2RND);
R5.H = R5.H * R2.L, R5.L = R5.H * R2.L (S2RND);
R6.H = R6.L * R1.L, R6.L = R6.L * R1.L (S2RND);
R7.H = R7.H * R0.L, R7.L = R7.H * R0.H (S2RND);
CHECKREG r0, 0x0584E80E;
CHECKREG r1, 0xAEE9000F;
CHECKREG r2, 0xF613F613;
CHECKREG r3, 0xFFFAFFFA;
CHECKREG r4, 0x00050005;
CHECKREG r5, 0xFD6AFD6A;
CHECKREG r6, 0xFFF1FFF1;
CHECKREG r7, 0xF92A0193;

imm32 r0, 0xab235a75;
imm32 r1, 0xcfba5127;
imm32 r2, 0xdd246905;
imm32 r3, 0x00d6d007;
imm32 r4, 0x90abcd09;
imm32 r5, 0x10aceddb;
imm32 r6, 0x000c0d0d;
imm32 r7, 0x1246700f;
R0.H = R7.H * R0.H, R0.L = R7.H * R0.L (S2RND);
R1.H = R6.H * R1.H, R1.L = R6.L * R1.L (S2RND);
R2.H = R5.H * R2.H, R2.L = R5.H * R2.L (S2RND);
R3.H = R4.H * R3.H, R3.L = R4.H * R3.L (S2RND);
R4.H = R3.H * R4.H, R4.L = R3.H * R4.L (S2RND);
R5.H = R2.H * R5.H, R5.L = R2.H * R5.L (S2RND);
R6.H = R1.H * R6.H, R6.L = R1.H * R6.L (S2RND);
R7.H = R0.L * R7.H, R7.L = R0.H * R7.H (S2RND);
CHECKREG r0, 0xE7C519D4;
CHECKREG r1, 0xFFF7108C;
CHECKREG r2, 0xF6EB1B5B;
CHECKREG r3, 0xFE8C5374;
CHECKREG r4, 0x02870128;
CHECKREG r5, 0xFDA20293;
CHECKREG r6, 0x0000FFFE;
CHECKREG r7, 0x0760F915;

imm32 r0, 0xfb235675;
imm32 r1, 0xcfba5127;
imm32 r2, 0x13f46705;
imm32 r3, 0x000f0007;
imm32 r4, 0x90abfd09;
imm32 r5, 0x10acefdb;
imm32 r6, 0x000c00fd;
imm32 r7, 0x1246700f;
R2.H = R0.L * R6.L, R2.L = R0.L * R6.H (S2RND);
R3.H = R1.H * R7.H, R3.L = R1.H * R7.L (S2RND);
R0.H = R2.L * R0.L, R0.L = R2.H * R0.H (S2RND);
R1.H = R3.L * R1.L, R1.L = R3.H * R1.H (S2RND);
R4.H = R4.L * R2.L, R4.L = R4.H * R2.H (S2RND);
R5.H = R5.L * R3.H, R5.L = R5.H * R3.L (S2RND);
R6.H = R6.H * R4.L, R6.L = R6.L * R4.H (S2RND);
R7.H = R7.L * R5.L, R7.L = R7.H * R5.H (S2RND);
CHECKREG r0, 0x0016FFE6;
CHECKREG r1, 0x94D30A65;
CHECKREG r2, 0x01560010;
CHECKREG r3, 0xF238AB7A;
CHECKREG r4, 0xFFFFFDAD;
CHECKREG r5, 0x037AE9FB;
CHECKREG r6, 0x00000000;
CHECKREG r7, 0xD97200FE;

imm32 r0, 0xab2d5675;
imm32 r1, 0xcfbad127;
imm32 r2, 0x13246d05;
imm32 r3, 0x000600d7;
imm32 r4, 0x908bcd09;
imm32 r5, 0x10a9efdb;
imm32 r6, 0x000c500d;
imm32 r7, 0x1246760f;
R4.H = R5.L * R2.L, R4.L = R5.L * R2.H (S2RND);
R6.H = R6.H * R3.L, R6.L = R6.L * R3.H (S2RND);
R0.H = R7.L * R4.L, R0.L = R7.L * R4.H (S2RND);
R1.H = R0.L * R5.H, R1.L = R0.L * R5.L (S2RND);
R2.H = R1.L * R6.L, R2.L = R1.L * R6.H (S2RND);
R5.H = R2.L * R7.H, R5.L = R2.H * R7.L (S2RND);
R3.H = R3.L * R0.L, R3.L = R3.L * R0.H (S2RND);
R7.H = R4.H * R1.L, R7.L = R4.L * R1.H (S2RND);
CHECKREG r0, 0xF718CD46;
CHECKREG r1, 0xF2CC0CCC;
CHECKREG r2, 0x00020000;
CHECKREG r3, 0xFF56FFE2;
CHECKREG r4, 0xE480FB2C;
CHECKREG r5, 0x00000004;
CHECKREG r6, 0x00000008;
CHECKREG r7, 0xFA8000FF;



pass
