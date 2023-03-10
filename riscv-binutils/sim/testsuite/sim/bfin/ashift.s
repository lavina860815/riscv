# Blackfin testcase for ashift
# mach: bfin

	.include "testutils.inc"

	.macro ashift_test in:req, shift:req, out:req, opt
	r0 = \in (Z);
	r2.L = \shift;
	r2.h = ASHIFT R0.L BY R2.L \opt;
	DBGA (r2.h, \out);
	.endm

	start

	/*
	 * 16-bit ashift and lshift uses a 6-bit signed  magnitude, which
	 * gives a range from -32 to 31.  In the case where the  magnitude
	 * is -32, make sure the answer is correct.
	 */

ashift_test 0x8001,  33, 0xffff;
ashift_test 0x8001,  32, 0xffff;
ashift_test 0x8001,  31, 0x0000;
ashift_test 0x8001,  30, 0x0000;
ashift_test 0x8001,  29, 0x0000;
ashift_test 0x8001,  28, 0x0000;
ashift_test 0x8001,  27, 0x0000;
ashift_test 0x8001,  26, 0x0000;
ashift_test 0x8001,  25, 0x0000;
ashift_test 0x8001,  24, 0x0000;
ashift_test 0x8001,  23, 0x0000;
ashift_test 0x8001,  22, 0x0000;
ashift_test 0x8001,  21, 0x0000;
ashift_test 0x8001,  20, 0x0000;
ashift_test 0x8001,  19, 0x0000;
ashift_test 0x8001,  18, 0x0000;
ashift_test 0x8001,  17, 0x0000;
ashift_test 0x8001,  16, 0x0000;
ashift_test 0x8001,  15, 0x8000;
ashift_test 0x8001,  14, 0x4000;
ashift_test 0x8001,  13, 0x2000;
ashift_test 0x8001,  12, 0x1000;
ashift_test 0x8001,  11, 0x0800;
ashift_test 0x8001,  10, 0x0400;
ashift_test 0x8001,   9, 0x0200;
ashift_test 0x8001,   8, 0x0100;
ashift_test 0x8001,   7, 0x0080;
ashift_test 0x8001,   6, 0x0040;
ashift_test 0x8001,   5, 0x0020;
ashift_test 0x8001,   4, 0x0010;
ashift_test 0x8001,   3, 0x0008;
ashift_test 0x8001,   2, 0x0004;
ashift_test 0x8001,   1, 0x0002;
ashift_test 0x8001,   0, 0x8001;
ashift_test 0x8001,  -1, 0xc000;
ashift_test 0x8001,  -2, 0xe000;
ashift_test 0x8001,  -3, 0xf000;
ashift_test 0x8001,  -4, 0xf800;
ashift_test 0x8001,  -5, 0xfc00;
ashift_test 0x8001,  -6, 0xfe00;
ashift_test 0x8001,  -7, 0xff00;
ashift_test 0x8001,  -8, 0xff80;
ashift_test 0x8001,  -9, 0xffc0;
ashift_test 0x8001, -10, 0xffe0;
ashift_test 0x8001, -11, 0xfff0;
ashift_test 0x8001, -12, 0xfff8;
ashift_test 0x8001, -13, 0xfffc;
ashift_test 0x8001, -14, 0xfffe;
ashift_test 0x8001, -15, 0xffff;
ashift_test 0x8001, -16, 0xffff;
ashift_test 0x8001, -17, 0xffff;
ashift_test 0x8001, -18, 0xffff;
ashift_test 0x8001, -19, 0xffff;
ashift_test 0x8001, -20, 0xffff;
ashift_test 0x8001, -21, 0xffff;
ashift_test 0x8001, -22, 0xffff;
ashift_test 0x8001, -23, 0xffff;
ashift_test 0x8001, -24, 0xffff;
ashift_test 0x8001, -25, 0xffff;
ashift_test 0x8001, -26, 0xffff;
ashift_test 0x8001, -27, 0xffff;
ashift_test 0x8001, -28, 0xffff;
ashift_test 0x8001, -29, 0xffff;
ashift_test 0x8001, -30, 0xffff;
ashift_test 0x8001, -31, 0xffff;
ashift_test 0x8001, -32, 0xffff;
ashift_test 0x8001, -33, 0x0;
ashift_test 0x8001, -34, 0x0;

