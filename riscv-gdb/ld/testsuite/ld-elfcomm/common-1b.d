#source: common-1.s
#as: --elf-stt-common=no
#ld: -r
#readelf: -s -W

#...
 +[0-9]+: +0+4 +30 +OBJECT +GLOBAL +DEFAULT +COM +foobar
#pass
