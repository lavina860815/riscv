#objdump: -dr --prefix-addresses
#name: MIPS ELF jal
#source: jal.s
#as: -32

# Test the jal macro.

.*: +file format .*mips.*

Disassembly of section .text:
0+0000 <[^>]*> jalr	t9
0+0004 <[^>]*> nop
0+0008 <[^>]*> jalr	a0,t9
0+000c <[^>]*> nop
0+0010 <[^>]*> jal	0+ <text_label>
[ 	]*10: R_MIPS_26	text_label
0+0014 <[^>]*> nop
0+0018 <[^>]*> jal	0+ <text_label>
[ 	]*18: R_MIPS_26	external_text_label
0+001c <[^>]*> nop
0+0020 <[^>]*> j	0+ <text_label>
[ 	]*20: R_MIPS_26	text_label
0+0024 <[^>]*> nop
0+0028 <[^>]*> j	0+ <text_label>
[ 	]*28: R_MIPS_26	external_text_label
0+002c <[^>]*> nop
	\.\.\.
