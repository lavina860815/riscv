#as: -x
#objdump: -tdr

.*:     file format elf64-mmix

SYMBOL TABLE:
0+ l    d  .text	0+ (|\.text)
0+ l    d  .data	0+ (|\.data)
0+ l    d  .bss	0+ (|\.bss)
ffff0000ffff0000 l       \*ABS\*	0+ i1
ffff0000ffff0000 l       \*ABS\*	0+ i2
0+ g     F .text	0+ Main

Disassembly of section .text:

0+ <Main>:
   0:	42ff0000 	bz \$255,0 <Main>
			0: R_MMIX_CBRANCH	\*ABS\*-0xffff00010000
   4:	fd000000 	swym 0,0,0
   8:	fd000000 	swym 0,0,0
   c:	fd000000 	swym 0,0,0
  10:	fd000000 	swym 0,0,0
  14:	fd000000 	swym 0,0,0
  18:	42ff0000 	bz \$255,18 <Main\+0x18>
			18: R_MMIX_CBRANCH	i2
  1c:	fd000000 	swym 0,0,0
  20:	fd000000 	swym 0,0,0
  24:	fd000000 	swym 0,0,0
  28:	fd000000 	swym 0,0,0
  2c:	fd000000 	swym 0,0,0
