//Original:/testcases/core/c_dsp32alu_rpp/c_dsp32alu_rpp.dsp
// Spec Reference: dsp32alu dreg = +/+ ( dreg, dreg)
# mach: bfin

.include "testutils.inc"
	start




// ALU operations include parallel addition, subtraction
// and 32-bit data. If an operation use a single ALU only, it uses ALU0.

imm32 r0, 0x15678911;
imm32 r1, 0x2789ab1d;
imm32 r2, 0x34445515;
imm32 r3, 0x46667717;
imm32 r4, 0x5567891b;
imm32 r5, 0x6789ab1d;
imm32 r6, 0x74445515;
imm32 r7, 0x86667777;
R0 = R0 +|+ R0;
R1 = R0 +|+ R1;
R2 = R0 +|+ R2;
R3 = R0 +|+ R3;
R4 = R0 +|+ R4;
R5 = R0 +|+ R5;
R6 = R0 +|+ R6;
R7 = R0 +|+ R7;
CHECKREG r0, 0x2ACE1222;
CHECKREG r1, 0x5257BD3F;
CHECKREG r2, 0x5F126737;
CHECKREG r3, 0x71348939;
CHECKREG r4, 0x80359B3D;
CHECKREG r5, 0x9257BD3F;
CHECKREG r6, 0x9F126737;
CHECKREG r7, 0xB1348999;

imm32 r0, 0x9567892b;
imm32 r1, 0xa789ab2d;
imm32 r2, 0xb4445525;
imm32 r3, 0xc6667727;
imm32 r4, 0xd8889929;
imm32 r5, 0xeaaabb2b;
imm32 r6, 0xfcccdd2d;
imm32 r7, 0x0eeeffff;
R0 = R1 +|+ R0;
R1 = R1 +|+ R1;
R2 = R1 +|+ R2;
R3 = R1 +|+ R3;
R4 = R1 +|+ R4;
R5 = R1 +|+ R5;
R6 = R1 +|+ R6;
R7 = R1 +|+ R7;
CHECKREG r0, 0x3CF03458;
CHECKREG r1, 0x4F12565A;
CHECKREG r2, 0x0356AB7F;
CHECKREG r3, 0x1578CD81;
CHECKREG r4, 0x279AEF83;
CHECKREG r5, 0x39BC1185;
CHECKREG r6, 0x4BDE3387;
CHECKREG r7, 0x5E005659;

imm32 r0, 0x416789ab;
imm32 r1, 0x6289abcd;
imm32 r2, 0x43445555;
imm32 r3, 0x64667777;
imm32 r4, 0x456789ab;
imm32 r5, 0x6689abcd;
imm32 r6, 0x47445555;
imm32 r7, 0x68667777;
R0 = R2 +|+ R0;
R1 = R2 +|+ R1;
R2 = R2 +|+ R2;
R3 = R2 +|+ R3;
R4 = R2 +|+ R4;
R5 = R2 +|+ R5;
R6 = R2 +|+ R6;
R7 = R2 +|+ R7;
CHECKREG r0, 0x84ABDF00;
CHECKREG r1, 0xA5CD0122;
CHECKREG r2, 0x8688AAAA;
CHECKREG r3, 0xEAEE2221;
CHECKREG r4, 0xCBEF3455;
CHECKREG r5, 0xED115677;
CHECKREG r6, 0xCDCCFFFF;
CHECKREG r7, 0xEEEE2221;

imm32 r0, 0xd567892b;
imm32 r1, 0xad89ab2d;
imm32 r2, 0xb4d45525;
imm32 r3, 0xc66d7727;
imm32 r0, 0x9567d92b;
imm32 r1, 0xa789ad2d;
imm32 r2, 0xb44455d5;
imm32 r3, 0xc666772d;
R0 = R3 +|+ R0;
R1 = R3 +|+ R1;
R2 = R3 +|+ R2;
R3 = R3 +|+ R3;
R4 = R3 +|+ R4;
R5 = R3 +|+ R5;
R6 = R3 +|+ R6;
R7 = R3 +|+ R7;
CHECKREG r0, 0x5BCD5058;
CHECKREG r1, 0x6DEF245A;
CHECKREG r2, 0x7AAACD02;
CHECKREG r3, 0x8CCCEE5A;
CHECKREG r4, 0x58BB22AF;
CHECKREG r5, 0x79DD44D1;
CHECKREG r6, 0x5A98EE59;
CHECKREG r7, 0x7BBA107B;

imm32 r0, 0x4577891b;
imm32 r1, 0x6779ab2d;
imm32 r2, 0x44755535;
imm32 r3, 0x66765747;
imm32 r4, 0x88779565;
imm32 r5, 0xaa7abb5b;
imm32 r6, 0xcc97dd85;
imm32 r7, 0xeeae7f9f;
R0 = R4 +|+ R0;
R1 = R4 +|+ R1;
R2 = R4 +|+ R2;
R3 = R4 +|+ R3;
R4 = R4 +|+ R4;
R5 = R4 +|+ R5;
R6 = R4 +|+ R6;
R7 = R4 +|+ R7;
CHECKREG r0, 0xCDEE1E80;
CHECKREG r1, 0xEFF04092;
CHECKREG r2, 0xCCECEA9A;
CHECKREG r3, 0xEEEDECAC;
CHECKREG r4, 0x10EE2ACA;
CHECKREG r5, 0xBB68E625;
CHECKREG r6, 0xDD85084F;
CHECKREG r7, 0xFF9CAA69;

