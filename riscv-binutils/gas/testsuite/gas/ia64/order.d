#objdump: -j .foo -j .bar -rs
#name: ia64 byte order

.*: +file format .*

RELOCATION RECORDS FOR \[.foo\]:
OFFSET[ 	]+TYPE[ 	]+VALUE 
0+00008 DIR64MSB          foo
0+00018 DIR64MSB          foo
0+00028 DIR64LSB          foo
0+00038 DIR64LSB          foo


RELOCATION RECORDS FOR \[.bar\]:
OFFSET[ 	]+TYPE[ 	]+VALUE 
0+00010 DIR64LSB          foo
0+00040 DIR64LSB          foo
0+00058 DIR64MSB          foo
0+00080 DIR64MSB          foo


Contents of section .foo:
 0000 12340000 12345678 00000000 00000000  ................
 0010 01234567 89abcdef 00000000 00000000  ................
 0020 34120000 78563412 00000000 00000000  ................
 0030 efcdab89 67452301 00000000 00000000  ................
Contents of section .bar:
 0000 cdcccc3d 00000000 9a999999 9999c93f  ................
 0010 00000000 00000000 00000000 00000000  ................
 0020 cdcccccc cccccccc fd3f0000 00000000  ................
 0030 cdcccccc cccccccc fe3f0000 00000000  ................
 0040 00000000 00000000 3dcccccd 00000000  ................
 0050 3fc99999 9999999a 00000000 00000000  ................
 0060 3ffdcccc cccccccc cccd0000 00000000  ................
 0070 3ffecccc cccccccc cccd0000 00000000  ................
 0080 00000000 00000000                    ........        
