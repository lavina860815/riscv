//Original:/testcases/core/c_dsp32mac_a1a0/c_dsp32mac_a1a0.dsp
// Spec Reference: dsp32mac a1 a0
# mach: bfin

.include "testutils.inc"
	start


INIT_R_REGS 0;

imm32 r0, 0x00000000;
A0 = 0;
A1 = 0;
ASTAT = r0;


// test the default (signed fraction : left )
imm32 r0, 0x12345678;
imm32 r1, 0x33456789;
imm32 r2, 0x5556789a;
imm32 r3, 0x75678912;
imm32 r4, 0x86789123;
imm32 r5, 0xa7891234;
imm32 r6, 0xc1234567;
imm32 r7, 0xf1234567;
A1 = R0.L * R1.L, A0 = R0.L * R1.L;
R0 = A0.w;
R1 = A1.w;
A1 = R2.L * R3.L, A0 += R2.L * R3.H;
R2 = A0.w;
R3 = A1.w;
A1 += R4.L * R5.L, A0 = R4.H * R5.L;
R4 = A0.w;
R5 = A1.w;
A1 += R6.L * R7.L, A0 += R6.H * R7.H;
R6 = A0.w;
R7 = A1.w;
CHECKREG r0, 0x45F11C70;
CHECKREG r1, 0x45F11C70;
CHECKREG r2, 0xB48EEC5C;
CHECKREG r3, 0x8FF1C9A8;
CHECKREG r4, 0xEEB780C0;
CHECKREG r5, 0x802DABE0;
CHECKREG r6, 0xF6043652;
CHECKREG r7, 0xA5CF0AC2;

imm32 r0, 0x12245618;
imm32 r1, 0x23256719;
imm32 r2, 0x3426781a;
imm32 r3, 0x45278912;
imm32 r4, 0x56289113;
imm32 r5, 0x67291214;
imm32 r6, 0xa1234517;
imm32 r7, 0xc1234517;
A1 = R0.L * R1.H, A0 += R0.L * R1.L;
R0 = A0.w;
R1 = A1.w;
A1 = R2.L * R3.H, A0 += R2.L * R3.H;
R2 = A0.w;
R3 = A1.w;
A1 = R4.L * R5.H, A0 += R4.H * R5.L;
R4 = A0.w;
R5 = A1.w;
A1 = R6.L * R7.H, A0 += R6.H * R7.H;
R6 = A0.w;
R7 = A1.w;
CHECKREG r0, 0x3B5C5702;
CHECKREG r1, 0x17A372F0;
CHECKREG r2, 0x7C3EF2EE;
CHECKREG r3, 0x40E29BEC;
CHECKREG r4, 0x886A092E;
CHECKREG r5, 0xA699C216;
CHECKREG r6, 0xB700DEC0;
CHECKREG r7, 0xDE11924A;

imm32 r0, 0x15245648;
imm32 r1, 0x25256749;
imm32 r2, 0x3526784a;
imm32 r3, 0x45278942;
imm32 r4, 0x55389143;
imm32 r5, 0x65391244;
imm32 r6, 0xa5334547;
imm32 r7, 0xc5334547;
A1 += R0.H * R1.H, A0 = R0.L * R1.L;
R0 = A0.w;
R1 = A1.w;
A1 += R2.H * R3.H, A0 = R2.L * R3.H;
R2 = A0.w;
R3 = A1.w;
A1 += R4.H * R5.H, A0 = R4.H * R5.L;
R4 = A0.w;
R5 = A1.w;
A1 += R6.H * R7.H, A0 = R6.H * R7.H;
R6 = A0.w;
R7 = A1.w;
CHECKREG r0, 0x459F2510;
CHECKREG r1, 0xE43416B2;
CHECKREG r2, 0x40FC8A8C;
CHECKREG r3, 0x00EAC446;
CHECKREG r4, 0x0C2925C0;
CHECKREG r5, 0x444EE736;
CHECKREG r6, 0x29B65052;
CHECKREG r7, 0x6E053788;


imm32 r0, 0x13245628;
imm32 r1, 0x23256729;
imm32 r2, 0x3326782a;
imm32 r3, 0x43278922;
imm32 r4, 0x56389123;
imm32 r5, 0x67391224;
imm32 r6, 0xa1334527;
imm32 r7, 0xc1334527;
A1 += R0.H * R1.L, A0 += R0.L * R1.L;
R0 = A0.w;
R1 = A1.w;
A1 = R2.H * R3.L, A0 += R2.L * R3.H;
R2 = A0.w;
R3 = A1.w;
A1 = R4.H * R5.L, A0 += R4.H * R5.L;
R4 = A0.w;
R5 = A1.w;
A1 = R6.H * R7.L, A0 += R6.H * R7.H;
R6 = A0.w;
R7 = A1.w;
CHECKREG r0, 0x6F261922;
CHECKREG r1, 0x7D725110;
CHECKREG r2, 0xAE30B1EE;
CHECKREG r3, 0xD0804218;
CHECKREG r4, 0xBA68D1AE;
CHECKREG r5, 0x0C381FC0;
CHECKREG r6, 0xE8EBF200;
CHECKREG r7, 0xCCC89B8A;


