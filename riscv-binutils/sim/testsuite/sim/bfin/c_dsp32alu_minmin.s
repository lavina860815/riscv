//Original:/testcases/core/c_dsp32alu_minmin/c_dsp32alu_minmin.dsp
// Spec Reference: dsp32alu dregs = min / min ( dregs, dregs)
# mach: bfin

.include "testutils.inc"
	start




imm32 r0, 0x25678911;
imm32 r1, 0x2389ab1d;
imm32 r2, 0x2a445345;
imm32 r3, 0x46657717;
imm32 r4, 0xd567e91b;
imm32 r5, 0x6789af1d;
imm32 r6, 0x74445d85;
imm32 r7, 0x8666a779;
R0 = MIN ( R0 , R0 ) (V);
R1 = MIN ( R0 , R1 ) (V);
R2 = MIN ( R0 , R2 ) (V);
R3 = MIN ( R0 , R3 ) (V);
R4 = MIN ( R0 , R4 ) (V);
R5 = MIN ( R0 , R5 ) (V);
R6 = MIN ( R0 , R6 ) (V);
R7 = MIN ( R0 , R7 ) (V);
CHECKREG r0, 0x25678911;
CHECKREG r1, 0x23898911;
CHECKREG r2, 0x25678911;
CHECKREG r3, 0x25678911;
CHECKREG r4, 0xD5678911;
CHECKREG r5, 0x25678911;
CHECKREG r6, 0x25678911;
CHECKREG r7, 0x86668911;

imm32 r0, 0x9567892b;
imm32 r1, 0xa789ab2d;
imm32 r2, 0xb4445525;
imm32 r3, 0xc6667727;
imm32 r4, 0xd8889929;
imm32 r5, 0xeaaabb2b;
imm32 r6, 0xfcccdd2d;
imm32 r7, 0x0eeeffff;
R0 = MIN ( R1 , R0 ) (V);
R1 = MIN ( R1 , R1 ) (V);
R2 = MIN ( R1 , R2 ) (V);
R3 = MIN ( R1 , R3 ) (V);
R4 = MIN ( R1 , R4 ) (V);
R5 = MIN ( R1 , R5 ) (V);
R6 = MIN ( R1 , R6 ) (V);
R7 = MIN ( R1 , R7 ) (V);
CHECKREG r0, 0x9567892B;
CHECKREG r1, 0xA789AB2D;
CHECKREG r2, 0xA789AB2D;
CHECKREG r3, 0xA789AB2D;
CHECKREG r4, 0xA7899929;
CHECKREG r5, 0xA789AB2D;
CHECKREG r6, 0xA789AB2D;
CHECKREG r7, 0xA789AB2D;

imm32 r0, 0x416789ab;
imm32 r1, 0x5289abcd;
imm32 r2, 0x43445555;
imm32 r3, 0xa466a777;
imm32 r4, 0x45678dab;
imm32 r5, 0xf689abcd;
imm32 r6, 0x47445555;
imm32 r7, 0x68667777;
R0 = MIN ( R2 , R0 ) (V);
R1 = MIN ( R2 , R1 ) (V);
R2 = MIN ( R2 , R2 ) (V);
R3 = MIN ( R2 , R3 ) (V);
R4 = MIN ( R2 , R4 ) (V);
R5 = MIN ( R2 , R5 ) (V);
R6 = MIN ( R2 , R6 ) (V);
R7 = MIN ( R2 , R7 ) (V);
CHECKREG r0, 0x416789AB;
CHECKREG r1, 0x4344ABCD;
CHECKREG r2, 0x43445555;
CHECKREG r3, 0xA466A777;
CHECKREG r4, 0x43448DAB;
CHECKREG r5, 0xF689ABCD;
CHECKREG r6, 0x43445555;
CHECKREG r7, 0x43445555;

