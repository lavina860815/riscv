#as: -mvsx
#objdump: -d -Mvsx
#name: VSX tests

.*


Disassembly of section \.text:

0+00 <start>:
   0:	(7d 0a a4 99|99 a4 0a 7d) 	lxsdx   vs40,r10,r20
   4:	(7d 0a a6 99|99 a6 0a 7d) 	lxvd2x  vs40,r10,r20
   8:	(7d 0a a2 99|99 a2 0a 7d) 	lxvdsx  vs40,r10,r20
   c:	(7d 0a a6 19|19 a6 0a 7d) 	lxvw4x  vs40,r10,r20
  10:	(7d 0a a5 99|99 a5 0a 7d) 	stxsdx  vs40,r10,r20
  14:	(7d 0a a7 99|99 a7 0a 7d) 	stxvd2x vs40,r10,r20
  18:	(7d 0a a7 19|19 a7 0a 7d) 	stxvw4x vs40,r10,r20
  1c:	(f1 00 e5 67|67 e5 00 f1) 	xsabsdp vs40,vs60
  20:	(f1 12 e1 07|07 e1 12 f1) 	xsadddp vs40,vs50,vs60
  24:	(f0 92 e1 5e|5e e1 92 f0) 	xscmpodp cr1,vs50,vs60
  28:	(f0 92 e1 1e|1e e1 92 f0) 	xscmpudp cr1,vs50,vs60
  2c:	(f1 12 e5 87|87 e5 12 f1) 	xscpsgndp vs40,vs50,vs60
  30:	(f1 00 e4 27|27 e4 00 f1) 	xscvdpsp vs40,vs60
  34:	(f1 00 e5 63|63 e5 00 f1) 	xscvdpsxds vs40,vs60
  38:	(f1 00 e1 63|63 e1 00 f1) 	xscvdpsxws vs40,vs60
  3c:	(f1 00 e5 23|23 e5 00 f1) 	xscvdpuxds vs40,vs60
  40:	(f1 00 e1 23|23 e1 00 f1) 	xscvdpuxws vs40,vs60
  44:	(f1 00 e5 27|27 e5 00 f1) 	xscvspdp vs40,vs60
  48:	(f1 00 e5 e3|e3 e5 00 f1) 	xscvsxddp vs40,vs60
  4c:	(f1 00 e5 a3|a3 e5 00 f1) 	xscvuxddp vs40,vs60
  50:	(f1 12 e1 c7|c7 e1 12 f1) 	xsdivdp vs40,vs50,vs60
  54:	(f1 12 e1 0f|0f e1 12 f1) 	xsmaddadp vs40,vs50,vs60
  58:	(f1 12 e1 4f|4f e1 12 f1) 	xsmaddmdp vs40,vs50,vs60
  5c:	(f1 12 e5 07|07 e5 12 f1) 	xsmaxdp vs40,vs50,vs60
  60:	(f1 12 e5 47|47 e5 12 f1) 	xsmindp vs40,vs50,vs60
  64:	(f1 12 e1 8f|8f e1 12 f1) 	xsmsubadp vs40,vs50,vs60
  68:	(f1 12 e1 cf|cf e1 12 f1) 	xsmsubmdp vs40,vs50,vs60
  6c:	(f1 12 e1 87|87 e1 12 f1) 	xsmuldp vs40,vs50,vs60
  70:	(f1 00 e5 a7|a7 e5 00 f1) 	xsnabsdp vs40,vs60
  74:	(f1 00 e5 e7|e7 e5 00 f1) 	xsnegdp vs40,vs60
  78:	(f1 12 e5 0f|0f e5 12 f1) 	xsnmaddadp vs40,vs50,vs60
  7c:	(f1 12 e5 4f|4f e5 12 f1) 	xsnmaddmdp vs40,vs50,vs60
  80:	(f1 12 e5 8f|8f e5 12 f1) 	xsnmsubadp vs40,vs50,vs60
  84:	(f1 12 e5 cf|cf e5 12 f1) 	xsnmsubmdp vs40,vs50,vs60
  88:	(f1 00 e1 27|27 e1 00 f1) 	xsrdpi  vs40,vs60
  8c:	(f1 00 e1 af|af e1 00 f1) 	xsrdpic vs40,vs60
  90:	(f1 00 e1 e7|e7 e1 00 f1) 	xsrdpim vs40,vs60
  94:	(f1 00 e1 a7|a7 e1 00 f1) 	xsrdpip vs40,vs60
  98:	(f1 00 e1 67|67 e1 00 f1) 	xsrdpiz vs40,vs60
  9c:	(f1 00 e1 6b|6b e1 00 f1) 	xsredp  vs40,vs60
  a0:	(f1 00 e1 2b|2b e1 00 f1) 	xsrsqrtedp vs40,vs60
  a4:	(f1 00 e1 2f|2f e1 00 f1) 	xssqrtdp vs40,vs60
  a8:	(f1 12 e1 47|47 e1 12 f1) 	xssubdp vs40,vs50,vs60
  ac:	(f0 92 e1 ee|ee e1 92 f0) 	xstdivdp cr1,vs50,vs60
  b0:	(f0 80 e1 aa|aa e1 80 f0) 	xstsqrtdp cr1,vs60
  b4:	(f1 00 e7 67|67 e7 00 f1) 	xvabsdp vs40,vs60
  b8:	(f1 00 e6 67|67 e6 00 f1) 	xvabssp vs40,vs60
  bc:	(f1 12 e3 07|07 e3 12 f1) 	xvadddp vs40,vs50,vs60
  c0:	(f1 12 e2 07|07 e2 12 f1) 	xvaddsp vs40,vs50,vs60
  c4:	(f1 12 e3 1f|1f e3 12 f1) 	xvcmpeqdp vs40,vs50,vs60
  c8:	(f1 12 e7 1f|1f e7 12 f1) 	xvcmpeqdp\. vs40,vs50,vs60
  cc:	(f1 12 e2 1f|1f e2 12 f1) 	xvcmpeqsp vs40,vs50,vs60
  d0:	(f1 12 e6 1f|1f e6 12 f1) 	xvcmpeqsp\. vs40,vs50,vs60
  d4:	(f1 12 e3 9f|9f e3 12 f1) 	xvcmpgedp vs40,vs50,vs60
  d8:	(f1 12 e7 9f|9f e7 12 f1) 	xvcmpgedp\. vs40,vs50,vs60
  dc:	(f1 12 e2 9f|9f e2 12 f1) 	xvcmpgesp vs40,vs50,vs60
  e0:	(f1 12 e6 9f|9f e6 12 f1) 	xvcmpgesp\. vs40,vs50,vs60
  e4:	(f1 12 e3 5f|5f e3 12 f1) 	xvcmpgtdp vs40,vs50,vs60
  e8:	(f1 12 e7 5f|5f e7 12 f1) 	xvcmpgtdp\. vs40,vs50,vs60
  ec:	(f1 12 e2 5f|5f e2 12 f1) 	xvcmpgtsp vs40,vs50,vs60
  f0:	(f1 12 e6 5f|5f e6 12 f1) 	xvcmpgtsp\. vs40,vs50,vs60
  f4:	(f1 12 e7 87|87 e7 12 f1) 	xvcpsgndp vs40,vs50,vs60
  f8:	(f1 1c e7 87|87 e7 1c f1) 	xvmovdp vs40,vs60
  fc:	(f1 1c e7 87|87 e7 1c f1) 	xvmovdp vs40,vs60
 100:	(f1 12 e6 87|87 e6 12 f1) 	xvcpsgnsp vs40,vs50,vs60
 104:	(f1 1c e6 87|87 e6 1c f1) 	xvmovsp vs40,vs60
 108:	(f1 1c e6 87|87 e6 1c f1) 	xvmovsp vs40,vs60
 10c:	(f1 00 e6 27|27 e6 00 f1) 	xvcvdpsp vs40,vs60
 110:	(f1 00 e7 63|63 e7 00 f1) 	xvcvdpsxds vs40,vs60
 114:	(f1 00 e3 63|63 e3 00 f1) 	xvcvdpsxws vs40,vs60
 118:	(f1 00 e7 23|23 e7 00 f1) 	xvcvdpuxds vs40,vs60
 11c:	(f1 00 e3 23|23 e3 00 f1) 	xvcvdpuxws vs40,vs60
 120:	(f1 00 e7 27|27 e7 00 f1) 	xvcvspdp vs40,vs60
 124:	(f1 00 e6 63|63 e6 00 f1) 	xvcvspsxds vs40,vs60
 128:	(f1 00 e2 63|63 e2 00 f1) 	xvcvspsxws vs40,vs60
 12c:	(f1 00 e6 23|23 e6 00 f1) 	xvcvspuxds vs40,vs60
 130:	(f1 00 e2 23|23 e2 00 f1) 	xvcvspuxws vs40,vs60
 134:	(f1 00 e7 e3|e3 e7 00 f1) 	xvcvsxddp vs40,vs60
 138:	(f1 00 e6 e3|e3 e6 00 f1) 	xvcvsxdsp vs40,vs60
 13c:	(f1 00 e3 e3|e3 e3 00 f1) 	xvcvsxwdp vs40,vs60
 140:	(f1 00 e2 e3|e3 e2 00 f1) 	xvcvsxwsp vs40,vs60
 144:	(f1 00 e7 a3|a3 e7 00 f1) 	xvcvuxddp vs40,vs60
 148:	(f1 00 e6 a3|a3 e6 00 f1) 	xvcvuxdsp vs40,vs60
 14c:	(f1 00 e3 a3|a3 e3 00 f1) 	xvcvuxwdp vs40,vs60
 150:	(f1 00 e2 a3|a3 e2 00 f1) 	xvcvuxwsp vs40,vs60
 154:	(f1 12 e3 c7|c7 e3 12 f1) 	xvdivdp vs40,vs50,vs60
 158:	(f1 12 e2 c7|c7 e2 12 f1) 	xvdivsp vs40,vs50,vs60
 15c:	(f1 12 e3 0f|0f e3 12 f1) 	xvmaddadp vs40,vs50,vs60
 160:	(f1 12 e3 4f|4f e3 12 f1) 	xvmaddmdp vs40,vs50,vs60
 164:	(f1 12 e2 0f|0f e2 12 f1) 	xvmaddasp vs40,vs50,vs60
 168:	(f1 12 e2 4f|4f e2 12 f1) 	xvmaddmsp vs40,vs50,vs60
 16c:	(f1 12 e7 07|07 e7 12 f1) 	xvmaxdp vs40,vs50,vs60
 170:	(f1 12 e6 07|07 e6 12 f1) 	xvmaxsp vs40,vs50,vs60
 174:	(f1 12 e7 47|47 e7 12 f1) 	xvmindp vs40,vs50,vs60
 178:	(f1 12 e6 47|47 e6 12 f1) 	xvminsp vs40,vs50,vs60
 17c:	(f1 12 e3 8f|8f e3 12 f1) 	xvmsubadp vs40,vs50,vs60
 180:	(f1 12 e3 cf|cf e3 12 f1) 	xvmsubmdp vs40,vs50,vs60
 184:	(f1 12 e2 8f|8f e2 12 f1) 	xvmsubasp vs40,vs50,vs60
 188:	(f1 12 e2 cf|cf e2 12 f1) 	xvmsubmsp vs40,vs50,vs60
 18c:	(f1 12 e3 87|87 e3 12 f1) 	xvmuldp vs40,vs50,vs60
 190:	(f1 12 e2 87|87 e2 12 f1) 	xvmulsp vs40,vs50,vs60
 194:	(f1 00 e7 a7|a7 e7 00 f1) 	xvnabsdp vs40,vs60
 198:	(f1 00 e6 a7|a7 e6 00 f1) 	xvnabssp vs40,vs60
 19c:	(f1 00 e7 e7|e7 e7 00 f1) 	xvnegdp vs40,vs60
 1a0:	(f1 00 e6 e7|e7 e6 00 f1) 	xvnegsp vs40,vs60
 1a4:	(f1 12 e7 0f|0f e7 12 f1) 	xvnmaddadp vs40,vs50,vs60
 1a8:	(f1 12 e7 4f|4f e7 12 f1) 	xvnmaddmdp vs40,vs50,vs60
 1ac:	(f1 12 e6 0f|0f e6 12 f1) 	xvnmaddasp vs40,vs50,vs60
 1b0:	(f1 12 e6 4f|4f e6 12 f1) 	xvnmaddmsp vs40,vs50,vs60
 1b4:	(f1 12 e7 8f|8f e7 12 f1) 	xvnmsubadp vs40,vs50,vs60
 1b8:	(f1 12 e7 cf|cf e7 12 f1) 	xvnmsubmdp vs40,vs50,vs60
 1bc:	(f1 12 e6 8f|8f e6 12 f1) 	xvnmsubasp vs40,vs50,vs60
 1c0:	(f1 12 e6 cf|cf e6 12 f1) 	xvnmsubmsp vs40,vs50,vs60
 1c4:	(f1 00 e3 27|27 e3 00 f1) 	xvrdpi  vs40,vs60
 1c8:	(f1 00 e3 af|af e3 00 f1) 	xvrdpic vs40,vs60
 1cc:	(f1 00 e3 e7|e7 e3 00 f1) 	xvrdpim vs40,vs60
 1d0:	(f1 00 e3 a7|a7 e3 00 f1) 	xvrdpip vs40,vs60
 1d4:	(f1 00 e3 67|67 e3 00 f1) 	xvrdpiz vs40,vs60
 1d8:	(f1 00 e3 6b|6b e3 00 f1) 	xvredp  vs40,vs60
 1dc:	(f1 00 e2 6b|6b e2 00 f1) 	xvresp  vs40,vs60
 1e0:	(f1 00 e2 27|27 e2 00 f1) 	xvrspi  vs40,vs60
 1e4:	(f1 00 e2 af|af e2 00 f1) 	xvrspic vs40,vs60
 1e8:	(f1 00 e2 e7|e7 e2 00 f1) 	xvrspim vs40,vs60
 1ec:	(f1 00 e2 a7|a7 e2 00 f1) 	xvrspip vs40,vs60
 1f0:	(f1 00 e2 67|67 e2 00 f1) 	xvrspiz vs40,vs60
 1f4:	(f1 00 e3 2b|2b e3 00 f1) 	xvrsqrtedp vs40,vs60
 1f8:	(f1 00 e2 2b|2b e2 00 f1) 	xvrsqrtesp vs40,vs60
 1fc:	(f1 00 e3 2f|2f e3 00 f1) 	xvsqrtdp vs40,vs60
 200:	(f1 00 e2 2f|2f e2 00 f1) 	xvsqrtsp vs40,vs60
 204:	(f1 12 e3 47|47 e3 12 f1) 	xvsubdp vs40,vs50,vs60
 208:	(f1 12 e2 47|47 e2 12 f1) 	xvsubsp vs40,vs50,vs60
 20c:	(f0 92 e3 ee|ee e3 92 f0) 	xvtdivdp cr1,vs50,vs60
 210:	(f0 92 e2 ee|ee e2 92 f0) 	xvtdivsp cr1,vs50,vs60
 214:	(f0 80 e3 aa|aa e3 80 f0) 	xvtsqrtdp cr1,vs60
 218:	(f0 80 e2 aa|aa e2 80 f0) 	xvtsqrtsp cr1,vs60
 21c:	(f1 12 e4 17|17 e4 12 f1) 	xxland  vs40,vs50,vs60
 220:	(f1 12 e4 57|57 e4 12 f1) 	xxlandc vs40,vs50,vs60
 224:	(f1 12 e5 17|17 e5 12 f1) 	xxlnor  vs40,vs50,vs60
 228:	(f1 12 e4 97|97 e4 12 f1) 	xxlor   vs40,vs50,vs60
 22c:	(f1 12 e4 d7|d7 e4 12 f1) 	xxlxor  vs40,vs50,vs60
 230:	(f1 12 e0 97|97 e0 12 f1) 	xxmrghw vs40,vs50,vs60
 234:	(f1 12 e1 97|97 e1 12 f1) 	xxmrglw vs40,vs50,vs60
 238:	(f1 12 e0 57|57 e0 12 f1) 	xxmrghd vs40,vs50,vs60
 23c:	(f1 12 e1 57|57 e1 12 f1) 	xxpermdi vs40,vs50,vs60,1
 240:	(f1 12 e2 57|57 e2 12 f1) 	xxpermdi vs40,vs50,vs60,2
 244:	(f1 12 e3 57|57 e3 12 f1) 	xxmrgld vs40,vs50,vs60
 248:	(f1 12 90 57|57 90 12 f1) 	xxspltd vs40,vs50,0
 24c:	(f1 12 90 57|57 90 12 f1) 	xxspltd vs40,vs50,0
 250:	(f1 12 93 57|57 93 12 f1) 	xxspltd vs40,vs50,1
 254:	(f1 12 93 57|57 93 12 f1) 	xxspltd vs40,vs50,1
 258:	(f1 12 e0 57|57 e0 12 f1) 	xxmrghd vs40,vs50,vs60
 25c:	(f1 12 e0 57|57 e0 12 f1) 	xxmrghd vs40,vs50,vs60
 260:	(f1 12 e3 57|57 e3 12 f1) 	xxmrgld vs40,vs50,vs60
 264:	(f1 12 92 57|57 92 12 f1) 	xxswapd vs40,vs50
 268:	(f1 12 92 57|57 92 12 f1) 	xxswapd vs40,vs50
 26c:	(f1 12 e7 bf|bf e7 12 f1) 	xxsel   vs40,vs50,vs60,vs62
 270:	(f1 12 e2 17|17 e2 12 f1) 	xxsldwi vs40,vs50,vs60,2
 274:	(f1 02 e2 93|93 e2 02 f1) 	xxspltw vs40,vs60,2
.*:	(7d 00 a6 99|99 a6 00 7d) 	lxvd2x  vs40,0,r20
.*:	(7d 0a a6 99|99 a6 0a 7d) 	lxvd2x  vs40,r10,r20
.*:	(7d 00 a7 99|99 a7 00 7d) 	stxvd2x vs40,0,r20
.*:	(7d 0a a7 99|99 a7 0a 7d) 	stxvd2x vs40,r10,r20
#pass
