#as: -mtune=itanium1
#objdump: -rs
#name: ia64 pcrel

.*: +file format .*

RELOCATION RECORDS FOR \[\.mov\]:
OFFSET[[:space:]]+TYPE[[:space:]]+VALUE[[:space:]]*
0+10[[:space:]]+PCREL22[[:space:]]+esym
0+20[[:space:]]+PCREL22[[:space:]]+esym\+0x0+20
0+30[[:space:]]+PCREL22[[:space:]]+esym
0+40[[:space:]]+PCREL22[[:space:]]+esym-0x0+20

RELOCATION RECORDS FOR \[\.movl\]:
OFFSET[[:space:]]+TYPE[[:space:]]+VALUE[[:space:]]*
0+11[[:space:]]+PCREL64I[[:space:]]+esym
0+21[[:space:]]+PCREL64I[[:space:]]+esym\+0x0+20
0+31[[:space:]]+PCREL64I[[:space:]]+esym
0+41[[:space:]]+PCREL64I[[:space:]]+esym-0x0+20

RELOCATION RECORDS FOR \[\.data8\]:
OFFSET[[:space:]]+TYPE[[:space:]]+VALUE[[:space:]]*
0+10[[:space:]]+PCREL64[LM]SB[[:space:]]+esym
0+20[[:space:]]+PCREL64[LM]SB[[:space:]]+esym\+0x0+20
0+30[[:space:]]+PCREL64[LM]SB[[:space:]]+esym
0+40[[:space:]]+PCREL64[LM]SB[[:space:]]+esym-0x0+20

RELOCATION RECORDS FOR \[\.data4\]:
OFFSET[[:space:]]+TYPE[[:space:]]+VALUE[[:space:]]*
0+10[[:space:]]+PCREL32[LM]SB[[:space:]]+esym
0+20[[:space:]]+PCREL32[LM]SB[[:space:]]+esym\+0x0+20
0+30[[:space:]]+PCREL32[LM]SB[[:space:]]+esym
0+40[[:space:]]+PCREL32[LM]SB[[:space:]]+esym-0x0+20


Contents of section \.mov:
 0+00 1d108001 00240000 00020000 00000020  .*
 0+10 1d100000 00240000 00020000 00000020  .*
 0+20 1d100000 00240000 00020000 00000020  .*
 0+30 1d100000 00240000 00020000 00000020  .*
 0+40 1d100000 00240000 00020000 00000020  .*
 0+50 1d100000 00240000 00020000 00000020  .*
Contents of section \.movl:
 0+00 05000000 01000000 00000040 00060060  .*
 0+10 05000000 01000000 00000040 00000060  .*
 0+20 05000000 01000000 00000040 00000060  .*
 0+30 05000000 01000000 00000040 00000060  .*
 0+40 05000000 01000000 00000040 00000060  .*
 0+50 05000000 01000000 00000040 00000060  .*
Contents of section \.data8:
 0+00 [06]0000000 000000[06]0 00000000 00000000  .*
 0+10 00000000 00000000 00000000 00000000  .*
 0+20 00000000 00000000 00000000 00000000  .*
 0+30 00000000 00000000 00000000 00000000  .*
 0+40 00000000 00000000 00000000 00000000  .*
 0+50 00000000 00000000 00000000 00000000  .*
Contents of section \.data4:
 0+00 [06]00000[06]0 00000000 00000000 00000000  .*
 0+10 00000000 00000000 00000000 00000000  .*
 0+20 00000000 00000000 00000000 00000000  .*
 0+30 00000000 00000000 00000000 00000000  .*
 0+40 00000000 00000000 00000000 00000000  .*
 0+50 00000000 00000000 00000000 00000000  .*
