#as: -mevexrcig=ru
#objdump: -dw
#name: x86_64 AVX512ER rcig insns
#source: x86-64-avx512er-rcig.s

.*: +file format .*


Disassembly of section \.text:

0+ <_start>:
[ 	]*[a-f0-9]+:[ 	]*62 02 7d 58 c8 f5[ 	]*vexp2ps \{sae\},%zmm29,%zmm30
[ 	]*[a-f0-9]+:[ 	]*62 02 fd 58 c8 f5[ 	]*vexp2pd \{sae\},%zmm29,%zmm30
[ 	]*[a-f0-9]+:[ 	]*62 02 7d 58 ca f5[ 	]*vrcp28ps \{sae\},%zmm29,%zmm30
[ 	]*[a-f0-9]+:[ 	]*62 02 fd 58 ca f5[ 	]*vrcp28pd \{sae\},%zmm29,%zmm30
[ 	]*[a-f0-9]+:[ 	]*62 02 15 50 cb f4[ 	]*vrcp28ss \{sae\},%xmm28,%xmm29,%xmm30
[ 	]*[a-f0-9]+:[ 	]*62 02 95 50 cb f4[ 	]*vrcp28sd \{sae\},%xmm28,%xmm29,%xmm30
[ 	]*[a-f0-9]+:[ 	]*62 02 7d 58 cc f5[ 	]*vrsqrt28ps \{sae\},%zmm29,%zmm30
[ 	]*[a-f0-9]+:[ 	]*62 02 fd 58 cc f5[ 	]*vrsqrt28pd \{sae\},%zmm29,%zmm30
[ 	]*[a-f0-9]+:[ 	]*62 02 15 50 cd f4[ 	]*vrsqrt28ss \{sae\},%xmm28,%xmm29,%xmm30
[ 	]*[a-f0-9]+:[ 	]*62 02 95 50 cd f4[ 	]*vrsqrt28sd \{sae\},%xmm28,%xmm29,%xmm30
[ 	]*[a-f0-9]+:[ 	]*62 02 7d 58 c8 f5[ 	]*vexp2ps \{sae\},%zmm29,%zmm30
[ 	]*[a-f0-9]+:[ 	]*62 02 fd 58 c8 f5[ 	]*vexp2pd \{sae\},%zmm29,%zmm30
[ 	]*[a-f0-9]+:[ 	]*62 02 7d 58 ca f5[ 	]*vrcp28ps \{sae\},%zmm29,%zmm30
[ 	]*[a-f0-9]+:[ 	]*62 02 fd 58 ca f5[ 	]*vrcp28pd \{sae\},%zmm29,%zmm30
[ 	]*[a-f0-9]+:[ 	]*62 02 15 50 cb f4[ 	]*vrcp28ss \{sae\},%xmm28,%xmm29,%xmm30
[ 	]*[a-f0-9]+:[ 	]*62 02 95 50 cb f4[ 	]*vrcp28sd \{sae\},%xmm28,%xmm29,%xmm30
[ 	]*[a-f0-9]+:[ 	]*62 02 7d 58 cc f5[ 	]*vrsqrt28ps \{sae\},%zmm29,%zmm30
[ 	]*[a-f0-9]+:[ 	]*62 02 fd 58 cc f5[ 	]*vrsqrt28pd \{sae\},%zmm29,%zmm30
[ 	]*[a-f0-9]+:[ 	]*62 02 15 50 cd f4[ 	]*vrsqrt28ss \{sae\},%xmm28,%xmm29,%xmm30
[ 	]*[a-f0-9]+:[ 	]*62 02 95 50 cd f4[ 	]*vrsqrt28sd \{sae\},%xmm28,%xmm29,%xmm30
#pass
