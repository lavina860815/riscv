#as:
#objdump: -d
#source: ls32ls16.s

.*: +file format .*

Disassembly of section \.text:

00000000 <.text>:
	...
  10:	2038      	lw!		r0, \[r3\]
  12:	2038      	lw!		r0, \[r3\]
  14:	23f8      	lw!		r3, \[r15\]
  16:	23f8      	lw!		r3, \[r15\]
  18:	2f88      	lw!		r15, \[r8\]
  1a:	2f88      	lw!		r15, \[r8\]
  1c:	c0888000 	lw		r4, \[r8, 0\]
  20:	c3338000 	lw		r25, \[r19, 0\]
  24:	2578      	lw!		r5, \[r7\]
  26:	2578      	lw!		r5, \[r7\]
  28:	2238      	lw!		r2, \[r3\]
  2a:	2238      	lw!		r2, \[r3\]
	...
  40:	2039      	lh!		r0, \[r3\]
  42:	2039      	lh!		r0, \[r3\]
  44:	23f9      	lh!		r3, \[r15\]
  46:	23f9      	lh!		r3, \[r15\]
  48:	2f89      	lh!		r15, \[r8\]
  4a:	2f89      	lh!		r15, \[r8\]
  4c:	c4888000 	lh		r4, \[r8, 0\]
  50:	c7338000 	lh		r25, \[r19, 0\]
  54:	2579      	lh!		r5, \[r7\]
  56:	2579      	lh!		r5, \[r7\]
  58:	2239      	lh!		r2, \[r3\]
  5a:	2239      	lh!		r2, \[r3\]
	...
 110:	203b      	lbu!		r0, \[r3\]
 112:	203b      	lbu!		r0, \[r3\]
 114:	23fb      	lbu!		r3, \[r15\]
 116:	23fb      	lbu!		r3, \[r15\]
 118:	2f8b      	lbu!		r15, \[r8\]
 11a:	2f8b      	lbu!		r15, \[r8\]
 11c:	d8888000 	lbu		r4, \[r8, 0\]
 120:	db338000 	lbu		r25, \[r19, 0\]
 124:	257b      	lbu!		r5, \[r7\]
 126:	257b      	lbu!		r5, \[r7\]
 128:	223b      	lbu!		r2, \[r3\]
 12a:	223b      	lbu!		r2, \[r3\]
	...
 210:	203c      	sw!		r0, \[r3\]
 212:	203c      	sw!		r0, \[r3\]
 214:	23fc      	sw!		r3, \[r15\]
 216:	23fc      	sw!		r3, \[r15\]
 218:	2f8c      	sw!		r15, \[r8\]
 21a:	2f8c      	sw!		r15, \[r8\]
 21c:	d0888000 	sw		r4, \[r8, 0\]
 220:	d3338000 	sw		r25, \[r19, 0\]
 224:	257c      	sw!		r5, \[r7\]
 226:	257c      	sw!		r5, \[r7\]
 228:	223c      	sw!		r2, \[r3\]
 22a:	223c      	sw!		r2, \[r3\]
 22c:	0000      	nop!
 22e:	0000      	nop!
 230:	203d      	sh!		r0, \[r3\]
 232:	203d      	sh!		r0, \[r3\]
 234:	23fd      	sh!		r3, \[r15\]
 236:	23fd      	sh!		r3, \[r15\]
 238:	2f8d      	sh!		r15, \[r8\]
 23a:	2f8d      	sh!		r15, \[r8\]
 23c:	d4888000 	sh		r4, \[r8, 0\]
 240:	d7338000 	sh		r25, \[r19, 0\]
 244:	257d      	sh!		r5, \[r7\]
 246:	257d      	sh!		r5, \[r7\]
 248:	223d      	sh!		r2, \[r3\]
 24a:	223d      	sh!		r2, \[r3\]
 24c:	0000      	nop!
 24e:	0000      	nop!
 250:	203f      	sb!		r0, \[r3\]
 252:	203f      	sb!		r0, \[r3\]
 254:	23ff      	sb!		r3, \[r15\]
 256:	23ff      	sb!		r3, \[r15\]
 258:	2f8f      	sb!		r15, \[r8\]
 25a:	2f8f      	sb!		r15, \[r8\]
 25c:	dc888000 	sb		r4, \[r8, 0\]
 260:	df338000 	sb		r25, \[r19, 0\]
 264:	257f      	sb!		r5, \[r7\]
 266:	257f      	sb!		r5, \[r7\]
 268:	223f      	sb!		r2, \[r3\]
 26a:	223f      	sb!		r2, \[r3\]
 26c:	0000      	nop!
 26e:	0000      	nop!
 270:	c0038000 	lw		r0, \[r3, 0\]
 274:	c257800a 	lw		r18, \[r23, 10\]
 278:	c1e08000 	lw		r15, \[r0, 0\]
 27c:	c23a800a 	lw		r17, \[r26, 10\]
 280:	2688      	lw!		r6, \[r8\]
 282:	2688      	lw!		r6, \[r8\]
 284:	2378      	lw!		r3, \[r7\]
 286:	2378      	lw!		r3, \[r7\]
	...
 290:	c4038000 	lh		r0, \[r3, 0\]
 294:	c657800a 	lh		r18, \[r23, 10\]
 298:	c5e08000 	lh		r15, \[r0, 0\]
 29c:	c63a800a 	lh		r17, \[r26, 10\]
 2a0:	2689      	lh!		r6, \[r8\]
 2a2:	2689      	lh!		r6, \[r8\]
 2a4:	2379      	lh!		r3, \[r7\]
 2a6:	2379      	lh!		r3, \[r7\]
	...
 2b0:	d8038000 	lbu		r0, \[r3, 0\]
 2b4:	da57800a 	lbu		r18, \[r23, 10\]
 2b8:	d9e08000 	lbu		r15, \[r0, 0\]
 2bc:	da3a800a 	lbu		r17, \[r26, 10\]
 2c0:	268b      	lbu!		r6, \[r8\]
 2c2:	268b      	lbu!		r6, \[r8\]
 2c4:	237b      	lbu!		r3, \[r7\]
 2c6:	237b      	lbu!		r3, \[r7\]
	...
 2d0:	d0038000 	sw		r0, \[r3, 0\]
 2d4:	d257800a 	sw		r18, \[r23, 10\]
 2d8:	d1e08000 	sw		r15, \[r0, 0\]
 2dc:	d23a800a 	sw		r17, \[r26, 10\]
 2e0:	268c      	sw!		r6, \[r8\]
 2e2:	268c      	sw!		r6, \[r8\]
 2e4:	237c      	sw!		r3, \[r7\]
 2e6:	237c      	sw!		r3, \[r7\]
	...
 2f0:	d4038000 	sh		r0, \[r3, 0\]
 2f4:	d657800a 	sh		r18, \[r23, 10\]
 2f8:	d5e08000 	sh		r15, \[r0, 0\]
 2fc:	d63a800a 	sh		r17, \[r26, 10\]
 300:	268d      	sh!		r6, \[r8\]
 302:	268d      	sh!		r6, \[r8\]
 304:	237d      	sh!		r3, \[r7\]
 306:	237d      	sh!		r3, \[r7\]
	...
 310:	dc038000 	sb		r0, \[r3, 0\]
 314:	de57800a 	sb		r18, \[r23, 10\]
 318:	dde08000 	sb		r15, \[r0, 0\]
 31c:	de3a800a 	sb		r17, \[r26, 10\]
 320:	268f      	sb!		r6, \[r8\]
 322:	268f      	sb!		r6, \[r8\]
 324:	237f      	sb!		r3, \[r7\]
 326:	237f      	sb!		r3, \[r7\]
#pass
