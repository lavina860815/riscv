//Original:/testcases/core/c_logi2op_arith_shft/c_logi2op_arith_shft.dsp
// Spec Reference: Logi2op >>>=
# mach: bfin

.include "testutils.inc"
	start





// Arithmetic >>>= : negative data
// bit 0-7
imm32 r0, 0x81111111;
imm32 r1, 0x81111111;
imm32 r2, 0x81111111;
imm32 r3, 0x81111111;
imm32 r4, 0x81111111;
imm32 r5, 0x81111111;
imm32 r6, 0x81111111;
imm32 r7, 0x81111111;
R0 >>>= 0; /* r0 = 0x81111111 */
R1 >>>= 1; /* r1 = 0xC0888888 */
R2 >>>= 2; /* r2 = 0xE0444444 */
R3 >>>= 3; /* r3 = 0xF0222222 */
R4 >>>= 4; /* r4 = 0xF8111111 */
R5 >>>= 5; /* r5 = 0xFC088888 */
R6 >>>= 6; /* r6 = 0xFE044444 */
R7 >>>= 7; /* r7 = 0xFF022222 */
CHECKREG r0, 0x81111111;
CHECKREG r1, 0xC0888888;
CHECKREG r2, 0xE0444444;
CHECKREG r3, 0xF0222222;
CHECKREG r4, 0xF8111111;
CHECKREG r5, 0xFC088888;
CHECKREG r6, 0xFE044444;
CHECKREG r7, 0xFF022222;

// bit 8-15
imm32 r0, 0x82222222;
imm32 r1, 0x82222222;
imm32 r2, 0x82222222;
imm32 r3, 0x82222222;
imm32 r4, 0x82222222;
imm32 r5, 0x82222222;
imm32 r6, 0x82222222;
imm32 r7, 0x82222222;
R0 >>>= 8; /* r0 = 0xFF822222 */
R1 >>>= 9; /* r1 = 0xFFC11111 */
R2 >>>= 10; /* r2 = 0xFFE08888 */
R3 >>>= 11; /* r3 = 0xFFF04444 */
R4 >>>= 12; /* r4 = 0xFFF82222 */
R5 >>>= 13; /* r5 = 0xFFFC1111 */
R6 >>>= 14; /* r6 = 0xFFFE0888 */
R7 >>>= 15; /* r7 = 0xFFFF0444 */
CHECKREG r0, 0xFF822222;
CHECKREG r1, 0xFFC11111;
CHECKREG r2, 0xFFE08888;
CHECKREG r3, 0xFFF04444;
CHECKREG r4, 0xFFF82222;
CHECKREG r5, 0xFFFC1111;
CHECKREG r6, 0xFFFE0888;
CHECKREG r7, 0xFFFF0444;

// bit 16-23
imm32 r0, 0x83333333;
imm32 r1, 0x83333333;
imm32 r2, 0x83333333;
imm32 r3, 0x83333333;
imm32 r4, 0x83333333;
imm32 r5, 0x83333333;
imm32 r6, 0x83333333;
imm32 r7, 0x83333333;
R0 >>>= 16; /* r0 = 0xFFFF8333 */
R1 >>>= 17; /* r1 = 0xFFFFC199 */
R2 >>>= 18; /* r2 = 0xFFFFE0CC */
R3 >>>= 19; /* r3 = 0xFFFFF066 */
R4 >>>= 20; /* r4 = 0xFFFFF833 */
R5 >>>= 21; /* r5 = 0xFFFFFC19 */
R6 >>>= 22; /* r6 = 0xFFFFFE0C */
R7 >>>= 23; /* r7 = 0xFFFFFF06 */
CHECKREG r0, 0xFFFF8333;
CHECKREG r1, 0xFFFFC199;
CHECKREG r2, 0xFFFFE0CC;
CHECKREG r3, 0xFFFFF066;
CHECKREG r4, 0xFFFFF833;
CHECKREG r5, 0xFFFFFC19;
CHECKREG r6, 0xFFFFFE0C;
CHECKREG r7, 0xFFFFFF06;

// bit 24-31
imm32 r0, 0x84444444;
imm32 r1, 0x84444444;
imm32 r2, 0x84444444;
imm32 r3, 0x84444444;
imm32 r4, 0x84444444;
imm32 r5, 0x84444444;
imm32 r6, 0x84444444;
imm32 r7, 0x84444444;
R0 >>>= 24; /* r0 = 0xFFFFFF84 */
R1 >>>= 25; /* r1 = 0xFFFFFFC2 */
R2 >>>= 26; /* r2 = 0xFFFFFFE1 */
R3 >>>= 27; /* r3 = 0xFFFFFFF0 */
R4 >>>= 28; /* r4 = 0xFFFFFFF8 */
R5 >>>= 29; /* r5 = 0xFFFFFFFC */
R6 >>>= 30; /* r6 = 0xFFFFFFFE */
R7 >>>= 31; /* r7 = 0xFFFFFFFF */
CHECKREG r0, 0xFFFFFF84;
CHECKREG r1, 0xFFFFFFC2;
CHECKREG r2, 0xFFFFFFE1;
CHECKREG r3, 0xFFFFFFF0;
CHECKREG r4, 0xFFFFFFF8;
CHECKREG r5, 0xFFFFFFFC;
CHECKREG r6, 0xFFFFFFFE;
CHECKREG r7, 0xFFFFFFFF;

