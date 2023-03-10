#source: section16.s
#as: --no-pad-sections
#readelf: -Sg --wide
#name: mbind sections 16
# A number of targets do not support SHF_GNU_MBIND
#notarget: ![supports_gnu_osabi]

#...
  \[[ 0-9]+\] \.mbind\.data[ 	]+PROGBITS[ 	]+0+0 0+[0-9a-f]+ 0+1 00 WAD  0   0  1
#...
  \[[ 0-9]+\] \.mbind\.data[ 	]+PROGBITS[ 	]+0+0 0+[0-9a-f]+ 0+1 00 WAD  0   3  1
#...
  \[[ 0-9]+\] \.mbind\.text[ 	]+PROGBITS[ 	]+0+0 0+[0-9a-f]+ 0+1 00 AXD  0   0  .
#...
  \[[ 0-9]+\] \.mbind\.text[ 	]+PROGBITS[ 	]+0+0 0+[0-9a-f]+ 0+1 00 AXD  0   3  .
#...
  \[[ 0-9]+\] \.mbind\.bss[ 	]+NOBITS[ 	]+0+0 0+[0-9a-f]+ 0+5 00 WAD  0   0  1
#...
  \[[ 0-9]+\] \.mbind\.bss[ 	]+NOBITS[ 	]+0+0 0+[0-9a-f]+ 0+6 00 WAD  0   3  1
#...
  \[[ 0-9]+\] \.mbind\.rodata[ 	]+PROGBITS[ 	]+0+0 0+[0-9a-f]+ 0+1 00 AGD  0   2  1
#...
  \[[ 0-9]+\] \.mbind\.data[ 	]+PROGBITS[ 	]+0+0 0+[0-9a-f]+ 0+1 00 WAGD  0   0  1
#...
  \[[ 0-9]+\] \.mbind\.data[ 	]+PROGBITS[ 	]+0+0 0+[0-9a-f]+ 0+2 00 WAGD  0   3  1
#...
  \[[ 0-9]+\] \.mbind\.text[ 	]+PROGBITS[ 	]+0+0 0+[0-9a-f]+ 0+1 00 AXGD  0   3  1
#...
COMDAT group section \[    1\] `\.group' \[\.foo_group\] contains . sections:
[ 	]+\[Index\][ 	]+Name
[ 	]+\[[ 0-9]+][ 	]+\.mbind\.rodata
[ 	]+\[[ 0-9]+][ 	]+\.mbind\.data
[ 	]+\[[ 0-9]+][ 	]+\.mbind\.data
[ 	]+\[[ 0-9]+][ 	]+\.mbind\.text
#pass
