#objdump: -h
#source: textalign-xcoff-001.s
#as: -mppc64 -a64

.*:     file format .*coff64-rs6000

Sections:
Idx Name          Size      VMA               LMA               File off  Algn
  0 \.text         00000004  0000000000000000  0000000000000000  000000f0  2\*\*2
                  CONTENTS, ALLOC, LOAD, CODE
  1 \.data         00000008  0000000000000008  0000000000000008  000000f4  2\*\*3
                  CONTENTS, ALLOC, LOAD, RELOC, DATA
  2 \.bss          00000000  0000000000000010  0000000000000010  00000000  2\*\*3
                  ALLOC
