#source: lea1.s
#as: --x32
#ld: -melf32_x86_64
#readelf: -SW

#failif
#...
[ 	]*\[.*\][ 	]+.*\.got .*
#...
