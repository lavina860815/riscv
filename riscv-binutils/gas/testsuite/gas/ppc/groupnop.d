#as:
#objdump: -dr

.*

Disassembly of section \.text:

0+ <\.text>:
   0:	(60 00 00 00|00 00 00 60) .*
   4:	(60 00 00 00|00 00 00 60) .*
   8:	(60 00 00 00|00 00 00 60) .*
   c:	(60 42 00 00|00 00 42 60) .*
  10:	(60 00 00 00|00 00 00 60) .*
  14:	(60 42 00 00|00 00 42 60) .*
  18:	(60 00 00 00|00 00 00 60) .*
  1c:	(60 21 00 00|00 00 21 60) .*
  20:	(60 00 00 00|00 00 00 60) .*
  24:	(60 00 00 00|00 00 00 60) .*
#pass
