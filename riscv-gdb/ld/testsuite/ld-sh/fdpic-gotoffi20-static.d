#source: fdpic-gotoffi20-static.s
#as: --isa=sh2a -big --fdpic
#ld: -EB -mshelf_fd
#objdump: -ds
#target: sh*-*-uclinux*

.*:[ \t]+file format elf32-shbig-fdpic

Contents of section \.text:
 400094 00f0fffc 01ce[ \t]+.*
Contents of section \.rofixup:
 40009c 004100a4[ \t]+.*
Contents of section \.data:
 4100a0 00000001[ \t]+.*
Contents of section \.got:
 4100a4 00000000 00000000 00000000[ \t]+.*

Disassembly of section \.text:

00400094 <_start>:
[ \t]+400094:[ \t]+00 f0 ff fc[ \t]+movi20[ \t]+#-4,r0
[ \t]+400098:[ \t]+01 ce[ \t]+mov\.l[ \t]+@\(r0,r12\),r1
