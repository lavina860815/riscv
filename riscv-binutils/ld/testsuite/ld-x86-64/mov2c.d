#source: mov2.s
#as: --x32
#ld: -shared -melf32_x86_64
#objdump: -dw

.*: +file format .*


Disassembly of section .text:

#...
[ 	]*[a-f0-9]+:	48 8b 05 ([0-9a-f]{2} ){4} *	mov    0x[a-f0-9]+\(%rip\),%rax        # [a-f0-9]+ <.*>
[ 	]*[a-f0-9]+:	48 8b 05 ([0-9a-f]{2} ){4} *	mov    0x[a-f0-9]+\(%rip\),%rax        # [a-f0-9]+ <.*>
[ 	]*[a-f0-9]+:	48 8b 05 ([0-9a-f]{2} ){4} *	mov    0x[a-f0-9]+\(%rip\),%rax        # [a-f0-9]+ <.*>
#pass
