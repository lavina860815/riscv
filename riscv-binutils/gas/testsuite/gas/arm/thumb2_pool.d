# as: -march=armv6t2
# objdump: -dr --prefix-addresses --show-raw-insn
# This test is only valid on ELF based ports.
#notarget: *-*-pe *-*-wince *-*-vxworks

.*: +file format .*arm.*

Disassembly of section .text:
0+000 <[^>]+> 4e04      	ldr	r6, \[pc, #16\]	; \(00+14 <[^>]+>\)
0+002 <[^>]+> 4904      	ldr	r1, \[pc, #16\]	; \(00+14 <[^>]+>\)
0+004 <[^>]+> f8df 600c 	ldr\.w	r6, \[pc, #12\]	; 00+14 <[^>]+>
0+008 <[^>]+> f8df 9008 	ldr\.w	r9, \[pc, #8\]	; 00+14 <[^>]+>
0+00c <[^>]+> bf00      	nop
0+00e <[^>]+> f8df 5004 	ldr\.w	r5, \[pc, #4\]	; 00+14 <[^>]+>
0+012 <[^>]+> 4900      	ldr	r1, \[pc, #0\]	; \(00+14 <[^>]+>\)
0+014 <[^>]+> 12345678 ?	.word	0x12345678
0+018 <[^>]+> 4907      	ldr	r1, \[pc, #28\]	; \(00000038 <[^>]+>\)
0+01a <[^>]+> 4c07      	ldr	r4, \[pc, #28\]	; \(00000038 <[^>]+>\)
0+01c <[^>]+> f8df 9018 	ldr.w	r9, \[pc, #24\]	; 00000038 <[^>]+>
0+020 <[^>]+> f8df c014 	ldr.w	ip, \[pc, #20\]	; 00000038 <[^>]+>
0+024 <[^>]+> f8df d010 	ldr.w	sp, \[pc, #16\]	; 00000038 <[^>]+>
0+028 <[^>]+> 4904      	ldr	r1, \[pc, #16\]	; \(0000003c <[^>]+>\)
0+02a <[^>]+> 4c04      	ldr	r4, \[pc, #16\]	; \(0000003c <[^>]+>\)
0+02c <[^>]+> f8df 900c 	ldr.w	r9, \[pc, #12\]	; 0000003c <[^>]+>
0+030 <[^>]+> f8df c008 	ldr.w	ip, \[pc, #8\]	; 0000003c <[^>]+>
0+034 <[^>]+> f8df d004 	ldr.w	sp, \[pc, #4\]	; 0000003c <[^>]+>
0+038 <[^>]+> 00000000 	.word	0x00000000
			38: R_ARM_ABS32	ext_symbol
0+03c <[^>]+> 00001000 	.word	0x00001000
			3c: R_ARM_ABS32	ext_symbol

