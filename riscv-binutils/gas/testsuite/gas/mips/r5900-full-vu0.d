#objdump: -dr --prefix-addresses --show-raw-insn -M gpr-names=numeric -mmips:5900
#name: MIPS R5900 Full VU0
#as: -march=r5900

.*: +file format .*mips.*

Disassembly of section \.text:
[0-9a-f]+ <[^>]*> 4be0f9fd 	vabs\.xyzw	\$vf0xyzw,\$vf31xyzw
[0-9a-f]+ <[^>]*> 4be0faa8 	vadd\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf0xyzw
[0-9a-f]+ <[^>]*> 4be0faa2 	vaddi\.xyzw	\$vf10xyzw,\$vf31xyzw,\$I
[0-9a-f]+ <[^>]*> 4be0faa0 	vaddq\.xyzw	\$vf10xyzw,\$vf31xyzw,\$Q
[0-9a-f]+ <[^>]*> 4be1fa83 	vaddw\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1w
[0-9a-f]+ <[^>]*> 4be1fa80 	vaddx\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1x
[0-9a-f]+ <[^>]*> 4be1fa81 	vaddy\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1y
[0-9a-f]+ <[^>]*> 4be1fa82 	vaddz\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1z
[0-9a-f]+ <[^>]*> 4be0fabc 	vadda\.xyzw	\$ACCxyzw,\$vf0xyzw,\$vf31xyzw
[0-9a-f]+ <[^>]*> 4be0fa3e 	vaddai\.xyzw	\$ACCxyzw,\$vf31xyzw,\$I
[0-9a-f]+ <[^>]*> 4be0fa3c 	vaddaq\.xyzw	\$ACCxyzw,\$vf31xyzw,\$Q
[0-9a-f]+ <[^>]*> 4be1f83f 	vaddaw\.xyzw	\$ACCxyzw,\$vf31xyzw,\$vf1w
[0-9a-f]+ <[^>]*> 4be1f83c 	vaddax\.xyzw	\$ACCxyzw,\$vf31xyzw,\$vf1x
[0-9a-f]+ <[^>]*> 4be1f83d 	vadday\.xyzw	\$ACCxyzw,\$vf31xyzw,\$vf1y
[0-9a-f]+ <[^>]*> 4be1f83e 	vaddaz\.xyzw	\$ACCxyzw,\$vf31xyzw,\$vf1z
[0-9a-f]+ <[^>]*> 4a000038 	vcallms	0x0
[0-9a-f]+ <[^>]*> 4a001a38 	vcallms	0x340
[0-9a-f]+ <[^>]*> 4a007ff8 	vcallms	0xff8
[0-9a-f]+ <[^>]*> 4a00d839 	vcallmsr	\$vi27
[0-9a-f]+ <[^>]*> 4bc1f9ff 	vclipw\.xyz	\$vf31xyz,\$vf1w
[0-9a-f]+ <[^>]*> 4bc1f9ff 	vclipw\.xyz	\$vf31xyz,\$vf1w
[0-9a-f]+ <[^>]*> 4a2b0bbc 	vdiv	\$Q,\$vf1y,\$vf11x
[0-9a-f]+ <[^>]*> 4be0f97c 	vftoi0\.xyzw	\$vf0xyzw,\$vf31xyzw
[0-9a-f]+ <[^>]*> 4be0f97d 	vftoi4\.xyzw	\$vf0xyzw,\$vf31xyzw
[0-9a-f]+ <[^>]*> 4be0f97e 	vftoi12\.xyzw	\$vf0xyzw,\$vf31xyzw
[0-9a-f]+ <[^>]*> 4be0f97f 	vftoi15\.xyzw	\$vf0xyzw,\$vf31xyzw
[0-9a-f]+ <[^>]*> 4a007870 	viadd	\$vi1,\$vi15,\$vi0
[0-9a-f]+ <[^>]*> 4a007ff2 	viaddi	\$vi0,\$vi15,-1
[0-9a-f]+ <[^>]*> 4a007874 	viand	\$vi1,\$vi15,\$vi0
[0-9a-f]+ <[^>]*> 4a207bfe 	vilwr\.w	\$vi0,\(\$vi15\)
[0-9a-f]+ <[^>]*> 4b007bfe 	vilwr\.x	\$vi0,\(\$vi15\)
[0-9a-f]+ <[^>]*> 4a807bfe 	vilwr\.y	\$vi0,\(\$vi15\)
[0-9a-f]+ <[^>]*> 4a407bfe 	vilwr\.z	\$vi0,\(\$vi15\)
[0-9a-f]+ <[^>]*> 4a007875 	vior	\$vi1,\$vi15,\$vi0
[0-9a-f]+ <[^>]*> 4a207bff 	viswr\.w	\$vi0,\(\$vi15\)
[0-9a-f]+ <[^>]*> 4b007bff 	viswr\.x	\$vi0,\(\$vi15\)
[0-9a-f]+ <[^>]*> 4a807bff 	viswr\.y	\$vi0,\(\$vi15\)
[0-9a-f]+ <[^>]*> 4a407bff 	viswr\.z	\$vi0,\(\$vi15\)
[0-9a-f]+ <[^>]*> 4a007871 	visub	\$vi1,\$vi15,\$vi0
[0-9a-f]+ <[^>]*> 4be0f93c 	vitof0\.xyzw	\$vf0xyzw,\$vf31xyzw
[0-9a-f]+ <[^>]*> 4be0f93d 	vitof4\.xyzw	\$vf0xyzw,\$vf31xyzw
[0-9a-f]+ <[^>]*> 4be0f93e 	vitof12\.xyzw	\$vf0xyzw,\$vf31xyzw
[0-9a-f]+ <[^>]*> 4be0f93f 	vitof15\.xyzw	\$vf0xyzw,\$vf31xyzw
[0-9a-f]+ <[^>]*> 4be07b7e 	vlqd\.xyzw	\$vf0xyzw,\(\-\-\$vi15\)
[0-9a-f]+ <[^>]*> 4be07b7c 	vlqi\.xyzw	\$vf0xyzw,\(\$vi15\+\+\)
[0-9a-f]+ <[^>]*> 4be0faa9 	vmadd\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf0xyzw
[0-9a-f]+ <[^>]*> 4be0faa3 	vmaddi\.xyzw	\$vf10xyzw,\$vf31xyzw,\$I
[0-9a-f]+ <[^>]*> 4be0faa1 	vmaddq\.xyzw	\$vf10xyzw,\$vf31xyzw,\$Q
[0-9a-f]+ <[^>]*> 4be1fa8b 	vmaddw\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1w
[0-9a-f]+ <[^>]*> 4be1fa88 	vmaddx\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1x
[0-9a-f]+ <[^>]*> 4be1fa89 	vmaddy\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1y
[0-9a-f]+ <[^>]*> 4be1fa8a 	vmaddz\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1z
[0-9a-f]+ <[^>]*> 4be5198a 	vmaddz\.xyzw	\$vf6xyzw,\$vf3xyzw,\$vf5z
[0-9a-f]+ <[^>]*> 4be0fabd 	vmadda\.xyzw	\$ACCxyzw,\$vf31xyzw,\$vf0xyzw
[0-9a-f]+ <[^>]*> 4be0fa3f 	vmaddai\.xyzw	\$ACCxyzw,\$vf31xyzw,\$I
[0-9a-f]+ <[^>]*> 4be0fa3d 	vmaddaq\.xyzw	\$ACCxyzw,\$vf31xyzw,\$Q
[0-9a-f]+ <[^>]*> 4be1f8bf 	vmaddaw\.xyzw	\$ACCxyzw,\$vf31xyzw,\$vf1w
[0-9a-f]+ <[^>]*> 4be1f8bc 	vmaddax\.xyzw	\$ACCxyzw,\$vf31xyzw,\$vf1x
[0-9a-f]+ <[^>]*> 4be508bc 	vmaddax\.xyzw	\$ACCxyzw,\$vf1xyzw,\$vf5x
[0-9a-f]+ <[^>]*> 4be1f8bd 	vmadday\.xyzw	\$ACCxyzw,\$vf31xyzw,\$vf1y
[0-9a-f]+ <[^>]*> 4be510bd 	vmadday\.xyzw	\$ACCxyzw,\$vf2xyzw,\$vf5y
[0-9a-f]+ <[^>]*> 4be1f8be 	vmaddaz\.xyzw	\$ACCxyzw,\$vf31xyzw,\$vf1z
[0-9a-f]+ <[^>]*> 4be0faab 	vmax\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf0xyzw
[0-9a-f]+ <[^>]*> 4be0fa9d 	vmaxi\.xyzw	\$vf10xyzw,\$vf31xyzw,\$I
[0-9a-f]+ <[^>]*> 4be1fa93 	vmaxw\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1w
[0-9a-f]+ <[^>]*> 4be1fa90 	vmaxx\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1x
[0-9a-f]+ <[^>]*> 4be1fa91 	vmaxy\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1y
[0-9a-f]+ <[^>]*> 4be1fa92 	vmaxz\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1z
[0-9a-f]+ <[^>]*> 4be07bfd 	vmfir\.xyzw	\$vf0xyzw,\$vi15
[0-9a-f]+ <[^>]*> 4be0faaf 	vmini\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf0xyzw
[0-9a-f]+ <[^>]*> 4be0fa9f 	vminii\.xyzw	\$vf10xyzw,\$vf31xyzw,\$I
[0-9a-f]+ <[^>]*> 4be1fa97 	vminiw\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1w
[0-9a-f]+ <[^>]*> 4be1fa94 	vminix\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1x
[0-9a-f]+ <[^>]*> 4be1fa95 	vminiy\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1y
[0-9a-f]+ <[^>]*> 4be1fa96 	vminiz\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1z
[0-9a-f]+ <[^>]*> 4be0fb3c 	vmove\.xyzw	\$vf0xyzw,\$vf31xyzw
[0-9a-f]+ <[^>]*> 4be0fb3d 	vmr32\.xyzw	\$vf0xyzw,\$vf31xyzw
[0-9a-f]+ <[^>]*> 4be0faad 	vmsub\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf0xyzw
[0-9a-f]+ <[^>]*> 4be0faa7 	vmsubi\.xyzw	\$vf10xyzw,\$vf31xyzw,\$I
[0-9a-f]+ <[^>]*> 4be0faa5 	vmsubq\.xyzw	\$vf10xyzw,\$vf31xyzw,\$Q
[0-9a-f]+ <[^>]*> 4be1fa8f 	vmsubw\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1w
[0-9a-f]+ <[^>]*> 4be1fa8c 	vmsubx\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1x
[0-9a-f]+ <[^>]*> 4be1fa8d 	vmsuby\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1y
[0-9a-f]+ <[^>]*> 4be1fa8e 	vmsubz\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1z
[0-9a-f]+ <[^>]*> 4be0fafd 	vmsuba\.xyzw	\$ACCxyzw,\$vf0xyzw,\$vf31xyzw
[0-9a-f]+ <[^>]*> 4be0fa7f 	vmsubai\.xyzw	\$ACCxyzw,\$vf31xyzw,\$I
[0-9a-f]+ <[^>]*> 4be0fa7d 	vmsubaq\.xyzw	\$ACCxyzw,\$vf31xyzw,\$Q
[0-9a-f]+ <[^>]*> 4be1f8ff 	vmsubaw\.xyzw	\$ACCxyzw,\$vf31xyzw,\$vf1w
[0-9a-f]+ <[^>]*> 4be1f8fc 	vmsubax\.xyzw	\$ACCxyzw,\$vf31xyzw,\$vf1x
[0-9a-f]+ <[^>]*> 4be1f8fd 	vmsubay\.xyzw	\$ACCxyzw,\$vf31xyzw,\$vf1y
[0-9a-f]+ <[^>]*> 4be1f8fe 	vmsubaz\.xyzw	\$ACCxyzw,\$vf31xyzw,\$vf1z
[0-9a-f]+ <[^>]*> 4a400bfc 	vmtir	\$vi0,\$vf1z
[0-9a-f]+ <[^>]*> 4be0faaa 	vmul\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf0xyzw
[0-9a-f]+ <[^>]*> 4be0fa9e 	vmuli\.xyzw	\$vf10xyzw,\$vf31xyzw,\$I
[0-9a-f]+ <[^>]*> 4be0fa9c 	vmulq\.xyzw	\$vf10xyzw,\$vf31xyzw,\$Q
[0-9a-f]+ <[^>]*> 4be1fa9b 	vmulw\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1w
[0-9a-f]+ <[^>]*> 4be1fa98 	vmulx\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1x
[0-9a-f]+ <[^>]*> 4be1fa99 	vmuly\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1y
[0-9a-f]+ <[^>]*> 4be1fa9a 	vmulz\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1z
[0-9a-f]+ <[^>]*> 4be0fabe 	vmula\.xyzw	\$ACCxyzw,\$vf31xyzw,\$vf0xyzw
[0-9a-f]+ <[^>]*> 4be0f9fe 	vmulai\.xyzw	\$ACCxyzw,\$vf31xyzw,\$I
[0-9a-f]+ <[^>]*> 4be0f9fc 	vmulaq\.xyzw	\$ACCxyzw,\$vf31xyzw,\$Q
[0-9a-f]+ <[^>]*> 4be1f9bf 	vmulaw\.xyzw	\$ACCxyzw,\$vf31xyzw,\$vf1w
[0-9a-f]+ <[^>]*> 4be021bf 	vmulaw\.xyzw	\$ACCxyzw,\$vf4xyzw,\$vf0w
[0-9a-f]+ <[^>]*> 4be1f9bc 	vmulax\.xyzw	\$ACCxyzw,\$vf31xyzw,\$vf1x
[0-9a-f]+ <[^>]*> 4be1f9bd 	vmulay\.xyzw	\$ACCxyzw,\$vf31xyzw,\$vf1y
[0-9a-f]+ <[^>]*> 4be1f9be 	vmulaz\.xyzw	\$ACCxyzw,\$vf31xyzw,\$vf1z
[0-9a-f]+ <[^>]*> 4a0002ff 	vnop
[0-9a-f]+ <[^>]*> 4bc0fafe 	vopmula\.xyz	\$ACCxyz,\$vf31xyz,\$vf0xyz
[0-9a-f]+ <[^>]*> 4bc0faae 	vopmsub\.xyz	\$vf10xyz,\$vf31xyz,\$vf0xyz
[0-9a-f]+ <[^>]*> 4be0043d 	vrget.xyzw	\$vf0xyzw,\$R
[0-9a-f]+ <[^>]*> 4a600c3e 	vrinit	\$R,\$vf1w
[0-9a-f]+ <[^>]*> 4be0043c 	vrnext\.xyzw	\$vf0xyzw,\$R
[0-9a-f]+ <[^>]*> 4a6b0bbe 	vrsqrt	\$Q,\$vf1w,\$vf11x
[0-9a-f]+ <[^>]*> 4a000c3f 	vrxor	\$R,\$vf1x
[0-9a-f]+ <[^>]*> 4be0fb7f 	vsqd\.xyzw	\$vf31xyzw,\(\-\-\$vi0\)
[0-9a-f]+ <[^>]*> 4be0fb7d 	vsqi\.xyzw	\$vf31xyzw,\(\$vi0\+\+\)
[0-9a-f]+ <[^>]*> 4b2b03bd 	vsqrt	\$Q,\$vf11z
[0-9a-f]+ <[^>]*> 4be0faac 	vsub\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf0xyzw
[0-9a-f]+ <[^>]*> 4be0faa6 	vsubi\.xyzw	\$vf10xyzw,\$vf31xyzw,\$I
[0-9a-f]+ <[^>]*> 4be0faa4 	vsubq\.xyzw	\$vf10xyzw,\$vf31xyzw,\$Q
[0-9a-f]+ <[^>]*> 4be1fa87 	vsubw\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1w
[0-9a-f]+ <[^>]*> 4be1fa84 	vsubx\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1x
[0-9a-f]+ <[^>]*> 4be1fa85 	vsuby\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1y
[0-9a-f]+ <[^>]*> 4be1fa86 	vsubz\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf1z
[0-9a-f]+ <[^>]*> 4be0fafc 	vsuba\.xyzw	\$ACCxyzw,\$vf31xyzw,\$vf0xyzw
[0-9a-f]+ <[^>]*> 4be0fa7e 	vsubai\.xyzw	\$ACCxyzw,\$vf31xyzw,\$I
[0-9a-f]+ <[^>]*> 4be0fa7c 	vsubaq\.xyzw	\$ACCxyzw,\$vf31xyzw,\$Q
[0-9a-f]+ <[^>]*> 4be1f87f 	vsubaw\.xyzw	\$ACCxyzw,\$vf31xyzw,\$vf1w
[0-9a-f]+ <[^>]*> 4be1f87c 	vsubax\.xyzw	\$ACCxyzw,\$vf31xyzw,\$vf1x
[0-9a-f]+ <[^>]*> 4be1f87d 	vsubay\.xyzw	\$ACCxyzw,\$vf31xyzw,\$vf1y
[0-9a-f]+ <[^>]*> 4be1f87e 	vsubaz\.xyzw	\$ACCxyzw,\$vf31xyzw,\$vf1z
[0-9a-f]+ <[^>]*> 4a0003bf 	vwaitq
[0-9a-f]+ <[^>]*> 4be0faa8 	vadd\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf0xyzw
[0-9a-f]+ <[^>]*> 4b80faa8 	vadd\.xy	\$vf10xy,\$vf31xy,\$vf0xy
[0-9a-f]+ <[^>]*> 4be0faa8 	vadd\.xyzw	\$vf10xyzw,\$vf31xyzw,\$vf0xyzw
[0-9a-f]+ <[^>]*> 4b807b7c 	vlqi\.xy	\$vf0xy,\(\$vi15\+\+\)
[0-9a-f]+ <[^>]*> 4be20828 	vadd\.xyzw	\$vf0xyzw,\$vf1xyzw,\$vf2xyzw
[0-9a-f]+ <[^>]*> 4be520e8 	vadd\.xyzw	\$vf3xyzw,\$vf4xyzw,\$vf5xyzw
[0-9a-f]+ <[^>]*> 4be839a8 	vadd\.xyzw	\$vf6xyzw,\$vf7xyzw,\$vf8xyzw
[0-9a-f]+ <[^>]*> 4beb5268 	vadd\.xyzw	\$vf9xyzw,\$vf10xyzw,\$vf11xyzw
[0-9a-f]+ <[^>]*> 4bee6b28 	vadd\.xyzw	\$vf12xyzw,\$vf13xyzw,\$vf14xyzw
[0-9a-f]+ <[^>]*> 4bf183e8 	vadd\.xyzw	\$vf15xyzw,\$vf16xyzw,\$vf17xyzw
[0-9a-f]+ <[^>]*> 4bf49ca8 	vadd\.xyzw	\$vf18xyzw,\$vf19xyzw,\$vf20xyzw
[0-9a-f]+ <[^>]*> 4bf7b568 	vadd\.xyzw	\$vf21xyzw,\$vf22xyzw,\$vf23xyzw
[0-9a-f]+ <[^>]*> 4bface28 	vadd\.xyzw	\$vf24xyzw,\$vf25xyzw,\$vf26xyzw
[0-9a-f]+ <[^>]*> 4bfde6e8 	vadd\.xyzw	\$vf27xyzw,\$vf28xyzw,\$vf29xyzw
[0-9a-f]+ <[^>]*> 4be0ffa8 	vadd\.xyzw	\$vf30xyzw,\$vf31xyzw,\$vf0xyzw
[0-9a-f]+ <[^>]*> 4a020830 	viadd	\$vi0,\$vi1,\$vi2
[0-9a-f]+ <[^>]*> 4a0520f0 	viadd	\$vi3,\$vi4,\$vi5
[0-9a-f]+ <[^>]*> 4a0839b0 	viadd	\$vi6,\$vi7,\$vi8
[0-9a-f]+ <[^>]*> 4a0b5270 	viadd	\$vi9,\$vi10,\$vi11
[0-9a-f]+ <[^>]*> 4a0e6b30 	viadd	\$vi12,\$vi13,\$vi14
[0-9a-f]+ <[^>]*> 4a1183f0 	viadd	\$vi15,\$vi16,\$vi17
[0-9a-f]+ <[^>]*> 4a149cb0 	viadd	\$vi18,\$vi19,\$vi20
[0-9a-f]+ <[^>]*> 4a17b570 	viadd	\$vi21,\$vi22,\$vi23
[0-9a-f]+ <[^>]*> 4a1ace30 	viadd	\$vi24,\$vi25,\$vi26
[0-9a-f]+ <[^>]*> 4a1de6f0 	viadd	\$vi27,\$vi28,\$vi29
[0-9a-f]+ <[^>]*> 4a00ffb0 	viadd	\$vi30,\$vi31,\$vi0
[0-9a-f]+ <[^>]*> d8000000 	lqc2	\$vf0,0\(\$0\)
[0-9a-f]+ <[^>]*> d8217fff 	lqc2	\$vf1,32767\(\$1\)
[0-9a-f]+ <[^>]*> d9088000 	lqc2	\$vf8,-32768\(\$8\)
[0-9a-f]+ <[^>]*> dbffffff 	lqc2	\$vf31,-1\(\$31\)
[0-9a-f]+ <[^>]*> f8000000 	sqc2	\$vf0,0\(\$0\)
[0-9a-f]+ <[^>]*> f8217fff 	sqc2	\$vf1,32767\(\$1\)
[0-9a-f]+ <[^>]*> f9088000 	sqc2	\$vf8,-32768\(\$8\)
[0-9a-f]+ <[^>]*> fbffffff 	sqc2	\$vf31,-1\(\$31\)
[0-9a-f]+ <[^>]*> 48400000 	cfc2	\$0,\$vi0
[0-9a-f]+ <[^>]*> 4840f800 	cfc2	\$0,\$vi31
[0-9a-f]+ <[^>]*> 48400001 	cfc2\.i	\$0,\$vi0
[0-9a-f]+ <[^>]*> 4840f801 	cfc2\.i	\$0,\$vi31
[0-9a-f]+ <[^>]*> 48400000 	cfc2	\$0,\$vi0
[0-9a-f]+ <[^>]*> 4840f800 	cfc2	\$0,\$vi31
[0-9a-f]+ <[^>]*> 48c00000 	ctc2	\$0,\$vi0
[0-9a-f]+ <[^>]*> 48c0f800 	ctc2	\$0,\$vi31
[0-9a-f]+ <[^>]*> 48c00001 	ctc2\.i	\$0,\$vi0
[0-9a-f]+ <[^>]*> 48c0f801 	ctc2\.i	\$0,\$vi31
[0-9a-f]+ <[^>]*> 48c00000 	ctc2	\$0,\$vi0
[0-9a-f]+ <[^>]*> 48c0f800 	ctc2	\$0,\$vi31
[0-9a-f]+ <[^>]*> 48200000 	qmfc2	\$0,\$vf0
[0-9a-f]+ <[^>]*> 4820f800 	qmfc2	\$0,\$vf31
[0-9a-f]+ <[^>]*> 48200001 	qmfc2\.i	\$0,\$vf0
[0-9a-f]+ <[^>]*> 4820f801 	qmfc2\.i	\$0,\$vf31
[0-9a-f]+ <[^>]*> 48200000 	qmfc2	\$0,\$vf0
[0-9a-f]+ <[^>]*> 4820f800 	qmfc2	\$0,\$vf31
[0-9a-f]+ <[^>]*> 48a00000 	qmtc2	\$0,\$vf0
[0-9a-f]+ <[^>]*> 48a0f800 	qmtc2	\$0,\$vf31
[0-9a-f]+ <[^>]*> 48a00001 	qmtc2\.i	\$0,\$vf0
[0-9a-f]+ <[^>]*> 48a0f801 	qmtc2\.i	\$0,\$vf31
[0-9a-f]+ <[^>]*> 48a00000 	qmtc2	\$0,\$vf0
[0-9a-f]+ <[^>]*> 48a0f800 	qmtc2	\$0,\$vf31
	\.\.\.
