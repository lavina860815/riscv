#objdump: -s
#name: elf section0
# The h8300 port issues a warning message for
# new sections created without atrributes.
#skip: h8300-*

.*: +file format .*

Contents of section .data:
 0+000 00 ?00 ?00 ?00 ?00 ?00 ?00 ?00 ?00 ?00 ?00 ?00 ?00 ?00 ?00 ?00.*
# The MIPS includes a 'section .reginfo' and such here.
#...
Contents of section A:
 0+000 01 ?01 ?01 ?01 ?01 ?01 ?01 ?01 ?01 ?01 ?01 ?01 ?01 ?01 ?01 ?01.*
Contents of section B:
 0+000 02 ?02 ?02 ?02 ?02 ?02 ?02 ?02 ?02 ?02 ?02 ?02 ?02 ?02 ?02 ?02.*
Contents of section C:
 0+000 03 ?03 ?03 ?03 ?03 ?03 ?03 ?03 ?03 ?03 ?03 ?03 ?03 ?03 ?03 ?03.*
# Arm includes a .ARM.attributes section here
#...
