#objdump: -dr --prefix-addresses --show-raw-insn
#name: MIPS ELF xgot reloc n64
#as: -march=from-abi -64 -KPIC -xgot
#source: elf-rel-got-n64.s

.*: +file format elf64-.*mips.*

Disassembly of section \.text:
0000000000000000 <fn> 3c050000 	lui	a1,0x0
			0: R_MIPS_GOT_HI16	dg1
			0: R_MIPS_NONE	\*ABS\*
			0: R_MIPS_NONE	\*ABS\*
0000000000000004 <fn\+0x4> 00bc282d 	daddu	a1,a1,gp
0000000000000008 <fn\+0x8> dca50000 	ld	a1,0\(a1\)
			8: R_MIPS_GOT_LO16	dg1
			8: R_MIPS_NONE	\*ABS\*
			8: R_MIPS_NONE	\*ABS\*
000000000000000c <fn\+0xc> 3c050000 	lui	a1,0x0
			c: R_MIPS_GOT_HI16	dg1
			c: R_MIPS_NONE	\*ABS\*
			c: R_MIPS_NONE	\*ABS\*
0000000000000010 <fn\+0x10> 00bc282d 	daddu	a1,a1,gp
0000000000000014 <fn\+0x14> dca50000 	ld	a1,0\(a1\)
			14: R_MIPS_GOT_LO16	dg1
			14: R_MIPS_NONE	\*ABS\*
			14: R_MIPS_NONE	\*ABS\*
0000000000000018 <fn\+0x18> 64a5000c 	daddiu	a1,a1,12
000000000000001c <fn\+0x1c> 3c050000 	lui	a1,0x0
			1c: R_MIPS_GOT_HI16	dg1
			1c: R_MIPS_NONE	\*ABS\*
			1c: R_MIPS_NONE	\*ABS\*
0000000000000020 <fn\+0x20> 00bc282d 	daddu	a1,a1,gp
0000000000000024 <fn\+0x24> dca50000 	ld	a1,0\(a1\)
			24: R_MIPS_GOT_LO16	dg1
			24: R_MIPS_NONE	\*ABS\*
			24: R_MIPS_NONE	\*ABS\*
0000000000000028 <fn\+0x28> 3c010001 	lui	at,0x1
000000000000002c <fn\+0x2c> 3421e240 	ori	at,at,0xe240
0000000000000030 <fn\+0x30> 00a1282d 	daddu	a1,a1,at
0000000000000034 <fn\+0x34> 3c050000 	lui	a1,0x0
			34: R_MIPS_GOT_HI16	dg1
			34: R_MIPS_NONE	\*ABS\*
			34: R_MIPS_NONE	\*ABS\*
0000000000000038 <fn\+0x38> 00bc282d 	daddu	a1,a1,gp
000000000000003c <fn\+0x3c> dca50000 	ld	a1,0\(a1\)
			3c: R_MIPS_GOT_LO16	dg1
			3c: R_MIPS_NONE	\*ABS\*
			3c: R_MIPS_NONE	\*ABS\*
0000000000000040 <fn\+0x40> 00b1282d 	daddu	a1,a1,s1
0000000000000044 <fn\+0x44> 3c050000 	lui	a1,0x0
			44: R_MIPS_GOT_HI16	dg1
			44: R_MIPS_NONE	\*ABS\*
			44: R_MIPS_NONE	\*ABS\*
0000000000000048 <fn\+0x48> 00bc282d 	daddu	a1,a1,gp
000000000000004c <fn\+0x4c> dca50000 	ld	a1,0\(a1\)
			4c: R_MIPS_GOT_LO16	dg1
			4c: R_MIPS_NONE	\*ABS\*
			4c: R_MIPS_NONE	\*ABS\*
0000000000000050 <fn\+0x50> 64a5000c 	daddiu	a1,a1,12
0000000000000054 <fn\+0x54> 00b1282d 	daddu	a1,a1,s1
0000000000000058 <fn\+0x58> 3c050000 	lui	a1,0x0
			58: R_MIPS_GOT_HI16	dg1
			58: R_MIPS_NONE	\*ABS\*
			58: R_MIPS_NONE	\*ABS\*
000000000000005c <fn\+0x5c> 00bc282d 	daddu	a1,a1,gp
0000000000000060 <fn\+0x60> dca50000 	ld	a1,0\(a1\)
			60: R_MIPS_GOT_LO16	dg1
			60: R_MIPS_NONE	\*ABS\*
			60: R_MIPS_NONE	\*ABS\*
0000000000000064 <fn\+0x64> 3c010001 	lui	at,0x1
0000000000000068 <fn\+0x68> 3421e240 	ori	at,at,0xe240
000000000000006c <fn\+0x6c> 00a1282d 	daddu	a1,a1,at
0000000000000070 <fn\+0x70> 00b1282d 	daddu	a1,a1,s1
0000000000000074 <fn\+0x74> 3c050000 	lui	a1,0x0
			74: R_MIPS_GOT_HI16	dg1
			74: R_MIPS_NONE	\*ABS\*
			74: R_MIPS_NONE	\*ABS\*
0000000000000078 <fn\+0x78> 00bc282d 	daddu	a1,a1,gp
000000000000007c <fn\+0x7c> dca50000 	ld	a1,0\(a1\)
			7c: R_MIPS_GOT_LO16	dg1
			7c: R_MIPS_NONE	\*ABS\*
			7c: R_MIPS_NONE	\*ABS\*
0000000000000080 <fn\+0x80> dca50000 	ld	a1,0\(a1\)
0000000000000084 <fn\+0x84> 3c050000 	lui	a1,0x0
			84: R_MIPS_GOT_HI16	dg1
			84: R_MIPS_NONE	\*ABS\*
			84: R_MIPS_NONE	\*ABS\*
0000000000000088 <fn\+0x88> 00bc282d 	daddu	a1,a1,gp
000000000000008c <fn\+0x8c> dca50000 	ld	a1,0\(a1\)
			8c: R_MIPS_GOT_LO16	dg1
			8c: R_MIPS_NONE	\*ABS\*
			8c: R_MIPS_NONE	\*ABS\*
0000000000000090 <fn\+0x90> dca5000c 	ld	a1,12\(a1\)
0000000000000094 <fn\+0x94> 3c050000 	lui	a1,0x0
			94: R_MIPS_GOT_HI16	dg1
			94: R_MIPS_NONE	\*ABS\*
			94: R_MIPS_NONE	\*ABS\*
0000000000000098 <fn\+0x98> 00bc282d 	daddu	a1,a1,gp
000000000000009c <fn\+0x9c> dca50000 	ld	a1,0\(a1\)
			9c: R_MIPS_GOT_LO16	dg1
			9c: R_MIPS_NONE	\*ABS\*
			9c: R_MIPS_NONE	\*ABS\*
00000000000000a0 <fn\+0xa0> 00b1282d 	daddu	a1,a1,s1
00000000000000a4 <fn\+0xa4> dca50000 	ld	a1,0\(a1\)
00000000000000a8 <fn\+0xa8> 3c050000 	lui	a1,0x0
			a8: R_MIPS_GOT_HI16	dg1
			a8: R_MIPS_NONE	\*ABS\*
			a8: R_MIPS_NONE	\*ABS\*
00000000000000ac <fn\+0xac> 00bc282d 	daddu	a1,a1,gp
00000000000000b0 <fn\+0xb0> dca50000 	ld	a1,0\(a1\)
			b0: R_MIPS_GOT_LO16	dg1
			b0: R_MIPS_NONE	\*ABS\*
			b0: R_MIPS_NONE	\*ABS\*
00000000000000b4 <fn\+0xb4> 00b1282d 	daddu	a1,a1,s1
00000000000000b8 <fn\+0xb8> dca5000c 	ld	a1,12\(a1\)
00000000000000bc <fn\+0xbc> 3c010000 	lui	at,0x0
			bc: R_MIPS_GOT_HI16	dg1
			bc: R_MIPS_NONE	\*ABS\*
			bc: R_MIPS_NONE	\*ABS\*
00000000000000c0 <fn\+0xc0> 003c082d 	daddu	at,at,gp
00000000000000c4 <fn\+0xc4> dc210000 	ld	at,0\(at\)
			c4: R_MIPS_GOT_LO16	dg1
			c4: R_MIPS_NONE	\*ABS\*
			c4: R_MIPS_NONE	\*ABS\*
00000000000000c8 <fn\+0xc8> 0025082d 	daddu	at,at,a1
00000000000000cc <fn\+0xcc> dc250022 	ld	a1,34\(at\)
00000000000000d0 <fn\+0xd0> 3c010000 	lui	at,0x0
			d0: R_MIPS_GOT_HI16	dg1
			d0: R_MIPS_NONE	\*ABS\*
			d0: R_MIPS_NONE	\*ABS\*
