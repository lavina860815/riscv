#source: copro-arm_v6plus-thumb_v6t2plus.s
#objdump: -dr --prefix-addresses --show-raw-insn
#name: ARMv6 ARM CoProcessor Instructions
#as: -march=armv6 -EL

# Test the standard ARM co-processor instructions:

.*: +file format .*arm.*

Disassembly of section .text:
0+000 <[^>]*> fc507d04 	mrrc2	13, 0, r7, r0, cr4
0+004 <[^>]*> fc407e05 	mcrr2	14, 0, r7, r0, cr5
0+008 <[^>]*> fc507fff 	mrrc2	15, 15, r7, r0, cr15
0+00c <[^>]*> fc407efe 	mcrr2	14, 15, r7, r0, cr14
