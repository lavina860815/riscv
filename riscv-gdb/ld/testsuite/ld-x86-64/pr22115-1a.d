#source: pr22115-1.s
#as: --64 -mrelax-relocations=yes
#ld: -pie -z text -m elf_x86_64
#objdump: -dw

.*: +file format .*


Disassembly of section .text:

[a-f0-9]+ <_start>:
 +[a-f0-9]+:	48 8d 05 ([0-9a-f]{2} ){4} *	lea    -?0x[a-f0-9]+\(%rip\),%rax        # [a-f0-9]+ <__ehdr_start>
#pass