00000000000000d4 <fn\+0xd4> 003c082d 	daddu	at,at,gp
00000000000000d8 <fn\+0xd8> dc210000 	ld	at,0\(at\)
			d8: R_MIPS_GOT_LO16	dg1
			d8: R_MIPS_NONE	\*ABS\*
			d8: R_MIPS_NONE	\*ABS\*
00000000000000dc <fn\+0xdc> 0025082d 	daddu	at,at,a1
00000000000000e0 <fn\+0xe0> fc250038 	sd	a1,56\(at\)
00000000000000e4 <fn\+0xe4> 3c010000 	lui	at,0x0
			e4: R_MIPS_GOT_HI16	dg1
			e4: R_MIPS_NONE	\*ABS\*
			e4: R_MIPS_NONE	\*ABS\*
00000000000000e8 <fn\+0xe8> 003c082d 	daddu	at,at,gp
00000000000000ec <fn\+0xec> dc210000 	ld	at,0\(at\)
			ec: R_MIPS_GOT_LO16	dg1
			ec: R_MIPS_NONE	\*ABS\*
			ec: R_MIPS_NONE	\*ABS\*
00000000000000f0 <fn\+0xf0> 8825000[03] 	lwl	a1,[03]\(at\)
00000000000000f4 <fn\+0xf4> 9825000[03] 	lwr	a1,[03]\(at\)
00000000000000f8 <fn\+0xf8> 3c010000 	lui	at,0x0
			f8: R_MIPS_GOT_HI16	dg1
			f8: R_MIPS_NONE	\*ABS\*
			f8: R_MIPS_NONE	\*ABS\*
00000000000000fc <fn\+0xfc> 003c082d 	daddu	at,at,gp
0000000000000100 <fn\+0x100> dc210000 	ld	at,0\(at\)
			100: R_MIPS_GOT_LO16	dg1
			100: R_MIPS_NONE	\*ABS\*
			100: R_MIPS_NONE	\*ABS\*
0000000000000104 <fn\+0x104> 6421000c 	daddiu	at,at,12
0000000000000108 <fn\+0x108> 8825000[03] 	lwl	a1,[03]\(at\)
000000000000010c <fn\+0x10c> 9825000[03] 	lwr	a1,[03]\(at\)
0000000000000110 <fn\+0x110> 3c010000 	lui	at,0x0
			110: R_MIPS_GOT_HI16	dg1
			110: R_MIPS_NONE	\*ABS\*
			110: R_MIPS_NONE	\*ABS\*
0000000000000114 <fn\+0x114> 003c082d 	daddu	at,at,gp
0000000000000118 <fn\+0x118> dc210000 	ld	at,0\(at\)
			118: R_MIPS_GOT_LO16	dg1
			118: R_MIPS_NONE	\*ABS\*
			118: R_MIPS_NONE	\*ABS\*
000000000000011c <fn\+0x11c> 0031082d 	daddu	at,at,s1
0000000000000120 <fn\+0x120> 8825000[03] 	lwl	a1,[03]\(at\)
0000000000000124 <fn\+0x124> 9825000[03] 	lwr	a1,[03]\(at\)
0000000000000128 <fn\+0x128> 3c010000 	lui	at,0x0
			128: R_MIPS_GOT_HI16	dg1
			128: R_MIPS_NONE	\*ABS\*
			128: R_MIPS_NONE	\*ABS\*
000000000000012c <fn\+0x12c> 003c082d 	daddu	at,at,gp
0000000000000130 <fn\+0x130> dc210000 	ld	at,0\(at\)
			130: R_MIPS_GOT_LO16	dg1
			130: R_MIPS_NONE	\*ABS\*
			130: R_MIPS_NONE	\*ABS\*
0000000000000134 <fn\+0x134> 6421000c 	daddiu	at,at,12
0000000000000138 <fn\+0x138> 0031082d 	daddu	at,at,s1
000000000000013c <fn\+0x13c> 8825000[03] 	lwl	a1,[03]\(at\)
0000000000000140 <fn\+0x140> 9825000[03] 	lwr	a1,[03]\(at\)
0000000000000144 <fn\+0x144> 3c010000 	lui	at,0x0
			144: R_MIPS_GOT_HI16	dg1
			144: R_MIPS_NONE	\*ABS\*
			144: R_MIPS_NONE	\*ABS\*
0000000000000148 <fn\+0x148> 003c082d 	daddu	at,at,gp
000000000000014c <fn\+0x14c> dc210000 	ld	at,0\(at\)
			14c: R_MIPS_GOT_LO16	dg1
			14c: R_MIPS_NONE	\*ABS\*
			14c: R_MIPS_NONE	\*ABS\*
0000000000000150 <fn\+0x150> 64210022 	daddiu	at,at,34
0000000000000154 <fn\+0x154> 0025082d 	daddu	at,at,a1
0000000000000158 <fn\+0x158> 8825000[03] 	lwl	a1,[03]\(at\)
000000000000015c <fn\+0x15c> 9825000[03] 	lwr	a1,[03]\(at\)
0000000000000160 <fn\+0x160> 3c010000 	lui	at,0x0
			160: R_MIPS_GOT_HI16	dg1
			160: R_MIPS_NONE	\*ABS\*
			160: R_MIPS_NONE	\*ABS\*
0000000000000164 <fn\+0x164> 003c082d 	daddu	at,at,gp
0000000000000168 <fn\+0x168> dc210000 	ld	at,0\(at\)
			168: R_MIPS_GOT_LO16	dg1
			168: R_MIPS_NONE	\*ABS\*
			168: R_MIPS_NONE	\*ABS\*
000000000000016c <fn\+0x16c> 64210038 	daddiu	at,at,56
0000000000000170 <fn\+0x170> 0025082d 	daddu	at,at,a1
0000000000000174 <fn\+0x174> a825000[03] 	swl	a1,[03]\(at\)
0000000000000178 <fn\+0x178> b825000[03] 	swr	a1,[03]\(at\)
000000000000017c <fn\+0x17c> df850000 	ld	a1,0\(gp\)
			17c: R_MIPS_GOT_PAGE	\.data\+0x3c
			17c: R_MIPS_NONE	\*ABS\*\+0x3c
			17c: R_MIPS_NONE	\*ABS\*\+0x3c
0000000000000180 <fn\+0x180> 64a50000 	daddiu	a1,a1,0
			180: R_MIPS_GOT_OFST	\.data\+0x3c
			180: R_MIPS_NONE	\*ABS\*\+0x3c
			180: R_MIPS_NONE	\*ABS\*\+0x3c
0000000000000184 <fn\+0x184> df850000 	ld	a1,0\(gp\)
			184: R_MIPS_GOT_PAGE	\.data\+0x48
			184: R_MIPS_NONE	\*ABS\*\+0x48
			184: R_MIPS_NONE	\*ABS\*\+0x48
0000000000000188 <fn\+0x188> 64a50000 	daddiu	a1,a1,0
			188: R_MIPS_GOT_OFST	\.data\+0x48
			188: R_MIPS_NONE	\*ABS\*\+0x48
			188: R_MIPS_NONE	\*ABS\*\+0x48
000000000000018c <fn\+0x18c> df850000 	ld	a1,0\(gp\)
			18c: R_MIPS_GOT_PAGE	\.data\+0x1e27c
			18c: R_MIPS_NONE	\*ABS\*\+0x1e27c
			18c: R_MIPS_NONE	\*ABS\*\+0x1e27c
0000000000000190 <fn\+0x190> 64a50000 	daddiu	a1,a1,0
			190: R_MIPS_GOT_OFST	\.data\+0x1e27c
			190: R_MIPS_NONE	\*ABS\*\+0x1e27c
			190: R_MIPS_NONE	\*ABS\*\+0x1e27c
0000000000000194 <fn\+0x194> df850000 	ld	a1,0\(gp\)
			194: R_MIPS_GOT_PAGE	\.data\+0x3c
			194: R_MIPS_NONE	\*ABS\*\+0x3c
			194: R_MIPS_NONE	\*ABS\*\+0x3c
0000000000000198 <fn\+0x198> 64a50000 	daddiu	a1,a1,0
			198: R_MIPS_GOT_OFST	\.data\+0x3c
			198: R_MIPS_NONE	\*ABS\*\+0x3c
			198: R_MIPS_NONE	\*ABS\*\+0x3c
000000000000019c <fn\+0x19c> 00b1282d 	daddu	a1,a1,s1
00000000000001a0 <fn\+0x1a0> df850000 	ld	a1,0\(gp\)
			1a0: R_MIPS_GOT_PAGE	\.data\+0x48
			1a0: R_MIPS_NONE	\*ABS\*\+0x48
			1a0: R_MIPS_NONE	\*ABS\*\+0x48