imm32 r0, 0x9567892b;
imm32 r1, 0xa789ab2d;
imm32 r2, 0xb4445525;
imm32 r3, 0xc6667727;
imm32 r0, 0x9567892b;
imm32 r1, 0xa789ab2d;
imm32 r2, 0xb4445525;
imm32 r3, 0xc6667727;
R0 = MIN ( R3 , R0 ) (V);
R1 = MIN ( R3 , R1 ) (V);
R2 = MIN ( R3 , R2 ) (V);
R3 = MIN ( R3 , R3 ) (V);
R4 = MIN ( R3 , R4 ) (V);
R5 = MIN ( R3 , R5 ) (V);
R6 = MIN ( R3 , R6 ) (V);
R7 = MIN ( R3 , R7 ) (V);
CHECKREG r0, 0x9567892B;
CHECKREG r1, 0xA789AB2D;
CHECKREG r2, 0xB4445525;
CHECKREG r3, 0xC6667727;
CHECKREG r4, 0xC6668DAB;
CHECKREG r5, 0xC666ABCD;
CHECKREG r6, 0xC6665555;
CHECKREG r7, 0xC6665555;

imm32 r0, 0x5537891b;
imm32 r1, 0x6759ab2d;
imm32 r2, 0x74555535;
imm32 r3, 0x86665747;
imm32 r4, 0x98789565;
imm32 r5, 0xaa8abb5b;
imm32 r6, 0xcc9cdd85;
imm32 r7, 0xeeaeff9f;
R0 = MIN ( R4 , R0 ) (V);
R1 = MIN ( R4 , R1 ) (V);
R2 = MIN ( R4 , R2 ) (V);
R3 = MIN ( R4 , R3 ) (V);
R4 = MIN ( R4 , R4 ) (V);
R5 = MIN ( R4 , R5 ) (V);
R6 = MIN ( R4 , R6 ) (V);
R7 = MIN ( R4 , R7 ) (V);
CHECKREG r0, 0x9878891B;
CHECKREG r1, 0x98789565;
CHECKREG r2, 0x98789565;
CHECKREG r3, 0x86669565;
CHECKREG r4, 0x98789565;
CHECKREG r5, 0x98789565;
CHECKREG r6, 0x98789565;
CHECKREG r7, 0x98789565;

imm32 r0, 0x256b89ab;
imm32 r1, 0x64764bcd;
imm32 r2, 0x49736564;
imm32 r3, 0x61278394;
imm32 r4, 0x98876439;
imm32 r5, 0xaaaa0bbb;
imm32 r6, 0xcccc1ddd;
imm32 r7, 0x43346fff;
R0 = MIN ( R5 , R0 ) (V);
R1 = MIN ( R5 , R1 ) (V);
R2 = MIN ( R5 , R2 ) (V);
R3 = MIN ( R5 , R3 ) (V);
R4 = MIN ( R5 , R4 ) (V);
R5 = MIN ( R5 , R5 ) (V);
R6 = MIN ( R5 , R6 ) (V);
R7 = MIN ( R5 , R7 ) (V);
CHECKREG r0, 0xAAAA89AB;
CHECKREG r1, 0xAAAA0BBB;
CHECKREG r2, 0xAAAA0BBB;
CHECKREG r3, 0xAAAA8394;
CHECKREG r4, 0x98870BBB;
CHECKREG r5, 0xAAAA0BBB;
CHECKREG r6, 0xAAAA0BBB;
CHECKREG r7, 0xAAAA0BBB;

imm32 r0, 0x456739ab;
imm32 r1, 0x67694bcd;
imm32 r2, 0x03456755;
imm32 r3, 0x66666777;
imm32 r4, 0x12345699;
imm32 r5, 0x45678b6b;
imm32 r6, 0x043290d6;
imm32 r7, 0x1234567f;
R0 = MIN ( R6 , R0 ) (V);
R1 = MIN ( R6 , R1 ) (V);
R2 = MIN ( R6 , R2 ) (V);
R3 = MIN ( R6 , R3 ) (V);
R4 = MIN ( R6 , R4 ) (V);
R5 = MIN ( R6 , R5 ) (V);
R6 = MIN ( R6 , R6 ) (V);
R7 = MIN ( R6 , R7 ) (V);
CHECKREG r0, 0x043290D6;
CHECKREG r1, 0x043290D6;
CHECKREG r2, 0x034590D6;
CHECKREG r3, 0x043290D6;
CHECKREG r4, 0x043290D6;
CHECKREG r5, 0x04328B6B;
CHECKREG r6, 0x043290D6;
CHECKREG r7, 0x043290D6;

