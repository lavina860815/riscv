#as: --auto-litpools
#objdump: -d
#name: auto-litpools-4 (handle auto literal pools in .init and .fini)

.*: +file format .*xtensa.*
#...
Disassembly of section .init.literal:
#...
Disassembly of section .fini.literal:
#...
Disassembly of section .init:
#...
 *0:.*l32r.*
#...
Disassembly of section .fini:
#...
 *0:.*l32r.*
#...