00000000000001a4 <fn\+0x1a4> 64a50000 	daddiu	a1,a1,0
			1a4: R_MIPS_GOT_OFST	\.data\+0x48
			1a4: R_MIPS_NONE	\*ABS\*\+0x48
			1a4: R_MIPS_NONE	\*ABS\*\+0x48
00000000000001a8 <fn\+0x1a8> 00b1282d 	daddu	a1,a1,s1
00000000000001ac <fn\+0x1ac> df850000 	ld	a1,0\(gp\)
			1ac: R_MIPS_GOT_PAGE	\.data\+0x1e27c
			1ac: R_MIPS_NONE	\*ABS\*\+0x1e27c
			1ac: R_MIPS_NONE	\*ABS\*\+0x1e27c
00000000000001b0 <fn\+0x1b0> 64a50000 	daddiu	a1,a1,0
			1b0: R_MIPS_GOT_OFST	\.data\+0x1e27c
			1b0: R_MIPS_NONE	\*ABS\*\+0x1e27c
			1b0: R_MIPS_NONE	\*ABS\*\+0x1e27c
00000000000001b4 <fn\+0x1b4> 00b1282d 	daddu	a1,a1,s1
00000000000001b8 <fn\+0x1b8> df850000 	ld	a1,0\(gp\)
			1b8: R_MIPS_GOT_PAGE	\.data\+0x3c
			1b8: R_MIPS_NONE	\*ABS\*\+0x3c
			1b8: R_MIPS_NONE	\*ABS\*\+0x3c
00000000000001bc <fn\+0x1bc> dca50000 	ld	a1,0\(a1\)
			1bc: R_MIPS_GOT_OFST	\.data\+0x3c
			1bc: R_MIPS_NONE	\*ABS\*\+0x3c
			1bc: R_MIPS_NONE	\*ABS\*\+0x3c
00000000000001c0 <fn\+0x1c0> df850000 	ld	a1,0\(gp\)
			1c0: R_MIPS_GOT_PAGE	\.data\+0x48
			1c0: R_MIPS_NONE	\*ABS\*\+0x48
			1c0: R_MIPS_NONE	\*ABS\*\+0x48
00000000000001c4 <fn\+0x1c4> dca50000 	ld	a1,0\(a1\)
			1c4: R_MIPS_GOT_OFST	\.data\+0x48
			1c4: R_MIPS_NONE	\*ABS\*\+0x48
			1c4: R_MIPS_NONE	\*ABS\*\+0x48
00000000000001c8 <fn\+0x1c8> df850000 	ld	a1,0\(gp\)
			1c8: R_MIPS_GOT_PAGE	\.data\+0x3c
			1c8: R_MIPS_NONE	\*ABS\*\+0x3c
			1c8: R_MIPS_NONE	\*ABS\*\+0x3c
00000000000001cc <fn\+0x1cc> 00b1282d 	daddu	a1,a1,s1
00000000000001d0 <fn\+0x1d0> dca50000 	ld	a1,0\(a1\)
			1d0: R_MIPS_GOT_OFST	\.data\+0x3c
			1d0: R_MIPS_NONE	\*ABS\*\+0x3c
			1d0: R_MIPS_NONE	\*ABS\*\+0x3c
00000000000001d4 <fn\+0x1d4> df850000 	ld	a1,0\(gp\)
			1d4: R_MIPS_GOT_PAGE	\.data\+0x48
			1d4: R_MIPS_NONE	\*ABS\*\+0x48
			1d4: R_MIPS_NONE	\*ABS\*\+0x48
00000000000001d8 <fn\+0x1d8> 00b1282d 	daddu	a1,a1,s1
00000000000001dc <fn\+0x1dc> dca50000 	ld	a1,0\(a1\)
			1dc: R_MIPS_GOT_OFST	\.data\+0x48
			1dc: R_MIPS_NONE	\*ABS\*\+0x48
			1dc: R_MIPS_NONE	\*ABS\*\+0x48
00000000000001e0 <fn\+0x1e0> df810000 	ld	at,0\(gp\)
			1e0: R_MIPS_GOT_PAGE	\.data\+0x5e
			1e0: R_MIPS_NONE	\*ABS\*\+0x5e
			1e0: R_MIPS_NONE	\*ABS\*\+0x5e
00000000000001e4 <fn\+0x1e4> 0025082d 	daddu	at,at,a1
00000000000001e8 <fn\+0x1e8> dc250000 	ld	a1,0\(at\)
			1e8: R_MIPS_GOT_OFST	\.data\+0x5e
			1e8: R_MIPS_NONE	\*ABS\*\+0x5e
			1e8: R_MIPS_NONE	\*ABS\*\+0x5e
00000000000001ec <fn\+0x1ec> df810000 	ld	at,0\(gp\)
			1ec: R_MIPS_GOT_PAGE	\.data\+0x74
			1ec: R_MIPS_NONE	\*ABS\*\+0x74
			1ec: R_MIPS_NONE	\*ABS\*\+0x74
00000000000001f0 <fn\+0x1f0> 0025082d 	daddu	at,at,a1
00000000000001f4 <fn\+0x1f4> fc250000 	sd	a1,0\(at\)
			1f4: R_MIPS_GOT_OFST	\.data\+0x74
			1f4: R_MIPS_NONE	\*ABS\*\+0x74
			1f4: R_MIPS_NONE	\*ABS\*\+0x74
00000000000001f8 <fn\+0x1f8> df810000 	ld	at,0\(gp\)
			1f8: R_MIPS_GOT_PAGE	\.data\+0x3c
			1f8: R_MIPS_NONE	\*ABS\*\+0x3c
			1f8: R_MIPS_NONE	\*ABS\*\+0x3c
00000000000001fc <fn\+0x1fc> 64210000 	daddiu	at,at,0
			1fc: R_MIPS_GOT_OFST	\.data\+0x3c
			1fc: R_MIPS_NONE	\*ABS\*\+0x3c
			1fc: R_MIPS_NONE	\*ABS\*\+0x3c
0000000000000200 <fn\+0x200> 8825000[03] 	lwl	a1,[03]\(at\)
0000000000000204 <fn\+0x204> 9825000[03] 	lwr	a1,[03]\(at\)
0000000000000208 <fn\+0x208> df810000 	ld	at,0\(gp\)
			208: R_MIPS_GOT_PAGE	\.data\+0x48
			208: R_MIPS_NONE	\*ABS\*\+0x48
			208: R_MIPS_NONE	\*ABS\*\+0x48
000000000000020c <fn\+0x20c> 64210000 	daddiu	at,at,0
			20c: R_MIPS_GOT_OFST	\.data\+0x48
			20c: R_MIPS_NONE	\*ABS\*\+0x48
			20c: R_MIPS_NONE	\*ABS\*\+0x48
0000000000000210 <fn\+0x210> 8825000[03] 	lwl	a1,[03]\(at\)
0000000000000214 <fn\+0x214> 9825000[03] 	lwr	a1,[03]\(at\)
0000000000000218 <fn\+0x218> df810000 	ld	at,0\(gp\)
			218: R_MIPS_GOT_PAGE	\.data\+0x3c
			218: R_MIPS_NONE	\*ABS\*\+0x3c
			218: R_MIPS_NONE	\*ABS\*\+0x3c
000000000000021c <fn\+0x21c> 64210000 	daddiu	at,at,0
			21c: R_MIPS_GOT_OFST	\.data\+0x3c
			21c: R_MIPS_NONE	\*ABS\*\+0x3c
			21c: R_MIPS_NONE	\*ABS\*\+0x3c
0000000000000220 <fn\+0x220> 0031082d 	daddu	at,at,s1
0000000000000224 <fn\+0x224> 8825000[03] 	lwl	a1,[03]\(at\)
0000000000000228 <fn\+0x228> 9825000[03] 	lwr	a1,[03]\(at\)
000000000000022c <fn\+0x22c> df810000 	ld	at,0\(gp\)
			22c: R_MIPS_GOT_PAGE	\.data\+0x48
			22c: R_MIPS_NONE	\*ABS\*\+0x48
			22c: R_MIPS_NONE	\*ABS\*\+0x48
0000000000000230 <fn\+0x230> 64210000 	daddiu	at,at,0
			230: R_MIPS_GOT_OFST	\.data\+0x48
			230: R_MIPS_NONE	\*ABS\*\+0x48
			230: R_MIPS_NONE	\*ABS\*\+0x48
0000000000000234 <fn\+0x234> 0031082d 	daddu	at,at,s1
0000000000000238 <fn\+0x238> 8825000[03] 	lwl	a1,[03]\(at\)
000000000000023c <fn\+0x23c> 9825000[03] 	lwr	a1,[03]\(at\)
0000000000000240 <fn\+0x240> df810000 	ld	at,0\(gp\)
			240: R_MIPS_GOT_PAGE	\.data\+0x5e
			240: R_MIPS_NONE	\*ABS\*\+0x5e
			240: R_MIPS_NONE	\*ABS\*\+0x5e