imm32 r0, 0x976789ab;
imm32 r1, 0x6779abcd;
imm32 r2, 0x8345a755;
imm32 r3, 0x5678b007;
imm32 r4, 0x789ab799;
imm32 r5, 0xaaaa0bbb;
imm32 r6, 0x89ab1d7d;
imm32 r7, 0xabcd2ff7;
R0 = MIN ( R7 , R0 ) (V);
R1 = MIN ( R7 , R1 ) (V);
R2 = MIN ( R7 , R2 ) (V);
R3 = MIN ( R7 , R3 ) (V);
R4 = MIN ( R7 , R4 ) (V);
R5 = MIN ( R7 , R5 ) (V);
R6 = MIN ( R7 , R6 ) (V);
R7 = MIN ( R7 , R7 ) (V);
CHECKREG r0, 0x976789AB;
CHECKREG r1, 0xABCDABCD;
CHECKREG r2, 0x8345A755;
CHECKREG r3, 0xABCDB007;
CHECKREG r4, 0xABCDB799;
CHECKREG r5, 0xAAAA0BBB;
CHECKREG r6, 0x89AB1D7D;
CHECKREG r7, 0xABCD2FF7;
imm32 r0, 0x456739ab;
imm32 r1, 0x67694bcd;
imm32 r2, 0x03456755;
imm32 r3, 0x66666777;
imm32 r4, 0x12345699;
imm32 r5, 0x45678b6b;
imm32 r6, 0x043290d6;
imm32 r7, 0x1234567f;
R4 = MIN ( R4 , R7 ) (V);
R5 = MIN ( R5 , R5 ) (V);
R2 = MIN ( R6 , R3 ) (V);
R6 = MIN ( R0 , R4 ) (V);
R0 = MIN ( R1 , R6 ) (V);
R2 = MIN ( R2 , R1 ) (V);
R1 = MIN ( R3 , R0 ) (V);
R7 = MIN ( R7 , R4 ) (V);
CHECKREG r0, 0x123439AB;
CHECKREG r1, 0x123439AB;
CHECKREG r2, 0x043290D6;
CHECKREG r3, 0x66666777;
CHECKREG r4, 0x1234567F;
CHECKREG r5, 0x45678B6B;
CHECKREG r6, 0x123439AB;
CHECKREG r7, 0x1234567F;

imm32 r0, 0xa76789ab;
imm32 r1, 0x6779abcd;
imm32 r2, 0xb3456755;
imm32 r3, 0x5678d007;
imm32 r4, 0x789ab799;
imm32 r5, 0xaaaa0bbb;
imm32 r6, 0x89ab1d7d;
imm32 r7, 0xabcd2ff7;
R3 = MIN ( R4 , R0 ) (V);
R5 = MIN ( R5 , R1 ) (V);
R2 = MIN ( R2 , R2 ) (V);
R7 = MIN ( R7 , R3 ) (V);
R4 = MIN ( R3 , R4 ) (V);
R0 = MIN ( R1 , R5 ) (V);
R1 = MIN ( R0 , R6 ) (V);
R6 = MIN ( R6 , R7 ) (V);
CHECKREG r0, 0xAAAAABCD;
CHECKREG r1, 0x89ABABCD;
CHECKREG r2, 0xB3456755;
CHECKREG r3, 0xA76789AB;
CHECKREG r4, 0xA76789AB;
CHECKREG r5, 0xAAAAABCD;
CHECKREG r6, 0x89AB89AB;
CHECKREG r7, 0xA76789AB;


pass
