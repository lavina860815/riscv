# mach: crisv32
# output: ce11d0c\n

; Check correct "pass" exit.

 .include "testutils.inc"
 start
 move.d 0x0ce11d0c,$r3
 dumpr3
 moveq 1,$r9
 moveq 0,$r10
 break 13
 move.d 0xbadc0de,$r3
 dumpr3
0:
 ba 0b
 nop