0000000000000244 <fn\+0x244> 64210000 	daddiu	at,at,0
			244: R_MIPS_GOT_OFST	\.data\+0x5e
			244: R_MIPS_NONE	\*ABS\*\+0x5e
			244: R_MIPS_NONE	\*ABS\*\+0x5e
0000000000000248 <fn\+0x248> 0025082d 	daddu	at,at,a1
000000000000024c <fn\+0x24c> 8825000[03] 	lwl	a1,[03]\(at\)
0000000000000250 <fn\+0x250> 9825000[03] 	lwr	a1,[03]\(at\)
0000000000000254 <fn\+0x254> df810000 	ld	at,0\(gp\)
			254: R_MIPS_GOT_PAGE	\.data\+0x74
			254: R_MIPS_NONE	\*ABS\*\+0x74
			254: R_MIPS_NONE	\*ABS\*\+0x74
0000000000000258 <fn\+0x258> 64210000 	daddiu	at,at,0
			258: R_MIPS_GOT_OFST	\.data\+0x74
			258: R_MIPS_NONE	\*ABS\*\+0x74
			258: R_MIPS_NONE	\*ABS\*\+0x74
000000000000025c <fn\+0x25c> 0025082d 	daddu	at,at,a1
0000000000000260 <fn\+0x260> a825000[03] 	swl	a1,[03]\(at\)
0000000000000264 <fn\+0x264> b825000[03] 	swr	a1,[03]\(at\)
0000000000000268 <fn\+0x268> 3c050000 	lui	a1,0x0
			268: R_MIPS_GOT_HI16	fn
			268: R_MIPS_NONE	\*ABS\*
			268: R_MIPS_NONE	\*ABS\*
000000000000026c <fn\+0x26c> 00bc282d 	daddu	a1,a1,gp
0000000000000270 <fn\+0x270> dca50000 	ld	a1,0\(a1\)
			270: R_MIPS_GOT_LO16	fn
			270: R_MIPS_NONE	\*ABS\*
			270: R_MIPS_NONE	\*ABS\*
0000000000000274 <fn\+0x274> df850000 	ld	a1,0\(gp\)
			274: R_MIPS_GOT_PAGE	\.text
			274: R_MIPS_NONE	\*ABS\*
			274: R_MIPS_NONE	\*ABS\*
0000000000000278 <fn\+0x278> 64a50000 	daddiu	a1,a1,0
			278: R_MIPS_GOT_OFST	\.text
			278: R_MIPS_NONE	\*ABS\*
			278: R_MIPS_NONE	\*ABS\*
000000000000027c <fn\+0x27c> 3c190000 	lui	t9,0x0
			27c: R_MIPS_CALL_HI16	fn
			27c: R_MIPS_NONE	\*ABS\*
			27c: R_MIPS_NONE	\*ABS\*
0000000000000280 <fn\+0x280> 033cc82d 	daddu	t9,t9,gp
0000000000000284 <fn\+0x284> df390000 	ld	t9,0\(t9\)
			284: R_MIPS_CALL_LO16	fn
			284: R_MIPS_NONE	\*ABS\*
			284: R_MIPS_NONE	\*ABS\*
0000000000000288 <fn\+0x288> df990000 	ld	t9,0\(gp\)
			288: R_MIPS_GOT_PAGE	\.text
			288: R_MIPS_NONE	\*ABS\*
			288: R_MIPS_NONE	\*ABS\*
000000000000028c <fn\+0x28c> 67390000 	daddiu	t9,t9,0
			28c: R_MIPS_GOT_OFST	\.text
			28c: R_MIPS_NONE	\*ABS\*
			28c: R_MIPS_NONE	\*ABS\*
0000000000000290 <fn\+0x290> 3c190000 	lui	t9,0x0
			290: R_MIPS_CALL_HI16	fn
			290: R_MIPS_NONE	\*ABS\*
			290: R_MIPS_NONE	\*ABS\*
0000000000000294 <fn\+0x294> 033cc82d 	daddu	t9,t9,gp
0000000000000298 <fn\+0x298> df390000 	ld	t9,0\(t9\)
			298: R_MIPS_CALL_LO16	fn
			298: R_MIPS_NONE	\*ABS\*
			298: R_MIPS_NONE	\*ABS\*
000000000000029c <fn\+0x29c> 0320f809 	jalr	t9
			29c: R_MIPS_JALR	fn
			29c: R_MIPS_NONE	\*ABS\*
			29c: R_MIPS_NONE	\*ABS\*
00000000000002a0 <fn\+0x2a0> 00000000 	nop
00000000000002a4 <fn\+0x2a4> df990000 	ld	t9,0\(gp\)
			2a4: R_MIPS_GOT_PAGE	\.text
			2a4: R_MIPS_NONE	\*ABS\*
			2a4: R_MIPS_NONE	\*ABS\*
00000000000002a8 <fn\+0x2a8> 67390000 	daddiu	t9,t9,0
			2a8: R_MIPS_GOT_OFST	\.text
			2a8: R_MIPS_NONE	\*ABS\*
			2a8: R_MIPS_NONE	\*ABS\*
00000000000002ac <fn\+0x2ac> 0320f809 	jalr	t9
			2ac: R_MIPS_JALR	\.text
			2ac: R_MIPS_NONE	\*ABS\*
			2ac: R_MIPS_NONE	\*ABS\*
00000000000002b0 <fn\+0x2b0> 00000000 	nop
00000000000002b4 <fn\+0x2b4> 3c050000 	lui	a1,0x0
			2b4: R_MIPS_GOT_HI16	dg2
			2b4: R_MIPS_NONE	\*ABS\*
			2b4: R_MIPS_NONE	\*ABS\*
00000000000002b8 <fn\+0x2b8> 00bc282d 	daddu	a1,a1,gp
00000000000002bc <fn\+0x2bc> dca50000 	ld	a1,0\(a1\)
			2bc: R_MIPS_GOT_LO16	dg2
			2bc: R_MIPS_NONE	\*ABS\*
			2bc: R_MIPS_NONE	\*ABS\*
00000000000002c0 <fn\+0x2c0> 3c050000 	lui	a1,0x0
			2c0: R_MIPS_GOT_HI16	dg2
			2c0: R_MIPS_NONE	\*ABS\*
			2c0: R_MIPS_NONE	\*ABS\*
00000000000002c4 <fn\+0x2c4> 00bc282d 	daddu	a1,a1,gp
00000000000002c8 <fn\+0x2c8> dca50000 	ld	a1,0\(a1\)
			2c8: R_MIPS_GOT_LO16	dg2
			2c8: R_MIPS_NONE	\*ABS\*
			2c8: R_MIPS_NONE	\*ABS\*
00000000000002cc <fn\+0x2cc> 64a5000c 	daddiu	a1,a1,12
00000000000002d0 <fn\+0x2d0> 3c050000 	lui	a1,0x0
			2d0: R_MIPS_GOT_HI16	dg2
			2d0: R_MIPS_NONE	\*ABS\*
			2d0: R_MIPS_NONE	\*ABS\*
00000000000002d4 <fn\+0x2d4> 00bc282d 	daddu	a1,a1,gp
00000000000002d8 <fn\+0x2d8> dca50000 	ld	a1,0\(a1\)
			2d8: R_MIPS_GOT_LO16	dg2
			2d8: R_MIPS_NONE	\*ABS\*
			2d8: R_MIPS_NONE	\*ABS\*
00000000000002dc <fn\+0x2dc> 3c010001 	lui	at,0x1
00000000000002e0 <fn\+0x2e0> 3421e240 	ori	at,at,0xe240
00000000000002e4 <fn\+0x2e4> 00a1282d 	daddu	a1,a1,at
00000000000002e8 <fn\+0x2e8> 3c050000 	lui	a1,0x0
			2e8: R_MIPS_GOT_HI16	dg2
			2e8: R_MIPS_NONE	\*ABS\*
			2e8: R_MIPS_NONE	\*ABS\*
00000000000002ec <fn\+0x2ec> 00bc282d 	daddu	a1,a1,gp
00000000000002f0 <fn\+0x2f0> dca50000 	ld	a1,0\(a1\)
			2f0: R_MIPS_GOT_LO16	dg2
			2f0: R_MIPS_NONE	\*ABS\*
			2f0: R_MIPS_NONE	\*ABS\*
00000000000002f4 <fn\+0x2f4> 00b1282d 	daddu	a1,a1,s1
00000000000002f8 <fn\+0x2f8> 3c050000 	lui	a1,0x0
			2f8: R_MIPS_GOT_HI16	dg2
			2f8: R_MIPS_NONE	\*ABS\*
			2f8: R_MIPS_NONE	\*ABS\*
