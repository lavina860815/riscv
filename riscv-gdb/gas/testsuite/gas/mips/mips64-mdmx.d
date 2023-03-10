#objdump: -dr --prefix-addresses --show-raw-insn -mmips:isa64
#name: MIPS MIPS64 MDMX ASE instructions (-mdmx flag)
#as: -mips64 -mdmx

# Check MIPS64 MDMX ASE instruction assembly and disassembly

.*: +file format .*mips.*

Disassembly of section .text:
0+0000 <[^>]*> 46b46051 	movf\.l	\$f1,\$f12,\$fcc5
0+0004 <[^>]*> 46b26053 	movn\.l	\$f1,\$f12,s2
0+0008 <[^>]*> 46b56051 	movt\.l	\$f1,\$f12,\$fcc5
0+000c <[^>]*> 46b26052 	movz\.l	\$f1,\$f12,s2
0+0010 <[^>]*> 7bd2604b 	add\.ob	\$v1,\$v12,0x12
0+0014 <[^>]*> 7ad2604b 	add\.ob	\$v1,\$v12,\$v18
0+0018 <[^>]*> 7992604b 	add\.ob	\$v1,\$v12,\$v18\[6\]
0+001c <[^>]*> 7bb2604b 	add\.qh	\$v1,\$v12,0x12
0+0020 <[^>]*> 7ab2604b 	add\.qh	\$v1,\$v12,\$v18
0+0024 <[^>]*> 7932604b 	add\.qh	\$v1,\$v12,\$v18\[2\]
0+0028 <[^>]*> 7bd26037 	adda\.ob	\$v12,0x12
0+002c <[^>]*> 7ad26037 	adda\.ob	\$v12,\$v18
0+0030 <[^>]*> 79926037 	adda\.ob	\$v12,\$v18\[6\]
0+0034 <[^>]*> 7bb26037 	adda\.qh	\$v12,0x12
0+0038 <[^>]*> 7ab26037 	adda\.qh	\$v12,\$v18
0+003c <[^>]*> 79326037 	adda\.qh	\$v12,\$v18\[2\]
0+0040 <[^>]*> 7bd26437 	addl\.ob	\$v12,0x12
0+0044 <[^>]*> 7ad26437 	addl\.ob	\$v12,\$v18
0+0048 <[^>]*> 79926437 	addl\.ob	\$v12,\$v18\[6\]
0+004c <[^>]*> 7bb26437 	addl\.qh	\$v12,0x12
0+0050 <[^>]*> 7ab26437 	addl\.qh	\$v12,\$v18
0+0054 <[^>]*> 79326437 	addl\.qh	\$v12,\$v18\[2\]
0+0058 <[^>]*> 78d26058 	alni\.ob	\$v1,\$v12,\$v18,6
0+005c <[^>]*> 7852605a 	alni\.qh	\$v1,\$v12,\$v18,2
0+0060 <[^>]*> 7ab26059 	alnv\.ob	\$v1,\$v12,\$v18,s5
0+0064 <[^>]*> 7ab2605b 	alnv\.qh	\$v1,\$v12,\$v18,s5
0+0068 <[^>]*> 7bd2604c 	and\.ob	\$v1,\$v12,0x12
0+006c <[^>]*> 7ad2604c 	and\.ob	\$v1,\$v12,\$v18
0+0070 <[^>]*> 7992604c 	and\.ob	\$v1,\$v12,\$v18\[6\]
0+0074 <[^>]*> 7bb2604c 	and\.qh	\$v1,\$v12,0x12
0+0078 <[^>]*> 7ab2604c 	and\.qh	\$v1,\$v12,\$v18
0+007c <[^>]*> 7932604c 	and\.qh	\$v1,\$v12,\$v18\[2\]
0+0080 <[^>]*> 7bd26001 	c\.eq\.ob	\$v12,0x12
0+0084 <[^>]*> 7ad26001 	c\.eq\.ob	\$v12,\$v18
0+0088 <[^>]*> 79926001 	c\.eq\.ob	\$v12,\$v18\[6\]
0+008c <[^>]*> 7bb26001 	c\.eq\.qh	\$v12,0x12
0+0090 <[^>]*> 7ab26001 	c\.eq\.qh	\$v12,\$v18
0+0094 <[^>]*> 79326001 	c\.eq\.qh	\$v12,\$v18\[2\]
0+0098 <[^>]*> 7bd26005 	c\.le\.ob	\$v12,0x12
0+009c <[^>]*> 7ad26005 	c\.le\.ob	\$v12,\$v18
0+00a0 <[^>]*> 79926005 	c\.le\.ob	\$v12,\$v18\[6\]
0+00a4 <[^>]*> 7bb26005 	c\.le\.qh	\$v12,0x12
0+00a8 <[^>]*> 7ab26005 	c\.le\.qh	\$v12,\$v18
0+00ac <[^>]*> 79326005 	c\.le\.qh	\$v12,\$v18\[2\]
0+00b0 <[^>]*> 7bd26004 	c\.lt\.ob	\$v12,0x12
0+00b4 <[^>]*> 7ad26004 	c\.lt\.ob	\$v12,\$v18
0+00b8 <[^>]*> 79926004 	c\.lt\.ob	\$v12,\$v18\[6\]
0+00bc <[^>]*> 7bb26004 	c\.lt\.qh	\$v12,0x12
0+00c0 <[^>]*> 7ab26004 	c\.lt\.qh	\$v12,\$v18
0+00c4 <[^>]*> 79326004 	c\.lt\.qh	\$v12,\$v18\[2\]
0+00c8 <[^>]*> 7bd26047 	max\.ob	\$v1,\$v12,0x12
0+00cc <[^>]*> 7ad26047 	max\.ob	\$v1,\$v12,\$v18
0+00d0 <[^>]*> 79926047 	max\.ob	\$v1,\$v12,\$v18\[6\]
0+00d4 <[^>]*> 7bb26047 	max\.qh	\$v1,\$v12,0x12
0+00d8 <[^>]*> 7ab26047 	max\.qh	\$v1,\$v12,\$v18
0+00dc <[^>]*> 79326047 	max\.qh	\$v1,\$v12,\$v18\[2\]
0+00e0 <[^>]*> 7bd26046 	min\.ob	\$v1,\$v12,0x12
0+00e4 <[^>]*> 7ad26046 	min\.ob	\$v1,\$v12,\$v18
0+00e8 <[^>]*> 79926046 	min\.ob	\$v1,\$v12,\$v18\[6\]
0+00ec <[^>]*> 7bb26046 	min\.qh	\$v1,\$v12,0x12
0+00f0 <[^>]*> 7ab26046 	min\.qh	\$v1,\$v12,\$v18
0+00f4 <[^>]*> 79326046 	min\.qh	\$v1,\$v12,\$v18\[2\]
0+00f8 <[^>]*> 7bb26040 	msgn\.qh	\$v1,\$v12,0x12
0+00fc <[^>]*> 7ab26040 	msgn\.qh	\$v1,\$v12,\$v18
0+0100 <[^>]*> 79326040 	msgn\.qh	\$v1,\$v12,\$v18\[2\]
0+0104 <[^>]*> 7bd26070 	mul\.ob	\$v1,\$v12,0x12
0+0108 <[^>]*> 7ad26070 	mul\.ob	\$v1,\$v12,\$v18
0+010c <[^>]*> 79926070 	mul\.ob	\$v1,\$v12,\$v18\[6\]
0+0110 <[^>]*> 7bb26070 	mul\.qh	\$v1,\$v12,0x12
0+0114 <[^>]*> 7ab26070 	mul\.qh	\$v1,\$v12,\$v18
0+0118 <[^>]*> 79326070 	mul\.qh	\$v1,\$v12,\$v18\[2\]
0+011c <[^>]*> 7bd26033 	mula\.ob	\$v12,0x12
0+0120 <[^>]*> 7ad26033 	mula\.ob	\$v12,\$v18
0+0124 <[^>]*> 79926033 	mula\.ob	\$v12,\$v18\[6\]
0+0128 <[^>]*> 7bb26033 	mula\.qh	\$v12,0x12
0+012c <[^>]*> 7ab26033 	mula\.qh	\$v12,\$v18
0+0130 <[^>]*> 79326033 	mula\.qh	\$v12,\$v18\[2\]
0+0134 <[^>]*> 7bd26433 	mull\.ob	\$v12,0x12
0+0138 <[^>]*> 7ad26433 	mull\.ob	\$v12,\$v18
0+013c <[^>]*> 79926433 	mull\.ob	\$v12,\$v18\[6\]
0+0140 <[^>]*> 7bb26433 	mull\.qh	\$v12,0x12
0+0144 <[^>]*> 7ab26433 	mull\.qh	\$v12,\$v18
0+0148 <[^>]*> 79326433 	mull\.qh	\$v12,\$v18\[2\]
0+014c <[^>]*> 7bd26032 	muls\.ob	\$v12,0x12
0+0150 <[^>]*> 7ad26032 	muls\.ob	\$v12,\$v18
0+0154 <[^>]*> 79926032 	muls\.ob	\$v12,\$v18\[6\]
0+0158 <[^>]*> 7bb26032 	muls\.qh	\$v12,0x12
0+015c <[^>]*> 7ab26032 	muls\.qh	\$v12,\$v18
0+0160 <[^>]*> 79326032 	muls\.qh	\$v12,\$v18\[2\]
0+0164 <[^>]*> 7bd26432 	mulsl\.ob	\$v12,0x12
0+0168 <[^>]*> 7ad26432 	mulsl\.ob	\$v12,\$v18
0+016c <[^>]*> 79926432 	mulsl\.ob	\$v12,\$v18\[6\]
0+0170 <[^>]*> 7bb26432 	mulsl\.qh	\$v12,0x12
0+0174 <[^>]*> 7ab26432 	mulsl\.qh	\$v12,\$v18
0+0178 <[^>]*> 79326432 	mulsl\.qh	\$v12,\$v18\[2\]
0+017c <[^>]*> 7bd2604f 	nor\.ob	\$v1,\$v12,0x12
0+0180 <[^>]*> 7ad2604f 	nor\.ob	\$v1,\$v12,\$v18
0+0184 <[^>]*> 7992604f 	nor\.ob	\$v1,\$v12,\$v18\[6\]
0+0188 <[^>]*> 7bb2604f 	nor\.qh	\$v1,\$v12,0x12
0+018c <[^>]*> 7ab2604f 	nor\.qh	\$v1,\$v12,\$v18
0+0190 <[^>]*> 7932604f 	nor\.qh	\$v1,\$v12,\$v18\[2\]
0+0194 <[^>]*> 7bd2604e 	or\.ob	\$v1,\$v12,0x12
0+0198 <[^>]*> 7ad2604e 	or\.ob	\$v1,\$v12,\$v18
0+019c <[^>]*> 7992604e 	or\.ob	\$v1,\$v12,\$v18\[6\]
0+01a0 <[^>]*> 7bb2604e 	or\.qh	\$v1,\$v12,0x12
0+01a4 <[^>]*> 7ab2604e 	or\.qh	\$v1,\$v12,\$v18
0+01a8 <[^>]*> 7932604e 	or\.qh	\$v1,\$v12,\$v18\[2\]
0+01ac <[^>]*> 7bd26042 	pickf\.ob	\$v1,\$v12,0x12
0+01b0 <[^>]*> 7ad26042 	pickf\.ob	\$v1,\$v12,\$v18
0+01b4 <[^>]*> 79926042 	pickf\.ob	\$v1,\$v12,\$v18\[6\]
0+01b8 <[^>]*> 7bb26042 	pickf\.qh	\$v1,\$v12,0x12
0+01bc <[^>]*> 7ab26042 	pickf\.qh	\$v1,\$v12,\$v18
0+01c0 <[^>]*> 79326042 	pickf\.qh	\$v1,\$v12,\$v18\[2\]
0+01c4 <[^>]*> 7bd26043 	pickt\.ob	\$v1,\$v12,0x12
0+01c8 <[^>]*> 7ad26043 	pickt\.ob	\$v1,\$v12,\$v18
0+01cc <[^>]*> 79926043 	pickt\.ob	\$v1,\$v12,\$v18\[6\]
0+01d0 <[^>]*> 7bb26043 	pickt\.qh	\$v1,\$v12,0x12
0+01d4 <[^>]*> 7ab26043 	pickt\.qh	\$v1,\$v12,\$v18
0+01d8 <[^>]*> 79326043 	pickt\.qh	\$v1,\$v12,\$v18\[2\]
0+01dc <[^>]*> 7a00007f 	rach\.ob	\$v1
0+01e0 <[^>]*> 7a20007f 	rach\.qh	\$v1
0+01e4 <[^>]*> 7800007f 	racl\.ob	\$v1
0+01e8 <[^>]*> 7820007f 	racl\.qh	\$v1
0+01ec <[^>]*> 7900007f 	racm\.ob	\$v1
0+01f0 <[^>]*> 7920007f 	racm\.qh	\$v1
0+01f4 <[^>]*> 7bb20065 	rnas\.qh	\$v1,0x12
0+01f8 <[^>]*> 7ab20065 	rnas\.qh	\$v1,\$v18
0+01fc <[^>]*> 79320065 	rnas\.qh	\$v1,\$v18\[2\]
0+0200 <[^>]*> 7bd20061 	rnau\.ob	\$v1,0x12
0+0204 <[^>]*> 7ad20061 	rnau\.ob	\$v1,\$v18
0+0208 <[^>]*> 79920061 	rnau\.ob	\$v1,\$v18\[6\]
0+020c <[^>]*> 7bb20061 	rnau\.qh	\$v1,0x12
0+0210 <[^>]*> 7ab20061 	rnau\.qh	\$v1,\$v18
0+0214 <[^>]*> 79320061 	rnau\.qh	\$v1,\$v18\[2\]
0+0218 <[^>]*> 7bb20066 	rnes\.qh	\$v1,0x12
0+021c <[^>]*> 7ab20066 	rnes\.qh	\$v1,\$v18
0+0220 <[^>]*> 79320066 	rnes\.qh	\$v1,\$v18\[2\]
0+0224 <[^>]*> 7bd20062 	rneu\.ob	\$v1,0x12
0+0228 <[^>]*> 7ad20062 	rneu\.ob	\$v1,\$v18
0+022c <[^>]*> 79920062 	rneu\.ob	\$v1,\$v18\[6\]
0+0230 <[^>]*> 7bb20062 	rneu\.qh	\$v1,0x12
0+0234 <[^>]*> 7ab20062 	rneu\.qh	\$v1,\$v18
0+0238 <[^>]*> 79320062 	rneu\.qh	\$v1,\$v18\[2\]
0+023c <[^>]*> 7bb20064 	rzs\.qh	\$v1,0x12
0+0240 <[^>]*> 7ab20064 	rzs\.qh	\$v1,\$v18
0+0244 <[^>]*> 79320064 	rzs\.qh	\$v1,\$v18\[2\]
0+0248 <[^>]*> 7bd20060 	rzu\.ob	\$v1,0x12
0+024c <[^>]*> 7ad20060 	rzu\.ob	\$v1,\$v18
0+0250 <[^>]*> 79920060 	rzu\.ob	\$v1,\$v18\[6\]
0+0254 <[^>]*> 7bb20060 	rzu\.qh	\$v1,0x12
0+0258 <[^>]*> 7ab20060 	rzu\.qh	\$v1,\$v18
0+025c <[^>]*> 79320060 	rzu\.qh	\$v1,\$v18\[2\]
0+0260 <[^>]*> 7a32605f 	shfl\.bfla\.qh	\$v1,\$v12,\$v18
0+0264 <[^>]*> 7992605f 	shfl\.mixh\.ob	\$v1,\$v12,\$v18
0+0268 <[^>]*> 7832605f 	shfl\.mixh\.qh	\$v1,\$v12,\$v18
0+026c <[^>]*> 79d2605f 	shfl\.mixl\.ob	\$v1,\$v12,\$v18
0+0270 <[^>]*> 78b2605f 	shfl\.mixl\.qh	\$v1,\$v12,\$v18
0+0274 <[^>]*> 7912605f 	shfl\.pach\.ob	\$v1,\$v12,\$v18
0+0278 <[^>]*> 7932605f 	shfl\.pach\.qh	\$v1,\$v12,\$v18
0+027c <[^>]*> 7b32605f 	shfl\.repa\.qh	\$v1,\$v12,\$v18
0+0280 <[^>]*> 7bb2605f 	shfl\.repb\.qh	\$v1,\$v12,\$v18
0+0284 <[^>]*> 78d2605f 	shfl\.upsl\.ob	\$v1,\$v12,\$v18
0+0288 <[^>]*> 7bd26050 	sll\.ob	\$v1,\$v12,0x12
0+028c <[^>]*> 7ad26050 	sll\.ob	\$v1,\$v12,\$v18
0+0290 <[^>]*> 79926050 	sll\.ob	\$v1,\$v12,\$v18\[6\]
0+0294 <[^>]*> 7bb26050 	sll\.qh	\$v1,\$v12,0x12
0+0298 <[^>]*> 7ab26050 	sll\.qh	\$v1,\$v12,\$v18
0+029c <[^>]*> 79326050 	sll\.qh	\$v1,\$v12,\$v18\[2\]
0+02a0 <[^>]*> 7bb26053 	sra\.qh	\$v1,\$v12,0x12
0+02a4 <[^>]*> 7ab26053 	sra\.qh	\$v1,\$v12,\$v18
0+02a8 <[^>]*> 79326053 	sra\.qh	\$v1,\$v12,\$v18\[2\]
0+02ac <[^>]*> 7bd26052 	srl\.ob	\$v1,\$v12,0x12
0+02b0 <[^>]*> 7ad26052 	srl\.ob	\$v1,\$v12,\$v18
0+02b4 <[^>]*> 79926052 	srl\.ob	\$v1,\$v12,\$v18\[6\]
0+02b8 <[^>]*> 7bb26052 	srl\.qh	\$v1,\$v12,0x12
0+02bc <[^>]*> 7ab26052 	srl\.qh	\$v1,\$v12,\$v18
0+02c0 <[^>]*> 79326052 	srl\.qh	\$v1,\$v12,\$v18\[2\]
0+02c4 <[^>]*> 7bd2604a 	sub\.ob	\$v1,\$v12,0x12
0+02c8 <[^>]*> 7ad2604a 	sub\.ob	\$v1,\$v12,\$v18
0+02cc <[^>]*> 7992604a 	sub\.ob	\$v1,\$v12,\$v18\[6\]
0+02d0 <[^>]*> 7bb2604a 	sub\.qh	\$v1,\$v12,0x12
0+02d4 <[^>]*> 7ab2604a 	sub\.qh	\$v1,\$v12,\$v18
0+02d8 <[^>]*> 7932604a 	sub\.qh	\$v1,\$v12,\$v18\[2\]
0+02dc <[^>]*> 7bd26036 	suba\.ob	\$v12,0x12
0+02e0 <[^>]*> 7ad26036 	suba\.ob	\$v12,\$v18
0+02e4 <[^>]*> 79926036 	suba\.ob	\$v12,\$v18\[6\]
0+02e8 <[^>]*> 7bb26036 	suba\.qh	\$v12,0x12
0+02ec <[^>]*> 7ab26036 	suba\.qh	\$v12,\$v18
0+02f0 <[^>]*> 79326036 	suba\.qh	\$v12,\$v18\[2\]
0+02f4 <[^>]*> 7bd26436 	subl\.ob	\$v12,0x12
0+02f8 <[^>]*> 7ad26436 	subl\.ob	\$v12,\$v18
0+02fc <[^>]*> 79926436 	subl\.ob	\$v12,\$v18\[6\]
0+0300 <[^>]*> 7bb26436 	subl\.qh	\$v12,0x12
0+0304 <[^>]*> 7ab26436 	subl\.qh	\$v12,\$v18
0+0308 <[^>]*> 79326436 	subl\.qh	\$v12,\$v18\[2\]
0+030c <[^>]*> 7a00603e 	wach\.ob	\$v12
0+0310 <[^>]*> 7a20603e 	wach\.qh	\$v12
0+0314 <[^>]*> 7812603e 	wacl\.ob	\$v12,\$v18
0+0318 <[^>]*> 7832603e 	wacl\.qh	\$v12,\$v18
0+031c <[^>]*> 7bd2604d 	xor\.ob	\$v1,\$v12,0x12
0+0320 <[^>]*> 7ad2604d 	xor\.ob	\$v1,\$v12,\$v18
0+0324 <[^>]*> 7992604d 	xor\.ob	\$v1,\$v12,\$v18\[6\]
0+0328 <[^>]*> 7bb2604d 	xor\.qh	\$v1,\$v12,0x12
0+032c <[^>]*> 7ab2604d 	xor\.qh	\$v1,\$v12,\$v18
0+0330 <[^>]*> 7932604d 	xor\.qh	\$v1,\$v12,\$v18\[2\]
	\.\.\.
