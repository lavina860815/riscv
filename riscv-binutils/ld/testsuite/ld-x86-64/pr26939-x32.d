#source: pr26939.s
#as: --x32
#ld: -pie -melf32_x86_64
#objdump: -dw

.*: +file format .*


Disassembly of section .text:

#...
[ 	]*[a-f0-9]+:	8b 05 ([0-9a-f]{2} ){4} *	mov    0x[a-f0-9]+\(%rip\),%eax        # [a-f0-9]+ <.*>
#pass
