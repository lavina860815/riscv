#as: -a32 -m601 -maltivec
#objdump: -dr
#name: AltiVec tests

.*

Disassembly of section \.text:

00000000 <start>:
   0:	(7c 60 06 6c|6c 06 60 7c) 	dss     3
   4:	(7e 00 06 6c|6c 06 00 7e) 	dssall
   8:	(7c 25 22 ac|ac 22 25 7c) 	dst     r5,r4,1
   c:	(7e 08 3a ac|ac 3a 08 7e) 	dstt    r8,r7,0
  10:	(7c 65 32 ec|ec 32 65 7c) 	dstst   r5,r6,3
  14:	(7e 44 2a ec|ec 2a 44 7e) 	dststt  r4,r5,2
  18:	(7f d6 c0 0e|0e c0 d6 7f) 	lvebx   v30,r22,r24
  1c:	(7e a0 c0 0e|0e c0 a0 7e) 	lvebx   v21,0,r24
  20:	(7d 50 10 4e|4e 10 50 7d) 	lvehx   v10,r16,r2
  24:	(7e 80 b8 4e|4e b8 80 7e) 	lvehx   v20,0,r23
  28:	(7e 24 90 8e|8e 90 24 7e) 	lvewx   v17,r4,r18
  2c:	(7e e0 40 8e|8e 40 e0 7e) 	lvewx   v23,0,r8
  30:	(7c c0 c8 0c|0c c8 c0 7c) 	lvsl    v6,0,r25
  34:	(7c 40 30 0c|0c 30 40 7c) 	lvsl    v2,0,r6
  38:	(7e d0 60 4c|4c 60 d0 7e) 	lvsr    v22,r16,r12
  3c:	(7c 00 e8 4c|4c e8 00 7c) 	lvsr    v0,0,r29
  40:	(7d e5 6a ce|ce 6a e5 7d) 	lvxl    v15,r5,r13
  44:	(7e 60 ba ce|ce ba 60 7e) 	lvxl    v19,0,r23
  48:	(7e c1 10 ce|ce 10 c1 7e) 	lvx     v22,r1,r2
  4c:	(7e 40 88 ce|ce 88 40 7e) 	lvx     v18,0,r17
  50:	(7f e0 42 a6|a6 42 e0 7f) 	mfvrsave r31
  54:	(13 00 06 04|04 06 00 13) 	mfvscr  v24
  58:	(7d 40 43 a6|a6 43 40 7d) 	mtvrsave r10
  5c:	(10 00 ce 44|44 ce 00 10) 	mtvscr  v25
  60:	(7e 5b 51 0e|0e 51 5b 7e) 	stvebx  v18,r27,r10
  64:	(7e 00 31 0e|0e 31 00 7e) 	stvebx  v16,0,r6
  68:	(7e 2d 81 4e|4e 81 2d 7e) 	stvehx  v17,r13,r16
  6c:	(7e e0 a1 4e|4e a1 e0 7e) 	stvehx  v23,0,r20
  70:	(7d 73 f9 8e|8e f9 73 7d) 	stvewx  v11,r19,r31
  74:	(7f e0 09 8e|8e 09 e0 7f) 	stvewx  v31,0,r1
  78:	(7f 55 8b ce|ce 8b 55 7f) 	stvxl   v26,r21,r17
  7c:	(7d a0 b3 ce|ce b3 a0 7d) 	stvxl   v13,0,r22
  80:	(7d 7f f9 ce|ce f9 7f 7d) 	stvx    v11,r31,r31
  84:	(7f c0 81 ce|ce 81 c0 7f) 	stvx    v30,0,r16
  88:	(13 07 e1 80|80 e1 07 13) 	vaddcuw v24,v7,v28
  8c:	(10 7e 58 0a|0a 58 7e 10) 	vaddfp  v3,v30,v11
  90:	(11 1c 4b 00|00 4b 1c 11) 	vaddsbs v8,v28,v9
  94:	(10 e5 23 40|40 23 e5 10) 	vaddshs v7,v5,v4
  98:	(12 da db 80|80 db da 12) 	vaddsws v22,v26,v27
  9c:	(12 0e e0 00|00 e0 0e 12) 	vaddubm v16,v14,v28
  a0:	(10 c1 ca 00|00 ca c1 10) 	vaddubs v6,v1,v25
  a4:	(10 44 30 40|40 30 44 10) 	vadduhm v2,v4,v6
  a8:	(13 55 42 40|40 42 55 13) 	vadduhs v26,v21,v8
  ac:	(13 bf 08 80|80 08 bf 13) 	vadduwm v29,v31,v1
  b0:	(12 ed 22 80|80 22 ed 12) 	vadduws v23,v13,v4
  b4:	(13 d0 4c 44|44 4c d0 13) 	vandc   v30,v16,v9
  b8:	(10 6d dc 04|04 dc 6d 10) 	vand    v3,v13,v27
  bc:	(10 86 8d 02|02 8d 86 10) 	vavgsb  v4,v6,v17
  c0:	(12 fc 9d 42|42 9d fc 12) 	vavgsh  v23,v28,v19
  c4:	(11 0f fd 82|82 fd 0f 11) 	vavgsw  v8,v15,v31
  c8:	(10 c7 cc 02|02 cc c7 10) 	vavgub  v6,v7,v25
  cc:	(13 36 54 42|42 54 36 13) 	vavguh  v25,v22,v10
  d0:	(10 77 ec 82|82 ec 77 10) 	vavguw  v3,v23,v29
  d4:	(11 c6 13 ca|ca 13 c6 11) 	vctsxs  v14,v2,6
  d8:	(11 34 fb 8a|8a fb 34 11) 	vctuxs  v9,v31,20
  dc:	(13 03 f3 4a|4a f3 03 13) 	vcfsx   v24,v30,3
  e0:	(12 3d ab 0a|0a ab 3d 12) 	vcfux   v17,v21,29
  e4:	(12 5c 03 c6|c6 03 5c 12) 	vcmpbfp v18,v28,v0
  e8:	(12 7a 1f c6|c6 1f 7a 12) 	vcmpbfp\. v19,v26,v3
  ec:	(12 02 58 c6|c6 58 02 12) 	vcmpeqfp v16,v2,v11
  f0:	(12 ed 6c c6|c6 6c ed 12) 	vcmpeqfp\. v23,v13,v13
  f4:	(13 33 50 06|06 50 33 13) 	vcmpequb v25,v19,v10
  f8:	(12 4b 14 06|06 14 4b 12) 	vcmpequb\. v18,v11,v2
  fc:	(11 39 38 46|46 38 39 11) 	vcmpequh v9,v25,v7
 100:	(11 d8 ac 46|46 ac d8 11) 	vcmpequh\. v14,v24,v21
 104:	(13 0c 28 86|86 28 0c 13) 	vcmpequw v24,v12,v5
 108:	(12 70 0c 86|86 0c 70 12) 	vcmpequw\. v19,v16,v1
 10c:	(12 f1 81 c6|c6 81 f1 12) 	vcmpgefp v23,v17,v16
 110:	(12 7d 8d c6|c6 8d 7d 12) 	vcmpgefp\. v19,v29,v17
 114:	(12 1c 6a c6|c6 6a 1c 12) 	vcmpgtfp v16,v28,v13
 118:	(11 d8 3e c6|c6 3e d8 11) 	vcmpgtfp\. v14,v24,v7
 11c:	(12 16 33 06|06 33 16 12) 	vcmpgtsb v16,v22,v6
 120:	(10 4c 77 06|06 77 4c 10) 	vcmpgtsb\. v2,v12,v14
 124:	(13 83 eb 46|46 eb 83 13) 	vcmpgtsh v28,v3,v29
 128:	(12 13 6f 46|46 6f 13 12) 	vcmpgtsh\. v16,v19,v13
 12c:	(11 e0 2b 86|86 2b e0 11) 	vcmpgtsw v15,v0,v5
 130:	(12 ad 07 86|86 07 ad 12) 	vcmpgtsw\. v21,v13,v0
 134:	(10 aa f2 06|06 f2 aa 10) 	vcmpgtub v5,v10,v30
 138:	(10 ed 56 06|06 56 ed 10) 	vcmpgtub\. v7,v13,v10
 13c:	(13 0f 82 46|46 82 0f 13) 	vcmpgtuh v24,v15,v16
 140:	(13 35 de 46|46 de 35 13) 	vcmpgtuh\. v25,v21,v27
 144:	(12 3b 32 86|86 32 3b 12) 	vcmpgtuw v17,v27,v6
 148:	(11 15 de 86|86 de 15 11) 	vcmpgtuw\. v8,v21,v27
 14c:	(10 2e 0b 4a|4a 0b 2e 10) 	vcfsx   v1,v1,14
 150:	(10 99 7b ca|ca 7b 99 10) 	vctsxs  v4,v15,25
 154:	(13 8e bb 8a|8a bb 8e 13) 	vctuxs  v28,v23,14
 158:	(10 c0 33 0a|0a 33 c0 10) 	vcfux   v6,v6,0
 15c:	(10 00 41 8a|8a 41 00 10) 	vexptefp v0,v8
 160:	(12 c0 d9 ca|ca d9 c0 12) 	vlogefp v22,v27
 164:	(12 f2 91 6e|6e 91 f2 12) 	vmaddfp v23,v18,v5,v18
 168:	(11 ad dc 0a|0a dc ad 11) 	vmaxfp  v13,v13,v27
 16c:	(11 17 71 02|02 71 17 11) 	vmaxsb  v8,v23,v14
 170:	(12 71 01 42|42 01 71 12) 	vmaxsh  v19,v17,v0
 174:	(12 63 b1 82|82 b1 63 12) 	vmaxsw  v19,v3,v22
 178:	(12 fe e0 02|02 e0 fe 12) 	vmaxub  v23,v30,v28
 17c:	(11 34 b8 42|42 b8 34 11) 	vmaxuh  v9,v20,v23
 180:	(12 b3 08 82|82 08 b3 12) 	vmaxuw  v21,v19,v1
 184:	(12 cd 2d a0|a0 2d cd 12) 	vmhaddshs v22,v13,v5,v22
 188:	(13 e0 1c a1|a1 1c e0 13) 	vmhraddshs v31,v0,v3,v18
 18c:	(10 55 c4 4a|4a c4 55 10) 	vminfp  v2,v21,v24
 190:	(12 86 53 02|02 53 86 12) 	vminsb  v20,v6,v10
 194:	(12 5b d3 42|42 d3 5b 12) 	vminsh  v18,v27,v26
 198:	(10 64 0b 82|82 0b 64 10) 	vminsw  v3,v4,v1
 19c:	(10 e0 6a 02|02 6a e0 10) 	vminub  v7,v0,v13
 1a0:	(10 0c 32 42|42 32 0c 10) 	vminuh  v0,v12,v6
 1a4:	(10 c3 0a 82|82 0a c3 10) 	vminuw  v6,v3,v1
 1a8:	(10 7d 1e a2|a2 1e 7d 10) 	vmladduhm v3,v29,v3,v26
 1ac:	(12 a5 f8 0c|0c f8 a5 12) 	vmrghb  v21,v5,v31
 1b0:	(12 b8 00 4c|4c 00 b8 12) 	vmrghh  v21,v24,v0
 1b4:	(12 00 b0 8c|8c b0 00 12) 	vmrghw  v16,v0,v22
 1b8:	(10 31 81 0c|0c 81 31 10) 	vmrglb  v1,v17,v16
 1bc:	(11 c8 79 4c|4c 79 c8 11) 	vmrglh  v14,v8,v15
 1c0:	(13 f5 29 8c|8c 29 f5 13) 	vmrglw  v31,v21,v5
 1c4:	(13 09 4c 84|84 4c 09 13) 	vmr     v24,v9
 1c8:	(13 09 4c 84|84 4c 09 13) 	vmr     v24,v9
 1cc:	(10 18 7d e5|e5 7d 18 10) 	vmsummbm v0,v24,v15,v23
 1d0:	(10 24 3e 68|68 3e 24 10) 	vmsumshm v1,v4,v7,v25
 1d4:	(11 28 6f e9|e9 6f 28 11) 	vmsumshs v9,v8,v13,v31
 1d8:	(12 ff 67 a4|a4 67 ff 12) 	vmsumubm v23,v31,v12,v30
 1dc:	(13 a0 d5 66|66 d5 a0 13) 	vmsumuhm v29,v0,v26,v21
 1e0:	(13 6e c9 67|67 c9 6e 13) 	vmsumuhs v27,v14,v25,v5
 1e4:	(11 59 73 08|08 73 59 11) 	vmulesb v10,v25,v14
 1e8:	(10 32 43 48|48 43 32 10) 	vmulesh v1,v18,v8
 1ec:	(12 2e 4a 08|08 4a 2e 12) 	vmuleub v17,v14,v9
 1f0:	(10 ba 4a 48|48 4a ba 10) 	vmuleuh v5,v26,v9
 1f4:	(12 b2 31 08|08 31 b2 12) 	vmulosb v21,v18,v6
 1f8:	(10 85 41 48|48 41 85 10) 	vmulosh v4,v5,v8
 1fc:	(10 49 98 08|08 98 49 10) 	vmuloub v2,v9,v19
 200:	(13 a5 20 48|48 20 a5 13) 	vmulouh v29,v5,v4
 204:	(11 02 29 af|af 29 02 11) 	vnmsubfp v8,v2,v6,v5
 208:	(13 e9 55 04|04 55 e9 13) 	vnor    v31,v9,v10
 20c:	(13 3f fd 04|04 fd 3f 13) 	vnot    v25,v31
 210:	(13 3f fd 04|04 fd 3f 13) 	vnot    v25,v31
 214:	(12 e7 14 84|84 14 e7 12) 	vor     v23,v7,v2
 218:	(10 1c b6 6b|6b b6 1c 10) 	vperm   v0,v28,v22,v25
 21c:	(12 19 8b 0e|0e 8b 19 12) 	vpkpx   v16,v25,v17
 220:	(11 90 89 8e|8e 89 90 11) 	vpkshss v12,v16,v17
 224:	(10 33 b9 0e|0e b9 33 10) 	vpkshus v1,v19,v23
 228:	(13 27 69 ce|ce 69 27 13) 	vpkswss v25,v7,v13
 22c:	(10 98 51 4e|4e 51 98 10) 	vpkswus v4,v24,v10
 230:	(11 3b 60 0e|0e 60 3b 11) 	vpkuhum v9,v27,v12
 234:	(12 ca c8 8e|8e c8 ca 12) 	vpkuhus v22,v10,v25
 238:	(13 d2 00 4e|4e 00 d2 13) 	vpkuwum v30,v18,v0
 23c:	(10 e3 b0 ce|ce b0 e3 10) 	vpkuwus v7,v3,v22
 240:	(13 00 e1 0a|0a e1 00 13) 	vrefp   v24,v28
 244:	(12 20 9a ca|ca 9a 20 12) 	vrfim   v17,v19
 248:	(13 00 ca 0a|0a ca 00 13) 	vrfin   v24,v25
 24c:	(10 60 2a 8a|8a 2a 60 10) 	vrfip   v3,v5
 250:	(11 00 52 4a|4a 52 00 11) 	vrfiz   v8,v10
 254:	(13 52 f0 04|04 f0 52 13) 	vrlb    v26,v18,v30
 258:	(12 11 c8 44|44 c8 11 12) 	vrlh    v16,v17,v25
 25c:	(12 fe 48 84|84 48 fe 12) 	vrlw    v23,v30,v9
 260:	(10 40 91 4a|4a 91 40 10) 	vrsqrtefp v2,v18
 264:	(12 8e 92 aa|aa 92 8e 12) 	vsel    v20,v14,v18,v10
 268:	(13 39 61 04|04 61 39 13) 	vslb    v25,v25,v12
 26c:	(11 29 61 ec|ec 61 29 11) 	vsldoi  v9,v9,v12,7
 270:	(11 c2 59 44|44 59 c2 11) 	vslh    v14,v2,v11
 274:	(13 c5 34 0c|0c 34 c5 13) 	vslo    v30,v5,v6
 278:	(12 de 49 c4|c4 49 de 12) 	vsl     v22,v30,v9
 27c:	(13 5a 19 84|84 19 5a 13) 	vslw    v26,v26,v3
 280:	(10 26 a2 0c|0c a2 26 10) 	vspltb  v1,v20,6
 284:	(12 03 92 4c|4c 92 03 12) 	vsplth  v16,v18,3
 288:	(13 33 03 0c|0c 03 33 13) 	vspltisb v25,-13
 28c:	(12 ca 03 4c|4c 03 ca 12) 	vspltish v22,10
 290:	(11 ad 03 8c|8c 03 ad 11) 	vspltisw v13,13
 294:	(11 22 92 8c|8c 92 22 11) 	vspltw  v9,v18,2
 298:	(11 d6 03 04|04 03 d6 11) 	vsrab   v14,v22,v0
 29c:	(11 8c 93 44|44 93 8c 11) 	vsrah   v12,v12,v18
 2a0:	(10 42 6b 84|84 6b 42 10) 	vsraw   v2,v2,v13
 2a4:	(10 fb 2a 04|04 2a fb 10) 	vsrb    v7,v27,v5
 2a8:	(10 eb ea 44|44 ea eb 10) 	vsrh    v7,v11,v29
 2ac:	(12 5e fc 4c|4c fc 5e 12) 	vsro    v18,v30,v31
 2b0:	(10 49 e2 c4|c4 e2 49 10) 	vsr     v2,v9,v28
 2b4:	(10 19 02 84|84 02 19 10) 	vsrw    v0,v25,v0
 2b8:	(13 02 55 80|80 55 02 13) 	vsubcuw v24,v2,v10
 2bc:	(12 d8 a0 4a|4a a0 d8 12) 	vsubfp  v22,v24,v20
 2c0:	(11 56 6f 00|00 6f 56 11) 	vsubsbs v10,v22,v13
 2c4:	(13 11 e7 40|40 e7 11 13) 	vsubshs v24,v17,v28
 2c8:	(11 5a 07 80|80 07 5a 11) 	vsubsws v10,v26,v0
 2cc:	(12 0b c4 00|00 c4 0b 12) 	vsububm v16,v11,v24
 2d0:	(11 75 0e 00|00 0e 75 11) 	vsububs v11,v21,v1
 2d4:	(10 cc c4 40|40 c4 cc 10) 	vsubuhm v6,v12,v24
 2d8:	(13 cb 4e 40|40 4e cb 13) 	vsubuhs v30,v11,v9
 2dc:	(12 74 6c 80|80 6c 74 12) 	vsubuwm v19,v20,v13
 2e0:	(12 59 36 80|80 36 59 12) 	vsubuws v18,v25,v6
 2e4:	(13 2a 96 88|88 96 2a 13) 	vsum2sws v25,v10,v18
 2e8:	(11 b0 af 08|08 af b0 11) 	vsum4sbs v13,v16,v21
 2ec:	(12 e8 26 48|48 26 e8 12) 	vsum4shs v23,v8,v4
 2f0:	(13 8d f6 08|08 f6 8d 13) 	vsum4ubs v28,v13,v30
 2f4:	(12 ca 47 88|88 47 ca 12) 	vsumsws v22,v10,v8
 2f8:	(13 00 73 4e|4e 73 00 13) 	vupkhpx v24,v14
 2fc:	(10 40 b2 0e|0e b2 40 10) 	vupkhsb v2,v22
 300:	(12 00 12 4e|4e 12 00 12) 	vupkhsh v16,v2
 304:	(11 40 d3 ce|ce d3 40 11) 	vupklpx v10,v26
 308:	(11 e0 e2 8e|8e e2 e0 11) 	vupklsb v15,v28
 30c:	(11 00 42 ce|ce 42 00 11) 	vupklsh v8,v8
 310:	(13 20 1c c4|c4 1c 20 13) 	vxor    v25,v0,v3
#pass