00000000000002fc <fn\+0x2fc> 00bc282d 	daddu	a1,a1,gp
0000000000000300 <fn\+0x300> dca50000 	ld	a1,0\(a1\)
			300: R_MIPS_GOT_LO16	dg2
			300: R_MIPS_NONE	\*ABS\*
			300: R_MIPS_NONE	\*ABS\*
0000000000000304 <fn\+0x304> 64a5000c 	daddiu	a1,a1,12
0000000000000308 <fn\+0x308> 00b1282d 	daddu	a1,a1,s1
000000000000030c <fn\+0x30c> 3c050000 	lui	a1,0x0
			30c: R_MIPS_GOT_HI16	dg2
			30c: R_MIPS_NONE	\*ABS\*
			30c: R_MIPS_NONE	\*ABS\*
0000000000000310 <fn\+0x310> 00bc282d 	daddu	a1,a1,gp
0000000000000314 <fn\+0x314> dca50000 	ld	a1,0\(a1\)
			314: R_MIPS_GOT_LO16	dg2
			314: R_MIPS_NONE	\*ABS\*
			314: R_MIPS_NONE	\*ABS\*
0000000000000318 <fn\+0x318> 3c010001 	lui	at,0x1
000000000000031c <fn\+0x31c> 3421e240 	ori	at,at,0xe240
0000000000000320 <fn\+0x320> 00a1282d 	daddu	a1,a1,at
0000000000000324 <fn\+0x324> 00b1282d 	daddu	a1,a1,s1
0000000000000328 <fn\+0x328> 3c050000 	lui	a1,0x0
			328: R_MIPS_GOT_HI16	dg2
			328: R_MIPS_NONE	\*ABS\*
			328: R_MIPS_NONE	\*ABS\*
000000000000032c <fn\+0x32c> 00bc282d 	daddu	a1,a1,gp
0000000000000330 <fn\+0x330> dca50000 	ld	a1,0\(a1\)
			330: R_MIPS_GOT_LO16	dg2
			330: R_MIPS_NONE	\*ABS\*
			330: R_MIPS_NONE	\*ABS\*
0000000000000334 <fn\+0x334> dca50000 	ld	a1,0\(a1\)
0000000000000338 <fn\+0x338> 3c050000 	lui	a1,0x0
			338: R_MIPS_GOT_HI16	dg2
			338: R_MIPS_NONE	\*ABS\*
			338: R_MIPS_NONE	\*ABS\*
000000000000033c <fn\+0x33c> 00bc282d 	daddu	a1,a1,gp
0000000000000340 <fn\+0x340> dca50000 	ld	a1,0\(a1\)
			340: R_MIPS_GOT_LO16	dg2
			340: R_MIPS_NONE	\*ABS\*
			340: R_MIPS_NONE	\*ABS\*
0000000000000344 <fn\+0x344> dca5000c 	ld	a1,12\(a1\)
0000000000000348 <fn\+0x348> 3c050000 	lui	a1,0x0
			348: R_MIPS_GOT_HI16	dg2
			348: R_MIPS_NONE	\*ABS\*
			348: R_MIPS_NONE	\*ABS\*
000000000000034c <fn\+0x34c> 00bc282d 	daddu	a1,a1,gp
0000000000000350 <fn\+0x350> dca50000 	ld	a1,0\(a1\)
			350: R_MIPS_GOT_LO16	dg2
			350: R_MIPS_NONE	\*ABS\*
			350: R_MIPS_NONE	\*ABS\*
0000000000000354 <fn\+0x354> 00b1282d 	daddu	a1,a1,s1
0000000000000358 <fn\+0x358> dca50000 	ld	a1,0\(a1\)
000000000000035c <fn\+0x35c> 3c050000 	lui	a1,0x0
			35c: R_MIPS_GOT_HI16	dg2
			35c: R_MIPS_NONE	\*ABS\*
			35c: R_MIPS_NONE	\*ABS\*
0000000000000360 <fn\+0x360> 00bc282d 	daddu	a1,a1,gp
0000000000000364 <fn\+0x364> dca50000 	ld	a1,0\(a1\)
			364: R_MIPS_GOT_LO16	dg2
			364: R_MIPS_NONE	\*ABS\*
			364: R_MIPS_NONE	\*ABS\*
0000000000000368 <fn\+0x368> 00b1282d 	daddu	a1,a1,s1
000000000000036c <fn\+0x36c> dca5000c 	ld	a1,12\(a1\)
0000000000000370 <fn\+0x370> 3c010000 	lui	at,0x0
			370: R_MIPS_GOT_HI16	dg2
			370: R_MIPS_NONE	\*ABS\*
			370: R_MIPS_NONE	\*ABS\*
0000000000000374 <fn\+0x374> 003c082d 	daddu	at,at,gp
0000000000000378 <fn\+0x378> dc210000 	ld	at,0\(at\)
			378: R_MIPS_GOT_LO16	dg2
			378: R_MIPS_NONE	\*ABS\*
			378: R_MIPS_NONE	\*ABS\*
000000000000037c <fn\+0x37c> 0025082d 	daddu	at,at,a1
0000000000000380 <fn\+0x380> dc250022 	ld	a1,34\(at\)
0000000000000384 <fn\+0x384> 3c010000 	lui	at,0x0
			384: R_MIPS_GOT_HI16	dg2
			384: R_MIPS_NONE	\*ABS\*
			384: R_MIPS_NONE	\*ABS\*
0000000000000388 <fn\+0x388> 003c082d 	daddu	at,at,gp
000000000000038c <fn\+0x38c> dc210000 	ld	at,0\(at\)
			38c: R_MIPS_GOT_LO16	dg2
			38c: R_MIPS_NONE	\*ABS\*
			38c: R_MIPS_NONE	\*ABS\*
0000000000000390 <fn\+0x390> 0025082d 	daddu	at,at,a1
0000000000000394 <fn\+0x394> fc250038 	sd	a1,56\(at\)
0000000000000398 <fn\+0x398> 3c010000 	lui	at,0x0
			398: R_MIPS_GOT_HI16	dg2
			398: R_MIPS_NONE	\*ABS\*
			398: R_MIPS_NONE	\*ABS\*
000000000000039c <fn\+0x39c> 003c082d 	daddu	at,at,gp
00000000000003a0 <fn\+0x3a0> dc210000 	ld	at,0\(at\)
			3a0: R_MIPS_GOT_LO16	dg2
			3a0: R_MIPS_NONE	\*ABS\*
			3a0: R_MIPS_NONE	\*ABS\*
00000000000003a4 <fn\+0x3a4> 8825000[03] 	lwl	a1,[03]\(at\)
00000000000003a8 <fn\+0x3a8> 9825000[03] 	lwr	a1,[03]\(at\)
00000000000003ac <fn\+0x3ac> 3c010000 	lui	at,0x0
			3ac: R_MIPS_GOT_HI16	dg2
			3ac: R_MIPS_NONE	\*ABS\*
			3ac: R_MIPS_NONE	\*ABS\*
00000000000003b0 <fn\+0x3b0> 003c082d 	daddu	at,at,gp
00000000000003b4 <fn\+0x3b4> dc210000 	ld	at,0\(at\)
			3b4: R_MIPS_GOT_LO16	dg2
			3b4: R_MIPS_NONE	\*ABS\*
			3b4: R_MIPS_NONE	\*ABS\*
00000000000003b8 <fn\+0x3b8> 6421000c 	daddiu	at,at,12
00000000000003bc <fn\+0x3bc> 8825000[03] 	lwl	a1,[03]\(at\)
00000000000003c0 <fn\+0x3c0> 9825000[03] 	lwr	a1,[03]\(at\)
00000000000003c4 <fn\+0x3c4> 3c010000 	lui	at,0x0
			3c4: R_MIPS_GOT_HI16	dg2
			3c4: R_MIPS_NONE	\*ABS\*
			3c4: R_MIPS_NONE	\*ABS\*
00000000000003c8 <fn\+0x3c8> 003c082d 	daddu	at,at,gp
00000000000003cc <fn\+0x3cc> dc210000 	ld	at,0\(at\)
			3cc: R_MIPS_GOT_LO16	dg2
			3cc: R_MIPS_NONE	\*ABS\*
			3cc: R_MIPS_NONE	\*ABS\*
00000000000003d0 <fn\+0x3d0> 0031082d 	daddu	at,at,s1
00000000000003d4 <fn\+0x3d4> 8825000[03] 	lwl	a1,[03]\(at\)
00000000000003d8 <fn\+0x3d8> 9825000[03] 	lwr	a1,[03]\(at\)
00000000000003dc <fn\+0x3dc> 3c010000 	lui	at,0x0
			3dc: R_MIPS_GOT_HI16	dg2
			3dc: R_MIPS_NONE	\*ABS\*
			3dc: R_MIPS_NONE	\*ABS\*
