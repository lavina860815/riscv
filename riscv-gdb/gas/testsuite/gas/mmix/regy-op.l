GAS for MMIX .*/regy-op\.s 			page 1


   1              	#.*
   2              	#.*
   3 0000 347B0C43 	Main	NEG X,Y,Z
   4 0004 36200C43 		NEGU \$32,Y,Z
   5 0008 347B2043 		NEG X,32,Z
   6 000c 36008543 		NEGU \$0,133,Z
   7 0010 347B0C49 		NEG X,Y,\$73
   8 0014 36820CE9 		NEGU \$130,Y,\$233
   9 0018 347B26D4 		NEG X,38,\$212
  10 001c 3601AFB5 		NEGU \$1,175,\$181
  11              	
  12 0020 357B0CB0 		NEG X,Y,Z0
  13 0024 37200CB0 		NEGU \$32,Y,Z0
  14 0028 357B84B0 		NEG X,132,Z0
  15 002c 37E885B0 		NEGU \$232,133,Z0
  16 0030 357B0CCB 		NEG X,Y,203
  17 0034 37E70CD5 		NEGU \$231,Y,213
  18 0038 357B26D3 		NEG X,38,211
  19 003c 3704AFA1 		NEGU \$4,175,161
  20              	
  21 0040 357B0C00 		NEG X,Y,0
  22 0044 37170C00 		NEGU \$23,Y,0
  23 0048 35020C00 		NEG \$2,Y,0
  24 004c 37E88500 		NEGU \$232,133,0
  25              	
  26 0050 347B0043 		NEG X,Z
  27 0054 36200043 		NEGU \$32,Z
  28 0058 357B0020 		NEG X,32
  29 005c 37E80085 		NEGU \$232,133
  30 0060 357B00B0 		NEG X,Z0
  31 0064 372000B0 		NEGU \$32,Z0
  32 0068 347B0020 		NEG X,\$32
  33 006c 36E80085 		NEGU \$232,\$133
  34              	X IS \$123
  35              	Y IS 12
  36              	Z IS \$67
  37              	Z0 IS 176
GAS for MMIX .*/regy-op\.s 			page 2


DEFINED SYMBOLS
.*/regy-op\.s:3      \.text:0000000000000000 Main
                            \*REG\*:000000000000007b X
                            \*ABS\*:000000000000000c Y
                            \*REG\*:0000000000000043 Z
                            \*ABS\*:00000000000000b0 Z0

NO UNDEFINED SYMBOLS
