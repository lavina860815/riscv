#objdump: -dr
#as:-march=armv8-a+lse

.*:     file format .*

Disassembly of section \.text:

0+ <.*>:
   0:	88a07c41 	cas	w0, w1, \[x2\]
   4:	88a27fe3 	cas	w2, w3, \[sp\]
   8:	88e07c41 	casa	w0, w1, \[x2\]
   c:	88e27fe3 	casa	w2, w3, \[sp\]
  10:	88a0fc41 	casl	w0, w1, \[x2\]
  14:	88a2ffe3 	casl	w2, w3, \[sp\]
  18:	88e0fc41 	casal	w0, w1, \[x2\]
  1c:	88e2ffe3 	casal	w2, w3, \[sp\]
  20:	08a07c41 	casb	w0, w1, \[x2\]
  24:	08a27fe3 	casb	w2, w3, \[sp\]
  28:	48a07c41 	cash	w0, w1, \[x2\]
  2c:	48a27fe3 	cash	w2, w3, \[sp\]
  30:	08e07c41 	casab	w0, w1, \[x2\]
  34:	08e27fe3 	casab	w2, w3, \[sp\]
  38:	08a0fc41 	caslb	w0, w1, \[x2\]
  3c:	08a2ffe3 	caslb	w2, w3, \[sp\]
  40:	08e0fc41 	casalb	w0, w1, \[x2\]
  44:	08e2ffe3 	casalb	w2, w3, \[sp\]
  48:	48e07c41 	casah	w0, w1, \[x2\]
  4c:	48e27fe3 	casah	w2, w3, \[sp\]
  50:	48a0fc41 	caslh	w0, w1, \[x2\]
  54:	48a2ffe3 	caslh	w2, w3, \[sp\]
  58:	48e0fc41 	casalh	w0, w1, \[x2\]
  5c:	48e2ffe3 	casalh	w2, w3, \[sp\]
  60:	c8a07c41 	cas	x0, x1, \[x2\]
  64:	c8a27fe3 	cas	x2, x3, \[sp\]
  68:	c8e07c41 	casa	x0, x1, \[x2\]
  6c:	c8e27fe3 	casa	x2, x3, \[sp\]
  70:	c8a0fc41 	casl	x0, x1, \[x2\]
  74:	c8a2ffe3 	casl	x2, x3, \[sp\]
  78:	c8e0fc41 	casal	x0, x1, \[x2\]
  7c:	c8e2ffe3 	casal	x2, x3, \[sp\]
  80:	b8208041 	swp	w0, w1, \[x2\]
  84:	b82283e3 	swp	w2, w3, \[sp\]
  88:	b8a08041 	swpa	w0, w1, \[x2\]
  8c:	b8a283e3 	swpa	w2, w3, \[sp\]
  90:	b8608041 	swpl	w0, w1, \[x2\]
  94:	b86283e3 	swpl	w2, w3, \[sp\]
  98:	b8e08041 	swpal	w0, w1, \[x2\]
  9c:	b8e283e3 	swpal	w2, w3, \[sp\]
  a0:	38208041 	swpb	w0, w1, \[x2\]
  a4:	382283e3 	swpb	w2, w3, \[sp\]
  a8:	78208041 	swph	w0, w1, \[x2\]
  ac:	782283e3 	swph	w2, w3, \[sp\]
  b0:	38a08041 	swpab	w0, w1, \[x2\]
  b4:	38a283e3 	swpab	w2, w3, \[sp\]
  b8:	38608041 	swplb	w0, w1, \[x2\]
  bc:	386283e3 	swplb	w2, w3, \[sp\]
  c0:	38e08041 	swpalb	w0, w1, \[x2\]
  c4:	38e283e3 	swpalb	w2, w3, \[sp\]
  c8:	78a08041 	swpah	w0, w1, \[x2\]
  cc:	78a283e3 	swpah	w2, w3, \[sp\]
  d0:	78608041 	swplh	w0, w1, \[x2\]
  d4:	786283e3 	swplh	w2, w3, \[sp\]
  d8:	78e08041 	swpalh	w0, w1, \[x2\]
  dc:	78e283e3 	swpalh	w2, w3, \[sp\]
  e0:	f8208041 	swp	x0, x1, \[x2\]
  e4:	f82283e3 	swp	x2, x3, \[sp\]
  e8:	f8a08041 	swpa	x0, x1, \[x2\]
  ec:	f8a283e3 	swpa	x2, x3, \[sp\]
  f0:	f8608041 	swpl	x0, x1, \[x2\]
  f4:	f86283e3 	swpl	x2, x3, \[sp\]
  f8:	f8e08041 	swpal	x0, x1, \[x2\]
  fc:	f8e283e3 	swpal	x2, x3, \[sp\]
 100:	08207ca2 	casp	w0, w1, w2, w3, \[x5\]
 104:	08247fe6 	casp	w4, w5, w6, w7, \[sp\]
 108:	48207c42 	casp	x0, x1, x2, x3, \[x2\]
 10c:	48247fe6 	casp	x4, x5, x6, x7, \[sp\]
 110:	08607ca2 	caspa	w0, w1, w2, w3, \[x5\]
 114:	08647fe6 	caspa	w4, w5, w6, w7, \[sp\]
 118:	48607c42 	caspa	x0, x1, x2, x3, \[x2\]
 11c:	48647fe6 	caspa	x4, x5, x6, x7, \[sp\]
 120:	0820fca2 	caspl	w0, w1, w2, w3, \[x5\]
 124:	0824ffe6 	caspl	w4, w5, w6, w7, \[sp\]
 128:	4820fc42 	caspl	x0, x1, x2, x3, \[x2\]
 12c:	4824ffe6 	caspl	x4, x5, x6, x7, \[sp\]
 130:	0860fca2 	caspal	w0, w1, w2, w3, \[x5\]
 134:	0864ffe6 	caspal	w4, w5, w6, w7, \[sp\]
 138:	4860fc42 	caspal	x0, x1, x2, x3, \[x2\]
 13c:	4864ffe6 	caspal	x4, x5, x6, x7, \[sp\]
 140:	b8200041 	ldadd	w0, w1, \[x2\]
 144:	b82203e3 	ldadd	w2, w3, \[sp\]
 148:	b8a00041 	ldadda	w0, w1, \[x2\]
 14c:	b8a203e3 	ldadda	w2, w3, \[sp\]
 150:	b8600041 	ldaddl	w0, w1, \[x2\]
 154:	b86203e3 	ldaddl	w2, w3, \[sp\]
 158:	b8e00041 	ldaddal	w0, w1, \[x2\]
 15c:	b8e203e3 	ldaddal	w2, w3, \[sp\]
 160:	38200041 	ldaddb	w0, w1, \[x2\]
 164:	382203e3 	ldaddb	w2, w3, \[sp\]
 168:	78200041 	ldaddh	w0, w1, \[x2\]
 16c:	782203e3 	ldaddh	w2, w3, \[sp\]
 170:	38a00041 	ldaddab	w0, w1, \[x2\]
 174:	38a203e3 	ldaddab	w2, w3, \[sp\]
 178:	38600041 	ldaddlb	w0, w1, \[x2\]
 17c:	386203e3 	ldaddlb	w2, w3, \[sp\]
 180:	38e00041 	ldaddalb	w0, w1, \[x2\]
 184:	38e203e3 	ldaddalb	w2, w3, \[sp\]
 188:	78a00041 	ldaddah	w0, w1, \[x2\]
 18c:	78a203e3 	ldaddah	w2, w3, \[sp\]
 190:	78600041 	ldaddlh	w0, w1, \[x2\]
 194:	786203e3 	ldaddlh	w2, w3, \[sp\]
 198:	78e00041 	ldaddalh	w0, w1, \[x2\]
 19c:	78e203e3 	ldaddalh	w2, w3, \[sp\]
 1a0:	f8200041 	ldadd	x0, x1, \[x2\]
 1a4:	f82203e3 	ldadd	x2, x3, \[sp\]
 1a8:	f8a00041 	ldadda	x0, x1, \[x2\]
 1ac:	f8a203e3 	ldadda	x2, x3, \[sp\]
 1b0:	f8600041 	ldaddl	x0, x1, \[x2\]
 1b4:	f86203e3 	ldaddl	x2, x3, \[sp\]
 1b8:	f8e00041 	ldaddal	x0, x1, \[x2\]
 1bc:	f8e203e3 	ldaddal	x2, x3, \[sp\]
 1c0:	b8201041 	ldclr	w0, w1, \[x2\]
 1c4:	b82213e3 	ldclr	w2, w3, \[sp\]
 1c8:	b8a01041 	ldclra	w0, w1, \[x2\]
 1cc:	b8a213e3 	ldclra	w2, w3, \[sp\]
 1d0:	b8601041 	ldclrl	w0, w1, \[x2\]
 1d4:	b86213e3 	ldclrl	w2, w3, \[sp\]
 1d8:	b8e01041 	ldclral	w0, w1, \[x2\]
 1dc:	b8e213e3 	ldclral	w2, w3, \[sp\]
 1e0:	38201041 	ldclrb	w0, w1, \[x2\]
 1e4:	382213e3 	ldclrb	w2, w3, \[sp\]
 1e8:	78201041 	ldclrh	w0, w1, \[x2\]
 1ec:	782213e3 	ldclrh	w2, w3, \[sp\]
 1f0:	38a01041 	ldclrab	w0, w1, \[x2\]
 1f4:	38a213e3 	ldclrab	w2, w3, \[sp\]
 1f8:	38601041 	ldclrlb	w0, w1, \[x2\]
 1fc:	386213e3 	ldclrlb	w2, w3, \[sp\]
 200:	38e01041 	ldclralb	w0, w1, \[x2\]
 204:	38e213e3 	ldclralb	w2, w3, \[sp\]
 208:	78a01041 	ldclrah	w0, w1, \[x2\]
 20c:	78a213e3 	ldclrah	w2, w3, \[sp\]
 210:	78601041 	ldclrlh	w0, w1, \[x2\]
 214:	786213e3 	ldclrlh	w2, w3, \[sp\]
 218:	78e01041 	ldclralh	w0, w1, \[x2\]
 21c:	78e213e3 	ldclralh	w2, w3, \[sp\]
 220:	f8201041 	ldclr	x0, x1, \[x2\]
 224:	f82213e3 	ldclr	x2, x3, \[sp\]
 228:	f8a01041 	ldclra	x0, x1, \[x2\]
 22c:	f8a213e3 	ldclra	x2, x3, \[sp\]
 230:	f8601041 	ldclrl	x0, x1, \[x2\]
 234:	f86213e3 	ldclrl	x2, x3, \[sp\]
 238:	f8e01041 	ldclral	x0, x1, \[x2\]
 23c:	f8e213e3 	ldclral	x2, x3, \[sp\]
 240:	b8202041 	ldeor	w0, w1, \[x2\]
 244:	b82223e3 	ldeor	w2, w3, \[sp\]
 248:	b8a02041 	ldeora	w0, w1, \[x2\]
 24c:	b8a223e3 	ldeora	w2, w3, \[sp\]
 250:	b8602041 	ldeorl	w0, w1, \[x2\]
 254:	b86223e3 	ldeorl	w2, w3, \[sp\]
 258:	b8e02041 	ldeoral	w0, w1, \[x2\]
 25c:	b8e223e3 	ldeoral	w2, w3, \[sp\]
 260:	38202041 	ldeorb	w0, w1, \[x2\]
 264:	382223e3 	ldeorb	w2, w3, \[sp\]
 268:	78202041 	ldeorh	w0, w1, \[x2\]
 26c:	782223e3 	ldeorh	w2, w3, \[sp\]
 270:	38a02041 	ldeorab	w0, w1, \[x2\]
 274:	38a223e3 	ldeorab	w2, w3, \[sp\]
 278:	38602041 	ldeorlb	w0, w1, \[x2\]
 27c:	386223e3 	ldeorlb	w2, w3, \[sp\]
 280:	38e02041 	ldeoralb	w0, w1, \[x2\]
 284:	38e223e3 	ldeoralb	w2, w3, \[sp\]
 288:	78a02041 	ldeorah	w0, w1, \[x2\]
 28c:	78a223e3 	ldeorah	w2, w3, \[sp\]
 290:	78602041 	ldeorlh	w0, w1, \[x2\]
 294:	786223e3 	ldeorlh	w2, w3, \[sp\]
 298:	78e02041 	ldeoralh	w0, w1, \[x2\]
 29c:	78e223e3 	ldeoralh	w2, w3, \[sp\]
 2a0:	f8202041 	ldeor	x0, x1, \[x2\]
 2a4:	f82223e3 	ldeor	x2, x3, \[sp\]
 2a8:	f8a02041 	ldeora	x0, x1, \[x2\]
 2ac:	f8a223e3 	ldeora	x2, x3, \[sp\]
 2b0:	f8602041 	ldeorl	x0, x1, \[x2\]
 2b4:	f86223e3 	ldeorl	x2, x3, \[sp\]
 2b8:	f8e02041 	ldeoral	x0, x1, \[x2\]
 2bc:	f8e223e3 	ldeoral	x2, x3, \[sp\]
 2c0:	b8203041 	ldset	w0, w1, \[x2\]
 2c4:	b82233e3 	ldset	w2, w3, \[sp\]
 2c8:	b8a03041 	ldseta	w0, w1, \[x2\]
 2cc:	b8a233e3 	ldseta	w2, w3, \[sp\]
 2d0:	b8603041 	ldsetl	w0, w1, \[x2\]
 2d4:	b86233e3 	ldsetl	w2, w3, \[sp\]
 2d8:	b8e03041 	ldsetal	w0, w1, \[x2\]
 2dc:	b8e233e3 	ldsetal	w2, w3, \[sp\]
 2e0:	38203041 	ldsetb	w0, w1, \[x2\]
 2e4:	382233e3 	ldsetb	w2, w3, \[sp\]
 2e8:	78203041 	ldseth	w0, w1, \[x2\]
 2ec:	782233e3 	ldseth	w2, w3, \[sp\]
 2f0:	38a03041 	ldsetab	w0, w1, \[x2\]
 2f4:	38a233e3 	ldsetab	w2, w3, \[sp\]
 2f8:	38603041 	ldsetlb	w0, w1, \[x2\]
 2fc:	386233e3 	ldsetlb	w2, w3, \[sp\]
 300:	38e03041 	ldsetalb	w0, w1, \[x2\]
 304:	38e233e3 	ldsetalb	w2, w3, \[sp\]
 308:	78a03041 	ldsetah	w0, w1, \[x2\]
 30c:	78a233e3 	ldsetah	w2, w3, \[sp\]
 310:	78603041 	ldsetlh	w0, w1, \[x2\]
 314:	786233e3 	ldsetlh	w2, w3, \[sp\]
 318:	78e03041 	ldsetalh	w0, w1, \[x2\]
 31c:	78e233e3 	ldsetalh	w2, w3, \[sp\]
 320:	f8203041 	ldset	x0, x1, \[x2\]
 324:	f82233e3 	ldset	x2, x3, \[sp\]
 328:	f8a03041 	ldseta	x0, x1, \[x2\]
 32c:	f8a233e3 	ldseta	x2, x3, \[sp\]
 330:	f8603041 	ldsetl	x0, x1, \[x2\]
 334:	f86233e3 	ldsetl	x2, x3, \[sp\]
 338:	f8e03041 	ldsetal	x0, x1, \[x2\]
 33c:	f8e233e3 	ldsetal	x2, x3, \[sp\]
 340:	b8204041 	ldsmax	w0, w1, \[x2\]
 344:	b82243e3 	ldsmax	w2, w3, \[sp\]
 348:	b8a04041 	ldsmaxa	w0, w1, \[x2\]
 34c:	b8a243e3 	ldsmaxa	w2, w3, \[sp\]
 350:	b8604041 	ldsmaxl	w0, w1, \[x2\]
 354:	b86243e3 	ldsmaxl	w2, w3, \[sp\]
 358:	b8e04041 	ldsmaxal	w0, w1, \[x2\]
 35c:	b8e243e3 	ldsmaxal	w2, w3, \[sp\]
 360:	38204041 	ldsmaxb	w0, w1, \[x2\]
 364:	382243e3 	ldsmaxb	w2, w3, \[sp\]
 368:	78204041 	ldsmaxh	w0, w1, \[x2\]
 36c:	782243e3 	ldsmaxh	w2, w3, \[sp\]
 370:	38a04041 	ldsmaxab	w0, w1, \[x2\]
 374:	38a243e3 	ldsmaxab	w2, w3, \[sp\]
 378:	38604041 	ldsmaxlb	w0, w1, \[x2\]
 37c:	386243e3 	ldsmaxlb	w2, w3, \[sp\]
 380:	38e04041 	ldsmaxalb	w0, w1, \[x2\]
 384:	38e243e3 	ldsmaxalb	w2, w3, \[sp\]
 388:	78a04041 	ldsmaxah	w0, w1, \[x2\]
 38c:	78a243e3 	ldsmaxah	w2, w3, \[sp\]
 390:	78604041 	ldsmaxlh	w0, w1, \[x2\]
 394:	786243e3 	ldsmaxlh	w2, w3, \[sp\]
 398:	78e04041 	ldsmaxalh	w0, w1, \[x2\]
 39c:	78e243e3 	ldsmaxalh	w2, w3, \[sp\]
 3a0:	f8204041 	ldsmax	x0, x1, \[x2\]
 3a4:	f82243e3 	ldsmax	x2, x3, \[sp\]
 3a8:	f8a04041 	ldsmaxa	x0, x1, \[x2\]
 3ac:	f8a243e3 	ldsmaxa	x2, x3, \[sp\]
 3b0:	f8604041 	ldsmaxl	x0, x1, \[x2\]
 3b4:	f86243e3 	ldsmaxl	x2, x3, \[sp\]
 3b8:	f8e04041 	ldsmaxal	x0, x1, \[x2\]
 3bc:	f8e243e3 	ldsmaxal	x2, x3, \[sp\]
 3c0:	b8205041 	ldsmin	w0, w1, \[x2\]
 3c4:	b82253e3 	ldsmin	w2, w3, \[sp\]
 3c8:	b8a05041 	ldsmina	w0, w1, \[x2\]
 3cc:	b8a253e3 	ldsmina	w2, w3, \[sp\]
 3d0:	b8605041 	ldsminl	w0, w1, \[x2\]
 3d4:	b86253e3 	ldsminl	w2, w3, \[sp\]
 3d8:	b8e05041 	ldsminal	w0, w1, \[x2\]
 3dc:	b8e253e3 	ldsminal	w2, w3, \[sp\]
 3e0:	38205041 	ldsminb	w0, w1, \[x2\]
 3e4:	382253e3 	ldsminb	w2, w3, \[sp\]
 3e8:	78205041 	ldsminh	w0, w1, \[x2\]
 3ec:	782253e3 	ldsminh	w2, w3, \[sp\]
 3f0:	38a05041 	ldsminab	w0, w1, \[x2\]
 3f4:	38a253e3 	ldsminab	w2, w3, \[sp\]
 3f8:	38605041 	ldsminlb	w0, w1, \[x2\]
 3fc:	386253e3 	ldsminlb	w2, w3, \[sp\]
 400:	38e05041 	ldsminalb	w0, w1, \[x2\]
 404:	38e253e3 	ldsminalb	w2, w3, \[sp\]
 408:	78a05041 	ldsminah	w0, w1, \[x2\]
 40c:	78a253e3 	ldsminah	w2, w3, \[sp\]
 410:	78605041 	ldsminlh	w0, w1, \[x2\]
 414:	786253e3 	ldsminlh	w2, w3, \[sp\]
 418:	78e05041 	ldsminalh	w0, w1, \[x2\]
 41c:	78e253e3 	ldsminalh	w2, w3, \[sp\]
 420:	f8205041 	ldsmin	x0, x1, \[x2\]
 424:	f82253e3 	ldsmin	x2, x3, \[sp\]
 428:	f8a05041 	ldsmina	x0, x1, \[x2\]
 42c:	f8a253e3 	ldsmina	x2, x3, \[sp\]
 430:	f8605041 	ldsminl	x0, x1, \[x2\]
 434:	f86253e3 	ldsminl	x2, x3, \[sp\]
 438:	f8e05041 	ldsminal	x0, x1, \[x2\]
 43c:	f8e253e3 	ldsminal	x2, x3, \[sp\]
 440:	b8206041 	ldumax	w0, w1, \[x2\]
 444:	b82263e3 	ldumax	w2, w3, \[sp\]
 448:	b8a06041 	ldumaxa	w0, w1, \[x2\]
 44c:	b8a263e3 	ldumaxa	w2, w3, \[sp\]
 450:	b8606041 	ldumaxl	w0, w1, \[x2\]
 454:	b86263e3 	ldumaxl	w2, w3, \[sp\]
 458:	b8e06041 	ldumaxal	w0, w1, \[x2\]
 45c:	b8e263e3 	ldumaxal	w2, w3, \[sp\]
 460:	38206041 	ldumaxb	w0, w1, \[x2\]
 464:	382263e3 	ldumaxb	w2, w3, \[sp\]
 468:	78206041 	ldumaxh	w0, w1, \[x2\]
 46c:	782263e3 	ldumaxh	w2, w3, \[sp\]
 470:	38a06041 	ldumaxab	w0, w1, \[x2\]
 474:	38a263e3 	ldumaxab	w2, w3, \[sp\]
 478:	38606041 	ldumaxlb	w0, w1, \[x2\]
 47c:	386263e3 	ldumaxlb	w2, w3, \[sp\]
 480:	38e06041 	ldumaxalb	w0, w1, \[x2\]
 484:	38e263e3 	ldumaxalb	w2, w3, \[sp\]
 488:	78a06041 	ldumaxah	w0, w1, \[x2\]
 48c:	78a263e3 	ldumaxah	w2, w3, \[sp\]
 490:	78606041 	ldumaxlh	w0, w1, \[x2\]
 494:	786263e3 	ldumaxlh	w2, w3, \[sp\]
 498:	78e06041 	ldumaxalh	w0, w1, \[x2\]
 49c:	78e263e3 	ldumaxalh	w2, w3, \[sp\]
 4a0:	f8206041 	ldumax	x0, x1, \[x2\]
 4a4:	f82263e3 	ldumax	x2, x3, \[sp\]
 4a8:	f8a06041 	ldumaxa	x0, x1, \[x2\]
 4ac:	f8a263e3 	ldumaxa	x2, x3, \[sp\]
 4b0:	f8606041 	ldumaxl	x0, x1, \[x2\]
 4b4:	f86263e3 	ldumaxl	x2, x3, \[sp\]
 4b8:	f8e06041 	ldumaxal	x0, x1, \[x2\]
 4bc:	f8e263e3 	ldumaxal	x2, x3, \[sp\]
 4c0:	b8207041 	ldumin	w0, w1, \[x2\]
 4c4:	b82273e3 	ldumin	w2, w3, \[sp\]
 4c8:	b8a07041 	ldumina	w0, w1, \[x2\]
 4cc:	b8a273e3 	ldumina	w2, w3, \[sp\]
 4d0:	b8607041 	lduminl	w0, w1, \[x2\]
 4d4:	b86273e3 	lduminl	w2, w3, \[sp\]
 4d8:	b8e07041 	lduminal	w0, w1, \[x2\]
 4dc:	b8e273e3 	lduminal	w2, w3, \[sp\]
 4e0:	38207041 	lduminb	w0, w1, \[x2\]
 4e4:	382273e3 	lduminb	w2, w3, \[sp\]
 4e8:	78207041 	lduminh	w0, w1, \[x2\]
 4ec:	782273e3 	lduminh	w2, w3, \[sp\]
 4f0:	38a07041 	lduminab	w0, w1, \[x2\]
 4f4:	38a273e3 	lduminab	w2, w3, \[sp\]
 4f8:	38607041 	lduminlb	w0, w1, \[x2\]
 4fc:	386273e3 	lduminlb	w2, w3, \[sp\]
 500:	38e07041 	lduminalb	w0, w1, \[x2\]
 504:	38e273e3 	lduminalb	w2, w3, \[sp\]
 508:	78a07041 	lduminah	w0, w1, \[x2\]
 50c:	78a273e3 	lduminah	w2, w3, \[sp\]
 510:	78607041 	lduminlh	w0, w1, \[x2\]
 514:	786273e3 	lduminlh	w2, w3, \[sp\]
 518:	78e07041 	lduminalh	w0, w1, \[x2\]
 51c:	78e273e3 	lduminalh	w2, w3, \[sp\]
 520:	f8207041 	ldumin	x0, x1, \[x2\]
 524:	f82273e3 	ldumin	x2, x3, \[sp\]
 528:	f8a07041 	ldumina	x0, x1, \[x2\]
 52c:	f8a273e3 	ldumina	x2, x3, \[sp\]
 530:	f8607041 	lduminl	x0, x1, \[x2\]
 534:	f86273e3 	lduminl	x2, x3, \[sp\]
 538:	f8e07041 	lduminal	x0, x1, \[x2\]
 53c:	f8e273e3 	lduminal	x2, x3, \[sp\]
 540:	b820005f 	stadd	w0, \[x2\]
 544:	b82203ff 	stadd	w2, \[sp\]
 548:	b860005f 	staddl	w0, \[x2\]
 54c:	b86203ff 	staddl	w2, \[sp\]
 550:	3820005f 	staddb	w0, \[x2\]
 554:	382203ff 	staddb	w2, \[sp\]
 558:	7820005f 	staddh	w0, \[x2\]
 55c:	782203ff 	staddh	w2, \[sp\]
 560:	3860005f 	staddlb	w0, \[x2\]
 564:	386203ff 	staddlb	w2, \[sp\]
 568:	7860005f 	staddlh	w0, \[x2\]
 56c:	786203ff 	staddlh	w2, \[sp\]
 570:	f820005f 	stadd	x0, \[x2\]
 574:	f82203ff 	stadd	x2, \[sp\]
 578:	f860005f 	staddl	x0, \[x2\]
 57c:	f86203ff 	staddl	x2, \[sp\]
 580:	b820105f 	stclr	w0, \[x2\]
 584:	b82213ff 	stclr	w2, \[sp\]
 588:	b860105f 	stclrl	w0, \[x2\]
 58c:	b86213ff 	stclrl	w2, \[sp\]
 590:	3820105f 	stclrb	w0, \[x2\]
 594:	382213ff 	stclrb	w2, \[sp\]
 598:	7820105f 	stclrh	w0, \[x2\]
 59c:	782213ff 	stclrh	w2, \[sp\]
 5a0:	3860105f 	stclrlb	w0, \[x2\]
 5a4:	386213ff 	stclrlb	w2, \[sp\]
 5a8:	7860105f 	stclrlh	w0, \[x2\]
 5ac:	786213ff 	stclrlh	w2, \[sp\]
 5b0:	f820105f 	stclr	x0, \[x2\]
 5b4:	f82213ff 	stclr	x2, \[sp\]
 5b8:	f860105f 	stclrl	x0, \[x2\]
 5bc:	f86213ff 	stclrl	x2, \[sp\]
 5c0:	b820205f 	steor	w0, \[x2\]
 5c4:	b82223ff 	steor	w2, \[sp\]
 5c8:	b860205f 	steorl	w0, \[x2\]
 5cc:	b86223ff 	steorl	w2, \[sp\]
 5d0:	3820205f 	steorb	w0, \[x2\]
 5d4:	382223ff 	steorb	w2, \[sp\]
 5d8:	7820205f 	steorh	w0, \[x2\]
 5dc:	782223ff 	steorh	w2, \[sp\]
 5e0:	3860205f 	steorlb	w0, \[x2\]
 5e4:	386223ff 	steorlb	w2, \[sp\]
 5e8:	7860205f 	steorlh	w0, \[x2\]
 5ec:	786223ff 	steorlh	w2, \[sp\]
 5f0:	f820205f 	steor	x0, \[x2\]
 5f4:	f82223ff 	steor	x2, \[sp\]
 5f8:	f860205f 	steorl	x0, \[x2\]
 5fc:	f86223ff 	steorl	x2, \[sp\]
 600:	b820305f 	stset	w0, \[x2\]
 604:	b82233ff 	stset	w2, \[sp\]
 608:	b860305f 	stsetl	w0, \[x2\]
 60c:	b86233ff 	stsetl	w2, \[sp\]
 610:	3820305f 	stsetb	w0, \[x2\]
 614:	382233ff 	stsetb	w2, \[sp\]
 618:	7820305f 	stseth	w0, \[x2\]
 61c:	782233ff 	stseth	w2, \[sp\]
 620:	3860305f 	stsetlb	w0, \[x2\]
 624:	386233ff 	stsetlb	w2, \[sp\]
 628:	7860305f 	stsetlh	w0, \[x2\]
 62c:	786233ff 	stsetlh	w2, \[sp\]
 630:	f820305f 	stset	x0, \[x2\]
 634:	f82233ff 	stset	x2, \[sp\]
 638:	f860305f 	stsetl	x0, \[x2\]
 63c:	f86233ff 	stsetl	x2, \[sp\]
 640:	b820405f 	stsmax	w0, \[x2\]
 644:	b82243ff 	stsmax	w2, \[sp\]
 648:	b860405f 	stsmaxl	w0, \[x2\]
 64c:	b86243ff 	stsmaxl	w2, \[sp\]
 650:	3820405f 	stsmaxb	w0, \[x2\]
 654:	382243ff 	stsmaxb	w2, \[sp\]
 658:	7820405f 	stsmaxh	w0, \[x2\]
 65c:	782243ff 	stsmaxh	w2, \[sp\]
 660:	3860405f 	stsmaxlb	w0, \[x2\]
 664:	386243ff 	stsmaxlb	w2, \[sp\]
 668:	7860405f 	stsmaxlh	w0, \[x2\]
 66c:	786243ff 	stsmaxlh	w2, \[sp\]
 670:	f820405f 	stsmax	x0, \[x2\]
 674:	f82243ff 	stsmax	x2, \[sp\]
 678:	f860405f 	stsmaxl	x0, \[x2\]
 67c:	f86243ff 	stsmaxl	x2, \[sp\]
 680:	b820505f 	stsmin	w0, \[x2\]
 684:	b82253ff 	stsmin	w2, \[sp\]
 688:	b860505f 	stsminl	w0, \[x2\]
 68c:	b86253ff 	stsminl	w2, \[sp\]
 690:	3820505f 	stsminb	w0, \[x2\]
 694:	382253ff 	stsminb	w2, \[sp\]
 698:	7820505f 	stsminh	w0, \[x2\]
 69c:	782253ff 	stsminh	w2, \[sp\]
 6a0:	3860505f 	stsminlb	w0, \[x2\]
 6a4:	386253ff 	stsminlb	w2, \[sp\]
 6a8:	7860505f 	stsminlh	w0, \[x2\]
 6ac:	786253ff 	stsminlh	w2, \[sp\]
 6b0:	f820505f 	stsmin	x0, \[x2\]
 6b4:	f82253ff 	stsmin	x2, \[sp\]
 6b8:	f860505f 	stsminl	x0, \[x2\]
 6bc:	f86253ff 	stsminl	x2, \[sp\]
 6c0:	b820605f 	stumax	w0, \[x2\]
 6c4:	b82263ff 	stumax	w2, \[sp\]
 6c8:	b860605f 	stumaxl	w0, \[x2\]
 6cc:	b86263ff 	stumaxl	w2, \[sp\]
 6d0:	3820605f 	stumaxb	w0, \[x2\]
 6d4:	382263ff 	stumaxb	w2, \[sp\]
 6d8:	7820605f 	stumaxh	w0, \[x2\]
 6dc:	782263ff 	stumaxh	w2, \[sp\]
 6e0:	3860605f 	stumaxlb	w0, \[x2\]
 6e4:	386263ff 	stumaxlb	w2, \[sp\]
 6e8:	7860605f 	stumaxlh	w0, \[x2\]
 6ec:	786263ff 	stumaxlh	w2, \[sp\]
 6f0:	f820605f 	stumax	x0, \[x2\]
 6f4:	f82263ff 	stumax	x2, \[sp\]
 6f8:	f860605f 	stumaxl	x0, \[x2\]
 6fc:	f86263ff 	stumaxl	x2, \[sp\]
 700:	b820705f 	stumin	w0, \[x2\]
 704:	b82273ff 	stumin	w2, \[sp\]
 708:	b860705f 	stuminl	w0, \[x2\]
 70c:	b86273ff 	stuminl	w2, \[sp\]
 710:	3820705f 	stuminb	w0, \[x2\]
 714:	382273ff 	stuminb	w2, \[sp\]
 718:	7820705f 	stuminh	w0, \[x2\]
 71c:	782273ff 	stuminh	w2, \[sp\]
 720:	3860705f 	stuminlb	w0, \[x2\]
 724:	386273ff 	stuminlb	w2, \[sp\]
 728:	7860705f 	stuminlh	w0, \[x2\]
 72c:	786273ff 	stuminlh	w2, \[sp\]
 730:	f820705f 	stumin	x0, \[x2\]
 734:	f82273ff 	stumin	x2, \[sp\]
 738:	f860705f 	stuminl	x0, \[x2\]
 73c:	f86273ff 	stuminl	x2, \[sp\]
