#source: common-2.s
#as: --elf-stt-common=yes
#ld: -r -z nocommon
#readelf: -s -W

#...
 +[0-9]+: +0+4 +30 +TLS +GLOBAL +DEFAULT +COM +foobar
#pass
