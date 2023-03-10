#PROG: objcopy
#objdump: -d --prefix-addresses --show-raw-insn
#name: MIPS16e2 extensible and non-extensible instruction disassembly
#as: -mips64r2 -mmips16e2
#source: mips16-extend-insn.s

# Verify interpreted and separate respectively EXTEND prefix disassembly
# for extensible and non-extensible instructions.

.*: +file format .*mips.*

Disassembly of section \.text:
[0-9a-f]+ <[^>]*> f123 0000 	addiu	s0,sp,6432
[0-9a-f]+ <[^>]*> f123 0020 	addiu	s0,gp,6432
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 0040      	addiu	s0,sp,256
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 0060      	addiu	s0,sp,384
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 0080      	addiu	s0,sp,512
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 00a0      	addiu	s0,sp,640
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 00c0      	addiu	s0,sp,768
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 00e0      	addiu	s0,sp,896
[0-9a-f]+ <[^>]*> f123 0800 	la	s0,00001940 <foo\+0x1940>
[0-9a-f]+ <[^>]*> f123 0820 	la	s0,00001944 <foo\+0x1944>
[0-9a-f]+ <[^>]*> f123 0840 	la	s0,00001948 <foo\+0x1948>
[0-9a-f]+ <[^>]*> f123 0860 	la	s0,0000194c <foo\+0x194c>
[0-9a-f]+ <[^>]*> f123 0880 	la	s0,00001950 <foo\+0x1950>
[0-9a-f]+ <[^>]*> f123 08a0 	la	s0,00001954 <foo\+0x1954>
[0-9a-f]+ <[^>]*> f123 08c0 	la	s0,00001958 <foo\+0x1958>
[0-9a-f]+ <[^>]*> f123 08e0 	la	s0,0000195c <foo\+0x195c>
[0-9a-f]+ <[^>]*> f123 1000 	b	00003284 <foo\+0x3284>
[0-9a-f]+ <[^>]*> f123 1020 	b	00003288 <foo\+0x3288>
[0-9a-f]+ <[^>]*> f123 1040 	b	0000328c <foo\+0x328c>
[0-9a-f]+ <[^>]*> f123 1060 	b	00003290 <foo\+0x3290>
[0-9a-f]+ <[^>]*> f123 1080 	b	00003294 <foo\+0x3294>
[0-9a-f]+ <[^>]*> f123 10a0 	b	00003298 <foo\+0x3298>
[0-9a-f]+ <[^>]*> f123 10c0 	b	0000329c <foo\+0x329c>
[0-9a-f]+ <[^>]*> f123 10e0 	b	000032a0 <foo\+0x32a0>
[0-9a-f]+ <[^>]*> f123 2000 	beqz	s0,000032a4 <foo\+0x32a4>
[0-9a-f]+ <[^>]*> f123 2020 	beqz	s0,000032a8 <foo\+0x32a8>
[0-9a-f]+ <[^>]*> f123 2040 	beqz	s0,000032ac <foo\+0x32ac>
[0-9a-f]+ <[^>]*> f123 2060 	beqz	s0,000032b0 <foo\+0x32b0>
[0-9a-f]+ <[^>]*> f123 2080 	beqz	s0,000032b4 <foo\+0x32b4>
[0-9a-f]+ <[^>]*> f123 20a0 	beqz	s0,000032b8 <foo\+0x32b8>
[0-9a-f]+ <[^>]*> f123 20c0 	beqz	s0,000032bc <foo\+0x32bc>
[0-9a-f]+ <[^>]*> f123 20e0 	beqz	s0,000032c0 <foo\+0x32c0>
[0-9a-f]+ <[^>]*> f123 2800 	bnez	s0,000032c4 <foo\+0x32c4>
[0-9a-f]+ <[^>]*> f123 2820 	bnez	s0,000032c8 <foo\+0x32c8>
[0-9a-f]+ <[^>]*> f123 2840 	bnez	s0,000032cc <foo\+0x32cc>
[0-9a-f]+ <[^>]*> f123 2860 	bnez	s0,000032d0 <foo\+0x32d0>
[0-9a-f]+ <[^>]*> f123 2880 	bnez	s0,000032d4 <foo\+0x32d4>
[0-9a-f]+ <[^>]*> f123 28a0 	bnez	s0,000032d8 <foo\+0x32d8>
[0-9a-f]+ <[^>]*> f123 28c0 	bnez	s0,000032dc <foo\+0x32dc>
[0-9a-f]+ <[^>]*> f123 28e0 	bnez	s0,000032e0 <foo\+0x32e0>
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 3000      	sll	s0,8
[0-9a-f]+ <[^>]*> f123 3004 	ins	s0,s0,0x4,0x0
[0-9a-f]+ <[^>]*> f123 3008 	ext	s0,s0,0x4,0x4
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 300c      	sll	s0,3
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 3010      	sll	s0,4
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 3014      	sll	s0,5
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 3018      	sll	s0,6
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 301c      	sll	s0,7
[0-9a-f]+ <[^>]*> f123 3001 	dsll	s0,36
[0-9a-f]+ <[^>]*> f123 3005 	dsll	s0,36
[0-9a-f]+ <[^>]*> f123 3009 	dsll	s0,36
[0-9a-f]+ <[^>]*> f123 300d 	dsll	s0,36
[0-9a-f]+ <[^>]*> f123 3011 	dsll	s0,36
[0-9a-f]+ <[^>]*> f123 3015 	dsll	s0,36
[0-9a-f]+ <[^>]*> f123 3019 	dsll	s0,36
[0-9a-f]+ <[^>]*> f123 301d 	dsll	s0,36
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 3002      	srl	s0,8
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 3006      	srl	s0,1
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 300a      	srl	s0,2
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 300e      	srl	s0,3
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 3012      	srl	s0,4
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 3016      	srl	s0,5
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 301a      	srl	s0,6
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 301e      	srl	s0,7
[0-9a-f]+ <[^>]*> f123 3003 	sra	s0,4
[0-9a-f]+ <[^>]*> f123 3007 	sra	s0,4
[0-9a-f]+ <[^>]*> f123 300b 	sra	s0,4
[0-9a-f]+ <[^>]*> f123 300f 	sra	s0,4
[0-9a-f]+ <[^>]*> f123 3013 	sra	s0,4
[0-9a-f]+ <[^>]*> f123 3017 	sra	s0,4
[0-9a-f]+ <[^>]*> f123 301b 	sra	s0,4
[0-9a-f]+ <[^>]*> f123 301f 	sra	s0,4
[0-9a-f]+ <[^>]*> f123 3800 	ld	s0,6432\(s0\)
[0-9a-f]+ <[^>]*> f123 4000 	addiu	s0,s0,6432
[0-9a-f]+ <[^>]*> f123 4010 	daddiu	s0,s0,6432
[0-9a-f]+ <[^>]*> f123 4800 	addiu	s0,6432
[0-9a-f]+ <[^>]*> f123 4820 	addiu	s0,6432
[0-9a-f]+ <[^>]*> f123 4840 	addiu	s0,6432
[0-9a-f]+ <[^>]*> f123 4860 	addiu	s0,6432
[0-9a-f]+ <[^>]*> f123 4880 	addiu	s0,6432
[0-9a-f]+ <[^>]*> f123 48a0 	addiu	s0,6432
[0-9a-f]+ <[^>]*> f123 48c0 	addiu	s0,6432
[0-9a-f]+ <[^>]*> f123 48e0 	addiu	s0,6432
[0-9a-f]+ <[^>]*> f123 5000 	slti	s0,6432
[0-9a-f]+ <[^>]*> f123 5020 	slti	s0,6432
[0-9a-f]+ <[^>]*> f123 5040 	slti	s0,6432
[0-9a-f]+ <[^>]*> f123 5060 	slti	s0,6432
[0-9a-f]+ <[^>]*> f123 5080 	slti	s0,6432
[0-9a-f]+ <[^>]*> f123 50a0 	slti	s0,6432
[0-9a-f]+ <[^>]*> f123 50c0 	slti	s0,6432
[0-9a-f]+ <[^>]*> f123 50e0 	slti	s0,6432
[0-9a-f]+ <[^>]*> f123 5800 	sltiu	s0,6432
[0-9a-f]+ <[^>]*> f123 5820 	sltiu	s0,6432
[0-9a-f]+ <[^>]*> f123 5840 	sltiu	s0,6432
[0-9a-f]+ <[^>]*> f123 5860 	sltiu	s0,6432
[0-9a-f]+ <[^>]*> f123 5880 	sltiu	s0,6432
[0-9a-f]+ <[^>]*> f123 58a0 	sltiu	s0,6432
[0-9a-f]+ <[^>]*> f123 58c0 	sltiu	s0,6432
[0-9a-f]+ <[^>]*> f123 58e0 	sltiu	s0,6432
[0-9a-f]+ <[^>]*> f123 6000 	bteqz	000033d0 <foo\+0x33d0>
[0-9a-f]+ <[^>]*> f123 6020 	bteqz	000033d4 <foo\+0x33d4>
[0-9a-f]+ <[^>]*> f123 6040 	bteqz	000033d8 <foo\+0x33d8>
[0-9a-f]+ <[^>]*> f123 6060 	bteqz	000033dc <foo\+0x33dc>
[0-9a-f]+ <[^>]*> f123 6080 	bteqz	000033e0 <foo\+0x33e0>
[0-9a-f]+ <[^>]*> f123 60a0 	bteqz	000033e4 <foo\+0x33e4>
[0-9a-f]+ <[^>]*> f123 60c0 	bteqz	000033e8 <foo\+0x33e8>
[0-9a-f]+ <[^>]*> f123 60e0 	bteqz	000033ec <foo\+0x33ec>
[0-9a-f]+ <[^>]*> f123 6100 	btnez	000033f0 <foo\+0x33f0>
[0-9a-f]+ <[^>]*> f123 6120 	btnez	000033f4 <foo\+0x33f4>
[0-9a-f]+ <[^>]*> f123 6140 	btnez	000033f8 <foo\+0x33f8>
[0-9a-f]+ <[^>]*> f123 6160 	btnez	000033fc <foo\+0x33fc>
[0-9a-f]+ <[^>]*> f123 6180 	btnez	00003400 <foo\+0x3400>
[0-9a-f]+ <[^>]*> f123 61a0 	btnez	00003404 <foo\+0x3404>
[0-9a-f]+ <[^>]*> f123 61c0 	btnez	00003408 <foo\+0x3408>
[0-9a-f]+ <[^>]*> f123 61e0 	btnez	0000340c <foo\+0x340c>
[0-9a-f]+ <[^>]*> f123 6200 	sw	ra,6432\(sp\)
[0-9a-f]+ <[^>]*> f123 6220 	sw	ra,6432\(sp\)
[0-9a-f]+ <[^>]*> f123 6240 	sw	ra,6432\(sp\)
[0-9a-f]+ <[^>]*> f123 6280 	sw	ra,6432\(sp\)
[0-9a-f]+ <[^>]*> f123 62a0 	sw	ra,6432\(sp\)
[0-9a-f]+ <[^>]*> f123 62c0 	sw	ra,6432\(sp\)
[0-9a-f]+ <[^>]*> f123 62e0 	sw	ra,6432\(sp\)
[0-9a-f]+ <[^>]*> f123 6200 	sw	ra,6432\(sp\)
[0-9a-f]+ <[^>]*> f123 6300 	addiu	sp,6432
[0-9a-f]+ <[^>]*> f123 6320 	addiu	sp,6432
[0-9a-f]+ <[^>]*> f123 6340 	addiu	sp,6432
[0-9a-f]+ <[^>]*> f123 6360 	addiu	sp,6432
[0-9a-f]+ <[^>]*> f123 6380 	addiu	sp,6432
[0-9a-f]+ <[^>]*> f123 63a0 	addiu	sp,6432
[0-9a-f]+ <[^>]*> f123 63c0 	addiu	sp,6432
[0-9a-f]+ <[^>]*> f123 63e0 	addiu	sp,6432
[0-9a-f]+ <[^>]*> f123 6400 	restore	256,s2,a1-a3
[0-9a-f]+ <[^>]*> f123 6480 	save	256,s2,a1-a3
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 6500      	nop
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 6501      	move	zero,s1
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 6700      	move	s0,zero
[0-9a-f]+ <[^>]*> f123 6800 	li	s0,6432
[0-9a-f]+ <[^>]*> f123 6820 	lui	s0,0x1920
[0-9a-f]+ <[^>]*> f123 6840 	ori	s0,0x1920
[0-9a-f]+ <[^>]*> f123 6860 	andi	s0,0x1920
[0-9a-f]+ <[^>]*> f123 6880 	xori	s0,0x1920
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 68a0      	li	s0,160
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 68c0      	li	s0,192
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> 68e0      	li	s0,224
[0-9a-f]+ <[^>]*> f123 7000 	cmpi	s0,6432
[0-9a-f]+ <[^>]*> f123 7020 	cmpi	s0,6432
[0-9a-f]+ <[^>]*> f123 7040 	cmpi	s0,6432
[0-9a-f]+ <[^>]*> f123 7060 	cmpi	s0,6432
[0-9a-f]+ <[^>]*> f123 7080 	cmpi	s0,6432
[0-9a-f]+ <[^>]*> f123 70a0 	cmpi	s0,6432
[0-9a-f]+ <[^>]*> f123 70c0 	cmpi	s0,6432
[0-9a-f]+ <[^>]*> f123 70e0 	cmpi	s0,6432
[0-9a-f]+ <[^>]*> f123 7800 	sd	s0,6432\(s0\)
[0-9a-f]+ <[^>]*> f123 8000 	lb	s0,6432\(s0\)
[0-9a-f]+ <[^>]*> f123 8800 	lh	s0,6432\(s0\)
[0-9a-f]+ <[^>]*> f123 9000 	lw	s0,6432\(sp\)
[0-9a-f]+ <[^>]*> f123 9020 	lw	s0,6432\(gp\)
[0-9a-f]+ <[^>]*> f123 9040 	lh	s0,6432\(gp\)
[0-9a-f]+ <[^>]*> f123 9060 	lb	s0,6432\(gp\)
[0-9a-f]+ <[^>]*> f123 9080 	lhu	s0,6432\(gp\)
[0-9a-f]+ <[^>]*> f123 90a0 	lbu	s0,6432\(gp\)
[0-9a-f]+ <[^>]*> f123 90c0 	ll	s0,-224\(v1\)
[0-9a-f]+ <[^>]*> f123 90e0 	lwl	s0,-224\(v1\)
[0-9a-f]+ <[^>]*> f123 9800 	lw	s0,6432\(s0\)
[0-9a-f]+ <[^>]*> f123 a000 	lbu	s0,6432\(s0\)
[0-9a-f]+ <[^>]*> f123 a800 	lhu	s0,6432\(s0\)
[0-9a-f]+ <[^>]*> f123 b000 	lw	s0,00001bb8 <foo\+0x1bb8>
[0-9a-f]+ <[^>]*> f123 b020 	lw	s0,00001bbc <foo\+0x1bbc>
[0-9a-f]+ <[^>]*> f123 b040 	lw	s0,00001bc0 <foo\+0x1bc0>
[0-9a-f]+ <[^>]*> f123 b060 	lw	s0,00001bc4 <foo\+0x1bc4>
[0-9a-f]+ <[^>]*> f123 b080 	lw	s0,00001bc8 <foo\+0x1bc8>
[0-9a-f]+ <[^>]*> f123 b0a0 	lw	s0,00001bcc <foo\+0x1bcc>
[0-9a-f]+ <[^>]*> f123 b0c0 	lw	s0,00001bd0 <foo\+0x1bd0>
[0-9a-f]+ <[^>]*> f123 b0e0 	lw	s0,00001bd4 <foo\+0x1bd4>
[0-9a-f]+ <[^>]*> f123 b800 	lwu	s0,6432\(s0\)
[0-9a-f]+ <[^>]*> f123 c000 	sb	s0,6432\(s0\)
[0-9a-f]+ <[^>]*> f123 c800 	sh	s0,6432\(s0\)
[0-9a-f]+ <[^>]*> f123 d000 	sw	s0,6432\(sp\)
[0-9a-f]+ <[^>]*> f123 d020 	sw	s0,6432\(gp\)
[0-9a-f]+ <[^>]*> f123 d040 	sh	s0,6432\(gp\)
[0-9a-f]+ <[^>]*> f123 d060 	sb	s0,6432\(gp\)
[0-9a-f]+ <[^>]*> f123 d080 	pref	0x3,-224\(s0\)
[0-9a-f]+ <[^>]*> f123 d0a0 	cache	0x3,-224\(s0\)
[0-9a-f]+ <[^>]*> f123 d0c0 	sc	s0,-224\(v1\)
[0-9a-f]+ <[^>]*> f123 d0e0 	swl	s0,-224\(v1\)
[0-9a-f]+ <[^>]*> f123 d800 	sw	s0,6432\(s0\)
[0-9a-f]+ <[^>]*> f123 e000 	asmacro	0x1,0x0,0x0,0x0,0x3,0x1
[0-9a-f]+ <[^>]*> f123 e001 	asmacro	0x1,0x1,0x0,0x0,0x3,0x1
[0-9a-f]+ <[^>]*> f123 e002 	asmacro	0x1,0x2,0x0,0x0,0x3,0x1
[0-9a-f]+ <[^>]*> f123 e003 	asmacro	0x1,0x3,0x0,0x0,0x3,0x1
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e800      	jr	s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e820      	jr	ra
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e840      	jalr	s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e880      	jrc	s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e8a0      	jrc	ra
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e8c0      	jalrc	s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e801      	sdbbp
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e802      	slt	s0,s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e803      	sltu	s0,s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e804      	sllv	s0,s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e805      	break
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e806      	srlv	s0,s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e807      	srav	s0,s0
[0-9a-f]+ <[^>]*> f123 e808 	dsrl	s0,36
[0-9a-f]+ <[^>]*> f123 e908 	dsrl	s0,36
[0-9a-f]+ <[^>]*> f123 ea08 	dsrl	s0,36
[0-9a-f]+ <[^>]*> f123 eb08 	dsrl	s0,36
[0-9a-f]+ <[^>]*> f123 ec08 	dsrl	s0,36
[0-9a-f]+ <[^>]*> f123 ed08 	dsrl	s0,36
[0-9a-f]+ <[^>]*> f123 ee08 	dsrl	s0,36
[0-9a-f]+ <[^>]*> f123 ef08 	dsrl	s0,36
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e809      	entry
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e829      	entry	ra
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> ed09      	exit	\$f0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> ee09      	exit	\$f0-\$f1
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> ef09      	exit
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e80a      	cmp	s0,s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e80b      	neg	s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e80c      	and	s0,s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e80d      	or	s0,s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e80e      	xor	s0,s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e80f      	not	s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e810      	mfhi	s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e811      	zeb	s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e831      	zeh	s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e851      	zew	s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e891      	seb	s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e8b1      	seh	s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e8d1      	sew	s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e812      	mflo	s0
[0-9a-f]+ <[^>]*> f123 e813 	dsra	s0,36
[0-9a-f]+ <[^>]*> f123 e913 	dsra	s0,36
[0-9a-f]+ <[^>]*> f123 ea13 	dsra	s0,36
[0-9a-f]+ <[^>]*> f123 eb13 	dsra	s0,36
[0-9a-f]+ <[^>]*> f123 ec13 	dsra	s0,36
[0-9a-f]+ <[^>]*> f123 ed13 	dsra	s0,36
[0-9a-f]+ <[^>]*> f123 ee13 	dsra	s0,36
[0-9a-f]+ <[^>]*> f123 ef13 	dsra	s0,36
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e814      	dsllv	s0,s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e816      	dsrlv	s0,s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e817      	dsrav	s0,s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e818      	mult	s0,s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e819      	multu	s0,s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e81a      	div	zero,s0,s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e81b      	divu	zero,s0,s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e81c      	dmult	s0,s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e81d      	dmultu	s0,s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e81e      	ddiv	zero,s0,s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> e81f      	ddivu	zero,s0,s0
[0-9a-f]+ <[^>]*> f123      	extend	0x123
[0-9a-f]+ <[^>]*> f000      	extend	0x0
[0-9a-f]+ <[^>]*> f123 f800 	ld	s0,6432\(sp\)
[0-9a-f]+ <[^>]*> f123 f900 	sd	s0,6432\(sp\)
[0-9a-f]+ <[^>]*> f123 fa00 	sd	ra,6432\(sp\)
[0-9a-f]+ <[^>]*> f123 fa20 	sd	ra,6432\(sp\)
[0-9a-f]+ <[^>]*> f123 fa40 	sd	ra,6432\(sp\)
[0-9a-f]+ <[^>]*> f123 fa60 	sd	ra,6432\(sp\)
[0-9a-f]+ <[^>]*> f123 fa80 	sd	ra,6432\(sp\)
[0-9a-f]+ <[^>]*> f123 faa0 	sd	ra,6432\(sp\)
[0-9a-f]+ <[^>]*> f123 fac0 	sd	ra,6432\(sp\)
[0-9a-f]+ <[^>]*> f123 fae0 	sd	ra,6432\(sp\)
[0-9a-f]+ <[^>]*> f123 fb00 	daddiu	sp,6432
[0-9a-f]+ <[^>]*> f123 fb20 	daddiu	sp,6432
[0-9a-f]+ <[^>]*> f123 fb40 	daddiu	sp,6432
[0-9a-f]+ <[^>]*> f123 fb60 	daddiu	sp,6432
[0-9a-f]+ <[^>]*> f123 fb80 	daddiu	sp,6432
[0-9a-f]+ <[^>]*> f123 fba0 	daddiu	sp,6432
[0-9a-f]+ <[^>]*> f123 fbc0 	daddiu	sp,6432
[0-9a-f]+ <[^>]*> f123 fbe0 	daddiu	sp,6432
[0-9a-f]+ <[^>]*> f123 fc00 	ld	s0,00001d50 <foo\+0x1d50>
[0-9a-f]+ <[^>]*> f123 fd00 	daddiu	s0,6432
[0-9a-f]+ <[^>]*> f123 fe00 	dla	s0,00001d58 <foo\+0x1d58>
[0-9a-f]+ <[^>]*> f123 ff00 	daddiu	s0,sp,6432
	\.\.\.