ashift_test 0x8001,  33, 0xffff, (S);
ashift_test 0x8001,  32, 0xffff, (S);
ashift_test 0x8001,  31, 0x8000, (S);
ashift_test 0x8001,  30, 0x8000, (S);
ashift_test 0x8001,  29, 0x8000, (S);
ashift_test 0x8001,  28, 0x8000, (S);
ashift_test 0x8001,  27, 0x8000, (S);
ashift_test 0x8001,  26, 0x8000, (S);
ashift_test 0x8001,  25, 0x8000, (S);
ashift_test 0x8001,  24, 0x8000, (S);
ashift_test 0x8001,  23, 0x8000, (S);
ashift_test 0x8001,  22, 0x8000, (S);
ashift_test 0x8001,  21, 0x8000, (S);
ashift_test 0x8001,  20, 0x8000, (S);
ashift_test 0x8001,  19, 0x8000, (S);
ashift_test 0x8001,  18, 0x8000, (S);
ashift_test 0x8001,  17, 0x8000, (S);
ashift_test 0x8001,  16, 0x8000, (S);
ashift_test 0x8001,  15, 0x8000, (S);
ashift_test 0x8001,  14, 0x8000, (S);
ashift_test 0x8001,  13, 0x8000, (S);
ashift_test 0x8001,  12, 0x8000, (S);
ashift_test 0x8001,  11, 0x8000, (S);
ashift_test 0x8001,  10, 0x8000, (S);
ashift_test 0x8001,   9, 0x8000, (S);
ashift_test 0x8001,   8, 0x8000, (S);
ashift_test 0x8001,   7, 0x8000, (S);
ashift_test 0x8001,   6, 0x8000, (S);
ashift_test 0x8001,   5, 0x8000, (S);
ashift_test 0x8001,   4, 0x8000, (S);
ashift_test 0x8001,   3, 0x8000, (S);
ashift_test 0x8001,   2, 0x8000, (S);
ashift_test 0x8001,   1, 0x8000, (S);
ashift_test 0x8001,   0, 0x8001, (S);
ashift_test 0x8001,  -1, 0xc000, (S);
ashift_test 0x8001,  -2, 0xe000, (S);
ashift_test 0x8001,  -3, 0xf000, (S);
ashift_test 0x8001,  -4, 0xf800, (S);
ashift_test 0x8001,  -5, 0xfc00, (S);
ashift_test 0x8001,  -6, 0xfe00, (S);
ashift_test 0x8001,  -7, 0xff00, (S);
ashift_test 0x8001,  -8, 0xff80, (S);
ashift_test 0x8001,  -9, 0xffc0, (S);
ashift_test 0x8001, -10, 0xffe0, (S);
ashift_test 0x8001, -11, 0xfff0, (S);
ashift_test 0x8001, -12, 0xfff8, (S);
ashift_test 0x8001, -13, 0xfffc, (S);
ashift_test 0x8001, -14, 0xfffe, (S);
ashift_test 0x8001, -15, 0xffff, (S);
ashift_test 0x8001, -16, 0xffff, (S);
ashift_test 0x8001, -17, 0xffff, (S);
ashift_test 0x8001, -18, 0xffff, (S);
ashift_test 0x8001, -19, 0xffff, (S);
ashift_test 0x8001, -20, 0xffff, (S);
ashift_test 0x8001, -21, 0xffff, (S);
ashift_test 0x8001, -22, 0xffff, (S);
ashift_test 0x8001, -23, 0xffff, (S);
ashift_test 0x8001, -24, 0xffff, (S);
ashift_test 0x8001, -25, 0xffff, (S);
ashift_test 0x8001, -26, 0xffff, (S);
ashift_test 0x8001, -27, 0xffff, (S);
ashift_test 0x8001, -28, 0xffff, (S);
ashift_test 0x8001, -29, 0xffff, (S);
ashift_test 0x8001, -30, 0xffff, (S);
ashift_test 0x8001, -31, 0xffff, (S);
ashift_test 0x8001, -32, 0xffff, (S);
ashift_test 0x8001, -33, 0x8000, (S);
ashift_test 0x8001, -34, 0x8000, (S);