00000000000003e0 <fn\+0x3e0> 003c082d 	daddu	at,at,gp
00000000000003e4 <fn\+0x3e4> dc210000 	ld	at,0\(at\)
			3e4: R_MIPS_GOT_LO16	dg2
			3e4: R_MIPS_NONE	\*ABS\*
			3e4: R_MIPS_NONE	\*ABS\*
00000000000003e8 <fn\+0x3e8> 6421000c 	daddiu	at,at,12
00000000000003ec <fn\+0x3ec> 0031082d 	daddu	at,at,s1
00000000000003f0 <fn\+0x3f0> 8825000[03] 	lwl	a1,[03]\(at\)
00000000000003f4 <fn\+0x3f4> 9825000[03] 	lwr	a1,[03]\(at\)
00000000000003f8 <fn\+0x3f8> 3c010000 	lui	at,0x0
			3f8: R_MIPS_GOT_HI16	dg2
			3f8: R_MIPS_NONE	\*ABS\*
			3f8: R_MIPS_NONE	\*ABS\*
00000000000003fc <fn\+0x3fc> 003c082d 	daddu	at,at,gp
0000000000000400 <fn\+0x400> dc210000 	ld	at,0\(at\)
			400: R_MIPS_GOT_LO16	dg2
			400: R_MIPS_NONE	\*ABS\*
			400: R_MIPS_NONE	\*ABS\*
0000000000000404 <fn\+0x404> 64210022 	daddiu	at,at,34
0000000000000408 <fn\+0x408> 0025082d 	daddu	at,at,a1
000000000000040c <fn\+0x40c> 8825000[03] 	lwl	a1,[03]\(at\)
0000000000000410 <fn\+0x410> 9825000[03] 	lwr	a1,[03]\(at\)
0000000000000414 <fn\+0x414> 3c010000 	lui	at,0x0
			414: R_MIPS_GOT_HI16	dg2
			414: R_MIPS_NONE	\*ABS\*
			414: R_MIPS_NONE	\*ABS\*
0000000000000418 <fn\+0x418> 003c082d 	daddu	at,at,gp
000000000000041c <fn\+0x41c> dc210000 	ld	at,0\(at\)
			41c: R_MIPS_GOT_LO16	dg2
			41c: R_MIPS_NONE	\*ABS\*
			41c: R_MIPS_NONE	\*ABS\*
0000000000000420 <fn\+0x420> 64210038 	daddiu	at,at,56
0000000000000424 <fn\+0x424> 0025082d 	daddu	at,at,a1
0000000000000428 <fn\+0x428> a825000[03] 	swl	a1,[03]\(at\)
000000000000042c <fn\+0x42c> b825000[03] 	swr	a1,[03]\(at\)
0000000000000430 <fn\+0x430> df850000 	ld	a1,0\(gp\)
			430: R_MIPS_GOT_PAGE	\.data\+0xb4
			430: R_MIPS_NONE	\*ABS\*\+0xb4
			430: R_MIPS_NONE	\*ABS\*\+0xb4
0000000000000434 <fn\+0x434> 64a50000 	daddiu	a1,a1,0
			434: R_MIPS_GOT_OFST	\.data\+0xb4
			434: R_MIPS_NONE	\*ABS\*\+0xb4
			434: R_MIPS_NONE	\*ABS\*\+0xb4
0000000000000438 <fn\+0x438> df850000 	ld	a1,0\(gp\)
			438: R_MIPS_GOT_PAGE	\.data\+0xc0
			438: R_MIPS_NONE	\*ABS\*\+0xc0
			438: R_MIPS_NONE	\*ABS\*\+0xc0
000000000000043c <fn\+0x43c> 64a50000 	daddiu	a1,a1,0
			43c: R_MIPS_GOT_OFST	\.data\+0xc0
			43c: R_MIPS_NONE	\*ABS\*\+0xc0
			43c: R_MIPS_NONE	\*ABS\*\+0xc0
0000000000000440 <fn\+0x440> df850000 	ld	a1,0\(gp\)
			440: R_MIPS_GOT_PAGE	\.data\+0x1e2f4
			440: R_MIPS_NONE	\*ABS\*\+0x1e2f4
			440: R_MIPS_NONE	\*ABS\*\+0x1e2f4
0000000000000444 <fn\+0x444> 64a50000 	daddiu	a1,a1,0
			444: R_MIPS_GOT_OFST	\.data\+0x1e2f4
			444: R_MIPS_NONE	\*ABS\*\+0x1e2f4
			444: R_MIPS_NONE	\*ABS\*\+0x1e2f4
0000000000000448 <fn\+0x448> df850000 	ld	a1,0\(gp\)
			448: R_MIPS_GOT_PAGE	\.data\+0xb4
			448: R_MIPS_NONE	\*ABS\*\+0xb4
			448: R_MIPS_NONE	\*ABS\*\+0xb4
000000000000044c <fn\+0x44c> 64a50000 	daddiu	a1,a1,0
			44c: R_MIPS_GOT_OFST	\.data\+0xb4
			44c: R_MIPS_NONE	\*ABS\*\+0xb4
			44c: R_MIPS_NONE	\*ABS\*\+0xb4
0000000000000450 <fn\+0x450> 00b1282d 	daddu	a1,a1,s1
0000000000000454 <fn\+0x454> df850000 	ld	a1,0\(gp\)
			454: R_MIPS_GOT_PAGE	\.data\+0xc0
			454: R_MIPS_NONE	\*ABS\*\+0xc0
			454: R_MIPS_NONE	\*ABS\*\+0xc0
0000000000000458 <fn\+0x458> 64a50000 	daddiu	a1,a1,0
			458: R_MIPS_GOT_OFST	\.data\+0xc0
			458: R_MIPS_NONE	\*ABS\*\+0xc0
			458: R_MIPS_NONE	\*ABS\*\+0xc0
000000000000045c <fn\+0x45c> 00b1282d 	daddu	a1,a1,s1
0000000000000460 <fn\+0x460> df850000 	ld	a1,0\(gp\)
			460: R_MIPS_GOT_PAGE	\.data\+0x1e2f4
			460: R_MIPS_NONE	\*ABS\*\+0x1e2f4
			460: R_MIPS_NONE	\*ABS\*\+0x1e2f4
0000000000000464 <fn\+0x464> 64a50000 	daddiu	a1,a1,0
			464: R_MIPS_GOT_OFST	\.data\+0x1e2f4
			464: R_MIPS_NONE	\*ABS\*\+0x1e2f4
			464: R_MIPS_NONE	\*ABS\*\+0x1e2f4
0000000000000468 <fn\+0x468> 00b1282d 	daddu	a1,a1,s1
000000000000046c <fn\+0x46c> df850000 	ld	a1,0\(gp\)
			46c: R_MIPS_GOT_PAGE	\.data\+0xb4
			46c: R_MIPS_NONE	\*ABS\*\+0xb4
			46c: R_MIPS_NONE	\*ABS\*\+0xb4
0000000000000470 <fn\+0x470> dca50000 	ld	a1,0\(a1\)
			470: R_MIPS_GOT_OFST	\.data\+0xb4
			470: R_MIPS_NONE	\*ABS\*\+0xb4
			470: R_MIPS_NONE	\*ABS\*\+0xb4
0000000000000474 <fn\+0x474> df850000 	ld	a1,0\(gp\)
			474: R_MIPS_GOT_PAGE	\.data\+0xc0
			474: R_MIPS_NONE	\*ABS\*\+0xc0
			474: R_MIPS_NONE	\*ABS\*\+0xc0
0000000000000478 <fn\+0x478> dca50000 	ld	a1,0\(a1\)
			478: R_MIPS_GOT_OFST	\.data\+0xc0
			478: R_MIPS_NONE	\*ABS\*\+0xc0
			478: R_MIPS_NONE	\*ABS\*\+0xc0
000000000000047c <fn\+0x47c> df850000 	ld	a1,0\(gp\)
			47c: R_MIPS_GOT_PAGE	\.data\+0xb4
			47c: R_MIPS_NONE	\*ABS\*\+0xb4
			47c: R_MIPS_NONE	\*ABS\*\+0xb4
0000000000000480 <fn\+0x480> 00b1282d 	daddu	a1,a1,s1
0000000000000484 <fn\+0x484> dca50000 	ld	a1,0\(a1\)
			484: R_MIPS_GOT_OFST	\.data\+0xb4
			484: R_MIPS_NONE	\*ABS\*\+0xb4
			484: R_MIPS_NONE	\*ABS\*\+0xb4
0000000000000488 <fn\+0x488> df850000 	ld	a1,0\(gp\)
			488: R_MIPS_GOT_PAGE	\.data\+0xc0
			488: R_MIPS_NONE	\*ABS\*\+0xc0
			488: R_MIPS_NONE	\*ABS\*\+0xc0
