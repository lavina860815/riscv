//Original:/testcases/core/c_dsp32alu_min/c_dsp32alu_min.dsp
// Spec Reference: dsp32alu dregs = min ( dregs, dregs)
# mach: bfin

.include "testutils.inc"
	start




imm32 r0, 0x35678911;
imm32 r1, 0x2789ab1d;
imm32 r2, 0x74445515;
imm32 r3, 0xf6667717;
imm32 r4, 0x5567891b;
imm32 r5, 0x6789ab1d;
imm32 r6, 0x74445515;
imm32 r7, 0x86667777;
R0 = MIN ( R0 , R0 );
R1 = MIN ( R0 , R1 );
R2 = MIN ( R0 , R2 );
R3 = MIN ( R0 , R3 );
R4 = MIN ( R0 , R4 );
R5 = MIN ( R0 , R5 );
R6 = MIN ( R0 , R6 );
R7 = MIN ( R0 , R7 );
CHECKREG r0, 0x35678911;
CHECKREG r1, 0x2789AB1D;
CHECKREG r2, 0x35678911;
CHECKREG r3, 0xF6667717;
CHECKREG r4, 0x35678911;
CHECKREG r5, 0x35678911;
CHECKREG r6, 0x35678911;
CHECKREG r7, 0x86667777;

imm32 r0, 0x9567892b;
imm32 r1, 0xa789ab2d;
imm32 r2, 0xb4445525;
imm32 r3, 0xc6667727;
imm32 r4, 0xd8889929;
imm32 r5, 0xeaaabb2b;
imm32 r6, 0xfcccdd2d;
imm32 r7, 0x0eeeffff;
R0 = MIN ( R1 , R0 );
R1 = MIN ( R1 , R1 );
R2 = MIN ( R1 , R2 );
R3 = MIN ( R1 , R3 );
R4 = MIN ( R1 , R4 );
R5 = MIN ( R1 , R5 );
R6 = MIN ( R1 , R6 );
R7 = MIN ( R1 , R7 );
CHECKREG r0, 0x9567892B;
CHECKREG r1, 0xA789AB2D;
CHECKREG r2, 0xA789AB2D;
CHECKREG r3, 0xA789AB2D;
CHECKREG r4, 0xA789AB2D;
CHECKREG r5, 0xA789AB2D;
CHECKREG r6, 0xA789AB2D;
CHECKREG r7, 0xA789AB2D;

imm32 r0, 0x716789ab;
imm32 r1, 0x8289abcd;
imm32 r2, 0x93445555;
imm32 r3, 0xa4667777;
imm32 r4, 0x456789ab;
imm32 r5, 0xb689abcd;
imm32 r6, 0x47445555;
imm32 r7, 0x68667777;
R0 = MIN ( R2 , R0 );
R1 = MIN ( R2 , R1 );
R2 = MIN ( R2 , R2 );
R3 = MIN ( R2 , R3 );
R4 = MIN ( R2 , R4 );
R5 = MIN ( R2 , R5 );
R6 = MIN ( R2 , R6 );
R7 = MIN ( R2 , R7 );
CHECKREG r0, 0x93445555;
CHECKREG r1, 0x8289ABCD;
CHECKREG r2, 0x93445555;
CHECKREG r3, 0x93445555;
CHECKREG r4, 0x93445555;
CHECKREG r5, 0x93445555;
CHECKREG r6, 0x93445555;
CHECKREG r7, 0x93445555;

imm32 r0, 0x2567892b;
imm32 r1, 0x5789ab2d;
imm32 r2, 0xb4445525;
imm32 r3, 0xc6667727;
imm32 r0, 0x9567892b;
imm32 r1, 0xa789ab2d;
imm32 r2, 0xb4445525;
imm32 r3, 0xc6667727;
R0 = MIN ( R3 , R0 );
R1 = MIN ( R3 , R1 );
R2 = MIN ( R3 , R2 );
R3 = MIN ( R3 , R3 );
R4 = MIN ( R3 , R4 );
R5 = MIN ( R3 , R5 );
R6 = MIN ( R3 , R6 );
R7 = MIN ( R3 , R7 );
CHECKREG r0, 0x9567892B;
CHECKREG r1, 0xA789AB2D;
CHECKREG r2, 0xB4445525;
CHECKREG r3, 0xC6667727;
CHECKREG r4, 0x93445555;
CHECKREG r5, 0x93445555;
CHECKREG r6, 0x93445555;
CHECKREG r7, 0x93445555;

imm32 r0, 0xd537891b;
imm32 r1, 0x6759ab2d;
imm32 r2, 0xf455b535;
imm32 r3, 0x66665747;
imm32 r4, 0x88789565;
imm32 r5, 0xaa8abb5b;
imm32 r6, 0xcc9cdd85;
imm32 r7, 0xeeaeff9f;
R0 = MIN ( R4 , R0 );
R1 = MIN ( R4 , R1 );
R2 = MIN ( R4 , R2 );
R3 = MIN ( R4 , R3 );
R4 = MIN ( R4 , R4 );
R5 = MIN ( R4 , R5 );
R6 = MIN ( R4 , R6 );
R7 = MIN ( R4 , R7 );
CHECKREG r0, 0x88789565;
CHECKREG r1, 0x88789565;
CHECKREG r2, 0x88789565;
CHECKREG r3, 0x88789565;
CHECKREG r4, 0x88789565;
CHECKREG r5, 0x88789565;
CHECKREG r6, 0x88789565;
CHECKREG r7, 0x88789565;

