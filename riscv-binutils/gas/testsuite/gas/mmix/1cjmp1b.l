GAS for MMIX .*/1cjmp1b.s 			page 1


   1 0000 FD000000 	Main SWYM 0,0,0
   2 0004 F0000001 	1: JMP 1f
   3 0008 F0000000 	1: JMP 1b
   4 000c F1FFFFFF 	 JMP 1b
GAS for MMIX .*/1cjmp1b.s 			page 2


DEFINED SYMBOLS
.*/1cjmp1b.s:1      .text:0000000000000000 Main

NO UNDEFINED SYMBOLS
