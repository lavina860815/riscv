#source: pr25490-6.s
#ld: --gc-sections -e _start
#readelf: -SW

#...
 +\[ *[0-9]+\] __patchable_function_entries +PROGBITS +[0-9a-f]+ +[0-9a-f]+ +0+6 +00 +WAL +[0-9] +0 +[1248]
#pass