ashift_test 0x4002,  33, 0x0;
ashift_test 0x4002,  32, 0x0;
ashift_test 0x4002,  31, 0x0;
ashift_test 0x4002,  30, 0x0;
ashift_test 0x4002,  20, 0x0;
ashift_test 0x4002,  19, 0x0;
ashift_test 0x4002,  18, 0x0;
ashift_test 0x4002,  17, 0x0;
ashift_test 0x4002,  16, 0x0;
ashift_test 0x4002,  15, 0x0;
ashift_test 0x4002,  14, 0x8000;
ashift_test 0x4002,  13, 0x4000;
ashift_test 0x4002,  12, 0x2000;
ashift_test 0x4002,  11, 0x1000;
ashift_test 0x4002,  10, 0x0800;
ashift_test 0x4002,   9, 0x0400;
ashift_test 0x4002,   8, 0x0200;
ashift_test 0x4002,   7, 0x0100;
ashift_test 0x4002,   6, 0x0080;
ashift_test 0x4002,   5, 0x0040;
ashift_test 0x4002,   4, 0x0020;
ashift_test 0x4002,   3, 0x0010;
ashift_test 0x4002,   2, 0x0008;
ashift_test 0x4002,   1, 0x8004;
ashift_test 0x4002,   0, 0x4002;
ashift_test 0x4002,  -1, 0x2001;
ashift_test 0x4002,  -2, 0x1000;
ashift_test 0x4002,  -3, 0x0800;
ashift_test 0x4002,  -4, 0x0400;
ashift_test 0x4002,  -5, 0x0200;
ashift_test 0x4002,  -6, 0x0100;
ashift_test 0x4002,  -7, 0x0080;
ashift_test 0x4002,  -8, 0x0040;
ashift_test 0x4002,  -9, 0x0020;
ashift_test 0x4002, -10, 0x0010;
ashift_test 0x4002, -11, 0x0008;
ashift_test 0x4002, -12, 0x0004;
ashift_test 0x4002, -13, 0x0002;
ashift_test 0x4002, -14, 0x0001;
ashift_test 0x4002, -15, 0x0;
ashift_test 0x4002, -16, 0x0;
ashift_test 0x4002, -17, 0x0;
ashift_test 0x4002, -31, 0x0;
ashift_test 0x4002, -32, 0x0;
ashift_test 0x4002, -33, 0x0;
ashift_test 0x4002, -34, 0x0;

ashift_test 0x4002,  33, 0x0, (S);
ashift_test 0x4002,  32, 0x0, (S);
ashift_test 0x4002,  31, 0x7fff, (S);
ashift_test 0x4002,  30, 0x7fff, (S);
ashift_test 0x4002,  20, 0x7fff, (S);
ashift_test 0x4002,  19, 0x7fff, (S);
ashift_test 0x4002,  18, 0x7fff, (S);
ashift_test 0x4002,  17, 0x7fff, (S);
ashift_test 0x4002,  16, 0x7fff, (S);
ashift_test 0x4002,  15, 0x7fff, (S);
ashift_test 0x4002,  14, 0x7fff, (S);
ashift_test 0x4002,  13, 0x7fff, (S);
ashift_test 0x4002,  12, 0x7fff, (S);
ashift_test 0x4002,  11, 0x7fff, (S);
ashift_test 0x4002,  10, 0x7fff, (S);
ashift_test 0x4002,   9, 0x7fff, (S);
ashift_test 0x4002,   8, 0x7fff, (S);
ashift_test 0x4002,   7, 0x7fff, (S);
ashift_test 0x4002,   6, 0x7fff, (S);
ashift_test 0x4002,   5, 0x7fff, (S);
ashift_test 0x4002,   4, 0x7fff, (S);
ashift_test 0x4002,   3, 0x7fff, (S);
ashift_test 0x4002,   2, 0x7fff, (S);
ashift_test 0x4002,   1, 0x7fff, (S);
ashift_test 0x4002,   0, 0x4002, (S);
ashift_test 0x4002,  -1, 0x2001, (S);
ashift_test 0x4002,  -2, 0x1000, (S);
ashift_test 0x4002,  -3, 0x0800, (S);
ashift_test 0x4002,  -4, 0x0400, (S);
ashift_test 0x4002,  -5, 0x0200, (S);
ashift_test 0x4002,  -6, 0x0100, (S);
ashift_test 0x4002,  -7, 0x0080, (S);
ashift_test 0x4002,  -8, 0x0040, (S);
ashift_test 0x4002,  -9, 0x0020, (S);
ashift_test 0x4002, -10, 0x0010, (S);
ashift_test 0x4002, -11, 0x0008, (S);
ashift_test 0x4002, -12, 0x0004, (S);
ashift_test 0x4002, -13, 0x0002, (S);
ashift_test 0x4002, -14, 0x0001, (S);
ashift_test 0x4002, -15, 0x0000, (S);
ashift_test 0x4002, -16, 0x0000, (S);
ashift_test 0x4002, -17, 0x0000, (S);
ashift_test 0x4002, -31, 0x0000, (S);
ashift_test 0x4002, -32, 0x0000, (S);
ashift_test 0x4002, -33, 0x7fff, (S);
ashift_test 0x4002, -34, 0x7fff, (S);

