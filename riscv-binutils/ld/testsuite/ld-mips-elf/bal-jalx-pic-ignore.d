#name: MIPS BAL/JALX in PIC mode (ignore branch ISA)
#source: ../../../gas/testsuite/gas/mips/branch-addend.s
#ld: -Ttext 0x1c000000 -e 0x1c000000 -shared --ignore-branch-isa
#objdump: -dr --prefix-addresses --show-raw-insn
#target: [check_shared_lib_support]

.*: +file format .*mips.*

Disassembly of section \.text:
	\.\.\.
[0-9a-f]+ <[^>]*> 0000 02d0 	not	zero,zero
[0-9a-f]+ <[^>]*> 001f 0f3c 	jr	ra
[0-9a-f]+ <[^>]*> 0000 02d0 	not	zero,zero
[0-9a-f]+ <[^>]*> 0000 0000 	nop
[0-9a-f]+ <[^>]*> 00000027 	nor	zero,zero,zero
[0-9a-f]+ <[^>]*> 04117ffa 	bal	0*1c021000 <.*>
[0-9a-f]+ <[^>]*> 00000027 	nor	zero,zero,zero
[0-9a-f]+ <[^>]*> 04117ffc 	bal	0*1c021010 <.*>
[0-9a-f]+ <[^>]*> 00000027 	nor	zero,zero,zero
[0-9a-f]+ <[^>]*> 03e00009 	jalr	zero,ra
[0-9a-f]+ <[^>]*> 00000027 	nor	zero,zero,zero
	\.\.\.