000000000000048c <fn\+0x48c> 00b1282d 	daddu	a1,a1,s1
0000000000000490 <fn\+0x490> dca50000 	ld	a1,0\(a1\)
			490: R_MIPS_GOT_OFST	\.data\+0xc0
			490: R_MIPS_NONE	\*ABS\*\+0xc0
			490: R_MIPS_NONE	\*ABS\*\+0xc0
0000000000000494 <fn\+0x494> df810000 	ld	at,0\(gp\)
			494: R_MIPS_GOT_PAGE	\.data\+0xd6
			494: R_MIPS_NONE	\*ABS\*\+0xd6
			494: R_MIPS_NONE	\*ABS\*\+0xd6
0000000000000498 <fn\+0x498> 0025082d 	daddu	at,at,a1
000000000000049c <fn\+0x49c> dc250000 	ld	a1,0\(at\)
			49c: R_MIPS_GOT_OFST	\.data\+0xd6
			49c: R_MIPS_NONE	\*ABS\*\+0xd6
			49c: R_MIPS_NONE	\*ABS\*\+0xd6
00000000000004a0 <fn\+0x4a0> df810000 	ld	at,0\(gp\)
			4a0: R_MIPS_GOT_PAGE	\.data\+0xec
			4a0: R_MIPS_NONE	\*ABS\*\+0xec
			4a0: R_MIPS_NONE	\*ABS\*\+0xec
00000000000004a4 <fn\+0x4a4> 0025082d 	daddu	at,at,a1
00000000000004a8 <fn\+0x4a8> fc250000 	sd	a1,0\(at\)
			4a8: R_MIPS_GOT_OFST	\.data\+0xec
			4a8: R_MIPS_NONE	\*ABS\*\+0xec
			4a8: R_MIPS_NONE	\*ABS\*\+0xec
00000000000004ac <fn\+0x4ac> df810000 	ld	at,0\(gp\)
			4ac: R_MIPS_GOT_PAGE	\.data\+0xb4
			4ac: R_MIPS_NONE	\*ABS\*\+0xb4
			4ac: R_MIPS_NONE	\*ABS\*\+0xb4
00000000000004b0 <fn\+0x4b0> 64210000 	daddiu	at,at,0
			4b0: R_MIPS_GOT_OFST	\.data\+0xb4
			4b0: R_MIPS_NONE	\*ABS\*\+0xb4
			4b0: R_MIPS_NONE	\*ABS\*\+0xb4
00000000000004b4 <fn\+0x4b4> 8825000[03] 	lwl	a1,[03]\(at\)
00000000000004b8 <fn\+0x4b8> 9825000[03] 	lwr	a1,[03]\(at\)
00000000000004bc <fn\+0x4bc> df810000 	ld	at,0\(gp\)
			4bc: R_MIPS_GOT_PAGE	\.data\+0xc0
			4bc: R_MIPS_NONE	\*ABS\*\+0xc0
			4bc: R_MIPS_NONE	\*ABS\*\+0xc0
00000000000004c0 <fn\+0x4c0> 64210000 	daddiu	at,at,0
			4c0: R_MIPS_GOT_OFST	\.data\+0xc0
			4c0: R_MIPS_NONE	\*ABS\*\+0xc0
			4c0: R_MIPS_NONE	\*ABS\*\+0xc0
00000000000004c4 <fn\+0x4c4> 8825000[03] 	lwl	a1,[03]\(at\)
00000000000004c8 <fn\+0x4c8> 9825000[03] 	lwr	a1,[03]\(at\)
00000000000004cc <fn\+0x4cc> df810000 	ld	at,0\(gp\)
			4cc: R_MIPS_GOT_PAGE	\.data\+0xb4
			4cc: R_MIPS_NONE	\*ABS\*\+0xb4
			4cc: R_MIPS_NONE	\*ABS\*\+0xb4
00000000000004d0 <fn\+0x4d0> 64210000 	daddiu	at,at,0
			4d0: R_MIPS_GOT_OFST	\.data\+0xb4
			4d0: R_MIPS_NONE	\*ABS\*\+0xb4
			4d0: R_MIPS_NONE	\*ABS\*\+0xb4
00000000000004d4 <fn\+0x4d4> 0031082d 	daddu	at,at,s1
00000000000004d8 <fn\+0x4d8> 8825000[03] 	lwl	a1,[03]\(at\)
00000000000004dc <fn\+0x4dc> 9825000[03] 	lwr	a1,[03]\(at\)
00000000000004e0 <fn\+0x4e0> df810000 	ld	at,0\(gp\)
			4e0: R_MIPS_GOT_PAGE	\.data\+0xc0
			4e0: R_MIPS_NONE	\*ABS\*\+0xc0
			4e0: R_MIPS_NONE	\*ABS\*\+0xc0
00000000000004e4 <fn\+0x4e4> 64210000 	daddiu	at,at,0
			4e4: R_MIPS_GOT_OFST	\.data\+0xc0
			4e4: R_MIPS_NONE	\*ABS\*\+0xc0
			4e4: R_MIPS_NONE	\*ABS\*\+0xc0
00000000000004e8 <fn\+0x4e8> 0031082d 	daddu	at,at,s1
00000000000004ec <fn\+0x4ec> 8825000[03] 	lwl	a1,[03]\(at\)
00000000000004f0 <fn\+0x4f0> 9825000[03] 	lwr	a1,[03]\(at\)
00000000000004f4 <fn\+0x4f4> df810000 	ld	at,0\(gp\)
			4f4: R_MIPS_GOT_PAGE	\.data\+0xd6
			4f4: R_MIPS_NONE	\*ABS\*\+0xd6
			4f4: R_MIPS_NONE	\*ABS\*\+0xd6
00000000000004f8 <fn\+0x4f8> 64210000 	daddiu	at,at,0
			4f8: R_MIPS_GOT_OFST	\.data\+0xd6
			4f8: R_MIPS_NONE	\*ABS\*\+0xd6
			4f8: R_MIPS_NONE	\*ABS\*\+0xd6
00000000000004fc <fn\+0x4fc> 0025082d 	daddu	at,at,a1
0000000000000500 <fn\+0x500> 8825000[03] 	lwl	a1,[03]\(at\)
0000000000000504 <fn\+0x504> 9825000[03] 	lwr	a1,[03]\(at\)
0000000000000508 <fn\+0x508> df810000 	ld	at,0\(gp\)
			508: R_MIPS_GOT_PAGE	\.data\+0xec
			508: R_MIPS_NONE	\*ABS\*\+0xec
			508: R_MIPS_NONE	\*ABS\*\+0xec
000000000000050c <fn\+0x50c> 64210000 	daddiu	at,at,0
			50c: R_MIPS_GOT_OFST	\.data\+0xec
			50c: R_MIPS_NONE	\*ABS\*\+0xec
			50c: R_MIPS_NONE	\*ABS\*\+0xec
0000000000000510 <fn\+0x510> 0025082d 	daddu	at,at,a1
0000000000000514 <fn\+0x514> a825000[03] 	swl	a1,[03]\(at\)
0000000000000518 <fn\+0x518> b825000[03] 	swr	a1,[03]\(at\)
000000000000051c <fn\+0x51c> 3c050000 	lui	a1,0x0
			51c: R_MIPS_GOT_HI16	fn2
			51c: R_MIPS_NONE	\*ABS\*
			51c: R_MIPS_NONE	\*ABS\*
0000000000000520 <fn\+0x520> 00bc282d 	daddu	a1,a1,gp
0000000000000524 <fn\+0x524> dca50000 	ld	a1,0\(a1\)
			524: R_MIPS_GOT_LO16	fn2
			524: R_MIPS_NONE	\*ABS\*
			524: R_MIPS_NONE	\*ABS\*
0000000000000528 <fn\+0x528> df850000 	ld	a1,0\(gp\)
			528: R_MIPS_GOT_PAGE	\.text\+0x600
			528: R_MIPS_NONE	\*ABS\*\+0x600
			528: R_MIPS_NONE	\*ABS\*\+0x600
000000000000052c <fn\+0x52c> 64a50000 	daddiu	a1,a1,0
			52c: R_MIPS_GOT_OFST	\.text\+0x600
			52c: R_MIPS_NONE	\*ABS\*\+0x600
			52c: R_MIPS_NONE	\*ABS\*\+0x600
0000000000000530 <fn\+0x530> 3c190000 	lui	t9,0x0
			530: R_MIPS_CALL_HI16	fn2
			530: R_MIPS_NONE	\*ABS\*
			530: R_MIPS_NONE	\*ABS\*
0000000000000534 <fn\+0x534> 033cc82d 	daddu	t9,t9,gp
0000000000000538 <fn\+0x538> df390000 	ld	t9,0\(t9\)
			538: R_MIPS_CALL_LO16	fn2
			538: R_MIPS_NONE	\*ABS\*
			538: R_MIPS_NONE	\*ABS\*
