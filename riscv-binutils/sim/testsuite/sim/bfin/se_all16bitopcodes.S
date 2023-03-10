/*
 * Blackfin testcase for testing illegal/legal 16-bit opcodes from userspace
 * we track all instructions which cause some sort of exception when run from
 * userspace, this is normally EXCAUSE :
 *  - 0x21 : illegal instruction
 *  - 0x22 : illegal instruction combination
 *  - 0x2e : use of supervisor resource from userspace
 * and walk every instruction from 0x0000 to 0xbfff
 */

# mach: bfin
# sim: --environment operating

#include "test.h"

#define SE_ALL_BITS 16
#define SE_ALL_NEW_INSN_STUB
#include "se_allopcodes.h"
	.include "testutils.inc"

.macro se_all_load_insn
	R2 = W[P5];
	R0 = R2;
.endm

.macro se_all_next_insn
	/* increment, and go again. */
	R0 = R2;

	R0 += 1;
	/* finish once we hit the 32bit limit */
	R1 = 0xC000 (Z);
	CC = R1 == R0;
	IF CC JUMP pass_lvl;

	W[P5] = R0;
.endm

.macro se_all_new_insn_stub
	jump _legal_instruction;
.endm

.macro se_all_insn_init
	.dw 0x0000;
.endm
.macro se_all_insn_table
	/* this table must be sorted, and end with zero */
	/* start	end		SEQSTAT */
	.dw 0x0001,	0x000f,		0x21
	.dw 0x0011,	0x0013,		0x2e
.ifndef BFIN_JTAG
	.dw 0x0014,	0x0014,		0x2e	/* anomaly - RTX works when emulator attached */
.endif
	.dw 0x0015,	0x001F,		0x21
	.dw 0x0021,	0x0022,		0x21
	.dw 0x0026,	0x0026,		0x21
.ifndef BFIN_JTAG
	.dw 0x0027,	0x0027,		0x21	/* anomaly 492 - unknown */
.endif
	.dw 0x0028,	0x002F,		0x21
	.dw 0x0030,	0x0037,		0x2e
	.dw 0x0038,	0x003F,		0x21
	.dw 0x0040,	0x0047,		0x2e
	.dw 0x0048,	0x004F,		0x21
	.dw 0x0058,	0x005F,		0x21
	.dw 0x0068,	0x006F,		0x21
	.dw 0x0078,	0x007F, 	0x21
	.dw 0x0088,	0x008F,		0x21
	.dw 0x0090,	0x009F,		0x2E
	.dw 0x00a0,	0x00a0,		0x00
	.dw 0x00a1,	0x00a1,		0x01
	.dw 0x00a2,	0x00a2,		0x02
	.dw 0x00a3,	0x00a3,		0x03
	.dw 0x00a4,	0x00a4,		0x04
	.dw 0x00a5,	0x00a5,		0x05
	.dw 0x00a6,	0x00a6,		0x06
	.dw 0x00a7,	0x00a7,		0x07
	.dw 0x00a8,	0x00a8,		0x08
	.dw 0x00a9,	0x00a9,		0x09
	.dw 0x00aa,	0x00aa,		0x0a
	.dw 0x00ab,	0x00ab,		0x0b
	.dw 0x00ac,	0x00ac,		0x0c
	.dw 0x00ad,	0x00ad,		0x0d
	.dw 0x00ae,	0x00ae,		0x0e
	.dw 0x00af,	0x00af,		0x0f
	.dw 0x00b6,	0x010f,		0x21
	.dw 0x0124,	0x0124,		0x21
.ifndef BFIN_JTAG
	.dw 0x0125,	0x0125,		0x21	/* anomaly 492  res = [SP++] */
.endif
	.dw 0x0128,	0x012F,		0x21
	.dw 0x0138,	0x0138,		0x22
	.dw 0x0139,	0x013F,		0x2E
	.dw 0x0164,	0x0164,		0x21
.ifndef BFIN_JTAG
	.dw 0x0165,	0x0165,		0x21	/* anomaly 492 [--SP] = res */
.endif
	.dw 0x0168,	0x016F,		0x21
	.dw 0x0178,	0x017F,		0x2E
	.dw 0x0180,	0x01FF,		0x21
	.dw 0x0210,	0x0217,		0x21
.ifndef BFIN_JTAG
	.dw 0x0219,	0x021F,		0x21	/* anomaly 492 CC = !CC opcode is  0000 0010 0001 1xxx */
