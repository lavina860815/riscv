#source: tlsget.s
#as: -a64 -mpower10
#ld: -shared --plt-align=0 --power10-stubs=yes tlsdll.so
#objdump: -dr
#target: powerpc64*-*-*

.*:     file format .*

Disassembly of section \.text:

.* <.*\.plt_call\..*>:
.*:	(f8 41 00 18|18 00 41 f8) 	std     r2,24\(r1\)
.*:	(60 00 00 00|00 00 00 60) 	nop
.*:	(04 10 .. ..|.. .. 10 04) 	pld     r12,.*
.*:	(e5 80 .. ..|.. .. 80 e5) 
.*:	(7d 89 03 a6|a6 03 89 7d) 	mtctr   r12
.*:	(4e 80 04 20|20 04 80 4e) 	bctr

.* <.*\.plt_call\.__tls_get_addr_opt.*>:
.*:	(e8 03 00 00|00 00 03 e8) 	ld      r0,0\(r3\)
.*:	(e9 83 00 08|08 00 83 e9) 	ld      r12,8\(r3\)
.*:	(2c 20 00 00|00 00 20 2c) 	cmpdi   r0,0
.*:	(7c 60 1b 78|78 1b 60 7c) 	mr      r0,r3
.*:	(7c 6c 6a 14|14 6a 6c 7c) 	add     r3,r12,r13
.*:	(4d 82 00 20|20 00 82 4d) 	beqlr
.*:	(7c 03 03 78|78 03 03 7c) 	mr      r3,r0
.*:	(7c 08 02 a6|a6 02 08 7c) 	mflr    r0
.*:	(f8 01 00 08|08 00 01 f8) 	std     r0,8\(r1\)
.*:	(f8 41 00 18|18 00 41 f8) 	std     r2,24\(r1\)
.*:	(04 10 .. ..|.. .. 10 04) 	pld     r12,.*
.*:	(e5 80 .. ..|.. .. 80 e5) 
.*:	(7d 89 03 a6|a6 03 89 7d) 	mtctr   r12
.*:	(4e 80 04 21|21 04 80 4e) 	bctrl
.*:	(e8 41 00 18|18 00 41 e8) 	ld      r2,24\(r1\)
.*:	(e8 01 00 08|08 00 01 e8) 	ld      r0,8\(r1\)
.*:	(7c 08 03 a6|a6 03 08 7c) 	mtlr    r0
.*:	(4e 80 00 20|20 00 80 4e) 	blr
#...

.* <_start>:
.*:	(06 10 .. ..|.. .. 10 06) 	pla     r3,.*
.*:	(38 60 .. ..|.. .. 60 38) 
.*:	(4b ff .. ..|.. .. ff 4b) 	bl      .* <.*\.plt_call\.__tls_get_addr_opt[^\+]*>
.*:	(60 00 00 00|00 00 00 60) 	nop
.*:	(38 62 .. ..|.. .. 62 38) 	addi    r3,r2,.*
.*:	(4b ff .. ..|.. .. ff 4b) 	bl      .* <.*\.plt_call\.__tls_get_addr_opt[^\+]*>
.*:	(60 00 00 00|00 00 00 60) 	nop
.*:	(4b ff .. ..|.. .. ff 4b) 	bl      .* <.*\.plt_call\..*:.*\+0x4>
.*:	(4b ff .. ..|.. .. ff 4b) 	bl      .* <.*.plt_call\..*:[^\+]*>
.*:	(e8 41 00 18|18 00 41 e8) 	ld      r2,24\(r1\)

.* <fun>:
.*:	(06 10 00 00|00 00 10 06) 	pla     r3,8
.*:	(38 60 00 08|08 00 60 38) 
.*:	(4e 80 00 20|20 00 80 4e) 	blr
.*:	(60 00 00 00|00 00 00 60) 	nop
.*:	(00 00 00 00|d0 02 01 00) 	.*
.*:	(00 01 02 d0|00 00 00 00) 	.*

.* <__glink_PLTresolve>:
.*:	(7c 08 02 a6|a6 02 08 7c) 	mflr    r0
.*:	(42 9f 00 05|05 00 9f 42) 	bcl     20,4\*cr7\+so,.* <__glink_PLTresolve\+0x8>
.*:	(7d 68 02 a6|a6 02 68 7d) 	mflr    r11
.*:	(7c 08 03 a6|a6 03 08 7c) 	mtlr    r0
.*:	(e8 0b ff f0|f0 ff 0b e8) 	ld      r0,-16\(r11\)
.*:	(7d 8b 60 50|50 60 8b 7d) 	subf    r12,r11,r12
.*:	(7d 60 5a 14|14 5a 60 7d) 	add     r11,r0,r11
.*:	(38 0c ff d4|d4 ff 0c 38) 	addi    r0,r12,-44
.*:	(e9 8b 00 00|00 00 8b e9) 	ld      r12,0\(r11\)
.*:	(78 00 f0 82|82 f0 00 78) 	rldicl  r0,r0,62,2
.*:	(7d 89 03 a6|a6 03 89 7d) 	mtctr   r12
.*:	(e9 6b 00 08|08 00 6b e9) 	ld      r11,8\(r11\)
.*:	(4e 80 04 20|20 04 80 4e) 	bctr

.* <__tls_get_addr_opt@plt>:
.*:	(4b ff .. ..|.. .. ff 4b) 	b       .* <__glink_PLTresolve>
