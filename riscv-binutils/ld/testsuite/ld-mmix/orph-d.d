#as: -linker-allocated-gregs
#source: start.s
#source: data-1.s
#source: tm-orph1.s
#source: tm-e.s
#ld: -m mmo -u __etext -u __Sdata -u __Edata -u __Sbss -u __Ebss -u __Eall
#objdump: -rst

# Like orph-d-awp.d but a section without specified flags; should
# attach to .debug_info, i.e. have address 0.

.*:     file format mmo

SYMBOL TABLE:
0+ +g +\.text Main
0+8 +g +\.text __etext
0+ +g +\.text __TMC_END__
20+8 +g +\.data __Ebss
20+8 +g +\.data __Edata
0+ +g +\.text _start
20+8 +g +\.data __Eall
20+ +g +\.data __Sdata
20+8 +g +\.data __Sbss

Contents of section \.text:
 0000 e3fd0001 23fcfe00 .*
Contents of section \.data:
 2000000000000004 00000042 .*
Contents of section .MMIX.reg_contents:
 07f0 00000000 00000007 .*
