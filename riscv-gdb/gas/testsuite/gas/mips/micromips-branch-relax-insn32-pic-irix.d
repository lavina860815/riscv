#objdump: -dr --show-raw-insn
#name: Relax microMIPS branches (insn32 mode, pic)
#as: -mips32r2 -32 -relax-branch -KPIC -minsn32 --defsym insn32=1
#warning_output: micromips-branch-relax-insn32-pic.l
#source: micromips-branch-relax.s

.*: +file format .*mips.*

Disassembly of section \.text:

[0-9a-f]+ <test>:
[ 0-9a-f]+:	9400 fffe 	b	[0-9a-f]+ <.*>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	9403 fffe 	beqz	v1,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	b403 fffe 	bnez	v1,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	9400 fffe 	b	[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	40e0 fffe 	bc	[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	4060 fffe 	bal	[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	9403 fffe 	beqz	v1,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	b403 fffe 	bnez	v1,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	9400 fffe 	b	[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	40e0 fffe 	bc	[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	4060 fffe 	bal	[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	9403 fffe 	beqz	v1,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	b403 fffe 	bnez	v1,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	9400 fffe 	b	[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	40e0 fffe 	bc	[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	4060 fffe 	bal	[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	9403 fffe 	beqz	v1,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	b403 fffe 	bnez	v1,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	ff3c 0001 	lw	t9,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3339 04fb 	addiu	t9,t9,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	03f9 0f3c 	jalr	t9
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	03e1 0f3c 	jalr	at
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	b483 fffe 	bne	v1,a0,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	9483 fffe 	beq	v1,a0,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	4043 fffe 	bgez	v1,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	4003 fffe 	bltz	v1,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	40d4 fffe 	bgtz	s4,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	4094 fffe 	blez	s4,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	40a3 fffe 	bnezc	v1,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at
[ 0-9a-f]+:	0000 0000 	nop

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	40e3 fffe 	beqzc	v1,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at
[ 0-9a-f]+:	0000 0000 	nop

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	401e fffe 	bltz	s8,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	03e1 0f3c 	jalr	at

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	405e fffe 	bgez	s8,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	03e1 0f3c 	jalr	at

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	43a0 fffe 	bc1t	[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	4380 fffe 	bc1f	[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	42a0 fffe 	bc2t	[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	4280 fffe 	bc2f	[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
[ 0-9a-f]+:	b483 fffe 	bne	v1,a0,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	b403 fffe 	bnez	v1,[0-9a-f]+ <.*>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1
[ 0-9a-f]+:	0083 0b50 	slt	at,v1,a0
[ 0-9a-f]+:	b401 fffe 	bnez	at,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1
[ 0-9a-f]+:	0083 0b50 	slt	at,v1,a0
[ 0-9a-f]+:	b401 fffe 	bnez	at,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	0083 0b90 	sltu	at,v1,a0
[ 0-9a-f]+:	b401 fffe 	bnez	at,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1
[ 0-9a-f]+:	0083 0b90 	sltu	at,v1,a0
[ 0-9a-f]+:	b401 fffe 	bnez	at,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	4003 fffe 	bltz	v1,[0-9a-f]+ <.*>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	03e1 0f3c 	jalr	at
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	4003 fffe 	bltz	v1,[0-9a-f]+ <.*>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	0064 0b50 	slt	at,a0,v1
[ 0-9a-f]+:	9401 fffe 	beqz	at,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1
[ 0-9a-f]+:	0064 0b50 	slt	at,a0,v1
[ 0-9a-f]+:	9401 fffe 	beqz	at,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	0064 0b90 	sltu	at,a0,v1
[ 0-9a-f]+:	9401 fffe 	beqz	at,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1
[ 0-9a-f]+:	0064 0b90 	sltu	at,a0,v1
[ 0-9a-f]+:	9401 fffe 	beqz	at,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	4083 fffe 	blez	v1,[0-9a-f]+ <.*>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	0064 0b50 	slt	at,a0,v1
[ 0-9a-f]+:	b401 fffe 	bnez	at,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1
[ 0-9a-f]+:	0064 0b50 	slt	at,a0,v1
[ 0-9a-f]+:	b401 fffe 	bnez	at,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	0064 0b90 	sltu	at,a0,v1
[ 0-9a-f]+:	b401 fffe 	bnez	at,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1
[ 0-9a-f]+:	0064 0b90 	sltu	at,a0,v1
[ 0-9a-f]+:	b401 fffe 	bnez	at,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	40c3 fffe 	bgtz	v1,[0-9a-f]+ <.*>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	0083 0b50 	slt	at,v1,a0
[ 0-9a-f]+:	9401 fffe 	beqz	at,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1
[ 0-9a-f]+:	0083 0b50 	slt	at,v1,a0
[ 0-9a-f]+:	9401 fffe 	beqz	at,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	0083 0b90 	sltu	at,v1,a0
[ 0-9a-f]+:	9401 fffe 	beqz	at,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1
[ 0-9a-f]+:	0083 0b90 	sltu	at,v1,a0
[ 0-9a-f]+:	9401 fffe 	beqz	at,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	4043 fffe 	bgez	v1,[0-9a-f]+ <.*>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	03e1 0f3c 	jalr	at
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	4043 fffe 	bgez	v1,[0-9a-f]+ <.*>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	9483 fffe 	beq	v1,a0,[0-9a-f]+ <.*>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	9403 fffe 	beqz	v1,[0-9a-f]+ <.*>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at

[0-9a-f]+ <.*>:
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1
[ 0-9a-f]+:	9403 fffe 	beqz	v1,[0-9a-f]+ <.*\+0x[0-9a-f]+>
[ 	]*[0-9a-f]+: R_MICROMIPS_PC16_S1	.*
[ 0-9a-f]+:	0000 0000 	nop
[ 0-9a-f]+:	fc3c 0001 	lw	at,1\(gp\)
[ 	]*[0-9a-f]+: R_MICROMIPS_GOT16	\.text
[ 0-9a-f]+:	3021 04fb 	addiu	at,at,1275
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.text
[ 0-9a-f]+:	0001 0f3c 	jr	at
[ 0-9a-f]+:	00a4 1b10 	xor	v1,a0,a1

[0-9a-f]+ <.*>:
	\.\.\.

[0-9a-f]+ <test2>:
	\.\.\.

[0-9a-f]+ <test3>:
[ 0-9a-f]+:	00a4 1950 	addu	v1,a0,a1
	\.\.\.
