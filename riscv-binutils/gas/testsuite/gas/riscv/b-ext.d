#as: -march=rv32i_zba_zbb_zbc
#source: b-ext.s
#objdump: -d

.*:[ 	]+file format .*


Disassembly of section .text:

0+000 <target>:
[ 	]+0:[ 	]+60051513[ 	]+clz[ 	]+a0,a0
[ 	]+4:[ 	]+60151513[ 	]+ctz[ 	]+a0,a0
[ 	]+8:[ 	]+60251513[ 	]+cpop[ 	]+a0,a0
[ 	]+c:[ 	]+0ac5c533[ 	]+min[ 	]+a0,a1,a2
[ 	]+10:[ 	]+0ac5d533[ 	]+minu[ 	]+a0,a1,a2
[ 	]+14:[ 	]+0ac5e533[ 	]+max[ 	]+a0,a1,a2
[ 	]+18:[ 	]+0ac5f533[ 	]+maxu[ 	]+a0,a1,a2
[ 	]+1c:[ 	]+60451513[ 	]+sext.b[ 	]+a0,a0
[ 	]+20:[ 	]+60551513[ 	]+sext.h[ 	]+a0,a0
[ 	]+24:[ 	]+08054533[ 	]+zext.h[ 	]+a0,a0
[ 	]+28:[ 	]+40c5f533[ 	]+andn[ 	]+a0,a1,a2
[ 	]+2c:[ 	]+40c5e533[ 	]+orn[ 	]+a0,a1,a2
[ 	]+30:[ 	]+40c5c533[ 	]+xnor[ 	]+a0,a1,a2
[ 	]+34:[ 	]+60c59533[ 	]+rol[ 	]+a0,a1,a2
[ 	]+38:[ 	]+60c5d533[ 	]+ror[ 	]+a0,a1,a2
[ 	]+3c:[ 	]+6025d513[ 	]+rori[ 	]+a0,a1,0x2
[ 	]+40:[ 	]+69855513[ 	]+rev8[ 	]+a0,a0
[ 	]+44:[ 	]+28755513[ 	]+orc.b[ 	]+a0,a0
[ 	]+48:[ 	]+20c5a533[ 	]+sh1add[ 	]+a0,a1,a2
[ 	]+4c:[ 	]+20c5c533[ 	]+sh2add[ 	]+a0,a1,a2
[ 	]+50:[ 	]+20c5e533[ 	]+sh3add[ 	]+a0,a1,a2
[ 	]+54:[ 	]+0ac59533[ 	]+clmul[ 	]+a0,a1,a2
[ 	]+58:[ 	]+0ac5b533[ 	]+clmulh[ 	]+a0,a1,a2
[ 	]+5c:[ 	]+0ac5a533[ 	]+clmulr[ 	]+a0,a1,a2
