#source: tls32.s
#source: tlslib32.s
#as: -a32
#ld: --no-tls-optimize
#objdump: -dr
#target: powerpc*-*-*

.*

Disassembly of section \.text:

0+18000a0 <_start>:
.*:	(42 9f 00 05|05 00 9f 42) 	bcl     .*
.*:	(7f c8 02 a6|a6 02 c8 7f) 	mflr    r30
.*:	(3f de 00 02|02 00 de 3f) 	addis   r30,r30,2
.*:	(3b de 80 a0|a0 80 de 3b) 	addi    r30,r30,-32608
.*:	(38 7f ff e4|e4 ff 7f 38) 	addi    r3,r31,-28
.*:	(48 00 00 6d|6d 00 00 48) 	bl      .*
.*:	(38 7f ff f8|f8 ff 7f 38) 	addi    r3,r31,-8
.*:	(48 00 00 65|65 00 00 48) 	bl      .*
.*:	(38 7f ff ec|ec ff 7f 38) 	addi    r3,r31,-20
.*:	(48 00 00 5d|5d 00 00 48) 	bl      .*
.*:	(38 7f ff f8|f8 ff 7f 38) 	addi    r3,r31,-8
.*:	(48 00 00 55|55 00 00 48) 	bl      .*
.*:	(39 23 80 24|24 80 23 39) 	addi    r9,r3,-32732
.*:	(3d 23 00 00|00 00 23 3d) 	addis   r9,r3,0
.*:	(81 49 80 28|28 80 49 81) 	lwz     r10,-32728\(r9\)
.*:	(81 3f ff f4|f4 ff 3f 81) 	lwz     r9,-12\(r31\)
.*:	(7d 49 12 2e|2e 12 49 7d) 	lhzx    r10,r9,r2
.*:	(89 42 90 34|34 90 42 89) 	lbz     r10,-28620\(r2\)
.*:	(3d 22 00 00|00 00 22 3d) 	addis   r9,r2,0
.*:	(99 49 90 38|38 90 49 99) 	stb     r10,-28616\(r9\)
.*:	(38 7e ff dc|dc ff 7e 38) 	addi    r3,r30,-36
.*:	(48 00 00 2d|2d 00 00 48) 	bl      .*
.*:	(38 7e ff f8|f8 ff 7e 38) 	addi    r3,r30,-8
.*:	(48 00 00 25|25 00 00 48) 	bl      .*
.*:	(91 43 80 04|04 80 43 91) 	stw     r10,-32764\(r3\)
.*:	(3d 23 00 00|00 00 23 3d) 	addis   r9,r3,0
.*:	(91 49 80 08|08 80 49 91) 	stw     r10,-32760\(r9\)
.*:	(81 3e ff f4|f4 ff 3e 81) 	lwz     r9,-12\(r30\)
.*:	(7d 49 13 2e|2e 13 49 7d) 	sthx    r10,r9,r2
.*:	(a1 42 90 14|14 90 42 a1) 	lhz     r10,-28652\(r2\)
.*:	(3d 22 00 00|00 00 22 3d) 	addis   r9,r2,0
.*:	(a9 49 90 18|18 90 49 a9) 	lha     r10,-28648\(r9\)

0+1800120 <__tls_get_addr>:
.*:	(4e 80 00 20|20 00 80 4e) 	blr
