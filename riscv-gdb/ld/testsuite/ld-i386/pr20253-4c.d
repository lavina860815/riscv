#source: pr20253-4.s
#as: --32 -mrelax-relocations=yes
#ld: -shared -melf_i386
#readelf: -r --wide

Relocation section '.rel.dyn' at offset 0x[0-9a-f]+ contains 2 entries:
 +Offset +Info +Type +Sym.* Value +Symbol's Name
[0-9a-f]+ +[0-9a-f]+ +R_386_GLOB_DAT +[0-9a-f]+ +__start
[0-9a-f]+ +[0-9a-f]+ +R_386_IRELATIVE +
