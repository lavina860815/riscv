#source: emit-relocs-273.s
#ld: -T relocs.ld --defsym tempy=0x11000 --defsym tempy2=0x45000 --defsym tempy3=0x1234  -e0 --emit-relocs
#objdump: -dr
#...
 +10000:	8a000000 	and	x0, x0, x0
 +10004:	92400000 	and	x0, x0, #0x1
 +10008:	58007fc4 	ldr	x4, 11000 <tempy>
	+10008: R_AARCH64_LD_PREL_LO19	tempy
 +1000c:	581a7fa7 	ldr	x7, 45000 <tempy2>
	+1000c: R_AARCH64_LD_PREL_LO19	tempy2
 +10010:	58f89131 	ldr	x17, 1234 <tempy3>
	+10010: R_AARCH64_LD_PREL_LO19	tempy3

