#objdump: -d --prefix-addresses
#as: -m68hc11 --mri -I$srcdir/$subdir
#name: Motorola Assembly Language Input Standard

# Test compliance with MALIS

.*: +file format elf32\-m68hc11

Disassembly of section .text:
0+000 <L0> ldaa	0x1,x
0+002 <L1> ldaa	#0x2c
0+004 <L_txt2> ldx	#0x0+000 <L0>
0+007 <L_constant> ldaa	#0x7b
0+009 <L_constant\+0x2> ldaa	#0xe9
0+00b <L_constant\+0x4> ldab	#0x8a
0+00d <L_constant\+0x6> ldab	#0x7
0+00f <L_constant\+0x8> ldaa	#0x3c
0+011 <L_constant\+0xa> ldaa	#0xff
0+013 <L12> ldaa	#0xae
0+015 <L13> ldaa	#0xb2
0+017 <L11> ldx	#0x0+0af <entry\+0x6c>
0+01a <L11\+0x3> ldx	#0x0+001 <L0\+0x1>
0+01d <L11\+0x6> ldx	#0x0+001 <L0\+0x1>
0+020 <L11\+0x9> ldx	#0x0+000 <L0>
0+023 <L11\+0xc> ldab	#0xd2
0+025 <L_if> ldx	#0x0+001 <L0\+0x1>
0+028 <L_if\+0x3> ldaa	#0x1f
0+02a <L_if\+0x5> ldaa	#0x4
0+02c <L_if\+0x7> ldx	#0x0+017 <L11>
0+02f <L_if\+0xa> ldx	#0x0+004 <L_txt2>
0+032 <L_if\+0xd> ldy	#0x0+001 <L0\+0x1>
0+036 <L_if\+0x11> ldy	#0x0+001 <L0\+0x1>
0+03a <L_if\+0x15> ldaa	#0x17
0+03c <L_if\+0x17> staa	0x0+018 <L11\+0x1>
0+03f <L_if\+0x1a> rts
0+040 <L_if\+0x1b> ldaa	0x0+017 <L11>
0+043 <entry> rts
