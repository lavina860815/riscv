# Blackfin testcase for ABS instruction
# mach: bfin

#include "test.h"

	.include "testutils.inc"

	start

	.global _test
_test:
	R6 = ASTAT;
	R0.H = 0x8000;
	R0.L = 0x0;
	R1 = ABS R0;
	R7 = ASTAT;
	R2.H = 0x7fff;
	R2.L = 0xffff;
	CC = R1 == R2;
	IF !CC JUMP 1f;
	/* CLEARED: AZ AN V V_COPY */
	R3.H = HI(_AZ|_AN);
	R3.L = LO(_AZ|_AN);
	R4 = R7 & R3;
	CC = R4 == 0;
	IF !CC JUMP 1f;
	/* SET: V V_COPY VS */
	R3.H = HI(_V|_V_COPY|_VS);
	R3.L = LO(_V|_V_COPY|_VS);
	R4 = R7 & R3;
	CC = R3 == R4;
	IF !CC JUMP 1f;
	/* UNAFFECTED: CC AQ RND_MOD AV0 AV0S AV1 AV1S AC0 AC0_COPY AC1 */
	R3.H = HI(_CC|_AQ|_RND_MOD|_AV0|_AV0S|_AV1|_AV1S|_AC0|_AC0_COPY|_AC1);
	R3.L = LO(_CC|_AQ|_RND_MOD|_AV0|_AV0S|_AV1|_AV1S|_AC0|_AC0_COPY|_AC1);
	R4 = R6 & R3;
	R5 = R7 & R3;
	CC = R4 == R5;
	IF !CC JUMP 1f;
	pass
1:
	fail
