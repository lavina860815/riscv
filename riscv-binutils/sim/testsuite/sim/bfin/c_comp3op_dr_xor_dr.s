//Original:/testcases/core/c_comp3op_dr_xor_dr/c_comp3op_dr_xor_dr.dsp
// Spec Reference: comp3op dregs xor dregs
# mach: bfin

.include "testutils.inc"
	start




imm32 r0, 0x01234567;
imm32 r1, 0x89abcdef;
imm32 r2, 0x56789abc;
imm32 r3, 0xdef01234;
imm32 r4, 0x23456899;
imm32 r5, 0x78912345;
imm32 r6, 0x98765432;
imm32 r7, 0x12345678;
R0 = R0 ^ R0;
R1 = R0 ^ R1;
R2 = R0 ^ R2;
R3 = R0 ^ R3;
R4 = R0 ^ R4;
R5 = R0 ^ R5;
R6 = R0 ^ R6;
R7 = R0 ^ R7;
CHECKREG r0, 0x00000000;
CHECKREG r1, 0x89ABCDEF;
CHECKREG r2, 0x56789ABC;
CHECKREG r3, 0xDEF01234;
CHECKREG r4, 0x23456899;
CHECKREG r5, 0x78912345;
CHECKREG r6, 0x98765432;
CHECKREG r7, 0x12345678;

imm32 r0, 0x01231567;
imm32 r1, 0x89ab1def;
imm32 r2, 0x56781abc;
imm32 r3, 0xdef01234;
imm32 r4, 0x23451899;
imm32 r5, 0x78911345;
imm32 r6, 0x98761432;
imm32 r7, 0x12341678;
R0 = R1 ^ R0;
R1 = R1 ^ R1;
R2 = R1 ^ R2;
R3 = R1 ^ R3;
R4 = R1 ^ R4;
R5 = R1 ^ R5;
R6 = R1 ^ R6;
R7 = R1 ^ R7;
CHECKREG r0, 0x88880888;
CHECKREG r1, 0x00000000;
CHECKREG r2, 0x56781ABC;
CHECKREG r3, 0xDEF01234;
CHECKREG r4, 0x23451899;
CHECKREG r5, 0x78911345;
CHECKREG r6, 0x98761432;
CHECKREG r7, 0x12341678;

imm32 r0, 0x01234527;
imm32 r1, 0x89abcd2f;
imm32 r2, 0x56789a2c;
imm32 r3, 0xdef01224;
imm32 r4, 0x23456829;
imm32 r5, 0x78912325;
imm32 r6, 0x98765422;
imm32 r7, 0x12345628;
R0 = R2 ^ R0;
R1 = R2 ^ R1;
R2 = R2 ^ R2;
R3 = R2 ^ R3;
R4 = R2 ^ R4;
R5 = R2 ^ R5;
R6 = R2 ^ R6;
R7 = R2 ^ R7;
CHECKREG r0, 0x575BDF0B;
CHECKREG r1, 0xDFD35703;
CHECKREG r2, 0x00000000;
CHECKREG r3, 0xDEF01224;
CHECKREG r4, 0x23456829;
CHECKREG r5, 0x78912325;
CHECKREG r6, 0x98765422;
CHECKREG r7, 0x12345628;

imm32 r0, 0x01234563;
imm32 r1, 0x89abcde3;
imm32 r2, 0x56789ab3;
imm32 r3, 0xdef01233;
imm32 r4, 0x23456893;
imm32 r5, 0x78912343;
imm32 r6, 0x98765433;
imm32 r7, 0x12345673;
R0 = R3 ^ R0;
R1 = R3 ^ R1;
R2 = R3 ^ R2;
R3 = R3 ^ R3;
R4 = R3 ^ R4;
R5 = R3 ^ R5;
R6 = R3 ^ R6;
R7 = R3 ^ R7;
CHECKREG r0, 0xDFD35750;
CHECKREG r1, 0x575BDFD0;
CHECKREG r2, 0x88888880;
CHECKREG r3, 0x00000000;
CHECKREG r4, 0x23456893;
CHECKREG r5, 0x78912343;
CHECKREG r6, 0x98765433;
CHECKREG r7, 0x12345673;