imm32 r0, 0x01340678;
imm32 r1, 0x02450789;
imm32 r2, 0x0356089a;
imm32 r3, 0x04670912;
imm32 r4, 0x05780123;
imm32 r5, 0x06890234;
imm32 r6, 0x07230567;
imm32 r7, 0x00230567;
A1 -= R0.L * R1.L, A0 = R0.L * R1.L;
R0 = A0.w;
R1 = A1.w;
A1 = R2.L * R3.L, A0 -= R2.L * R3.H;
R2 = A0.w;
R3 = A1.w;
A1 -= R4.L * R5.L, A0 -= R4.H * R5.L;
R4 = A0.w;
R5 = A1.w;
A1 -= R6.L * R7.L, A0 += R6.H * R7.H;
R6 = A0.w;
R7 = A1.w;
CHECKREG r0, 0x00617C70;
CHECKREG r1, 0xCC671F1A;
CHECKREG r2, 0x0015C084;
CHECKREG r3, 0x009C09A8;
CHECKREG r4, 0xFFFDA7C4;
CHECKREG r5, 0x00970770;
CHECKREG r6, 0xFFFF9B56;
CHECKREG r7, 0x005CA88E;

imm32 r0, 0x00245618;
imm32 r1, 0x01256719;
imm32 r2, 0x0226781a;
imm32 r3, 0x03278912;
imm32 r4, 0x06489113;
imm32 r5, 0x05291214;
imm32 r6, 0x01634517;
imm32 r7, 0x02234517;
A1 += R0.L * R1.H, A0 -= R0.L * R1.L;
R0 = A0.w;
R1 = A1.w;
A1 -= R2.L * R3.H, A0 += R2.L * R3.H;
R2 = A0.w;
R3 = A1.w;
A1 -= R4.L * R5.H, A0 -= R4.H * R5.L;
R4 = A0.w;
R5 = A1.w;
A1 += R6.L * R7.H, A0 -= R6.H * R7.H;
R6 = A0.w;
R7 = A1.w;
CHECKREG r0, 0xBAA77AA6;
CHECKREG r1, 0x0121BB7E;
CHECKREG r2, 0xBD9CAE92;
CHECKREG r3, 0xFE2C8792;
CHECKREG r4, 0xBCB99352;
CHECKREG r5, 0x02A5517C;
CHECKREG r6, 0xBCB3A640;
CHECKREG r7, 0x03CC91C6;

imm32 r0, 0x10240648;
imm32 r1, 0x25156749;
imm32 r2, 0x3526084a;
imm32 r3, 0x45238942;
imm32 r4, 0x51381143;
imm32 r5, 0x62392244;
imm32 r6, 0xa3333547;
imm32 r7, 0xc4334547;
A1 += R0.H * R1.H, A0 -= R0.L * R1.L;
R0 = A0.w;
R1 = A1.w;
A1 -= R2.H * R3.H, A0 -= R2.L * R3.H;
R2 = A0.w;
R3 = A1.w;
A1 -= R4.H * R5.H, A0 += R4.H * R5.L;
R4 = A0.w;
R5 = A1.w;
A1 += R6.H * R7.H, A0 -= R6.H * R7.H;
R6 = A0.w;
R7 = A1.w;
CHECKREG r0, 0xB7A22130;
CHECKREG r1, 0x08799FAE;
CHECKREG r2, 0xB327F8F4;
CHECKREG r3, 0xEBC49B4A;
CHECKREG r4, 0xC8E5FEB4;
CHECKREG r5, 0xAD71905A;
CHECKREG r6, 0x9D8AE062;
CHECKREG r7, 0xD8CCAEAC;


imm32 r0, 0x10245628;
imm32 r1, 0x23056729;
imm32 r2, 0x3320782a;
imm32 r3, 0x43270922;
imm32 r4, 0x56389023;
imm32 r5, 0x67391024;
imm32 r6, 0x21334507;
imm32 r7, 0x11334520;
A1 += R0.H * R1.L, A0 -= R0.L * R1.L;
R0 = A0.w;
R1 = A1.w;
A1 -= R2.H * R3.L, A0 += R2.L * R3.H;
R2 = A0.w;
R3 = A1.w;
A1 -= R4.H * R5.L, A0 -= R4.H * R5.L;
R4 = A0.w;
R5 = A1.w;
A1 += R6.H * R7.L, A0 -= R6.H * R7.H;
R6 = A0.w;
R7 = A1.w;
CHECKREG r0, 0x581B1792;
CHECKREG r1, 0xE5CED234;
CHECKREG r2, 0x9725B05E;
CHECKREG r3, 0xE228FDB4;
CHECKREG r4, 0x8C46709E;
CHECKREG r5, 0xD749BDF4;
CHECKREG r6, 0x87D0704C;
CHECKREG r7, 0xE93788B4;



pass
