#objdump: -dr
#name: x-to-word-sreg-@OR@

.*:     file format .*-cris

Disassembly of section \.text:
0+ <notstart>:
[	 ]+0:[	 ]+0000[ 	]+bcc ( 0x2|\.\+2)
^[ 	]+\.\.\.
0+4 <start>:
[	 ]+4:[	 ]+@IR+3506@[ 	]+move[ ]+\$?r5,.*
[	 ]+6:[	 ]+@IM+350a@[ 	]+move[ ]+\[\$?r5\],.*
[	 ]+8:[	 ]+@IM+350e@[ 	]+move[ ]+\[\$?r5\+\],.*
[	 ]+a:[	 ]+@IM+3f0e@ 0000[ 	]+move[ ]+0x0,.*
[	 ]+e:[	 ]+@IM+3f0e@ 0100[ 	]+move[ ]+0x1,.*
[	 ]+12:[	 ]+@IM+3f0e@ 7f00[ 	]+move[ ]+0x7f,.*
[	 ]+16:[	 ]+@IM+3f0e@ 8000[ 	]+move[ ]+0x80,.*
[	 ]+1a:[	 ]+@IM+3f0e@ ffff[ 	]+move[ ]+0xffff,.*
[	 ]+1e:[	 ]+@IM+3f0e@ 81ff[ 	]+move[ ]+0xff81,.*
[	 ]+22:[	 ]+@IM+3f0e@ 80ff[ 	]+move[ ]+0xff80,.*
[	 ]+26:[	 ]+@IM+3f0e@ 7fff[ 	]+move[ ]+0xff7f,.*
[	 ]+2a:[	 ]+@IM+3f0e@ ff00[ 	]+move[ ]+0xff,.*
[	 ]+2e:[	 ]+@IM+3f0e@ 01ff[ 	]+move[ ]+0xff01,.*
[	 ]+32:[	 ]+@IM+3f0e@ 0001[ 	]+move[ ]+0x[0]?100,.*
[	 ]+36:[	 ]+@IM+3f0e@ 68dd[ 	]+move[ ]+0xdd68,.*
[	 ]+3a:[	 ]+@IM+3f0e@ 9822[ 	]+move[ ]+0x2298,.*
[	 ]+3e:[	 ]+@IM+3f0e@ 2a00[ 	]+move[ ]+0x2a,.*
[	 ]+42:[	 ]+@IM+3f0e@ d6ff[ 	]+move[ ]+0xffd6,.*
[	 ]+46:[	 ]+@IM+3f0e@ 2a00[ 	]+move[ ]+0x2a,.*
[	 ]+4a:[	 ]+@IM+3f0e@ d6ff[ 	]+move[ ]+0xffd6,.*
[	 ]+4e:[	 ]+@IM+3f0e@ d6ff[ 	]+move[ ]+0xffd6,.*
[	 ]+52:[	 ]+@IM+3f0e@ 2a00[ 	]+move[ ]+0x2a,.*
[	 ]+56:[	 ]+@IM+3f0e@ ff7f[ 	]+move[ ]+0x7fff,.*
[	 ]+5a:[	 ]+@IM+3f0e@ 0080[ 	]+move[ ]+0x8000,.*
[	 ]+5e:[	 ]+@IM+3f0e@ 0180[ 	]+move[ ]+0x8001,.*
[	 ]+62:[	 ]+@IM+3f0e@ 0180[ 	]+move[ ]+0x8001,.*
[	 ]+66:[	 ]+@IM+3f0e@ 0080[ 	]+move[ ]+0x8000,.*
[	 ]+6a:[	 ]+@IM+3f0e@ ffff[ 	]+move[ ]+0xffff,.*
[	 ]+6e:[	 ]+@IM+3f0e@ 0000[ 	]+move[ ]+0x0,.*
[ 	]+70:[ 	]+(R_CRIS_)?16[ 	]+externalsym
[	 ]+72:[	 ]+4255 @IM+300a@[ 	]+move[ ]+\[\$?r2\+\$?r5\.b\],.*
[	 ]+76:[	 ]+4529 @IM+300a@[ 	]+move[ ]+\[\$?r2\+\[\$?r5\]\.b\],.*
[	 ]+7a:[	 ]+452d @IM+300a@[ 	]+move[ ]+\[\$?r2\+\[\$?r5\+\]\.b\],.*
[	 ]+7e:[	 ]+452d @IM+300a@[ 	]+move[ ]+\[\$?r2\+\[\$?r5\+\]\.b\],.*
[	 ]+82:[	 ]+5255 @IM+300a@[ 	]+move[ ]+\[\$?r2\+\$?r5\.w\],.*
[	 ]+86:[	 ]+5529 @IM+300a@[ 	]+move[ ]+\[\$?r2\+\[\$?r5\]\.w\],.*
[	 ]+8a:[	 ]+552d @IM+300a@[ 	]+move[ ]+\[\$?r2\+\[\$?r5\+\]\.w\],.*
[	 ]+8e:[	 ]+552d @IM+300a@[ 	]+move[ ]+\[\$?r2\+\[\$?r5\+\]\.w\],.*
[	 ]+92:[	 ]+6255 @IM+300a@[ 	]+move[ ]+\[\$?r2\+\$?r5\.d\],.*
[	 ]+96:[	 ]+6529 @IM+300a@[ 	]+move[ ]+\[\$?r2\+\[\$?r5\]\.d\],.*
[	 ]+9a:[	 ]+652d @IM+300a@[ 	]+move[ ]+\[\$?r2\+\[\$?r5\+\]\.d\],.*
[	 ]+9e:[	 ]+652d @IM+300a@[ 	]+move[ ]+\[\$?r2\+\[\$?r5\+\]\.d\],.*
[	 ]+a2:[	 ]+0021 @IM+300a@[ 	]+move[ ]+\[\$?r2\+0\],.*
[	 ]+a6:[	 ]+0121 @IM+300a@[ 	]+move[ ]+\[\$?r2\+1\],.*
[	 ]+aa:[	 ]+7f21 @IM+300a@[ 	]+move[ ]+\[\$?r2\+127\],.*
[	 ]+ae:[	 ]+5f2d 8000 @IM+300a@[ 	]+move[ ]+\[\$?r2\+128\],.*
[	 ]+b4:[	 ]+ff21 @IM+300a@[ 	]+move[ ]+\[\$?r2-1\],.*
[	 ]+b8:[	 ]+ff21 @IM+300a@[ 	]+move[ ]+\[\$?r2-1\],.*
[	 ]+bc:[	 ]+8121 @IM+300a@[ 	]+move[ ]+\[\$?r2-127\],.*
[	 ]+c0:[	 ]+8021 @IM+300a@[ 	]+move[ ]+\[\$?r2-128\],.*
[	 ]+c4:[	 ]+5f2d 7fff @IM+300a@[ 	]+move[ ]+\[\$?r2-129\],.*
[	 ]+ca:[	 ]+8121 @IM+300a@[ 	]+move[ ]+\[\$?r2-127\],.*
[	 ]+ce:[	 ]+8021 @IM+300a@[ 	]+move[ ]+\[\$?r2-128\],.*
[	 ]+d2:[	 ]+5f2d 7fff @IM+300a@[ 	]+move[ ]+\[\$?r2-129\],.*
[	 ]+d8:[	 ]+5f2d ff00 @IM+300a@[ 	]+move[ ]+\[\$?r2\+255\],.*
[	 ]+de:[	 ]+5f2d 01ff @IM+300a@[ 	]+move[ ]+\[\$?r2-255\],.*
[	 ]+e4:[	 ]+5f2d 01ff @IM+300a@[ 	]+move[ ]+\[\$?r2-255\],.*
[	 ]+ea:[	 ]+5f2d 0001 @IM+300a@[ 	]+move[ ]+\[\$?r2\+256\],.*
[	 ]+f0:[	 ]+5f2d 00ff @IM+300a@[ 	]+move[ ]+\[\$?r2-256\],.*
[	 ]+f6:[	 ]+5f2d 68dd @IM+300a@[ 	]+move[ ]+\[\$?r2-8856\],.*
[	 ]+fc:[	 ]+5f2d 68dd @IM+300a@[ 	]+move[ ]+\[\$?r2-8856\],.*
[	 ]+102:[	 ]+5f2d 9822 @IM+300a@[ 	]+move[ ]+\[\$?r2\+8856\],.*
[	 ]+108:[	 ]+2a21 @IM+300a@[ 	]+move[ ]+\[\$?r2\+42\],.*
[	 ]+10c:[	 ]+d621 @IM+300a@[ 	]+move[ ]+\[\$?r2-42\],.*
[	 ]+110:[	 ]+d621 @IM+300a@[ 	]+move[ ]+\[\$?r2-42\],.*
[	 ]+114:[	 ]+2a21 @IM+300a@[ 	]+move[ ]+\[\$?r2\+42\],.*
[	 ]+118:[	 ]+d621 @IM+300a@[ 	]+move[ ]+\[\$?r2-42\],.*
[	 ]+11c:[	 ]+d621 @IM+300a@[ 	]+move[ ]+\[\$?r2-42\],.*
[	 ]+120:[	 ]+d621 @IM+300a@[ 	]+move[ ]+\[\$?r2-42\],.*
[	 ]+124:[	 ]+2a21 @IM+300a@[ 	]+move[ ]+\[\$?r2\+42\],.*
[	 ]+128:[	 ]+5f2d ff7f @IM+300a@[ 	]+move[ ]+\[\$?r2\+32767\],.*
[	 ]+12e:[	 ]+6f2d 0080 0000 @IM+300a@[ 	]+move[ ]+\[\$?r2\+(32768|8000 <three2767\+0x1>)\],.*
[	 ]+136:[	 ]+6f2d 0180 0000 @IM+300a@[ 	]+move[ ]+\[\$?r2\+(32769|8001 <three2767\+0x2>)\],.*
[	 ]+13e:[	 ]+5f2d 0180 @IM+300a@[ 	]+move[ ]+\[\$?r2-32767\],.*
[	 ]+144:[	 ]+5f2d 0080 @IM+300a@[ 	]+move[ ]+\[\$?r2-32768\],.*
[	 ]+14a:[	 ]+6f2d ff7f ffff @IM+300a@[ 	]+move[ ]+\[\$?r2\+[^]]+\],.*
[	 ]+152:[	 ]+5f2d 0180 @IM+300a@[ 	]+move[ ]+\[\$?r2-32767\],.*
[	 ]+158:[	 ]+5f2d 0080 @IM+300a@[ 	]+move[ ]+\[\$?r2-32768\],.*
[	 ]+15e:[	 ]+6f2d ff7f ffff @IM+300a@[ 	]+move[ ]+\[\$?r2\+[^]]+\],.*
[	 ]+166:[	 ]+6f2d ffff 0000 @IM+300a@[ 	]+move[ ]+\[\$?r2\+(65535|ffff <six5535>)\],.*
[	 ]+16e:[	 ]+6f2d 0000 0000 @IM+300a@[ 	]+move[ ]+\[\$?r2\+0( <notstart>)?\],.*
[ 	]+170:[ 	]+(R_CRIS_)?32[ 	]+externalsym
[	 ]+176:[	 ]+4255 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+\$?r5\.b\],.*
[	 ]+17a:[	 ]+4529 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+\[\$?r5\]\.b\],.*
[	 ]+17e:[	 ]+452d @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+\[\$?r5\+\]\.b\],.*
[	 ]+182:[	 ]+452d @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+\[\$?r5\+\]\.b\],.*
[	 ]+186:[	 ]+5255 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+\$?r5\.w\],.*
[	 ]+18a:[	 ]+5529 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+\[\$?r5\]\.w\],.*
[	 ]+18e:[	 ]+552d @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+\[\$?r5\+\]\.w\],.*
[	 ]+192:[	 ]+552d @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+\[\$?r5\+\]\.w\],.*
[	 ]+196:[	 ]+6255 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+\$?r5\.d\],.*
[	 ]+19a:[	 ]+6529 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+\[\$?r5\]\.d\],.*
[	 ]+19e:[	 ]+652d @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+\[\$?r5\+\]\.d\],.*
[	 ]+1a2:[	 ]+652d @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+\[\$?r5\+\]\.d\],.*
[	 ]+1a6:[	 ]+0021 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+0\],.*
[	 ]+1aa:[	 ]+0121 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+1\],.*
[	 ]+1ae:[	 ]+7f21 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+127\],.*
[	 ]+1b2:[	 ]+5f2d 8000 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+128\],.*
[	 ]+1b8:[	 ]+ff21 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2-1\],.*
[	 ]+1bc:[	 ]+ff21 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2-1\],.*
[	 ]+1c0:[	 ]+8121 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2-127\],.*
[	 ]+1c4:[	 ]+8021 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2-128\],.*
[	 ]+1c8:[	 ]+5f2d 7fff @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2-129\],.*
[	 ]+1ce:[	 ]+8121 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2-127\],.*
[	 ]+1d2:[	 ]+8021 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2-128\],.*
[	 ]+1d6:[	 ]+5f2d 7fff @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2-129\],.*
[	 ]+1dc:[	 ]+5f2d ff00 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+255\],.*
[	 ]+1e2:[	 ]+5f2d 01ff @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2-255\],.*
[	 ]+1e8:[	 ]+5f2d 01ff @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2-255\],.*
[	 ]+1ee:[	 ]+5f2d 0001 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+256\],.*
[	 ]+1f4:[	 ]+5f2d 00ff @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2-256\],.*
[	 ]+1fa:[	 ]+5f2d 68dd @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2-8856\],.*
[	 ]+200:[	 ]+5f2d 68dd @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2-8856\],.*
[	 ]+206:[	 ]+5f2d 9822 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+8856\],.*
[	 ]+20c:[	 ]+2a21 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+42\],.*
[	 ]+210:[	 ]+d621 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2-42\],.*
[	 ]+214:[	 ]+d621 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2-42\],.*
[	 ]+218:[	 ]+2a21 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+42\],.*
[	 ]+21c:[	 ]+d621 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2-42\],.*
[	 ]+220:[	 ]+d621 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2-42\],.*
[	 ]+224:[	 ]+d621 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2-42\],.*
[	 ]+228:[	 ]+2a21 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+42\],.*
[	 ]+22c:[	 ]+5f2d ff7f @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+32767\],.*
[	 ]+232:[	 ]+6f2d 0080 0000 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+(32768|8000 <three2767\+0x1>)\],.*
[	 ]+23a:[	 ]+6f2d 0180 0000 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+(32769|8001 <three2767\+0x2>)\],.*
[	 ]+242:[	 ]+5f2d 0180 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2-32767\],.*
[	 ]+248:[	 ]+5f2d 0080 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2-32768\],.*
[	 ]+24e:[	 ]+6f2d ff7f ffff @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+[^]]+\],.*
[	 ]+256:[	 ]+5f2d 0180 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2-32767\],.*
[	 ]+25c:[	 ]+5f2d 0080 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2-32768\],.*
[	 ]+262:[	 ]+6f2d ff7f ffff @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+[^]]+\],.*
[	 ]+26a:[	 ]+6f2d ffff 0000 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+(65535|ffff <six5535>)\],.*
[	 ]+272:[	 ]+6f2d 0000 0000 @IM+3c0e@[ 	]+move[ ]+\[\$?r12=\$?r2\+0( <notstart>)?\],.*
[ 	]+274:[ 	]+(R_CRIS_)?32[ 	]+externalsym
[	 ]+27a:[	 ]+7209 @IM+300a@[ 	]+move[ ]+\[\[\$?r2\]\],.*
[	 ]+27e:[	 ]+730d @IM+300a@[ 	]+move[ ]+\[\[\$?r3\+\]\],.*
[	 ]+282:[	 ]+7f0d 0000 0000 @IM+300a@[ 	]+move[ ]+\[(0x0|0 <notstart>)\],.*
[ 	]+284:[ 	]+(R_CRIS_)?32[ 	]+externalsym
[	 ]+28a:[	 ]+7f0d 0000 0000 @IM+300a@[ 	]+move[ ]+\[(0x0|0 <notstart>)\],.*
[ 	]+28c:[ 	]+(R_CRIS_)?32[ 	]+\.text
0+292 <end>:
^[ 	]+\.\.\.