imm32 r0, 0x41234567;
imm32 r1, 0x49abcdef;
imm32 r2, 0x46789abc;
imm32 r3, 0x4ef01234;
imm32 r4, 0x43456899;
imm32 r5, 0x48912345;
imm32 r6, 0x48765432;
imm32 r7, 0x42345678;
R0 = R4 ^ R0;
R1 = R4 ^ R1;
R2 = R4 ^ R2;
R3 = R4 ^ R3;
R4 = R4 ^ R4;
R5 = R4 ^ R5;
R6 = R4 ^ R6;
R7 = R4 ^ R7;
CHECKREG r0, 0x02662DFE;
CHECKREG r1, 0x0AEEA576;
CHECKREG r2, 0x053DF225;
CHECKREG r3, 0x0DB57AAD;
CHECKREG r4, 0x00000000;
CHECKREG r5, 0x48912345;
CHECKREG r6, 0x48765432;
CHECKREG r7, 0x42345678;

imm32 r0, 0x05234567;
imm32 r1, 0x85abcdef;
imm32 r2, 0x55789abc;
imm32 r3, 0xd5f01234;
imm32 r4, 0x25456899;
imm32 r5, 0x75912345;
imm32 r6, 0x95765432;
imm32 r7, 0x15345678;
R0 = R5 ^ R0;
R1 = R5 ^ R1;
R2 = R5 ^ R2;
R3 = R5 ^ R3;
R4 = R5 ^ R4;
R5 = R5 ^ R5;
R6 = R5 ^ R6;
R7 = R5 ^ R7;
CHECKREG r0, 0x70B26622;
CHECKREG r1, 0xF03AEEAA;
CHECKREG r2, 0x20E9B9F9;
CHECKREG r3, 0xA0613171;
CHECKREG r4, 0x50D44BDC;
CHECKREG r5, 0x00000000;
CHECKREG r6, 0x95765432;
CHECKREG r7, 0x15345678;

imm32 r0, 0x01264567;
imm32 r1, 0x89a6cdef;
imm32 r2, 0x56769abc;
imm32 r3, 0xdef61234;
imm32 r4, 0x23466899;
imm32 r5, 0x78962345;
imm32 r6, 0x98765432;
imm32 r7, 0x12365678;
R0 = R6 ^ R0;
R1 = R6 ^ R1;
R2 = R6 ^ R2;
R3 = R6 ^ R3;
R4 = R6 ^ R4;
R5 = R6 ^ R5;
R6 = R6 ^ R6;
R7 = R6 ^ R7;
CHECKREG r0, 0x99501155;
CHECKREG r1, 0x11D099DD;
CHECKREG r2, 0xCE00CE8E;
CHECKREG r3, 0x46804606;
CHECKREG r4, 0xBB303CAB;
CHECKREG r5, 0xE0E07777;
CHECKREG r6, 0x00000000;
CHECKREG r7, 0x12365678;

imm32 r0, 0x01237567;
imm32 r1, 0x89ab7def;
imm32 r2, 0x56787abc;
imm32 r3, 0xdef07234;
imm32 r4, 0x23457899;
imm32 r5, 0x78917345;
imm32 r6, 0x98767432;
imm32 r7, 0x12345678;
R0 = R7 ^ R0;
R1 = R7 ^ R1;
R2 = R7 ^ R2;
R3 = R7 ^ R3;
R4 = R7 ^ R4;
R5 = R7 ^ R5;
R6 = R7 ^ R6;
R7 = R7 ^ R7;
CHECKREG r0, 0x1317231F;
CHECKREG r1, 0x9B9F2B97;
CHECKREG r2, 0x444C2CC4;
CHECKREG r3, 0xCCC4244C;
CHECKREG r4, 0x31712EE1;
CHECKREG r5, 0x6AA5253D;
CHECKREG r6, 0x8A42224A;
CHECKREG r7, 0x00000000;

