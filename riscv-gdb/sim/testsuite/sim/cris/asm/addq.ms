# mach: crisv3 crisv8 crisv10 crisv32
# output: ffffffff\n0\n1\n100\n10000\n47\n67\na6\n80000001\n

 .include "testutils.inc"
 start
 moveq -2,r3
 addq 1,r3
 test_cc 1 0 0 0
 dumpr3

 addq 1,r3
 test_cc 0 1 0 1
 dumpr3

 addq 1,r3
 test_cc 0 0 0 0
 dumpr3

 move.d 0xff,r3
 addq 1,r3
 test_cc 0 0 0 0
 dumpr3

 move.d 0xffff,r3
 addq 1,r3
 test_cc 0 0 0 0
 dumpr3

 move.d 0x42,r3
 addq 5,r3
 test_cc 0 0 0 0
 dumpr3

 addq 32,r3
 test_cc 0 0 0 0
 dumpr3

 addq 63,r3
 test_cc 0 0 0 0
 dumpr3

 move.d 0x7ffffffe,r3
 addq 3,r3
 test_cc 1 0 1 0
 dumpr3

 quit