000000000000053c <fn\+0x53c> df990000 	ld	t9,0\(gp\)
			53c: R_MIPS_GOT_PAGE	\.text\+0x600
			53c: R_MIPS_NONE	\*ABS\*\+0x600
			53c: R_MIPS_NONE	\*ABS\*\+0x600
0000000000000540 <fn\+0x540> 67390000 	daddiu	t9,t9,0
			540: R_MIPS_GOT_OFST	\.text\+0x600
			540: R_MIPS_NONE	\*ABS\*\+0x600
			540: R_MIPS_NONE	\*ABS\*\+0x600
0000000000000544 <fn\+0x544> 3c190000 	lui	t9,0x0
			544: R_MIPS_CALL_HI16	fn2
			544: R_MIPS_NONE	\*ABS\*
			544: R_MIPS_NONE	\*ABS\*
0000000000000548 <fn\+0x548> 033cc82d 	daddu	t9,t9,gp
000000000000054c <fn\+0x54c> df390000 	ld	t9,0\(t9\)
			54c: R_MIPS_CALL_LO16	fn2
			54c: R_MIPS_NONE	\*ABS\*
			54c: R_MIPS_NONE	\*ABS\*
0000000000000550 <fn\+0x550> 0320f809 	jalr	t9
			550: R_MIPS_JALR	fn2
			550: R_MIPS_NONE	\*ABS\*
			550: R_MIPS_NONE	\*ABS\*
0000000000000554 <fn\+0x554> 00000000 	nop
0000000000000558 <fn\+0x558> df990000 	ld	t9,0\(gp\)
			558: R_MIPS_GOT_PAGE	\.text\+0x600
			558: R_MIPS_NONE	\*ABS\*\+0x600
			558: R_MIPS_NONE	\*ABS\*\+0x600
000000000000055c <fn\+0x55c> 67390000 	daddiu	t9,t9,0
			55c: R_MIPS_GOT_OFST	\.text\+0x600
			55c: R_MIPS_NONE	\*ABS\*\+0x600
			55c: R_MIPS_NONE	\*ABS\*\+0x600
0000000000000560 <fn\+0x560> 0320f809 	jalr	t9
			560: R_MIPS_JALR	\.text\+0x600
			560: R_MIPS_NONE	\*ABS\*\+0x600
			560: R_MIPS_NONE	\*ABS\*\+0x600
0000000000000564 <fn\+0x564> 00000000 	nop
0000000000000568 <fn\+0x568> 3c050000 	lui	a1,0x0
			568: R_MIPS_GOT_HI16	dg1
			568: R_MIPS_NONE	\*ABS\*
			568: R_MIPS_NONE	\*ABS\*
000000000000056c <fn\+0x56c> 00bc282d 	daddu	a1,a1,gp
0000000000000570 <fn\+0x570> dca50000 	ld	a1,0\(a1\)
			570: R_MIPS_GOT_LO16	dg1
			570: R_MIPS_NONE	\*ABS\*
			570: R_MIPS_NONE	\*ABS\*
0000000000000574 <fn\+0x574> 1000fea2 	b	0000000000000000 <fn>
0000000000000578 <fn\+0x578> 00000000 	nop
000000000000057c <fn\+0x57c> 3c050000 	lui	a1,0x0
			57c: R_MIPS_GOT_HI16	dg2
			57c: R_MIPS_NONE	\*ABS\*
			57c: R_MIPS_NONE	\*ABS\*
0000000000000580 <fn\+0x580> 00bc282d 	daddu	a1,a1,gp
0000000000000584 <fn\+0x584> dca50000 	ld	a1,0\(a1\)
			584: R_MIPS_GOT_LO16	dg2
			584: R_MIPS_NONE	\*ABS\*
			584: R_MIPS_NONE	\*ABS\*
0000000000000588 <fn\+0x588> dca50000 	ld	a1,0\(a1\)
000000000000058c <fn\+0x58c> 1000001c 	b	0000000000000600 <fn2>
0000000000000590 <fn\+0x590> 00000000 	nop
0000000000000594 <fn\+0x594> df850000 	ld	a1,0\(gp\)
			594: R_MIPS_GOT_PAGE	\.data\+0x3c
			594: R_MIPS_NONE	\*ABS\*\+0x3c
			594: R_MIPS_NONE	\*ABS\*\+0x3c
0000000000000598 <fn\+0x598> 64a50000 	daddiu	a1,a1,0
			598: R_MIPS_GOT_OFST	\.data\+0x3c
			598: R_MIPS_NONE	\*ABS\*\+0x3c
			598: R_MIPS_NONE	\*ABS\*\+0x3c
000000000000059c <fn\+0x59c> 1000fe98 	b	0000000000000000 <fn>
00000000000005a0 <fn\+0x5a0> 00000000 	nop
00000000000005a4 <fn\+0x5a4> df850000 	ld	a1,0\(gp\)
			5a4: R_MIPS_GOT_PAGE	\.data\+0xc0
			5a4: R_MIPS_NONE	\*ABS\*\+0xc0
			5a4: R_MIPS_NONE	\*ABS\*\+0xc0
00000000000005a8 <fn\+0x5a8> 64a50000 	daddiu	a1,a1,0
			5a8: R_MIPS_GOT_OFST	\.data\+0xc0
			5a8: R_MIPS_NONE	\*ABS\*\+0xc0
			5a8: R_MIPS_NONE	\*ABS\*\+0xc0
00000000000005ac <fn\+0x5ac> 10000014 	b	0000000000000600 <fn2>
00000000000005b0 <fn\+0x5b0> 00000000 	nop
00000000000005b4 <fn\+0x5b4> df850000 	ld	a1,0\(gp\)
			5b4: R_MIPS_GOT_PAGE	\.data\+0x1e27c
			5b4: R_MIPS_NONE	\*ABS\*\+0x1e27c
			5b4: R_MIPS_NONE	\*ABS\*\+0x1e27c
00000000000005b8 <fn\+0x5b8> 64a50000 	daddiu	a1,a1,0
			5b8: R_MIPS_GOT_OFST	\.data\+0x1e27c
			5b8: R_MIPS_NONE	\*ABS\*\+0x1e27c
			5b8: R_MIPS_NONE	\*ABS\*\+0x1e27c
00000000000005bc <fn\+0x5bc> 1000fe90 	b	0000000000000000 <fn>
00000000000005c0 <fn\+0x5c0> 00000000 	nop
00000000000005c4 <fn\+0x5c4> df850000 	ld	a1,0\(gp\)
			5c4: R_MIPS_GOT_PAGE	\.data\+0xb4
			5c4: R_MIPS_NONE	\*ABS\*\+0xb4
			5c4: R_MIPS_NONE	\*ABS\*\+0xb4
00000000000005c8 <fn\+0x5c8> dca50000 	ld	a1,0\(a1\)
			5c8: R_MIPS_GOT_OFST	\.data\+0xb4
			5c8: R_MIPS_NONE	\*ABS\*\+0xb4
			5c8: R_MIPS_NONE	\*ABS\*\+0xb4
00000000000005cc <fn\+0x5cc> 1000000c 	b	0000000000000600 <fn2>
00000000000005d0 <fn\+0x5d0> 00000000 	nop
00000000000005d4 <fn\+0x5d4> df850000 	ld	a1,0\(gp\)
			5d4: R_MIPS_GOT_PAGE	\.data\+0x48
			5d4: R_MIPS_NONE	\*ABS\*\+0x48
			5d4: R_MIPS_NONE	\*ABS\*\+0x48
00000000000005d8 <fn\+0x5d8> dca50000 	ld	a1,0\(a1\)
			5d8: R_MIPS_GOT_OFST	\.data\+0x48
			5d8: R_MIPS_NONE	\*ABS\*\+0x48
			5d8: R_MIPS_NONE	\*ABS\*\+0x48
00000000000005dc <fn\+0x5dc> 1000fe88 	b	0000000000000000 <fn>
00000000000005e0 <fn\+0x5e0> 00000000 	nop
00000000000005e4 <fn\+0x5e4> df810000 	ld	at,0\(gp\)
			5e4: R_MIPS_GOT_PAGE	\.data\+0xd6
			5e4: R_MIPS_NONE	\*ABS\*\+0xd6
			5e4: R_MIPS_NONE	\*ABS\*\+0xd6
00000000000005e8 <fn\+0x5e8> 0025082d 	daddu	at,at,a1
00000000000005ec <fn\+0x5ec> dc250000 	ld	a1,0\(at\)
			5ec: R_MIPS_GOT_OFST	\.data\+0xd6
			5ec: R_MIPS_NONE	\*ABS\*\+0xd6
			5ec: R_MIPS_NONE	\*ABS\*\+0xd6
00000000000005f0 <fn\+0x5f0> 10000003 	b	0000000000000600 <fn2>
00000000000005f4 <fn\+0x5f4> 00000000 	nop
	\.\.\.
	\.\.\.
