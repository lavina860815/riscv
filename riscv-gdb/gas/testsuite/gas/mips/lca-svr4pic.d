#objdump: -dr --prefix-addresses -mmips:3000
#name: MIPS lca-svr4pic
#as: -32 -mips1 -KPIC --defsym KPIC=1
#source: lca.s

# Test the lca macro with -KPIC.

.*: +file format .*mips.*

Disassembly of section .text:
[0-9a-f]+ <[^>]*> li	a0,0
[0-9a-f]+ <[^>]*> li	a0,1
[0-9a-f]+ <[^>]*> li	a0,0x8000
[0-9a-f]+ <[^>]*> li	a0,-32768
[0-9a-f]+ <[^>]*> lui	a0,0x1
[0-9a-f]+ <[^>]*> lui	a0,0x1
[0-9a-f]+ <[^>]*> ori	a0,a0,0xa5a5
[0-9a-f]+ <[^>]*> addiu	a0,a1,0
[0-9a-f]+ <[^>]*> addiu	a0,a1,1
[0-9a-f]+ <[^>]*> li	a0,0x8000
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> addiu	a0,a1,-32768
[0-9a-f]+ <[^>]*> lui	a0,0x1
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lui	a0,0x1
[0-9a-f]+ <[^>]*> ori	a0,a0,0xa5a5
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.data
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	.data
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_CALL16	big_external_data_label
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_CALL16	small_external_data_label
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_CALL16	big_external_common
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_CALL16	small_external_common
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.bss
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	.bss
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.bss
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,1000
[ 	]*[0-9a-f]+: R_MIPS_LO16	.bss
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.data
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,1
[ 	]*[0-9a-f]+: R_MIPS_LO16	.data
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	big_external_data_label
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	small_external_data_label
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	big_external_common
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	small_external_common
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.bss
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,1
[ 	]*[0-9a-f]+: R_MIPS_LO16	.bss
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.bss
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,1001
[ 	]*[0-9a-f]+: R_MIPS_LO16	.bss
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.data
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> addiu	at,at,-32768
[ 	]*[0-9a-f]+: R_MIPS_LO16	.data
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	big_external_data_label
[0-9a-f]+ <[^>]*> li	at,0x8000
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	small_external_data_label
[0-9a-f]+ <[^>]*> li	at,0x8000
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	big_external_common
[0-9a-f]+ <[^>]*> li	at,0x8000
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	small_external_common
[0-9a-f]+ <[^>]*> li	at,0x8000
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.bss
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> addiu	at,at,-32768
[ 	]*[0-9a-f]+: R_MIPS_LO16	.bss
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.bss
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> addiu	at,at,-31768
[ 	]*[0-9a-f]+: R_MIPS_LO16	.bss
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.data
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,-32768
[ 	]*[0-9a-f]+: R_MIPS_LO16	.data
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	big_external_data_label
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,-32768
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	small_external_data_label
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,-32768
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	big_external_common
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,-32768
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	small_external_common
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,-32768
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.bss
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,-32768
[ 	]*[0-9a-f]+: R_MIPS_LO16	.bss
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.bss
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,-31768
[ 	]*[0-9a-f]+: R_MIPS_LO16	.bss
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.data
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	.data
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	big_external_data_label
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	small_external_data_label
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	big_external_common
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	small_external_common
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.bss
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	.bss
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.bss
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> addiu	at,at,1000
[ 	]*[0-9a-f]+: R_MIPS_LO16	.bss
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.data
[0-9a-f]+ <[^>]*> lui	at,0x2
[0-9a-f]+ <[^>]*> addiu	at,at,-23131
[ 	]*[0-9a-f]+: R_MIPS_LO16	.data
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	big_external_data_label
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> ori	at,at,0xa5a5
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	small_external_data_label
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> ori	at,at,0xa5a5
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	big_external_common
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> ori	at,at,0xa5a5
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	small_external_common
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> ori	at,at,0xa5a5
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.bss
[0-9a-f]+ <[^>]*> lui	at,0x2
[0-9a-f]+ <[^>]*> addiu	at,at,-23131
[ 	]*[0-9a-f]+: R_MIPS_LO16	.bss
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.bss
[0-9a-f]+ <[^>]*> lui	at,0x2
[0-9a-f]+ <[^>]*> addiu	at,at,-22131
[ 	]*[0-9a-f]+: R_MIPS_LO16	.bss
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.data
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	.data
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	big_external_data_label
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	small_external_data_label
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	big_external_common
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	small_external_common
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.bss
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	.bss
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.bss
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,1000
[ 	]*[0-9a-f]+: R_MIPS_LO16	.bss
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.data
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,1
[ 	]*[0-9a-f]+: R_MIPS_LO16	.data
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	big_external_data_label
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,1
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	small_external_data_label
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,1
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	big_external_common
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,1
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	small_external_common
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,1
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.bss
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,1
[ 	]*[0-9a-f]+: R_MIPS_LO16	.bss
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.bss
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,1001
[ 	]*[0-9a-f]+: R_MIPS_LO16	.bss
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.data
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> addiu	at,at,-32768
[ 	]*[0-9a-f]+: R_MIPS_LO16	.data
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	big_external_data_label
[0-9a-f]+ <[^>]*> li	at,0x8000
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	small_external_data_label
[0-9a-f]+ <[^>]*> li	at,0x8000
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	big_external_common
[0-9a-f]+ <[^>]*> li	at,0x8000
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	small_external_common
[0-9a-f]+ <[^>]*> li	at,0x8000
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.bss
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> addiu	at,at,-32768
[ 	]*[0-9a-f]+: R_MIPS_LO16	.bss
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.bss
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> addiu	at,at,-31768
[ 	]*[0-9a-f]+: R_MIPS_LO16	.bss
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.data
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,-32768
[ 	]*[0-9a-f]+: R_MIPS_LO16	.data
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	big_external_data_label
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,-32768
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	small_external_data_label
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,-32768
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	big_external_common
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,-32768
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	small_external_common
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,-32768
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.bss
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,-32768
[ 	]*[0-9a-f]+: R_MIPS_LO16	.bss
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.bss
[0-9a-f]+ <[^>]*> nop
[0-9a-f]+ <[^>]*> addiu	a0,a0,-31768
[ 	]*[0-9a-f]+: R_MIPS_LO16	.bss
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.data
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	.data
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	big_external_data_label
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	small_external_data_label
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	big_external_common
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	small_external_common
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.bss
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	.bss
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.bss
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> addiu	at,at,1000
[ 	]*[0-9a-f]+: R_MIPS_LO16	.bss
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.data
[0-9a-f]+ <[^>]*> lui	at,0x2
[0-9a-f]+ <[^>]*> addiu	at,at,-23131
[ 	]*[0-9a-f]+: R_MIPS_LO16	.data
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	big_external_data_label
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> ori	at,at,0xa5a5
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	small_external_data_label
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> ori	at,at,0xa5a5
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	big_external_common
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> ori	at,at,0xa5a5
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	small_external_common
[0-9a-f]+ <[^>]*> lui	at,0x1
[0-9a-f]+ <[^>]*> ori	at,at,0xa5a5
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.bss
[0-9a-f]+ <[^>]*> lui	at,0x2
[0-9a-f]+ <[^>]*> addiu	at,at,-23131
[ 	]*[0-9a-f]+: R_MIPS_LO16	.bss
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
[0-9a-f]+ <[^>]*> lw	a0,0\(gp\)
[ 	]*[0-9a-f]+: R_MIPS_GOT16	.bss
[0-9a-f]+ <[^>]*> lui	at,0x2
[0-9a-f]+ <[^>]*> addiu	at,at,-22131
[ 	]*[0-9a-f]+: R_MIPS_LO16	.bss
[0-9a-f]+ <[^>]*> addu	a0,a0,at
[0-9a-f]+ <[^>]*> addu	a0,a0,a1
	...
