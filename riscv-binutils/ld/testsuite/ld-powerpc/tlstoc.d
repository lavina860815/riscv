#source: tlslib.s
#source: tlstoc.s
#as: -a64
#ld:
#objdump: -dr
#target: powerpc64*-*-*

.*

Disassembly of section \.text:

.* <\.__tls_get_addr>:
.*	(4e 80 00 20|20 00 80 4e) 	blr

.* <\._start>:
.*	(60 00 00 00|00 00 00 60) 	nop
.*	(38 6d 90 40|40 90 6d 38) 	addi    r3,r13,-28608
.*	(60 00 00 00|00 00 00 60) 	nop
.*	(60 00 00 00|00 00 00 60) 	nop
.*	(38 6d 10 00|00 10 6d 38) 	addi    r3,r13,4096
.*	(60 00 00 00|00 00 00 60) 	nop
.*	(60 00 00 00|00 00 00 60) 	nop
.*	(38 6d 90 48|48 90 6d 38) 	addi    r3,r13,-28600
.*	(60 00 00 00|00 00 00 60) 	nop
.*	(60 00 00 00|00 00 00 60) 	nop
.*	(38 6d 10 00|00 10 6d 38) 	addi    r3,r13,4096
.*	(60 00 00 00|00 00 00 60) 	nop
.*	(39 23 80 50|50 80 23 39) 	addi    r9,r3,-32688
.*	(3d 23 00 00|00 00 23 3d) 	addis   r9,r3,0
.*	(81 49 80 58|58 80 49 81) 	lwz     r10,-32680\(r9\)
.*	(e9 22 80 40|40 80 22 e9) 	ld      r9,-32704\(r2\)
.*	(7d 49 18 2a|2a 18 49 7d) 	ldx     r10,r9,r3
.*	(60 00 00 00|00 00 00 60) 	nop
.*	(a1 4d 90 68|68 90 4d a1) 	lhz     r10,-28568\(r13\)
.*	(89 4d 90 70|70 90 4d 89) 	lbz     r10,-28560\(r13\)
.*	(60 00 00 00|00 00 00 60) 	nop
.*	(99 4d 90 78|78 90 4d 99) 	stb     r10,-28552\(r13\)
