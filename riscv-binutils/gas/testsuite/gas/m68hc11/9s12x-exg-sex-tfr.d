#objdump: -d -mm9s12x --prefix-addresses --reloc
#as: -mm9s12x
#name: s12x extended forms of exg,tfr,sex

.*:     file format elf32-m68hc12


Disassembly of section .text:
0x00000000 exg	A,A
0x00000002 exg	B,A
0x00000004 exg	D,A
0x00000006 exg	A,B
0x00000008 exg	B,B
0x0000000a exg	D,B
0x0000000c exg	CCR,CCR
0x0000000e exg	D,CCR
0x00000010 exg	X,CCR
0x00000012 exg	Y,CCR
0x00000014 exg	SP,CCR
0x00000016 exg	A,D
0x00000018 exg	B,D
0x0000001a exg	CCR,D
0x0000001c exg	D,D
0x0000001e exg	X,D
0x00000020 exg	Y,D
0x00000022 exg	SP,D
0x00000024 exg	CCR,X
0x00000026 xgdx
0x00000028 exg	X,X
0x0000002a exg	Y,X
0x0000002c exg	SP,X
0x0000002e exg	CCR,Y
0x00000030 xgdy
0x00000032 exg	X,Y
0x00000034 exg	Y,Y
0x00000036 exg	SP,Y
0x00000038 exg	CCR,SP
0x0000003a exg	D,SP
0x0000003c exg	X,SP
0x0000003e exg	Y,SP
0x00000040 exg	SP,SP
0x00000042 sex	A,D
0x00000044 sex	B,D
0x00000046 sex	D,X
0x00000048 sex	D,Y
0x0000004a tfr	A,A
0x0000004c tfr	B,A
0x0000004e tfr	D,A
0x00000050 tfr	A,B
0x00000052 tfr	B,B
0x00000054 tfr	D,B
0x00000056 tfr	D,D
0x00000058 tfr	X,D
0x0000005a tfr	Y,D
0x0000005c tfr	SP,D
0x0000005e tfr	X,X
0x00000060 tfr	Y,X
0x00000062 tsx
0x00000064 tfr	X,Y
0x00000066 tfr	Y,Y
0x00000068 tsy
0x0000006a tfr	D,SP
0x0000006c txs
0x0000006e tys
0x00000070 tfr	SP,SP
