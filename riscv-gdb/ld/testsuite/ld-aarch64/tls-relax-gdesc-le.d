#source: tls-relax-gdesc-le.s
#ld: -T relocs.ld -e0
#objdump: -dr
#...
 +10000:	d2a00000 	movz	x0, #0x0, lsl #16
 +10004:	f2800200 	movk	x0, #0x10
 +10008:	d503201f 	nop
 +1000c:	d503201f 	nop
 +10010:	d53bd041 	mrs	x1, tpidr_el0
 +10014:	8b000020 	add	x0, x1, x0
 +10018:	b9400000 	ldr	w0, \[x0\]
