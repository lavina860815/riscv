#objdump: -r
#name: macro test 2
#source: ../macros/test2.s

.*: +file format .*

RELOCATION RECORDS FOR .*
OFFSET[ 	]+TYPE[ 	]+VALUE.*
0+08[ 	]+[a-zA-Z0-9_]+[ 	]+foo3
0+04[ 	]+[a-zA-Z0-9_]+[ 	]+foo2
0+00[ 	]+[a-zA-Z0-9_]+[ 	]+foo1