.endif
	.dw 0x0220,	0x023F,		0x21
	.dw 0x0280,	0x02FF,		0x21
	.dw 0x0305,	0x0305,		0x21
	.dw 0x0325,	0x0325,		0x21
	.dw 0x0345,	0x0345,		0x21
	.dw 0x0365,	0x0365,		0x21
	.dw 0x0385,	0x0385,		0x21
	.dw 0x03a5,	0x03a5,		0x21
	.dw 0x03c5,	0x03c5,		0x21
	.dw 0x03e5,	0x03e5,		0x21
	.dw 0x0400,	0x047F,		0x21
	.dw 0x0486,	0x04Bf,		0x21
	.dw 0x04c6,	0x04FF,		0x21
	.dw 0x0501,	0x0507,		0x21
	.dw 0x0509,	0x050F,		0x21
	.dw 0x0511,	0x0517,		0x21
	.dw 0x0519,	0x051F,		0x21
	.dw 0x0521,	0x0527,		0x21
	.dw 0x0529,	0x052F,		0x21
	.dw 0x0531,	0x0537,		0x21
	.dw 0x0539,	0x053F,		0x21
	.dw 0x0541,	0x0547,		0x21
	.dw 0x0549,	0x054F,		0x21
	.dw 0x0551,	0x0557,		0x21
	.dw 0x0559,	0x055F,		0x21
	.dw 0x0561,	0x0567,		0x21
	.dw 0x0569,	0x056F,		0x21
	.dw 0x0571,	0x0577,		0x21
	.dw 0x0579,	0x057F,		0x21
	.dw 0x0586,	0x0587,		0x21
	.dw 0x058e,	0x058F,		0x21
	.dw 0x0596,	0x0597,		0x21
	.dw 0x059e,	0x059f,		0x21
	.dw 0x05a6,	0x05a7,		0x21
	.dw 0x05ae,	0x05af,		0x21
	.dw 0x05b6,	0x05b7,		0x21
	.dw 0x05be,	0x05bf,		0x21
	.dw 0x05c6,	0x05c7,		0x21
	.dw 0x05ce,	0x05cf,		0x21
	.dw 0x05d6,	0x05d7,		0x21
	.dw 0x05de,	0x05df,		0x21
	.dw 0x05e6,	0x05e7,		0x21
	.dw 0x05ee,	0x05ef,		0x21
	.dw 0x05f6,	0x05f7,		0x21
	.dw 0x05fe,	0x05ff,		0x21
	.dw 0x0a81,	0x0aff,		0x21
	.dw 0x0b01,	0x0b7f,		0x21
	.dw 0x0b81,	0x0bff,		0x21
	.dw 0x0e80,	0x0fff,		0x21
	.dw 0x3104,	0x3105,		0x21
	.dw 0x310c,	0x310d,		0x21
	.dw 0x3114,	0x3115,		0x21
	.dw 0x311c,	0x311d,		0x21
	.dw 0x3124,	0x3125,		0x21
	.dw 0x312c,	0x312d,		0x21
	.dw 0x3134,	0x3135,		0x21
	.dw 0x313c,	0x313d,		0x21
	.dw 0x3140,	0x317F,		0x21
	.dw 0x31c0,	0x31ff,		0x2E
	.dw 0x3304,	0x3305,		0x21
	.dw 0x330c,	0x330d,		0x21
	.dw 0x3314,	0x3315,		0x21
	.dw 0x331c,	0x331d,		0x21
	.dw 0x3324,	0x3325,		0x21
	.dw 0x332c,	0x332d,		0x21
	.dw 0x3334,	0x3335,		0x21
	.dw 0x333c,	0x333d,		0x21
	.dw 0x3340,	0x337f,		0x21
	.dw 0x33c0,	0x33ff,		0x2e
	.dw 0x3504,	0x3507,		0x21
	.dw 0x350c,	0x350F,		0x21
	.dw 0x3514,	0x3517,		0x21
	.dw 0x351c,	0x351F,		0x21
	.dw 0x3524,	0x3527,		0x21
	.dw 0x352c,	0x352f,		0x21
	.dw 0x3534,	0x3537,		0x21
	.dw 0x353c,	0x353f,		0x21
	.dw 0x3540,	0x35c6,		0x21
	.dw 0x35c7,	0x35c7,		0x2e
	.dw 0x35c8,	0x35ce,		0x21
	.dw 0x35cf,	0x35cf,		0x2e
	.dw 0x35d0,	0x35d6,		0x21
	.dw 0x35d7,	0x35d7,		0x2e
	.dw 0x35d8,	0x35de,		0x21
	.dw 0x35df,	0x35df,		0x2e
	.dw 0x35e0,	0x35e6,		0x21
	.dw 0x35e7,	0x35e7,		0x2e
	.dw 0x35e8,	0x35ee,		0x21
	.dw 0x35ef,	0x35ef,		0x2e
	.dw 0x35f0,	0x35f6,		0x21
	.dw 0x35f7,	0x35f7,		0x2e
	.dw 0x35f8,	0x35fe,		0x21
	.dw 0x35ff,	0x35ff,		0x2e
	.dw 0x3704,	0x3707,		0x21
	.dw 0x370c,	0x370f,		0x21
	.dw 0x3714,	0x3717,		0x21
	.dw 0x371c,	0x371f,		0x21
	.dw 0x3724,	0x3727,		0x21
	.dw 0x372c,	0x372f,		0x21
	.dw 0x3734,	0x3737,		0x21
	.dw 0x373c,	0x37c6,		0x21
	.dw 0x37c7,	0x37c7,		0x2e
	.dw 0x37c8,	0x37ce,		0x21
	.dw 0x37cf,	0x37cf,		0x2e
	.dw 0x37d0,	0x37d6,		0x21
	.dw 0x37d7,	0x37d7,		0x2e
	.dw 0x37d8,	0x37de,		0x21
	.dw 0x37df,	0x37df,		0x2e
	.dw 0x37e0,	0x37e6,		0x21
	.dw 0x37e7,	0x37e7,		0x2e
	.dw 0x37e8,	0x37ee,		0x21
	.dw 0x37ef,	0x37ef,		0x2e
	.dw 0x37f0,	0x37f6,		0x21
	.dw 0x37f7,	0x37f7,		0x2e
	.dw 0x37f8,	0x37fe,		0x21
	.dw 0x37ff,	0x37ff,		0x2e
	.dw 0x3820,	0x382f,		0x21
	.dw 0x3860,	0x386f,		0x21
	.dw 0x38a0,	0x38af,		0x21
	.dw 0x38b0,	0x38bf,		0x21
	.dw 0x38e0,	0x38ef,		0x21
	.dw 0x38f0,	0x38ff,		0x21
	.dw 0x3904,	0x3907,		0x21
	.dw 0x390c,	0x390f,		0x21
	.dw 0x3914,	0x3917,		0x21
	.dw 0x391c,	0x392f,		0x21
	.dw 0x3934,	0x3937,		0x21
	.dw 0x393c,	0x39bf,		0x21
	.dw 0x397f,	0x397f,		0x2e
	.dw 0x3980,	0x39bf,		0x21
	.dw 0x39c0,	0x39c0,		0x2e
	.dw 0x39c1,	0x39c7,		0x21
	.dw 0x39c8,	0x39c8,		0x2e
	.dw 0x39c9,	0x39cf,		0x21
	.dw 0x39d0,	0x39d0,		0x2e
	.dw 0x39d1,	0x39d7,		0x21
	.dw 0x39d8,	0x39d8,		0x2e
	.dw 0x39d9,	0x39ef,		0x21
	.dw 0x39f0,	0x39f0,		0x2e
	.dw 0x39f1,	0x39f6,		0x21
	.dw 0x39f7,	0x39f8,		0x2e
	.dw 0x39f9,	0x39fe,		0x21
	.dw 0x39ff,	0x39ff,		0x2e
	.dw 0x3a00,	0x3bff,		0x21
	.dw 0x3c80,	0x3cff,		0x21
	.dw 0x3d04,	0x3d07,		0x21
	.dw 0x3d0c,	0x3d0f,		0x21
	.dw 0x3d14,	0x3d17,		0x21
	.dw 0x3d1c,	0x3d1f,		0x21
	.dw 0x3d24,	0x3d27,		0x21
	.dw 0x3d2c,	0x3d2f,		0x21
	.dw 0x3d34,	0x3d37,		0x21
	.dw 0x3d3c,	0x3dbf,		0X21
	.dw 0x3dc0,	0x3dc0,		0x2e
	.dw 0x3dc1,	0x3dc6,		0x21
	.dw 0x3dc7,	0x3dc8,		0x2e
	.dw 0x3dc9,	0x3dce,		0x21
	.dw 0x3dcf,	0x3dd0,		0x2e
	.dw 0x3dd1,	0x3dd6,		0x21
	.dw 0x3dd7,	0x3dd8,		0x2e
	.dw 0x3dd9,	0x3dde,		0x21
	.dw 0x3ddf,	0x3de0,		0x2e
	.dw 0x3de1,	0x3de6,		0x21
	.dw 0x3de7,	0x3de8,		0x2e
	.dw 0x3de9,	0x3dee,		0x21
	.dw 0x3def,	0x3df0,		0x2e
	.dw 0x3df1,	0x3df6,		0x21
	.dw 0x3df7,	0x3df8,		0x2e
	.dw 0x3df9,	0x3dfe,		0x21
	.dw 0x3dff,	0x3e7f,		0x2e
	.dw 0x3e80,	0x3eb7,		0x21
	.dw 0x3eb8,	0x3ebf,		0x2e
	.dw 0x3ec0,	0x3ef7,		0x21
	.dw 0x3ef8,	0x3f03,		0x2e
	.dw 0x3f04,	0x3f07,		0x21
	.dw 0x3f08,	0x3f0b,		0x2e
	.dw 0x3f0c,	0x3f0f,		0x21
	.dw 0x3f10,	0x3f13,		0x2e
	.dw 0x3f14,	0x3f17,		0x21
	.dw 0x3f18,	0x3f1b,		0x2e
	.dw 0x3f1c,	0x3f1f,		0x21
	.dw 0x3f20,	0x3f23,		0x2e
	.dw 0x3f24,	0x3f27,		0x21
	.dw 0x3f28,	0x3f2b,		0x2e
	.dw 0x3f2c,	0x3f2f,		0x21
	.dw 0x3f30,	0x3f33,		0x2e
	.dw 0x3f34,	0x3f37,		0x21
	.dw 0x3f38,	0x3f3b,		0x2e
	.dw 0x3f3c,	0x3f3d,		0x21
	.dw 0x3f3e,	0x3f3f,		0x2e
	.dw 0x3f40,	0x3fb7,		0x21
	.dw 0x3fb8,	0x3fc0,		0x2e
	.dw 0x3fc1,	0x3fc6,		0x21
	.dw 0x3fc7,	0x3fc8,		0x2e
	.dw 0x3fc9,	0x3fce,		0x21
	.dw 0x3fcf,	0x3fd0,		0x2e
	.dw 0x3fd1,	0x3fd6,		0x21
	.dw 0x3fd7,	0x3fd8,		0x2e
	.dw 0x3fd9,	0x3fde,		0x21
	.dw 0x3fdf,	0x3fe0,		0x2e
	.dw 0x3fe1,	0x3fe6,		0x21
	.dw 0x3fe7,	0x3fe8,		0x2e
	.dw 0x3fe9,	0x3fee,		0x21
	.dw 0x3fef,	0x3ff0,		0x2e
	.dw 0x3ff1,	0x3ff6,		0x21
	.dw 0x3ff7,	0x3fff,		0x2e
	.dw 0x4180,	0x41FF,		0x21
	.dw 0x4480,	0x44bF,		0x21
	.dw 0x4600,	0x47FF,		0x21
	.dw 0x7000,	0x7FFF,		0x21
	.dw 0x9040,	0x9040,		0x22
	.dw 0x9049,	0x9049,		0x22
	.dw 0x9052,	0x9052,		0x22
	.dw 0x905b,	0x905b,		0x22
	.dw 0x9064,	0x9064,		0x22
	.dw 0x906d,	0x906d,		0x22
	.dw 0x9076,	0x9076,		0x22
	.dw 0x907f,	0x907f,		0x22
	.dw 0x90c0,	0x90c0,		0x22
	.dw 0x90c9,	0x90c9,		0x22
	.dw 0x90d2,	0x90d2,		0x22
	.dw 0x90db,	0x90db,		0x22
	.dw 0x90e4,	0x90e4,		0x22
	.dw 0x90ed,	0x90ed,		0x22
	.dw 0x90f6,	0x90f6,		0x22
	.dw 0x90ff,	0x90ff,		0x22
	.dw 0x9180,	0x91ff,		0x21
	.dw 0x9380,	0x93ff,		0x21
	.dw 0x9580,	0x95ff,		0x21
	.dw 0x9640,	0x967f,		0x21
	.dw 0x96c0,	0x96ff,		0x21
	.dw 0x9740,	0x97ff,		0x21
	.dw 0x9980,	0x99ff,		0x21
	.dw 0x9a40,	0x9a7f,		0x21
	.dw 0x9ac0,	0x9aff,		0x21
	.dw 0x9b40,	0x9bff,		0x21
	.dw 0x9c60,	0x9c7f,		0x21
	.dw 0x9ce0,	0x9cff,		0x21
	.dw 0x9d60,	0x9d7f,		0x21
	.dw 0x9ef0,	0x9eff,		0x21
	.dw 0x9f70,	0x9f7f,		0x21
	.dw 0x0000,	0x0000,		0x00
.endm

	se_all_test
