#PROG: strip
#source: group-3.s
#strip: --strip-unneeded
#readelf: -Sg --wide
#name: strip with section group 7

#...
  \[[ 0-9]+\] .group[ \t]+GROUP[ \t]+.*
#...
  \[[ 0-9]+\] \.text.*[ \t]+PROGBITS[ \t0-9a-f]+AXG[ \t]+.*
#...
  \[[ 0-9]+\] \.data.*[ \t]+PROGBITS[ \t0-9a-f]+WAG[ \t]+.*
#...
COMDAT group section \[[ 0-9]+\] `.group' \[foo3\] contains . sections:
   \[Index\]    Name
   \[[ 0-9]+\]   .text.*
#...
   \[[ 0-9]+\]   .data.*
#pass
