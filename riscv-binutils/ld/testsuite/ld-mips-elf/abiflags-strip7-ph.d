#source: jr.s -mips32r3
#source: jr.s -mips32r2 RUN_OBJCOPY
#ld: -e 0
#objcopy_objects: -R .MIPS.abiflags
#objdump: -p

[^:]*:     file format elf32-.*

Program Header:
0x70000003 off    0x0000.... vaddr 0x004000.. paddr 0x004000.. align 2\*\*3
         filesz 0x00000018 memsz 0x00000018 flags r--
#...
private flags = 70001000: \[abi=O32\] \[mips32r2\] \[not 32bitmode\]

MIPS ABI Flags Version: 0

ISA: MIPS32r3
GPR size: 32
CPR1 size: 32
CPR2 size: 0
FP ABI: Hard float \(double precision\)
ISA Extension: None
ASEs:
	None
FLAGS 1: 0000000.
FLAGS 2: 00000000

