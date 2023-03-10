# mach: crisv0 crisv3 crisv8 crisv10 crisv32
# output: 1\n0\n1\n0\n1\n0\n1\n0\n0\n1\n1\n0\n1\n0\n1\n0\n1\n0\n0\n1\n0\n1\n1\n0\n1\n0\n0\n1\n1\n0\n1\n1\n0\n

 .include "testutils.inc"

 start
 clearf nzvc
 scc r3
 dumpr3 ; 1
 scs r3
 dumpr3 ; 0
 sne r3
 dumpr3 ; 1
 seq r3
 dumpr3 ; 0
 svc r3
 dumpr3 ; 1
 svs r3
 dumpr3 ; 0
 spl r3
 dumpr3 ; 1
 smi r3
 dumpr3 ; 0
 sls r3
 dumpr3 ; 0
 shi r3
 dumpr3 ; 1
 sge r3
 dumpr3 ; 1
 slt r3
 dumpr3 ; 0
 sgt r3
 dumpr3 ; 1
 sle r3
 dumpr3 ; 0
 sa r3
 dumpr3 ; 1
 setf nzvc
 scc r3
 dumpr3 ; 0
 scs r3
 dumpr3 ; 1
 sne r3
 dumpr3 ; 0
 svc r3
 dumpr3 ; 0
 svs r3
 dumpr3 ; 1
 spl r3
 dumpr3 ; 0
 smi r3
 dumpr3 ; 1
 sls r3
 dumpr3 ; 1
 shi r3
 dumpr3 ; 0
 sge r3
 dumpr3 ; 1
 slt r3
 dumpr3 ; 0
 sgt r3
 dumpr3 ; 0
 sle r3
 dumpr3 ; 1
 sa r3
 dumpr3 ; 1
 clearf n
 sge r3
 dumpr3 ; 0
 slt r3
 dumpr3 ; 1

 .if ..asm.arch.cris.v32
 setf p
 ssb r3
 .else
 moveq 1,r3
 .endif
 dumpr3 ; 1

 .if ..asm.arch.cris.v32
 clearf p
 ssb r3
 .else
 moveq 0,r3
 .endif
 dumpr3 ; 0

 quit