// Arithmetic >>>= : positive data
// bit 0-7
imm32 r0, 0x41111111;
imm32 r1, 0x41111111;
imm32 r2, 0x41111111;
imm32 r3, 0x41111111;
imm32 r4, 0x41111111;
imm32 r5, 0x41111111;
imm32 r6, 0x41111111;
imm32 r7, 0x41111111;
R0 >>>= 0; /* r0 = 0x41111111 */
R1 >>>= 1; /* r1 = 0x20888888 */
R2 >>>= 2; /* r2 = 0x10444444 */
R3 >>>= 3; /* r3 = 0x08222222 */
R4 >>>= 4; /* r4 = 0x04111111 */
R5 >>>= 5; /* r5 = 0x02088888 */
R6 >>>= 6; /* r6 = 0x01044444 */
R7 >>>= 7; /* r7 = 0x00822222 */
CHECKREG r0, 0x41111111;
CHECKREG r1, 0x20888888;
CHECKREG r2, 0x10444444;
CHECKREG r3, 0x08222222;
CHECKREG r4, 0x04111111;
CHECKREG r5, 0x02088888;
CHECKREG r6, 0x01044444;
CHECKREG r7, 0x00822222;

// bit 8-15
imm32 r0, 0x42222222;
imm32 r1, 0x42222222;
imm32 r2, 0x42222222;
imm32 r3, 0x42222222;
imm32 r4, 0x42222222;
imm32 r5, 0x42222222;
imm32 r6, 0x42222222;
imm32 r7, 0x42222222;
R0 >>>= 8; /* r0 = 0x00422222 */
R1 >>>= 9; /* r1 = 0x00211111 */
R2 >>>= 10; /* r2 = 0x00108888 */
R3 >>>= 11; /* r3 = 0x00084444 */
R4 >>>= 12; /* r4 = 0x00042222 */
R5 >>>= 13; /* r5 = 0x00021111 */
R6 >>>= 14; /* r6 = 0x00010888 */
R7 >>>= 15; /* r7 = 0x00008444 */
CHECKREG r0, 0x00422222;
CHECKREG r1, 0x00211111;
CHECKREG r2, 0x00108888;
CHECKREG r3, 0x00084444;
CHECKREG r4, 0x00042222;
CHECKREG r5, 0x00021111;
CHECKREG r6, 0x00010888;
CHECKREG r7, 0x00008444;

// bit 16-23
imm32 r0, 0x43333333;
imm32 r1, 0x43333333;
imm32 r2, 0x43333333;
imm32 r3, 0x43333333;
imm32 r4, 0x43333333;
imm32 r5, 0x43333333;
imm32 r6, 0x43333333;
imm32 r7, 0x43333333;
R0 >>>= 16; /* r0 = 0x00004333 */
R1 >>>= 17; /* r1 = 0x00002199 */
R2 >>>= 18; /* r2 = 0x000010CC */
R3 >>>= 19; /* r3 = 0x00000866 */
R4 >>>= 20; /* r4 = 0x00000433 */
R5 >>>= 21; /* r5 = 0x00000219 */
R6 >>>= 22; /* r6 = 0x0000010C */
R7 >>>= 23; /* r7 = 0x00000086 */
CHECKREG r0, 0x00004333;
CHECKREG r1, 0x00002199;
CHECKREG r2, 0x000010CC;
CHECKREG r3, 0x00000866;
CHECKREG r4, 0x00000433;
CHECKREG r5, 0x00000219;
CHECKREG r6, 0x0000010C;
CHECKREG r7, 0x00000086;

// bit 24-31
imm32 r0, 0x44444444;
imm32 r1, 0x44444444;
imm32 r2, 0x44444444;
imm32 r3, 0x44444444;
imm32 r4, 0x44444444;
imm32 r5, 0x44444444;
imm32 r6, 0x44444444;
imm32 r7, 0x44444444;
R0 >>>= 24; /* r0 = 0x00000044 */
R1 >>>= 25; /* r1 = 0x00000022 */
R2 >>>= 26; /* r2 = 0x00000011 */
R3 >>>= 27; /* r3 = 0x00000008 */
R4 >>>= 28; /* r4 = 0x00000004 */
R5 >>>= 29; /* r5 = 0x00000002 */
R6 >>>= 30; /* r6 = 0x00000001 */
R7 >>>= 31; /* r7 = 0x00000000 */
CHECKREG r0, 0x00000044;
CHECKREG r1, 0x00000022;
CHECKREG r2, 0x00000011;
CHECKREG r3, 0x00000008;
CHECKREG r4, 0x00000004;
CHECKREG r5, 0x00000002;
CHECKREG r6, 0x00000001;
CHECKREG r7, 0x00000000;


pass
