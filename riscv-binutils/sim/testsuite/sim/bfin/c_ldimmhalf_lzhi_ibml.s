//Original:/testcases/core/c_ldimmhalf_lzhi_ibml/c_ldimmhalf_lzhi_ibml.dsp
# mach: bfin

.include "testutils.inc"
	start


// Spec Reference: ldimmhalf lzhi ibml




I0 = 0x2001 (Z);
I0.H = 0x2000;
I1 = 0x2003 (Z);
I1.H = 0x2002;
I2 = 0x2005 (Z);
I2.H = 0x2004;
I3 = 0x2007 (Z);
I3.H = 0x2006;
L0 = 0x2009 (Z);
L0.H = 0x2008;
L1 = 0x200b (Z);
L1.H = 0x200a;
L2 = 0x200d (Z);
L2.H = 0x200c;
L3 = 0x200f (Z);
L3.H = 0x200e;


R0 = I0;
R1 = I1;
R2 = I2;
R3 = I3;
R4 = L0;
R5 = L1;
R6 = L2;
R7 = L3;
CHECKREG r0, 0x20002001;
CHECKREG r1, 0x20022003;
CHECKREG r2, 0x20042005;
CHECKREG r3, 0x20062007;
CHECKREG r4, 0x20082009;
CHECKREG r5, 0x200a200b;
CHECKREG r6, 0x200c200d;
CHECKREG r7, 0x200e200f;

I0 = 0x0111 (Z);
I0.H = 0x1000;
I1 = 0x1111 (Z);
I1.H = 0x1000;
I2 = 0x2222 (Z);
I2.H = 0x2000;
I3 = 0x3333 (Z);
I3.H = 0x3000;
L0 = 0x4444 (Z);
L0.H = 0x4000;
L1 = 0x5555 (Z);
L1.H = 0x5000;
L2 = 0x6666 (Z);
L2.H = 0x6000;
L3 = 0x7777 (Z);
L3.H = 0x7000;
R0 = I0;
R1 = I1;
R2 = I2;
R3 = I3;
R4 = L0;
R5 = L1;
R6 = L2;
R7 = L3;
CHECKREG r0, 0x10000111;
CHECKREG r1, 0x10001111;
CHECKREG r2, 0x20002222;
CHECKREG r3, 0x30003333;
CHECKREG r4, 0x40004444;
CHECKREG r5, 0x50005555;
CHECKREG r6, 0x60006666;
CHECKREG r7, 0x70007777;

I0 = 0x8888 (Z);
I0.H = 0x8000;
I1 = 0x9aaa (Z);
I1.H = 0x9000;
I2 = 0xabbb (Z);
I2.H = 0xa000;
I3 = 0xbccc (Z);
I3.H = 0xb000;
L0 = 0xcddd (Z);
L0.H = 0xc000;
L1 = 0xdeee (Z);
L1.H = 0xd000;
L2 = 0xefff (Z);
L2.H = 0xe000;
L3 = 0xf111 (Z);
L3.H = 0xf000;
R0 = I0;
R1 = I1;
R2 = I2;
R3 = I3;
R4 = L0;
R5 = L1;
R6 = L2;
R7 = L3;
CHECKREG r0, 0x80008888;
CHECKREG r1, 0x90009aaa;
CHECKREG r2, 0xa000abbb;
CHECKREG r3, 0xb000bccc;
CHECKREG r4, 0xc000cddd;
CHECKREG r5, 0xd000deee;
CHECKREG r6, 0xe000efff;
CHECKREG r7, 0xf000f111;

B0 = 0x3001 (Z);
B0.H = 0x3000;
B1 = 0x3003 (Z);
B1.H = 0x3002;
B2 = 0x3005 (Z);
B2.H = 0x3004;
B3 = 0x3007 (Z);
B3.H = 0x3006;
M0 = 0x3009 (Z);
M0.H = 0x3008;
M1 = 0x300b (Z);
M1.H = 0x300a;
M2 = 0x300d (Z);
M2.H = 0x300c;
M3 = 0x300f (Z);
M3.H = 0x300e;

R0 = B0;
R1 = B1;
R2 = B2;
R3 = B3;
R4 = M0;
R5 = M1;
R6 = M2;
R7 = M3;
CHECKREG r0, 0x30003001;
CHECKREG r1, 0x30023003;
CHECKREG r2, 0x30043005;
CHECKREG r3, 0x30063007;
CHECKREG r4, 0x30083009;
CHECKREG r5, 0x300A300B;
CHECKREG r6, 0x300c300d;
CHECKREG r7, 0x300e300f;


B0 = 0x0110 (Z);
B0.H = 0x1000;
B1 = 0x1110 (Z);
B1.H = 0x1000;
B2 = 0x2220 (Z);
B2.H = 0x2000;
B3 = 0x3330 (Z);
B3.H = 0x3000;
M0 = 0x4440 (Z);
M0.H = 0x4000;
M1 = 0x5550 (Z);
M1.H = 0x5000;
M2 = 0x6660 (Z);
M2.H = 0x6000;
M3 = 0x7770 (Z);
M3.H = 0x7000;
R0 = B0;
R1 = B1;
R2 = B2;
R3 = B3;
R4 = M0;
R5 = M1;
R6 = M2;
R7 = M3;
CHECKREG r0, 0x10000110;
CHECKREG r1, 0x10001110;
CHECKREG r2, 0x20002220;
CHECKREG r3, 0x30003330;
CHECKREG r4, 0x40004440;
CHECKREG r5, 0x50005550;
CHECKREG r6, 0x60006660;
CHECKREG r7, 0x70007770;

B0 = 0xf880 (Z);
B0.H = 0x8000;
B1 = 0xfaa0 (Z);
B1.H = 0xa000;
B2 = 0xfbb0 (Z);
B2.H = 0xb000;
B3 = 0xfcc0 (Z);
B3.H = 0xc000;
M0 = 0xfdd0 (Z);
M0.H = 0xd000;
M1 = 0xfee0 (Z);
M1.H = 0xe000;
M2 = 0xfff0 (Z);
M2.H = 0xf000;
M3 = 0xf110 (Z);
M3.H = 0x1000;
R0 = B0;
R1 = B1;
R2 = B2;
R3 = B3;
R4 = M0;
R5 = M1;
R6 = M2;
R7 = M3;
CHECKREG r0, 0x8000f880;
CHECKREG r1, 0xa000faa0;
CHECKREG r2, 0xb000fbb0;
CHECKREG r3, 0xc000fcc0;
CHECKREG r4, 0xd000fdd0;
CHECKREG r5, 0xe000fee0;
CHECKREG r6, 0xf000fff0;
CHECKREG r7, 0x1000f110;


pass