ashift_test 0x0001,  33, 0x0000, (S);
ashift_test 0x0001,  32, 0x0000, (S);
ashift_test 0x0001,  31, 0x7fff, (S);
ashift_test 0x0001,  30, 0x7fff, (S);
ashift_test 0x0001,  29, 0x7fff, (S);
ashift_test 0x0001,  28, 0x7fff, (S);
ashift_test 0x0001,  27, 0x7fff, (S);
ashift_test 0x0001,  26, 0x7fff, (S);
ashift_test 0x0001,  25, 0x7fff, (S);
ashift_test 0x0001,  24, 0x7fff, (S);
ashift_test 0x0001,  23, 0x7fff, (S);
ashift_test 0x0001,  22, 0x7fff, (S);
ashift_test 0x0001,  21, 0x7fff, (S);
ashift_test 0x0001,  20, 0x7fff, (S);
ashift_test 0x0001,  19, 0x7fff, (S);
ashift_test 0x0001,  18, 0x7fff, (S);
ashift_test 0x0001,  17, 0x7fff, (S);
ashift_test 0x0001,  16, 0x7fff, (S);
ashift_test 0x0001,  15, 0x7fff, (S);
ashift_test 0x0001,  14, 0x4000, (S);
ashift_test 0x0001,  13, 0x2000, (S);
ashift_test 0x0001,  12, 0x1000, (S);
ashift_test 0x0001,  11, 0x0800, (S);
ashift_test 0x0001,  10, 0x0400, (S);
ashift_test 0x0001,   9, 0x0200, (S);
ashift_test 0x0001,   8, 0x0100, (S);
ashift_test 0x0001,   7, 0x0080, (S);
ashift_test 0x0001,   6, 0x0040, (S);
ashift_test 0x0001,   5, 0x0020, (S);
ashift_test 0x0001,   4, 0x0010, (S);
ashift_test 0x0001,   3, 0x0008, (S);
ashift_test 0x0001,   2, 0x0004, (S);
ashift_test 0x0001,   1, 0x0002, (S);
ashift_test 0x0001,   0, 0x0001, (S);
ashift_test 0x0001,  -1, 0x0000, (S);
ashift_test 0x0001,  -2, 0x0000, (S);
ashift_test 0x0001,  -3, 0x0000, (S);
ashift_test 0x0001,  -4, 0x0000, (S);
ashift_test 0x0001,  -5, 0x0000, (S);
ashift_test 0x0001,  -6, 0x0000, (S);
ashift_test 0x0001,  -7, 0x0000, (S);
ashift_test 0x0001,  -8, 0x0000, (S);
ashift_test 0x0001,  -9, 0x0000, (S);
ashift_test 0x0001, -10, 0x0000, (S);
ashift_test 0x0001, -11, 0x0000, (S);
ashift_test 0x0001, -12, 0x0000, (S);
ashift_test 0x0001, -13, 0x0000, (S);
ashift_test 0x0001, -14, 0x0, (S);
ashift_test 0x0001, -15, 0x0, (S);
ashift_test 0x0001, -16, 0x0, (S);
ashift_test 0x0001, -17, 0x0, (S);
ashift_test 0x0001, -18, 0x0, (S);
ashift_test 0x0001, -19, 0x0, (S);
ashift_test 0x0001, -20, 0x0, (S);
ashift_test 0x0001, -21, 0x0, (S);
ashift_test 0x0001, -22, 0x0, (S);
ashift_test 0x0001, -23, 0x0, (S);
ashift_test 0x0001, -24, 0x0, (S);
ashift_test 0x0001, -25, 0x0, (S);
ashift_test 0x0001, -26, 0x0, (S);
ashift_test 0x0001, -27, 0x0, (S);
ashift_test 0x0001, -28, 0x0, (S);
ashift_test 0x0001, -29, 0x0, (S);
ashift_test 0x0001, -30, 0x0, (S);
ashift_test 0x0001, -31, 0x0, (S);
ashift_test 0x0001, -32, 0x0, (S);
ashift_test 0x0001, -33, 0x7fff, (S);
ashift_test 0x0001, -34, 0x7fff, (S);

	pass
