#source: zeroeh_x.s
#source: zeroeh_y.s
#ld: -Ttext 0xa00 -T zeroeh.ld
#objdump: -s
#target: cris-*-elf cris-*-linux* i?86-*-elf i?86-*-linux* i?86-*-gnu*
#target: powerpc-*-elf powerpc-*-linux*

# The word at address 201c, for the linkonce-excluded section, must be zero.

.*:     file format elf32.*

Contents of section \.text:
 0a00 (00000a08 00000a10 00000001 00000002|080a0000 100a0000 01000000 02000000)  .*
 0a10 (00000003|03000000)  .*
Contents of section \.gcc_except_table:
 2000 (00000002 00000a08 00000008 00000007|02000000 080a0000 08000000 07000000)  .*
 2010 (00000a10 00000004 00006066 00000000|100a0000 04000000 66600000 00000000)  .*
 2020 (00000004|04000000)  .*
Contents of section \.eh_frame:
 4000 (0000000c 00000000 0100017c 00000000|0c000000 00000000 0100017c 00000000)  .*
 4010 (0000000c 00000014 00000a08 00000008|0c000000 14000000 080a0000 08000000)  .*
 4020 (0000000c 00000024 00000a10 00000004|0c000000 24000000 100a0000 04000000)  .*