imm32 r0, 0x11234567;
imm32 r1, 0x81abcdef;
imm32 r2, 0x56189abc;
imm32 r3, 0xdef11234;
imm32 r4, 0x23451899;
imm32 r5, 0x78912145;
imm32 r6, 0x98765412;
imm32 r7, 0x12345671;
R0 = R1 ^ R0;
R1 = R2 ^ R0;
R2 = R3 ^ R0;
R3 = R4 ^ R0;
R4 = R5 ^ R0;
R5 = R6 ^ R0;
R6 = R7 ^ R0;
R7 = R0 ^ R0;
CHECKREG r0, 0x90888888;
CHECKREG r1, 0xC6901234;
CHECKREG r2, 0x4E799ABC;
CHECKREG r3, 0xB3CD9011;
CHECKREG r4, 0xE819A9CD;
CHECKREG r5, 0x08FEDC9A;
CHECKREG r6, 0x82BCDEF9;
CHECKREG r7, 0x00000000;

imm32 r0, 0x01231567;
imm32 r1, 0x29ab1def;
imm32 r2, 0x52781abc;
imm32 r3, 0xde201234;
imm32 r4, 0x23421899;
imm32 r5, 0x78912345;
imm32 r6, 0x98761232;
imm32 r7, 0x12341628;
R0 = R2 ^ R1;
R1 = R3 ^ R1;
R2 = R4 ^ R1;
R3 = R5 ^ R1;
R4 = R6 ^ R1;
R5 = R7 ^ R1;
R6 = R0 ^ R1;
R7 = R1 ^ R1;
CHECKREG r0, 0x7BD30753;
CHECKREG r1, 0xF78B0FDB;
CHECKREG r2, 0xD4C91742;
CHECKREG r3, 0x8F1A2C9E;
CHECKREG r4, 0x6FFD1DE9;
CHECKREG r5, 0xE5BF19F3;
CHECKREG r6, 0x8C580888;
CHECKREG r7, 0x00000000;

imm32 r0, 0x03234527;
imm32 r1, 0x893bcd2f;
imm32 r2, 0x56739a2c;
imm32 r3, 0x3ef03224;
imm32 r4, 0x23456329;
imm32 r5, 0x78312335;
imm32 r6, 0x98735423;
imm32 r7, 0x12343628;
R0 = R4 ^ R2;
R1 = R5 ^ R2;
R2 = R6 ^ R2;
R3 = R7 ^ R2;
R4 = R0 ^ R2;
R5 = R1 ^ R2;
R6 = R2 ^ R2;
R7 = R3 ^ R2;
CHECKREG r0, 0x7536F905;
CHECKREG r1, 0x2E42B919;
CHECKREG r2, 0xCE00CE0F;
CHECKREG r3, 0xDC34F827;
CHECKREG r4, 0xBB36370A;
CHECKREG r5, 0xE0427716;
CHECKREG r6, 0x00000000;
CHECKREG r7, 0x12343628;

imm32 r0, 0x04234563;
imm32 r1, 0x894bcde3;
imm32 r2, 0x56749ab3;
imm32 r3, 0x4ef04233;
imm32 r4, 0x24456493;
imm32 r5, 0x78412344;
imm32 r6, 0x98745434;
imm32 r7, 0x12344673;
R0 = R5 ^ R3;
R1 = R6 ^ R3;
R2 = R7 ^ R3;
R3 = R0 ^ R3;
R4 = R1 ^ R3;
R5 = R2 ^ R3;
R6 = R3 ^ R3;
R7 = R4 ^ R3;
CHECKREG r0, 0x36B16177;
CHECKREG r1, 0xD6841607;
CHECKREG r2, 0x5CC40440;
CHECKREG r3, 0x78412344;
CHECKREG r4, 0xAEC53543;
CHECKREG r5, 0x24852704;
CHECKREG r6, 0x00000000;
CHECKREG r7, 0xD6841607;

