#objdump: -D
#as: -m68hc12
#name: 68HC12 movb movw instructions

.*:  +file format elf32\-m68hc12

Disassembly of section .text:

0+00 <\.text>:
[ ]+ 0:	86 00[ ]+ 	ldaa	#0x0
[ ]+ 2:	18 0a 0f 0f 	movb	0xf,X, 0xf,X
[ ]+ 6:	18 0a 0f 0f 	movb	0xf,X, 0xf,X
[ ]+ a:	18 0a 0f 0f 	movb	0xf,X, 0xf,X
[ ]+ e:	86 01[ ]+ 	ldaa	#0x1
[ ]+10:	18 0a 0f 0f 	movb	0xf,X, 0xf,X
[ ]+14:	18 0a 0f 0f 	movb	0xf,X, 0xf,X
[ ]+18:	18 0a 0f 0f 	movb	0xf,X, 0xf,X
[ ]+1c:	86 02[ ]+ 	ldaa	#0x2
[ ]+1e:	18 0a 0f 10 	movb	0xf,X, 0xfff0,X
[ ]+22:	18 0a 0f 10 	movb	0xf,X, 0xfff0,X
[ ]+26:	18 0a 0f 10 	movb	0xf,X, 0xfff0,X
[ ]+2a:	86 03[ ]+ 	ldaa	#0x3
[ ]+2c:	18 0a 10 0f 	movb	0xfff0,X, 0xf,X
[ ]+30:	18 0a 10 0f 	movb	0xfff0,X, 0xf,X
[ ]+34:	18 0a 10 0f 	movb	0xfff0,X, 0xf,X
[ ]+38:	86 04[ ]+ 	ldaa	#0x4
[ ]+3a:	18 02 0f 0f 	movw	0xf,X, 0xf,X
[ ]+3e:	18 02 0f 0f 	movw	0xf,X, 0xf,X
[ ]+42:	18 02 0f 0f 	movw	0xf,X, 0xf,X
[ ]+46:	86 05[ ]+ 	ldaa	#0x5
[ ]+48:	18 02 0f 0f 	movw	0xf,X, 0xf,X
[ ]+4c:	18 02 0f 0f 	movw	0xf,X, 0xf,X
[ ]+50:	18 02 0f 0f 	movw	0xf,X, 0xf,X
[ ]+54:	86 06[ ]+ 	ldaa	#0x6
[ ]+56:	18 02 0f 10 	movw	0xf,X, 0xfff0,X
[ ]+5a:	18 02 0f 10 	movw	0xf,X, 0xfff0,X
[ ]+5e:	18 02 0f 10 	movw	0xf,X, 0xfff0,X
[ ]+62:	86 07[ ]+ 	ldaa	#0x7
[ ]+64:	18 02 10 0f 	movw	0xfff0,X, 0xf,X
[ ]+68:	18 02 10 0f 	movw	0xfff0,X, 0xf,X
[ ]+6c:	18 02 10 0f 	movw	0xfff0,X, 0xf,X
[ ]+70:	86 08[ ]+ 	ldaa	#0x8
[ ]+72:	18 0a 4f 4f 	movb	0xf,Y, 0xf,Y
[ ]+76:	18 0a 4f 4f 	movb	0xf,Y, 0xf,Y
[ ]+7a:	18 0a 4f 4f 	movb	0xf,Y, 0xf,Y
[ ]+7e:	86 09[ ]+ 	ldaa	#0x9
[ ]+80:	18 0a 4f 4f 	movb	0xf,Y, 0xf,Y
[ ]+84:	18 0a 4f 4f 	movb	0xf,Y, 0xf,Y
[ ]+88:	18 0a 4f 4f 	movb	0xf,Y, 0xf,Y
[ ]+8c:	86 0a[ ]+ 	ldaa	#0xa
[ ]+8e:	18 0a 4f 50 	movb	0xf,Y, 0xfff0,Y
[ ]+92:	18 0a 4f 50 	movb	0xf,Y, 0xfff0,Y
[ ]+96:	18 0a 4f 50 	movb	0xf,Y, 0xfff0,Y
[ ]+9a:	86 0b[ ]+ 	ldaa	#0xb
[ ]+9c:	18 0a 50 4f 	movb	0xfff0,Y, 0xf,Y
[ ]+a0:	18 0a 50 4f 	movb	0xfff0,Y, 0xf,Y
[ ]+a4:	18 0a 50 4f 	movb	0xfff0,Y, 0xf,Y
[ ]+a8:	86 0c[ ]+	ldaa	#0xc
[ ]+aa:	18 02 4f 4f 	movw	0xf,Y, 0xf,Y
[ ]+ae:	18 02 4f 4f 	movw	0xf,Y, 0xf,Y
[ ]+b2:	18 02 4f 4f 	movw	0xf,Y, 0xf,Y
[ ]+b6:	86 0d[ ]+ 	ldaa	#0xd
[ ]+b8:	18 02 4f 4f 	movw	0xf,Y, 0xf,Y
[ ]+bc:	18 02 4f 4f 	movw	0xf,Y, 0xf,Y
[ ]+c0:	18 02 4f 4f 	movw	0xf,Y, 0xf,Y
[ ]+c4:	86 0e[ ]+ 	ldaa	#0xe
[ ]+c6:	18 02 4f 50 	movw	0xf,Y, 0xfff0,Y
[ ]+ca:	18 02 4f 50 	movw	0xf,Y, 0xfff0,Y
[ ]+ce:	18 02 4f 50 	movw	0xf,Y, 0xfff0,Y
[ ]+d2:	86 0f[ ]+ 	ldaa	#0xf
[ ]+d4:	18 02 50 4f 	movw	0xfff0,Y, 0xf,Y
[ ]+d8:	18 02 50 4f 	movw	0xfff0,Y, 0xf,Y
[ ]+dc:	18 02 50 4f 	movw	0xfff0,Y, 0xf,Y
[ ]+e0:	86 10[ ]+ 	ldaa	#0x10
[ ]+e2:	18 0a 4f cf 	movb	0xf,Y, 0xf,PC \{0xf5 <cat2\+0xe6>\}
[ ]+e6:	18 0a 4f cf 	movb	0xf,Y, 0xf,PC \{0xf9 <cat2\+0xea>\}
[ ]+ea:	18 0a 4f cf 	movb	0xf,Y, 0xf,PC \{0xfd <cat2\+0xee>\}
[ ]+ee:	86 11[ ]+ 	ldaa	#0x11
[ ]+f0:	18 0a 4f cf 	movb	0xf,Y, 0xf,PC \{0x103 <cat2\+0xf4>\}
[ ]+f4:	18 0a 4f cf 	movb	0xf,Y, 0xf,PC \{0x107 <cat2\+0xf8>\}
[ ]+f8:	18 0a 4f cf 	movb	0xf,Y, 0xf,PC \{0x10b <cat2\+0xfc>\}
[ ]+fc:	86 12[ ]+ 	ldaa	#0x12
[ ]+fe:	18 0a 4f d0 	movb	0xf,Y, 0xfff0,PC \{0xf2 <cat2\+0xe3>\}
 102:	18 0a 4f d0 	movb	0xf,Y, 0xfff0,PC \{0xf6 <cat2\+0xe7>\}
 106:	18 0a 4f d0 	movb	0xf,Y, 0xfff0,PC \{0xfa <cat2\+0xeb>\}
 10a:	86 13[ ]+ 	ldaa	#0x13
 10c:	18 0a 50 cf 	movb	0xfff0,Y, 0xf,PC \{0x11f <cat2\+0x110>\}
 110:	18 0a 50 cf 	movb	0xfff0,Y, 0xf,PC \{0x123 <cat2\+0x114>\}
 114:	18 0a 50 cf 	movb	0xfff0,Y, 0xf,PC \{0x127 <cat2\+0x118>\}
 118:	86 14[ ]+ 	ldaa	#0x14
 11a:	18 02 4f cf 	movw	0xf,Y, 0xf,PC \{0x12d <cat2\+0x11e>\}
 11e:	18 02 4f cf 	movw	0xf,Y, 0xf,PC \{0x131 <cat2\+0x122>\}
 122:	18 02 4f cf 	movw	0xf,Y, 0xf,PC \{0x135 <cat2\+0x126>\}
 126:	86 15[ ]+ 	ldaa	#0x15
 128:	18 02 4f cf 	movw	0xf,Y, 0xf,PC \{0x13b <cat2\+0x12c>\}
 12c:	18 02 4f cf 	movw	0xf,Y, 0xf,PC \{0x13f <cat2\+0x130>\}
 130:	18 02 4f cf 	movw	0xf,Y, 0xf,PC \{0x143 <cat2\+0x134>\}
 134:	86 16[ ]+ 	ldaa	#0x16
 136:	18 02 4f d0 	movw	0xf,Y, 0xfff0,PC \{0x12a <cat2\+0x11b>\}
 13a:	18 02 4f d0 	movw	0xf,Y, 0xfff0,PC \{0x12e <cat2\+0x11f>\}
 13e:	18 02 4f d0 	movw	0xf,Y, 0xfff0,PC \{0x132 <cat2\+0x123>\}
 142:	86 17[ ]+ 	ldaa	#0x17
 144:	18 02 50 cf 	movw	0xfff0,Y, 0xf,PC \{0x157 <cat2\+0x148>\}
 148:	18 02 50 cf 	movw	0xfff0,Y, 0xf,PC \{0x15b <cat2\+0x14c>\}
 14c:	18 02 50 cf 	movw	0xfff0,Y, 0xf,PC \{0x15f <cat2\+0x150>\}
 150:	86 18[ ]+ 	ldaa	#0x18
 152:	18 0a 8f cf 	movb	0xf,SP, 0xf,PC \{0x165 <cat2\+0x156>\}
 156:	18 0a 8f cf 	movb	0xf,SP, 0xf,PC \{0x169 <cat2\+0x15a>\}
 15a:	18 0a 8f cf 	movb	0xf,SP, 0xf,PC \{0x16d <cat2\+0x15e>\}
 15e:	86 19[ ]+ 	ldaa	#0x19
 160:	18 0a 8f cf 	movb	0xf,SP, 0xf,PC \{0x173 <cat2\+0x164>\}
 164:	18 0a 8f cf 	movb	0xf,SP, 0xf,PC \{0x177 <cat2\+0x168>\}
 168:	18 0a 8f cf 	movb	0xf,SP, 0xf,PC \{0x17b <cat2\+0x16c>\}
 16c:	86 1a[ ]+ 	ldaa	#0x1a
 16e:	18 0a 8f d0 	movb	0xf,SP, 0xfff0,PC \{0x162 <cat2\+0x153>\}
 172:	18 0a 8f d0 	movb	0xf,SP, 0xfff0,PC \{0x166 <cat2\+0x157>\}
 176:	18 0a 8f d0 	movb	0xf,SP, 0xfff0,PC \{0x16a <cat2\+0x15b>\}
 17a:	86 1b[ ]+ 	ldaa	#0x1b
 17c:	18 0a 90 cf 	movb	0xfff0,SP, 0xf,PC \{0x18f <cat2\+0x180>\}
 180:	18 0a 90 cf 	movb	0xfff0,SP, 0xf,PC \{0x193 <cat2\+0x184>\}
 184:	18 0a 90 cf 	movb	0xfff0,SP, 0xf,PC \{0x197 <cat2\+0x188>\}
 188:	86 1c[ ]+ 	ldaa	#0x1c
 18a:	18 02 8f cf 	movw	0xf,SP, 0xf,PC \{0x19d <cat2\+0x18e>\}
 18e:	18 02 8f cf 	movw	0xf,SP, 0xf,PC \{0x1a1 <cat2\+0x192>\}
 192:	18 02 8f cf 	movw	0xf,SP, 0xf,PC \{0x1a5 <cat2\+0x196>\}
 196:	86 1d[ ]+ 	ldaa	#0x1d
 198:	18 02 8f cf 	movw	0xf,SP, 0xf,PC \{0x1ab <cat2\+0x19c>\}
 19c:	18 02 8f cf 	movw	0xf,SP, 0xf,PC \{0x1af <cat2\+0x1a0>\}
 1a0:	18 02 8f cf 	movw	0xf,SP, 0xf,PC \{0x1b3 <cat2\+0x1a4>\}
 1a4:	86 1e[ ]+ 	ldaa	#0x1e
 1a6:	18 02 8f d0 	movw	0xf,SP, 0xfff0,PC \{0x19a <cat2\+0x18b>\}
 1aa:	18 02 8f d0 	movw	0xf,SP, 0xfff0,PC \{0x19e <cat2\+0x18f>\}
 1ae:	18 02 8f d0 	movw	0xf,SP, 0xfff0,PC \{0x1a2 <cat2\+0x193>\}
 1b2:	86 1f[ ]+ 	ldaa	#0x1f
 1b4:	18 02 90 cf 	movw	0xfff0,SP, 0xf,PC \{0x1c7 <cat2\+0x1b8>\}
 1b8:	18 02 90 cf 	movw	0xfff0,SP, 0xf,PC \{0x1cb <cat2\+0x1bc>\}
 1bc:	18 02 90 cf 	movw	0xfff0,SP, 0xf,PC \{0x1cf <cat2\+0x1c0>\}
 1c0:	86 20[ ]+ 	ldaa	#0x20
 1c2:	18 09 0f 10 	movb	0x1000 <cat2\+0xff1>, 0xf,X
 1c6:	00 
 1c7:	18 09 0f 10 	movb	0x1000 <cat2\+0xff1>, 0xf,X
 1cb:	00 
 1cc:	18 09 0f 10 	movb	0x1000 <cat2\+0xff1>, 0xf,X
 1d0:	00 
 1d1:	86 21[ ]+ 	ldaa	#0x21
 1d3:	18 0d 0f 10 	movb	0xf,X, 0x1000 <cat2\+0xff1>
 1d7:	00 
 1d8:	18 0d 0f 10 	movb	0xf,X, 0x1000 <cat2\+0xff1>
 1dc:	00 
 1dd:	18 0d 0f 10 	movb	0xf,X, 0x1000 <cat2\+0xff1>
 1e1:	00 
 1e2:	86 22[ ]+ 	ldaa	#0x22
 1e4:	18 09 10 10 	movb	0x1000 <cat2\+0xff1>, 0xfff0,X
 1e8:	00 
 1e9:	18 09 10 10 	movb	0x1000 <cat2\+0xff1>, 0xfff0,X
 1ed:	00 
 1ee:	18 09 10 10 	movb	0x1000 <cat2\+0xff1>, 0xfff0,X
 1f2:	00 
 1f3:	86 23[ ]+ 	ldaa	#0x23
 1f5:	18 0d 10 10 	movb	0xfff0,X, 0x1000 <cat2\+0xff1>
 1f9:	00 
 1fa:	18 0d 10 10 	movb	0xfff0,X, 0x1000 <cat2\+0xff1>
 1fe:	00 
 1ff:	18 0d 10 10 	movb	0xfff0,X, 0x1000 <cat2\+0xff1>
 203:	00 
 204:	86 24[ ]+ 	ldaa	#0x24
 206:	18 01 0f 10 	movw	0x1002 <cat2\+0xff3>, 0xf,X
 20a:	02 
 20b:	18 01 0f 10 	movw	0x1002 <cat2\+0xff3>, 0xf,X
 20f:	02 
 210:	18 01 0f 10 	movw	0x1002 <cat2\+0xff3>, 0xf,X
 214:	02 
 215:	86 25[ ]+ 	ldaa	#0x25
 217:	18 05 0f 10 	movw	0xf,X, 0x1002 <cat2\+0xff3>
 21b:	02 
 21c:	18 05 0f 10 	movw	0xf,X, 0x1002 <cat2\+0xff3>
 220:	02 
 221:	18 05 0f 10 	movw	0xf,X, 0x1002 <cat2\+0xff3>
 225:	02 
 226:	86 26[ ]+ 	ldaa	#0x26
 228:	18 01 10 10 	movw	0x1002 <cat2\+0xff3>, 0xfff0,X
 22c:	02 
 22d:	18 01 10 10 	movw	0x1002 <cat2\+0xff3>, 0xfff0,X
 231:	02 
 232:	18 01 10 10 	movw	0x1002 <cat2\+0xff3>, 0xfff0,X
 236:	02 
 237:	86 27[ ]+ 	ldaa	#0x27
 239:	18 05 10 10 	movw	0xfff0,X, 0x1002 <cat2\+0xff3>
 23d:	02 
 23e:	18 05 10 10 	movw	0xfff0,X, 0x1002 <cat2\+0xff3>
 242:	02 
 243:	18 05 10 10 	movw	0xfff0,X, 0x1002 <cat2\+0xff3>
 247:	02 
 248:	86 28[ ]+ 	ldaa	#0x28
 24a:	18 09 4f 10 	movb	0x1000 <cat2\+0xff1>, 0xf,Y
 24e:	00 
 24f:	18 09 4f 10 	movb	0x1000 <cat2\+0xff1>, 0xf,Y
 253:	00 
 254:	18 09 4f 10 	movb	0x1000 <cat2\+0xff1>, 0xf,Y
 258:	00 
 259:	86 29[ ]+ 	ldaa	#0x29
 25b:	18 0d 4f 10 	movb	0xf,Y, 0x1000 <cat2\+0xff1>
 25f:	00 
 260:	18 0d 4f 10 	movb	0xf,Y, 0x1000 <cat2\+0xff1>
 264:	00 
 265:	18 0d 4f 10 	movb	0xf,Y, 0x1000 <cat2\+0xff1>
 269:	00 
 26a:	86 2a[ ]+ 	ldaa	#0x2a
 26c:	18 09 50 10 	movb	0x1000 <cat2\+0xff1>, 0xfff0,Y
 270:	00 
 271:	18 09 50 10 	movb	0x1000 <cat2\+0xff1>, 0xfff0,Y
 275:	00 
 276:	18 09 50 10 	movb	0x1000 <cat2\+0xff1>, 0xfff0,Y
 27a:	00 
 27b:	86 2b[ ]+ 	ldaa	#0x2b
 27d:	18 0d 50 10 	movb	0xfff0,Y, 0x1000 <cat2\+0xff1>
 281:	00 
 282:	18 0d 50 10 	movb	0xfff0,Y, 0x1000 <cat2\+0xff1>
 286:	00 
 287:	18 0d 50 10 	movb	0xfff0,Y, 0x1000 <cat2\+0xff1>
 28b:	00 
 28c:	86 2c[ ]+ 	ldaa	#0x2c
 28e:	18 01 4f 10 	movw	0x1002 <cat2\+0xff3>, 0xf,Y
 292:	02 
 293:	18 01 4f 10 	movw	0x1002 <cat2\+0xff3>, 0xf,Y
 297:	02 
 298:	18 01 4f 10 	movw	0x1002 <cat2\+0xff3>, 0xf,Y
 29c:	02 
 29d:	86 2d[ ]+ 	ldaa	#0x2d
 29f:	18 05 4f 10 	movw	0xf,Y, 0x1002 <cat2\+0xff3>
 2a3:	02 
 2a4:	18 05 4f 10 	movw	0xf,Y, 0x1002 <cat2\+0xff3>
 2a8:	02 
 2a9:	18 05 4f 10 	movw	0xf,Y, 0x1002 <cat2\+0xff3>
 2ad:	02 
 2ae:	86 2e[ ]+ 	ldaa	#0x2e
 2b0:	18 01 50 10 	movw	0x1002 <cat2\+0xff3>, 0xfff0,Y
 2b4:	02 
 2b5:	18 01 50 10 	movw	0x1002 <cat2\+0xff3>, 0xfff0,Y
 2b9:	02 
 2ba:	18 01 50 10 	movw	0x1002 <cat2\+0xff3>, 0xfff0,Y
 2be:	02 
 2bf:	86 2f[ ]+ 	ldaa	#0x2f
 2c1:	18 05 50 10 	movw	0xfff0,Y, 0x1002 <cat2\+0xff3>
 2c5:	02 
 2c6:	18 05 50 10 	movw	0xfff0,Y, 0x1002 <cat2\+0xff3>
 2ca:	02 
 2cb:	18 05 50 10 	movw	0xfff0,Y, 0x1002 <cat2\+0xff3>
 2cf:	02 
 2d0:	86 30[ ]+ 	ldaa	#0x30
 2d2:	18 09 cf 10 	movb	0x1000 <cat2\+0xff1>, 0xf,PC \{0x2e4 <cat2\+0x2d5>\}
 2d6:	00 
 2d7:	18 09 cf 10 	movb	0x1000 <cat2\+0xff1>, 0xf,PC \{0x2e9 <cat2\+0x2da>\}
 2db:	00 
 2dc:	18 09 cf 10 	movb	0x1000 <cat2\+0xff1>, 0xf,PC \{0x2ee <cat2\+0x2df>\}
 2e0:	00 
 2e1:	86 31[ ]+ 	ldaa	#0x31
 2e3:	18 0d cf 10 	movb	0xf,PC \{0x2f5 <cat2\+0x2e6>\}, 0x1000 <cat2\+0xff1>
 2e7:	00 
 2e8:	18 0d cf 10 	movb	0xf,PC \{0x2fa <cat2\+0x2eb>\}, 0x1000 <cat2\+0xff1>
 2ec:	00 
 2ed:	18 0d cf 10 	movb	0xf,PC \{0x2ff <cat2\+0x2f0>\}, 0x1000 <cat2\+0xff1>
 2f1:	00 
 2f2:	86 32[ ]+ 	ldaa	#0x32
 2f4:	18 09 d0 10 	movb	0x1000 <cat2\+0xff1>, 0xfff0,PC \{0x2e7 <cat2\+0x2d8>\}
 2f8:	00 
 2f9:	18 09 d0 10 	movb	0x1000 <cat2\+0xff1>, 0xfff0,PC \{0x2ec <cat2\+0x2dd>\}
 2fd:	00 
 2fe:	18 09 d0 10 	movb	0x1000 <cat2\+0xff1>, 0xfff0,PC \{0x2f1 <cat2\+0x2e2>\}
 302:	00 
 303:	86 33[ ]+ 	ldaa	#0x33
 305:	18 0d d0 10 	movb	0xfff0,PC \{0x2f8 <cat2\+0x2e9>\}, 0x1000 <cat2\+0xff1>
 309:	00 
 30a:	18 0d d0 10 	movb	0xfff0,PC \{0x2fd <cat2\+0x2ee>\}, 0x1000 <cat2\+0xff1>
 30e:	00 
 30f:	18 0d d0 10 	movb	0xfff0,PC \{0x302 <cat2\+0x2f3>\}, 0x1000 <cat2\+0xff1>
 313:	00 
 314:	86 34[ ]+ 	ldaa	#0x34
 316:	18 01 cf 10 	movw	0x1002 <cat2\+0xff3>, 0xf,PC \{0x328 <cat2\+0x319>\}
 31a:	02 
 31b:	18 01 cf 10 	movw	0x1002 <cat2\+0xff3>, 0xf,PC \{0x32d <cat2\+0x31e>\}
 31f:	02 
 320:	18 01 cf 10 	movw	0x1002 <cat2\+0xff3>, 0xf,PC \{0x332 <cat2\+0x323>\}
 324:	02 
 325:	86 35[ ]+ 	ldaa	#0x35
 327:	18 05 cf 10 	movw	0xf,PC \{0x339 <cat2\+0x32a>\}, 0x1002 <cat2\+0xff3>
 32b:	02 
 32c:	18 05 cf 10 	movw	0xf,PC \{0x33e <cat2\+0x32f>\}, 0x1002 <cat2\+0xff3>
 330:	02 
 331:	18 05 cf 10 	movw	0xf,PC \{0x343 <cat2\+0x334>\}, 0x1002 <cat2\+0xff3>
 335:	02 
 336:	86 36[ ]+ 	ldaa	#0x36
 338:	18 01 d0 10 	movw	0x1002 <cat2\+0xff3>, 0xfff0,PC \{0x32b <cat2\+0x31c>\}
 33c:	02 
 33d:	18 01 d0 10 	movw	0x1002 <cat2\+0xff3>, 0xfff0,PC \{0x330 <cat2\+0x321>\}
 341:	02 
 342:	18 01 d0 10 	movw	0x1002 <cat2\+0xff3>, 0xfff0,PC \{0x335 <cat2\+0x326>\}
 346:	02 
 347:	86 37[ ]+ 	ldaa	#0x37
 349:	18 05 d0 10 	movw	0xfff0,PC \{0x33c <cat2\+0x32d>\}, 0x1002 <cat2\+0xff3>
 34d:	02 
 34e:	18 05 d0 10 	movw	0xfff0,PC \{0x341 <cat2\+0x332>\}, 0x1002 <cat2\+0xff3>
 352:	02 
 353:	18 05 d0 10 	movw	0xfff0,PC \{0x346 <cat2\+0x337>\}, 0x1002 <cat2\+0xff3>
 357:	02 
 358:	86 38[ ]+ 	ldaa	#0x38
 35a:	18 09 8f 10 	movb	0x1000 <cat2\+0xff1>, 0xf,SP
 35e:	00 
 35f:	18 09 8f 10 	movb	0x1000 <cat2\+0xff1>, 0xf,SP
 363:	00 
 364:	18 09 8f 10 	movb	0x1000 <cat2\+0xff1>, 0xf,SP
 368:	00 
 369:	86 39[ ]+ 	ldaa	#0x39
 36b:	18 0d 8f 10 	movb	0xf,SP, 0x1000 <cat2\+0xff1>
 36f:	00 
 370:	18 0d 8f 10 	movb	0xf,SP, 0x1000 <cat2\+0xff1>
 374:	00 
 375:	18 0d 8f 10 	movb	0xf,SP, 0x1000 <cat2\+0xff1>
 379:	00 
 37a:	86 3a[ ]+ 	ldaa	#0x3a
 37c:	18 09 90 10 	movb	0x1000 <cat2\+0xff1>, 0xfff0,SP
 380:	00 
 381:	18 09 90 10 	movb	0x1000 <cat2\+0xff1>, 0xfff0,SP
 385:	00 
 386:	18 09 90 10 	movb	0x1000 <cat2\+0xff1>, 0xfff0,SP
 38a:	00 
 38b:	86 3b[ ]+ 	ldaa	#0x3b
 38d:	18 0d 90 10 	movb	0xfff0,SP, 0x1000 <cat2\+0xff1>
 391:	00 
 392:	18 0d 90 10 	movb	0xfff0,SP, 0x1000 <cat2\+0xff1>
 396:	00 
 397:	18 0d 90 10 	movb	0xfff0,SP, 0x1000 <cat2\+0xff1>
 39b:	00 
 39c:	86 3c[ ]+ 	ldaa	#0x3c
 39e:	18 01 8f 10 	movw	0x1002 <cat2\+0xff3>, 0xf,SP
 3a2:	02 
 3a3:	18 01 8f 10 	movw	0x1002 <cat2\+0xff3>, 0xf,SP
 3a7:	02 
 3a8:	18 01 8f 10 	movw	0x1002 <cat2\+0xff3>, 0xf,SP
 3ac:	02 
 3ad:	86 3d[ ]+ 	ldaa	#0x3d
 3af:	18 05 8f 10 	movw	0xf,SP, 0x1002 <cat2\+0xff3>
 3b3:	02 
 3b4:	18 05 8f 10 	movw	0xf,SP, 0x1002 <cat2\+0xff3>
 3b8:	02 
 3b9:	18 05 8f 10 	movw	0xf,SP, 0x1002 <cat2\+0xff3>
 3bd:	02 
 3be:	86 3e[ ]+ 	ldaa	#0x3e
 3c0:	18 01 90 10 	movw	0x1002 <cat2\+0xff3>, 0xfff0,SP
 3c4:	02 
 3c5:	18 01 90 10 	movw	0x1002 <cat2\+0xff3>, 0xfff0,SP
 3c9:	02 
 3ca:	18 01 90 10 	movw	0x1002 <cat2\+0xff3>, 0xfff0,SP
 3ce:	02 
 3cf:	86 3f[ ]+ 	ldaa	#0x3f
 3d1:	18 05 90 10 	movw	0xfff0,SP, 0x1002 <cat2\+0xff3>
 3d5:	02 
 3d6:	18 05 90 10 	movw	0xfff0,SP, 0x1002 <cat2\+0xff3>
 3da:	02 
 3db:	18 05 90 10 	movw	0xfff0,SP, 0x1002 <cat2\+0xff3>
 3df:	02 
 3e0:	86 40[ ]+ 	ldaa	#0x40
 3e2:	18 08 07 aa 	movb	#0xaa, 0x7,X
 3e6:	18 08 07 aa 	movb	#0xaa, 0x7,X
 3ea:	18 08 07 aa 	movb	#0xaa, 0x7,X
 3ee:	86 41[ ]+ 	ldaa	#0x41
 3f0:	18 08 18 aa 	movb	#0xaa, 0xfff8,X
 3f4:	18 08 18 aa 	movb	#0xaa, 0xfff8,X
 3f8:	18 08 18 aa 	movb	#0xaa, 0xfff8,X
 3fc:	86 42[ ]+ 	ldaa	#0x42
 3fe:	18 00 07 00 	movw	#0x44 <cat2\+0x35>, 0x7,X
 402:	44 
 403:	18 00 07 00 	movw	#0x44 <cat2\+0x35>, 0x7,X
 407:	44 
 408:	18 00 07 00 	movw	#0x44 <cat2\+0x35>, 0x7,X
 40c:	44 
 40d:	86 43[ ]+ 	ldaa	#0x43
 40f:	18 00 18 00 	movw	#0x44 <cat2\+0x35>, 0xfff8,X
 413:	44 
 414:	18 00 18 00 	movw	#0x44 <cat2\+0x35>, 0xfff8,X
 418:	44 
 419:	18 00 18 00 	movw	#0x44 <cat2\+0x35>, 0xfff8,X
 41d:	44 
 41e:	86 44[ ]+ 	ldaa	#0x44
 420:	18 08 47 aa 	movb	#0xaa, 0x7,Y
 424:	18 08 47 aa 	movb	#0xaa, 0x7,Y
 428:	18 08 47 aa 	movb	#0xaa, 0x7,Y
 42c:	86 45[ ]+ 	ldaa	#0x45
 42e:	18 08 58 aa 	movb	#0xaa, 0xfff8,Y
 432:	18 08 58 aa 	movb	#0xaa, 0xfff8,Y
 436:	18 08 58 aa 	movb	#0xaa, 0xfff8,Y
 43a:	86 46[ ]+ 	ldaa	#0x46
 43c:	18 00 47 00 	movw	#0x44 <cat2\+0x35>, 0x7,Y
 440:	44 
 441:	18 00 47 00 	movw	#0x44 <cat2\+0x35>, 0x7,Y
 445:	44 
 446:	18 00 47 00 	movw	#0x44 <cat2\+0x35>, 0x7,Y
 44a:	44 
 44b:	86 47[ ]+ 	ldaa	#0x47
 44d:	18 00 58 00 	movw	#0x44 <cat2\+0x35>, 0xfff8,Y
 451:	44 
 452:	18 00 58 00 	movw	#0x44 <cat2\+0x35>, 0xfff8,Y
 456:	44 
 457:	18 00 58 00 	movw	#0x44 <cat2\+0x35>, 0xfff8,Y
 45b:	44 
 45c:	86 48[ ]+ 	ldaa	#0x48
 45e:	18 08 c7 aa 	movb	#0xaa, 0x7,PC \{0x468 <cat2\+0x459>\}
 462:	18 08 c7 aa 	movb	#0xaa, 0x7,PC \{0x46c <cat2\+0x45d>\}
 466:	18 08 c7 aa 	movb	#0xaa, 0x7,PC \{0x470 <cat2\+0x461>\}
 46a:	86 49[ ]+ 	ldaa	#0x49
 46c:	18 08 d8 aa 	movb	#0xaa, 0xfff8,PC \{0x467 <cat2\+0x458>\}
 470:	18 08 d8 aa 	movb	#0xaa, 0xfff8,PC \{0x46b <cat2\+0x45c>\}
 474:	18 08 d8 aa 	movb	#0xaa, 0xfff8,PC \{0x46f <cat2\+0x460>\}
 478:	86 4a[ ]+ 	ldaa	#0x4a
 47a:	18 00 c7 00 	movw	#0x44 <cat2\+0x35>, 0x7,PC \{0x484 <cat2\+0x475>\}
 47e:	44 
 47f:	18 00 c7 00 	movw	#0x44 <cat2\+0x35>, 0x7,PC \{0x489 <cat2\+0x47a>\}
 483:	44 
 484:	18 00 c7 00 	movw	#0x44 <cat2\+0x35>, 0x7,PC \{0x48e <cat2\+0x47f>\}
 488:	44 
 489:	86 4b[ ]+ 	ldaa	#0x4b
 48b:	18 00 d8 00 	movw	#0x44 <cat2\+0x35>, 0xfff8,PC \{0x486 <cat2\+0x477>\}
 48f:	44 
 490:	18 00 d8 00 	movw	#0x44 <cat2\+0x35>, 0xfff8,PC \{0x48b <cat2\+0x47c>\}
 494:	44 
 495:	18 00 d8 00 	movw	#0x44 <cat2\+0x35>, 0xfff8,PC \{0x490 <cat2\+0x481>\}
 499:	44 
 49a:	86 4c[ ]+ 	ldaa	#0x4c
 49c:	18 08 87 aa 	movb	#0xaa, 0x7,SP
 4a0:	18 08 87 aa 	movb	#0xaa, 0x7,SP
 4a4:	18 08 87 aa 	movb	#0xaa, 0x7,SP
 4a8:	86 4d[ ]+ 	ldaa	#0x4d
 4aa:	18 08 98 aa 	movb	#0xaa, 0xfff8,SP
 4ae:	18 08 98 aa 	movb	#0xaa, 0xfff8,SP
 4b2:	18 08 98 aa 	movb	#0xaa, 0xfff8,SP
 4b6:	86 4e[ ]+ 	ldaa	#0x4e
 4b8:	18 00 87 00 	movw	#0x44 <cat2\+0x35>, 0x7,SP
 4bc:	44 
 4bd:	18 00 87 00 	movw	#0x44 <cat2\+0x35>, 0x7,SP
 4c1:	44 
 4c2:	18 00 87 00 	movw	#0x44 <cat2\+0x35>, 0x7,SP
 4c6:	44 
 4c7:	86 4f[ ]+ 	ldaa	#0x4f
 4c9:	18 00 98 00 	movw	#0x44 <cat2\+0x35>, 0xfff8,SP
 4cd:	44 
 4ce:	18 00 98 00 	movw	#0x44 <cat2\+0x35>, 0xfff8,SP
 4d2:	44 
 4d3:	18 00 98 00 	movw	#0x44 <cat2\+0x35>, 0xfff8,SP
 4d7:	44 
 4d8:	86 50[ ]+ 	ldaa	#0x50

