#name: MIPS relax-jalr-shared n32
#source: relax-jalr.s
#as: -march=from-abi -KPIC -n32 -EB
#objdump: --prefix-addresses -d --show-raw-insn
#ld: -shared -melf32btsmipn32
#target: [check_shared_lib_support]

.*:     file format elf.*mips.*

Disassembly of section \.text:
	\.\.\.
	\.\.\.
.*	lw	t9,.*
.*	jalr	t9
.*	nop
	\.\.\.
.*	lw	t9,.*
.*	jalr	t9
.*	nop
	\.\.\.
.*	lw	t9,.*
.*	bal	.* <__start>
.*	nop
	\.\.\.
