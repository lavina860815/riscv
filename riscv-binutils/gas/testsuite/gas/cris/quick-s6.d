#objdump: -dr
#name: @OC@

# Test the @OC@ insn.

.*:     file format .*-cris

Disassembly of section \.text:
0+ <start>:
[	 ]+0:[	 ]+@IR+5632@[ 	]+@OC@[ ]+22,\$?r3
[	 ]+2:[	 ]+@IR+4b52@[ 	]+@OC@[ ]+11,\$?r5
[	 ]+4:[	 ]+@IR+40a2@[ 	]+@OC@[ ]+0,\$?r10
[	 ]+6:[	 ]+@IR+5f52@[ 	]+@OC@[ ]+31,\$?r5
[	 ]+8:[	 ]+@IR+4142@[ 	]+@OC@[ ]+1,\$?r4
[	 ]+a:[	 ]+@IR+40b2@[ 	]+@OC@[ ]+0,\$?r11
[	 ]+c:[	 ]+@IR+4ab2@[ 	]+@OC@[ ]+10,\$?r11
[	 ]+e:[	 ]+@IR+40c2@[ 	]+@OC@[ ]+0,\$?r12
0+10 <signed6>:
[	 ]+10:[	 ]+@IR+6132@[ 	]+@OC@[ ]+-31,\$?r3
[	 ]+12:[	 ]+@IR+6a32@[ 	]+@OC@[ ]+-22,\$?r3
[	 ]+14:[	 ]+@IR+6232@[ 	]+@OC@[ ]+-30,\$?r3
[	 ]+16:[	 ]+@IR+6372@[ 	]+@OC@[ ]+-29,\$?r7
[	 ]+18:[	 ]+@IR+7fd2@[ 	]+@OC@[ ]+-1,\$?r13
[	 ]+1a:[	 ]+@IR+7fc2@[ 	]+@OC@[ ]+-1,\$?r12
