#source: split-lo16.s -mv850e
#ld: -Tsplit-lo16.ld
#objdump: -d
#...
00010000 <.*>:
   10000:	40 0e 34 12 	movhi	4660, r0, r1
   10004:	01 16 78 56 	addi	22136, r1, r2
   10008:	81 17 79 56 	ld\.bu	22136\[r1\], r2
   1000c:	40 0e 36 12 	movhi	4662, r0, r1
   10010:	01 16 78 d8 	addi	-10120, r1, r2
   10014:	81 17 79 d8 	ld\.bu	-10120\[r1\], r2
   10018:	40 0e 12 00 	movhi	18, r0, r1
   1001c:	81 17 57 34 	ld\.bu	13398\[r1\], r2
   10020:	01 16 56 34 	addi	13398, r1, r2
   10024:	40 0e 14 00 	movhi	20, r0, r1
   10028:	81 17 57 b6 	ld\.bu	-18858\[r1\], r2
   1002c:	01 16 56 b6 	addi	-18858, r1, r2
   10030:	40 0e 79 56 	movhi	22137, r0, r1
   10034:	01 16 bc 9a 	addi	-25924, r1, r2
   10038:	81 17 bd 9a 	ld\.bu	-25924\[r1\], r2
   1003c:	40 0e 9b 78 	movhi	30875, r0, r1
   10040:	81 17 df bc 	ld\.bu	-17186\[r1\], r2
   10044:	01 16 de bc 	addi	-17186, r1, r2
   10048:	40 0e 45 23 	movhi	9029, r0, r1
   1004c:	a1 17 89 67 	ld\.bu	26505\[r1\], r2
#pass