imm32 r0, 0x41235567;
imm32 r1, 0x49abc5ef;
imm32 r2, 0x46789a5c;
imm32 r3, 0x4ef01235;
imm32 r4, 0x53456899;
imm32 r5, 0x45912345;
imm32 r6, 0x48565432;
imm32 r7, 0x42355678;
R0 = R6 ^ R4;
R1 = R7 ^ R4;
R2 = R0 ^ R4;
R3 = R1 ^ R4;
R4 = R2 ^ R4;
R5 = R3 ^ R4;
R6 = R4 ^ R4;
R7 = R5 ^ R4;
CHECKREG r0, 0x1B133CAB;
CHECKREG r1, 0x11703EE1;
CHECKREG r2, 0x48565432;
CHECKREG r3, 0x42355678;
CHECKREG r4, 0x1B133CAB;
CHECKREG r5, 0x59266AD3;
CHECKREG r6, 0x00000000;
CHECKREG r7, 0x42355678;

imm32 r0, 0x05264567;
imm32 r1, 0x85ab6def;
imm32 r2, 0x657896bc;
imm32 r3, 0xd6f01264;
imm32 r4, 0x25656896;
imm32 r5, 0x75962345;
imm32 r6, 0x95766432;
imm32 r7, 0x15345678;
R0 = R7 ^ R5;
R1 = R0 ^ R5;
R2 = R1 ^ R5;
R3 = R2 ^ R5;
R4 = R3 ^ R5;
R5 = R4 ^ R5;
R6 = R5 ^ R5;
R7 = R6 ^ R5;
CHECKREG r0, 0x60A2753D;
CHECKREG r1, 0x15345678;
CHECKREG r2, 0x60A2753D;
CHECKREG r3, 0x15345678;
CHECKREG r4, 0x60A2753D;
CHECKREG r5, 0x15345678;
CHECKREG r6, 0x00000000;
CHECKREG r7, 0x15345678;

imm32 r0, 0x01764567;
imm32 r1, 0x89a7cdef;
imm32 r2, 0x56767abc;
imm32 r3, 0xdef61734;
imm32 r4, 0x73466879;
imm32 r5, 0x77962347;
imm32 r6, 0x98765432;
imm32 r7, 0x12375678;
R0 = R7 ^ R6;
R1 = R0 ^ R6;
R2 = R1 ^ R6;
R3 = R2 ^ R6;
R4 = R3 ^ R6;
R5 = R4 ^ R6;
R6 = R5 ^ R6;
R7 = R6 ^ R6;
CHECKREG r0, 0x8A41024A;
CHECKREG r1, 0x12375678;
CHECKREG r2, 0x8A41024A;
CHECKREG r3, 0x12375678;
CHECKREG r4, 0x8A41024A;
CHECKREG r5, 0x12375678;
CHECKREG r6, 0x8A41024A;
CHECKREG r7, 0x00000000;

imm32 r0, 0x81238567;
imm32 r1, 0x88ab78ef;
imm32 r2, 0x56887a8c;
imm32 r3, 0x8ef87238;
imm32 r4, 0x28458899;
imm32 r5, 0x78817845;
imm32 r6, 0x98787482;
imm32 r7, 0x12348678;
R0 = R1 ^ R7;
R1 = R2 ^ R7;
R2 = R3 ^ R7;
R3 = R4 ^ R7;
R4 = R5 ^ R7;
R5 = R6 ^ R7;
R6 = R7 ^ R7;
R7 = R0 ^ R7;
CHECKREG r0, 0x9A9FFE97;
CHECKREG r1, 0x44BCFCF4;
CHECKREG r2, 0x9CCCF440;
CHECKREG r3, 0x3A710EE1;
CHECKREG r4, 0x6AB5FE3D;
CHECKREG r5, 0x8A4CF2FA;
CHECKREG r6, 0x00000000;
CHECKREG r7, 0x88AB78EF;


pass
