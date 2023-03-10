//Original:/testcases/core/c_ldimmhalf_lz_ibml/c_ldimmhalf_lz_ibml.dsp
# mach: bfin

.include "testutils.inc"
	start


// Spec Reference: ldimmhalf lz ibml




I0 = 0x2001 (Z);
I1 = 0x2003 (Z);
I2 = 0x2005 (Z);
I3 = 0x2007 (Z);
L0 = 0x2009 (Z);
L1 = 0x200b (Z);
L2 = 0x200d (Z);
L3 = 0x200f (Z);


R0 = I0;
R1 = I1;
R2 = I2;
R3 = I3;
R4 = L0;
R5 = L1;
R6 = L2;
R7 = L3;
CHECKREG r0, 0x00002001;
CHECKREG r1, 0x00002003;
CHECKREG r2, 0x00002005;
CHECKREG r3, 0x00002007;
CHECKREG r4, 0x00002009;
CHECKREG r5, 0x0000200b;
CHECKREG r6, 0x0000200d;
CHECKREG r7, 0x0000200f;

I0 = 0x0111 (Z);
I1 = 0x1111 (Z);
I2 = 0x2222 (Z);
I3 = 0x3333 (Z);
L0 = 0x4444 (Z);
L1 = 0x5555 (Z);
L2 = 0x6666 (Z);
L3 = 0x7777 (Z);
R0 = I0;
R1 = I1;
R2 = I2;
R3 = I3;
R4 = L0;
R5 = L1;
R6 = L2;
R7 = L3;
CHECKREG r0, 0x00000111;
CHECKREG r1, 0x00001111;
CHECKREG r2, 0x00002222;
CHECKREG r3, 0x00003333;
CHECKREG r4, 0x00004444;
CHECKREG r5, 0x00005555;
CHECKREG r6, 0x00006666;
CHECKREG r7, 0x00007777;

I0 = 0x8888 (Z);
I1 = 0x9aaa (Z);
I2 = 0xabbb (Z);
I3 = 0xbccc (Z);
L0 = 0xcddd (Z);
L1 = 0xdeee (Z);
L2 = 0xefff (Z);
L3 = 0xf111 (Z);
R0 = I0;
R1 = I1;
R2 = I2;
R3 = I3;
R4 = L0;
R5 = L1;
R6 = L2;
R7 = L3;
CHECKREG r0, 0x00008888;
CHECKREG r1, 0x00009aaa;
CHECKREG r2, 0x0000abbb;
CHECKREG r3, 0x0000bccc;
CHECKREG r4, 0x0000cddd;
CHECKREG r5, 0x0000deee;
CHECKREG r6, 0x0000efff;
CHECKREG r7, 0x0000f111;

B0 = 0x3001 (Z);
B1 = 0x3003 (Z);
B2 = 0x3005 (Z);
B3 = 0x3007 (Z);
M0 = 0x3009 (Z);
M1 = 0x300b (Z);
M2 = 0x300d (Z);
M3 = 0x300f (Z);

R0 = B0;
R1 = B1;
R2 = B2;
R3 = B3;
R4 = M0;
R5 = M1;
R6 = M2;
R7 = M3;
CHECKREG r0, 0x00003001;
CHECKREG r1, 0x00003003;
CHECKREG r2, 0x00003005;
CHECKREG r3, 0x00003007;
CHECKREG r4, 0x00003009;
CHECKREG r5, 0x0000300B;
CHECKREG r6, 0x0000300d;
CHECKREG r7, 0x0000300f;


B0 = 0x0110 (Z);
B1 = 0x1110 (Z);
B2 = 0x2220 (Z);
B3 = 0x3330 (Z);
M0 = 0x4440 (Z);
M1 = 0x5550 (Z);
M2 = 0x6660 (Z);
M3 = 0x7770 (Z);
R0 = B0;
R1 = B1;
R2 = B2;
R3 = B3;
R4 = M0;
R5 = M1;
R6 = M2;
R7 = M3;
CHECKREG r0, 0x00000110;
CHECKREG r1, 0x00001110;
CHECKREG r2, 0x00002220;
CHECKREG r3, 0x00003330;
CHECKREG r4, 0x00004440;
CHECKREG r5, 0x00005550;
CHECKREG r6, 0x00006660;
CHECKREG r7, 0x00007770;

B0 = 0xf880 (Z);
B1 = 0xfaa0 (Z);
B2 = 0xfbb0 (Z);
B3 = 0xfcc0 (Z);
M0 = 0xfdd0 (Z);
M1 = 0xfee0 (Z);
M2 = 0xfff0 (Z);
M3 = 0xf110 (Z);
R0 = B0;
R1 = B1;
R2 = B2;
R3 = B3;
R4 = M0;
R5 = M1;
R6 = M2;
R7 = M3;
CHECKREG r0, 0x0000f880;
CHECKREG r1, 0x0000faa0;
CHECKREG r2, 0x0000fbb0;
CHECKREG r3, 0x0000fcc0;
CHECKREG r4, 0x0000fdd0;
CHECKREG r5, 0x0000fee0;
CHECKREG r6, 0x0000fff0;
CHECKREG r7, 0x0000f110;


pass
