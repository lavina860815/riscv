#as:
#source: A.c
#source: A-2.c
#source: B.c
#source: B-2.c
#source: C.c
#source: C-2.c
#objdump: --ctf=.ctf
#ld: -shared --ctf-variables
#name: Conflicting cycle 3.C-2

.*: +file format .*

#...
CTF archive member: .*/C-2.c:

  Header:
    Magic number: 0xdff2
    Version: 4 \(CTF_VERSION_3\)
#...
    Parent name: .*
    Compilation unit name: .*/C-2.c
#...
  Labels:

  Data objects:

  Function objects:

  Variables:
    c -> 0x80000001: \(kind 6\) struct C \(size 0x[0-9a-f]*\) \(aligned at 0x[0-9a-f]*\)

  Types:
    0x80000001: \(kind 6\) struct C \(size 0x[0-9a-f]*\) \(aligned at 0x[0-9a-f]*\)
                \[0x0\] a: ID 0x[0-9a-f]*: \(kind 3\) struct A \* \(size 0x[0-9a-f]*\) \(aligned at 0x[0-9a-f]*\)
                \[0x[0-9a-f]*\] wombat: ID 0x[0-9a-f]*: \(kind 1\) int \(format 0x1\) \(size 0x[0-9a-f]*\) \(aligned at 0x[0-9a-f]*\)

  Strings:
    0x0: 
#...
