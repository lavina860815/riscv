#as: -32 -mfpxx
#source: attr-gnu-4-5.s
#DUMPPROG: readelf
#readelf: -A
#name: MIPS gnu_attribute 4,5 (-mfpxx)

Attribute Section: gnu
File Attributes
  Tag_GNU_MIPS_ABI_FP: Hard float \(32-bit CPU, Any FPU\)

MIPS ABI Flags Version: 0

ISA: MIPS.*
GPR size: 32
CPR1 size: 32
CPR2 size: 0
FP ABI: Hard float \(32-bit CPU, Any FPU\)
ISA Extension: .*
ASEs:
#...
FLAGS 1: 0000000.
FLAGS 2: 00000000

