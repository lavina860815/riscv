#objdump: -dr --prefix-addresses --show-raw-insn
#name: MIPS DSP ASE for MIPS32
#as: -mdsp -32
#source: mips32-dsp.s

# Check MIPS DSP ASE for MIPS32 Instruction Assembly

.*: +file format .*mips.*

Disassembly of section .text:
0+0000 <[^>]*> 7c220290 	addq\.ph	zero,at,v0
0+0004 <[^>]*> 7c430b90 	addq_s\.ph	at,v0,v1
0+0008 <[^>]*> 7c641590 	addq_s\.w	v0,v1,a0
0+000c <[^>]*> 7c851810 	addu\.qb	v1,a0,a1
0+0010 <[^>]*> 7ca62110 	addu_s\.qb	a0,a1,a2
0+0014 <[^>]*> 7cc72ad0 	subq\.ph	a1,a2,a3
0+0018 <[^>]*> 7ce833d0 	subq_s\.ph	a2,a3,t0
0+001c <[^>]*> 7d093dd0 	subq_s\.w	a3,t0,t1
0+0020 <[^>]*> 7d2a4050 	subu\.qb	t0,t1,t2
0+0024 <[^>]*> 7d4b4950 	subu_s\.qb	t1,t2,t3
0+0028 <[^>]*> 7d6c5410 	addsc	t2,t3,t4
0+002c <[^>]*> 7d8d5c50 	addwc	t3,t4,t5
0+0030 <[^>]*> 7dae6490 	modsub	t4,t5,t6
0+0034 <[^>]*> 7dc06d10 	raddu\.w\.qb	t5,t6
0+0038 <[^>]*> 7c0f7252 	absq_s\.ph	t6,t7
0+003c <[^>]*> 7c107c52 	absq_s\.w	t7,s0
0+0040 <[^>]*> 7e328311 	precrq\.qb\.ph	s0,s1,s2
0+0044 <[^>]*> 7e538d11 	precrq\.ph\.w	s1,s2,s3
0+0048 <[^>]*> 7e749551 	precrq_rs\.ph\.w	s2,s3,s4
0+004c <[^>]*> 7e959bd1 	precrqu_s\.qb\.ph	s3,s4,s5
0+0050 <[^>]*> 7c15a312 	preceq\.w\.phl	s4,s5
0+0054 <[^>]*> 7c16ab52 	preceq\.w\.phr	s5,s6
0+0058 <[^>]*> 7c17b112 	precequ\.ph\.qbl	s6,s7
0+005c <[^>]*> 7c18b952 	precequ\.ph\.qbr	s7,t8
0+0060 <[^>]*> 7c19c192 	precequ\.ph\.qbla	t8,t9
0+0064 <[^>]*> 7c1ac9d2 	precequ\.ph\.qbra	t9,k0
0+0068 <[^>]*> 7c1bd712 	preceu\.ph\.qbl	k0,k1
0+006c <[^>]*> 7c1cdf52 	preceu\.ph\.qbr	k1,gp
0+0070 <[^>]*> 7c1de792 	preceu\.ph\.qbla	gp,sp
0+0074 <[^>]*> 7c1eefd2 	preceu\.ph\.qbra	sp,s8
0+0078 <[^>]*> 7c1ff013 	shll\.qb	s8,ra,0x0
0+007c <[^>]*> 7cfff013 	shll\.qb	s8,ra,0x7
0+0080 <[^>]*> 7c20f893 	shllv\.qb	ra,zero,at
0+0084 <[^>]*> 7c010213 	shll\.ph	zero,at,0x0
0+0088 <[^>]*> 7de10213 	shll\.ph	zero,at,0xf
0+008c <[^>]*> 7c620a93 	shllv\.ph	at,v0,v1
0+0090 <[^>]*> 7c031313 	shll_s\.ph	v0,v1,0x0
0+0094 <[^>]*> 7de31313 	shll_s\.ph	v0,v1,0xf
0+0098 <[^>]*> 7ca41b93 	shllv_s\.ph	v1,a0,a1
0+009c <[^>]*> 7c052513 	shll_s\.w	a0,a1,0x0
0+00a0 <[^>]*> 7fe52513 	shll_s\.w	a0,a1,0x1f
0+00a4 <[^>]*> 7ce62d93 	shllv_s\.w	a1,a2,a3
0+00a8 <[^>]*> 7c073053 	shrl\.qb	a2,a3,0x0
0+00ac <[^>]*> 7ce73053 	shrl\.qb	a2,a3,0x7
0+00b0 <[^>]*> 7d2838d3 	shrlv\.qb	a3,t0,t1
0+00b4 <[^>]*> 7c094253 	shra\.ph	t0,t1,0x0
0+00b8 <[^>]*> 7de94253 	shra\.ph	t0,t1,0xf
0+00bc <[^>]*> 7d6a4ad3 	shrav\.ph	t1,t2,t3
0+00c0 <[^>]*> 7c0b5353 	shra_r\.ph	t2,t3,0x0
0+00c4 <[^>]*> 7deb5353 	shra_r\.ph	t2,t3,0xf
0+00c8 <[^>]*> 7dac5bd3 	shrav_r\.ph	t3,t4,t5
0+00cc <[^>]*> 7c0d6553 	shra_r\.w	t4,t5,0x0
0+00d0 <[^>]*> 7fed6553 	shra_r\.w	t4,t5,0x1f
0+00d4 <[^>]*> 7dee6dd3 	shrav_r\.w	t5,t6,t7
0+00d8 <[^>]*> 7df07190 	muleu_s\.ph\.qbl	t6,t7,s0
0+00dc <[^>]*> 7e1179d0 	muleu_s\.ph\.qbr	t7,s0,s1
0+00e0 <[^>]*> 7e3287d0 	mulq_rs\.ph	s0,s1,s2
0+00e4 <[^>]*> 7e538f10 	muleq_s\.w\.phl	s1,s2,s3
0+00e8 <[^>]*> 7e749750 	muleq_s\.w\.phr	s2,s3,s4
0+00ec <[^>]*> 7e7400f0 	dpau\.h\.qbl	\$ac0,s3,s4
0+00f0 <[^>]*> 7e9509f0 	dpau\.h\.qbr	\$ac1,s4,s5
0+00f4 <[^>]*> 7eb612f0 	dpsu\.h\.qbl	\$ac2,s5,s6
0+00f8 <[^>]*> 7ed71bf0 	dpsu\.h\.qbr	\$ac3,s6,s7
0+00fc <[^>]*> 7ef80130 	dpaq_s\.w\.ph	\$ac0,s7,t8
0+0100 <[^>]*> 7f190970 	dpsq_s\.w\.ph	\$ac1,t8,t9
0+0104 <[^>]*> 7f3a11b0 	mulsaq_s\.w\.ph	\$ac2,t9,k0
0+0108 <[^>]*> 7f5b1b30 	dpaq_sa\.l\.w	\$ac3,k0,k1
0+010c <[^>]*> 7f7c0370 	dpsq_sa\.l\.w	\$ac0,k1,gp
0+0110 <[^>]*> 7f9d0d30 	maq_s\.w\.phl	\$ac1,gp,sp
0+0114 <[^>]*> 7fbe15b0 	maq_s\.w\.phr	\$ac2,sp,s8
0+0118 <[^>]*> 7fdf1c30 	maq_sa\.w\.phl	\$ac3,s8,ra
0+011c <[^>]*> 7fe004b0 	maq_sa\.w\.phr	\$ac0,ra,zero
0+0120 <[^>]*> 7c0106d2 	bitrev	zero,at
0+0124 <[^>]*> 7c41000c 	insv	at,v0
0+0128 <[^>]*> 7c001092 	repl\.qb	v0,0x0
0+012c <[^>]*> 7cff1092 	repl\.qb	v0,0xff
0+0130 <[^>]*> 7c0418d2 	replv\.qb	v1,a0
0+0134 <[^>]*> 7e002292 	repl\.ph	a0,-512
0+0138 <[^>]*> 7dff2292 	repl\.ph	a0,511
0+013c <[^>]*> 7c062ad2 	replv\.ph	a1,a2
0+0140 <[^>]*> 7cc70011 	cmpu\.eq\.qb	a2,a3
0+0144 <[^>]*> 7ce80051 	cmpu\.lt\.qb	a3,t0
0+0148 <[^>]*> 7d090091 	cmpu\.le\.qb	t0,t1
0+014c <[^>]*> 7d4b4911 	cmpgu\.eq\.qb	t1,t2,t3
0+0150 <[^>]*> 7d6c5151 	cmpgu\.lt\.qb	t2,t3,t4
0+0154 <[^>]*> 7d8d5991 	cmpgu\.le\.qb	t3,t4,t5
0+0158 <[^>]*> 7d8d0211 	cmp\.eq\.ph	t4,t5
0+015c <[^>]*> 7dae0251 	cmp\.lt\.ph	t5,t6
0+0160 <[^>]*> 7dcf0291 	cmp\.le\.ph	t6,t7
0+0164 <[^>]*> 7e1178d1 	pick\.qb	t7,s0,s1
0+0168 <[^>]*> 7e3282d1 	pick\.ph	s0,s1,s2
0+016c <[^>]*> 7e538b91 	packrl\.ph	s1,s2,s3
0+0170 <[^>]*> 7c120838 	extr\.w	s2,\$ac1,0x0
0+0174 <[^>]*> 7ff20838 	extr\.w	s2,\$ac1,0x1f
0+0178 <[^>]*> 7c131138 	extr_r\.w	s3,\$ac2,0x0
0+017c <[^>]*> 7ff31138 	extr_r\.w	s3,\$ac2,0x1f
0+0180 <[^>]*> 7c1419b8 	extr_rs\.w	s4,\$ac3,0x0
0+0184 <[^>]*> 7ff419b8 	extr_rs\.w	s4,\$ac3,0x1f
0+0188 <[^>]*> 7c1503b8 	extr_s\.h	s5,\$ac0,0x0
0+018c <[^>]*> 7ff503b8 	extr_s\.h	s5,\$ac0,0x1f
0+0190 <[^>]*> 7ef60bf8 	extrv_s\.h	s6,\$ac1,s7
0+0194 <[^>]*> 7f171078 	extrv\.w	s7,\$ac2,t8
0+0198 <[^>]*> 7f381978 	extrv_r\.w	t8,\$ac3,t9
0+019c <[^>]*> 7f5901f8 	extrv_rs\.w	t9,\$ac0,k0
0+01a0 <[^>]*> 7c1a08b8 	extp	k0,\$ac1,0x0
0+01a4 <[^>]*> 7ffa08b8 	extp	k0,\$ac1,0x1f
0+01a8 <[^>]*> 7f9b10f8 	extpv	k1,\$ac2,gp
0+01ac <[^>]*> 7c1c1ab8 	extpdp	gp,\$ac3,0x0
0+01b0 <[^>]*> 7ffc1ab8 	extpdp	gp,\$ac3,0x1f
0+01b4 <[^>]*> 7fdd02f8 	extpdpv	sp,\$ac0,s8
0+01b8 <[^>]*> 7e000eb8 	shilo	\$ac1,-32
0+01bc <[^>]*> 7df00eb8 	shilo	\$ac1,31
0+01c0 <[^>]*> 7fc016f8 	shilov	\$ac2,s8
0+01c4 <[^>]*> 7fe01ff8 	mthlip	ra,\$ac3
0+01c8 <[^>]*> 00000010 	mfhi	zero,\$ac0
0+01cc <[^>]*> 00200812 	mflo	at,\$ac1
0+01d0 <[^>]*> 00401011 	mthi	v0,\$ac2
0+01d4 <[^>]*> 00601813 	mtlo	v1,\$ac3
0+01d8 <[^>]*> 7c8004f8 	wrdsp	a0,0x0
0+01dc <[^>]*> 7c81fcf8 	wrdsp	a0,0x3f
0+01e0 <[^>]*> 7cbffcf8 	wrdsp	a1
0+01e4 <[^>]*> 7c0034b8 	rddsp	a2,0x0
0+01e8 <[^>]*> 7c3f34b8 	rddsp	a2,0x3f
0+01ec <[^>]*> 7fff3cb8 	rddsp	a3
0+01f0 <[^>]*> 7d49418a 	lbux	t0,t1\(t2\)
0+01f4 <[^>]*> 7d6a490a 	lhx	t1,t2\(t3\)
0+01f8 <[^>]*> 7d8b500a 	lwx	t2,t3\(t4\)
0+01fc <[^>]*> 041cffff 	bposge32	000001fc <[^>]*>
			1fc: R_MIPS_PC16	text_label
0+0200 <[^>]*> 00000000 	nop
0+0204 <[^>]*> 716c1000 	madd	\$ac2,t3,t4
0+0208 <[^>]*> 718d1801 	maddu	\$ac3,t4,t5
0+020c <[^>]*> 71ae0004 	msub	\$ac0,t5,t6
0+0210 <[^>]*> 71cf0805 	msubu	\$ac1,t6,t7
0+0214 <[^>]*> 02b61818 	mult	\$ac3,s5,s6
0+0218 <[^>]*> 02d70019 	multu	\$ac0,s6,s7
	\.\.\.