imm32 r0, 0xa56b89ab;
imm32 r1, 0x69764bcd;
imm32 r2, 0x49736564;
imm32 r3, 0x61278394;
imm32 r4, 0x98876439;
imm32 r5, 0xaaaa0bbb;
imm32 r6, 0xcccc1ddd;
imm32 r7, 0x12346fff;
R0 = MIN ( R5 , R0 );
R1 = MIN ( R5 , R1 );
R2 = MIN ( R5 , R2 );
R3 = MIN ( R5 , R3 );
R4 = MIN ( R5 , R4 );
R5 = MIN ( R5 , R5 );
R6 = MIN ( R5 , R6 );
R7 = MIN ( R5 , R7 );
CHECKREG r0, 0xA56B89AB;
CHECKREG r1, 0xAAAA0BBB;
CHECKREG r2, 0xAAAA0BBB;
CHECKREG r3, 0xAAAA0BBB;
CHECKREG r4, 0x98876439;
CHECKREG r5, 0xAAAA0BBB;
CHECKREG r6, 0xAAAA0BBB;
CHECKREG r7, 0xAAAA0BBB;

imm32 r0, 0xe56739ab;
imm32 r1, 0x67694bcd;
imm32 r2, 0x03456755;
imm32 r3, 0x66666777;
imm32 r4, 0xd2345699;
imm32 r5, 0x45678b6b;
imm32 r6, 0x043290d6;
imm32 r7, 0x1234567f;
R0 = MIN ( R6 , R0 );
R1 = MIN ( R6 , R1 );
R2 = MIN ( R6 , R2 );
R3 = MIN ( R6 , R3 );
R4 = MIN ( R6 , R4 );
R5 = MIN ( R6 , R5 );
R6 = MIN ( R6 , R6 );
R7 = MIN ( R6 , R7 );
CHECKREG r0, 0xE56739AB;
CHECKREG r1, 0x043290D6;
CHECKREG r2, 0x03456755;
CHECKREG r3, 0x043290D6;
CHECKREG r4, 0xD2345699;
CHECKREG r5, 0x043290D6;
CHECKREG r6, 0x043290D6;
CHECKREG r7, 0x043290D6;

imm32 r0, 0x476789ab;
imm32 r1, 0x6779abcd;
imm32 r2, 0x23456755;
imm32 r3, 0x56789007;
imm32 r4, 0x789ab799;
imm32 r5, 0xaaaa0bbb;
imm32 r6, 0x89ab1d7d;
imm32 r7, 0xabcd2ff7;
R0 = MIN ( R7 , R0 );
R1 = MIN ( R7 , R1 );
R2 = MIN ( R7 , R2 );
R3 = MIN ( R7 , R3 );
R4 = MIN ( R7 , R4 );
R5 = MIN ( R7 , R5 );
R6 = MIN ( R7 , R6 );
R7 = MIN ( R7 , R7 );
CHECKREG r0, 0xABCD2FF7;
CHECKREG r1, 0xABCD2FF7;
CHECKREG r2, 0xABCD2FF7;
CHECKREG r3, 0xABCD2FF7;
CHECKREG r4, 0xABCD2FF7;
CHECKREG r5, 0xAAAA0BBB;
CHECKREG r6, 0x89AB1D7D;
CHECKREG r7, 0xABCD2FF7;
imm32 r0, 0x456739ab;
imm32 r1, 0x67694bcd;
imm32 r2, 0xd3456755;
imm32 r3, 0x66666777;
imm32 r4, 0x12345699;
imm32 r5, 0x45678b6b;
imm32 r6, 0xb43290d6;
imm32 r7, 0x1234567f;
R4 = MIN ( R4 , R7 );
R5 = MIN ( R5 , R5 );
R2 = MIN ( R6 , R3 );
R6 = MIN ( R0 , R4 );
R0 = MIN ( R1 , R6 );
R2 = MIN ( R2 , R1 );
R1 = MIN ( R3 , R0 );
R7 = MIN ( R7 , R4 );
CHECKREG r0, 0x1234567F;
CHECKREG r1, 0x1234567F;
CHECKREG r2, 0xB43290D6;
CHECKREG r3, 0x66666777;
CHECKREG r4, 0x1234567F;
CHECKREG r5, 0x45678B6B;
CHECKREG r6, 0x1234567F;
CHECKREG r7, 0x1234567F;

imm32 r0, 0xa76789ab;
imm32 r1, 0x6779abcd;
imm32 r2, 0xf3456755;
imm32 r3, 0x56789007;
imm32 r4, 0x789ab799;
imm32 r5, 0xaaaa0bbb;
imm32 r6, 0x89ab1d7d;
imm32 r7, 0xabcd2ff7;
R3 = MIN ( R4 , R0 );
R5 = MIN ( R5 , R1 );
R2 = MIN ( R2 , R2 );
R7 = MIN ( R7 , R3 );
R4 = MIN ( R3 , R4 );
R0 = MIN ( R1 , R5 );
R1 = MIN ( R0 , R6 );
R6 = MIN ( R6 , R7 );
CHECKREG r0, 0xAAAA0BBB;
CHECKREG r1, 0x89AB1D7D;
CHECKREG r2, 0xF3456755;
CHECKREG r3, 0xA76789AB;
CHECKREG r4, 0xA76789AB;
CHECKREG r5, 0xAAAA0BBB;
CHECKREG r6, 0x89AB1D7D;
CHECKREG r7, 0xA76789AB;


pass
