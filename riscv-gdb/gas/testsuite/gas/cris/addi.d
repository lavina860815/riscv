#objdump: -dr
#name: addi

.*:     file format .*-cris

Disassembly of section \.text:
0+ <start>:
[	 ]+0:[	 ]+0105[ 	]+addi[ ]+\$?r0.b,\$?r1
[	 ]+2:[	 ]+1105[ 	]+addi[ ]+\$?r0.w,\$?r1
[	 ]+4:[	 ]+2105[ 	]+addi[ ]+\$?r0.d,\$?r1
[	 ]+6:[	 ]+0005[ 	]+addi[ ]+\$?r0.b,\$?r0
[	 ]+8:[	 ]+1005[ 	]+addi[ ]+\$?r0.w,\$?r0
[	 ]+a:[	 ]+2005[ 	]+addi[ ]+\$?r0.d,\$?r0
[	 ]+c:[	 ]+0755[ 	]+addi[ ]+\$?r5.b,\$?r7
[	 ]+e:[	 ]+1095[ 	]+addi[ ]+\$?r9.w,\$?r0
[	 ]+10:[	 ]+2db5[ 	]+addi[ ]+\$?r11.d,\$?r13
[	 ]+12:[	 ]+0445[ 	]+addi[ ]+\$?r4.b,\$?r4
[	 ]+14:[	 ]+1445[ 	]+addi[ ]+\$?r4.w,\$?r4
[	 ]+16:[	 ]+2445[ 	]+addi[ ]+\$?r4.d,\$?r4
