source_sh ${srcdir}/emulparams/armelf.sh
OUTPUT_FORMAT="elf32-littlearm-vxworks"
BIG_OUTPUT_FORMAT="elf32-bigarm-vxworks"
LITTLE_OUTPUT_FORMAT="$OUTPUT_FORMAT"
MAXPAGESIZE="CONSTANT (MAXPAGESIZE)"
source_sh ${srcdir}/emulparams/vxworks.sh