imm32 r0, 0x456b89ab;
imm32 r1, 0x69764bcd;
imm32 r2, 0x49736564;
imm32 r3, 0x61278394;
imm32 r4, 0x98876439;
imm32 r5, 0xaaaa0bbb;
imm32 r6, 0xcccc1ddd;
imm32 r7, 0x12346fff;
R0 = R5 +|+ R0;
R1 = R5 +|+ R1;
R2 = R5 +|+ R2;
R3 = R5 +|+ R3;
R4 = R5 +|+ R4;
R5 = R5 +|+ R5;
R6 = R5 +|+ R6;
R7 = R5 +|+ R7;
CHECKREG r0, 0xF0159566;
CHECKREG r1, 0x14205788;
CHECKREG r2, 0xF41D711F;
CHECKREG r3, 0x0BD18F4F;
CHECKREG r4, 0x43316FF4;
CHECKREG r5, 0x55541776;
CHECKREG r6, 0x22203553;
CHECKREG r7, 0x67888775;

imm32 r0, 0xaa6739ab;
imm32 r1, 0x67dd4bcd;
imm32 r2, 0x03456755;
imm32 r3, 0x6b66bb77;
imm32 r4, 0x12345699;
imm32 r5, 0x45b78b6b;
imm32 r6, 0x043b90d6;
imm32 r7, 0x12b4bb7f;
R0 = R6 +|+ R0;
R1 = R6 +|+ R1;
R2 = R6 +|+ R2;
R3 = R6 +|+ R3;
R4 = R6 +|+ R4;
R5 = R6 +|+ R5;
R6 = R6 +|+ R6;
R7 = R6 +|+ R7;
CHECKREG r0, 0xAEA2CA81;
CHECKREG r1, 0x6C18DCA3;
CHECKREG r2, 0x0780F82B;
CHECKREG r3, 0x6FA14C4D;
CHECKREG r4, 0x166FE76F;
CHECKREG r5, 0x49F21C41;
CHECKREG r6, 0x087621AC;
CHECKREG r7, 0x1B2ADD2B;

imm32 r0, 0x976789ab;
imm32 r1, 0x6979abcd;
imm32 r2, 0x23956755;
imm32 r3, 0x56799007;
imm32 r4, 0x789a9799;
imm32 r5, 0xaaaa09bb;
imm32 r6, 0x89ab1d9d;
imm32 r7, 0xabcd2ff9;
R0 = R7 +|+ R0;
R1 = R7 +|+ R1;
R2 = R7 +|+ R2;
R3 = R7 +|+ R3;
R4 = R7 +|+ R4;
R5 = R7 +|+ R5;
R6 = R7 +|+ R6;
R7 = R7 +|+ R7;
CHECKREG r0, 0x4334B9A4;
CHECKREG r1, 0x1546DBC6;
CHECKREG r2, 0xCF62974E;
CHECKREG r3, 0x0246C000;
CHECKREG r4, 0x2467C792;
CHECKREG r5, 0x567739B4;
CHECKREG r6, 0x35784D96;
CHECKREG r7, 0x579A5FF2;

imm32 r0, 0x856739ab;
imm32 r1, 0x87694bcd;
imm32 r2, 0x08856755;
imm32 r3, 0x66686777;
imm32 r4, 0x12385699;
imm32 r5, 0x4567886b;
imm32 r6, 0x04329086;
imm32 r7, 0x12345678;
R4 = R4 +|+ R7 (S);
R5 = R5 +|+ R5 (CO);
R2 = R6 +|+ R3 (SCO);
R6 = R0 +|+ R4 (S);
R0 = R1 +|+ R6 (S);
R2 = R2 +|+ R1 (CO);
R1 = R3 +|+ R0 (CO);
R7 = R7 +|+ R4 (SCO);
CHECKREG r0, 0x80007FFF;
CHECKREG r1, 0xE776E668;
CHECKREG r2, 0xB6677F66;
CHECKREG r3, 0x66686777;
CHECKREG r4, 0x246C7FFF;
CHECKREG r5, 0x10D68ACE;
CHECKREG r6, 0xA9D37FFF;
CHECKREG r7, 0x7FFF36A0;

imm32 r0, 0x476789ab;
imm32 r1, 0x6779abcd;
imm32 r2, 0x23456755;
imm32 r3, 0x56789007;
imm32 r4, 0x789ab799;
imm32 r5, 0xaaaa0bbb;
imm32 r6, 0x89ab1d7d;
imm32 r7, 0xabcd2ff7;
R3 = R4 +|+ R0 (S);
R5 = R5 +|+ R1 (SCO);
R2 = R2 +|+ R2 (S);
R7 = R7 +|+ R3 (CO);
R4 = R3 +|+ R4 (CO);
R0 = R1 +|+ R5 (S);
R1 = R0 +|+ R6 (SCO);
R6 = R6 +|+ R7 (SCO);
CHECKREG r0, 0x1F01BDF0;
CHECKREG r1, 0xDB6DA8AC;
CHECKREG r2, 0x468A7FFF;
CHECKREG r3, 0x7FFF8000;
CHECKREG r4, 0x3799F899;
CHECKREG r5, 0xB7881223;
CHECKREG r6, 0x49498000;
CHECKREG r7, 0xAFF72BCC;



pass
