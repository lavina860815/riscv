#name: FRV uClinux PIC relocs to forced-local symbols, shared linking
#source: fdpic2.s
#objdump: -DR -j .text -j .data -j .got -j .plt
#ld: -shared --hash-style=sysv --version-script fdpic2.ldv

.*:     file format elf.*frv.*

Disassembly of section \.text:

[0-9a-f ]+<F2>:
[0-9a-f ]+:	80 3c 00 01 	call [0-9a-f]+ <GF0>

[0-9a-f ]+<GF0>:
[0-9a-f ]+:	80 40 f0 10 	addi gr15,16,gr0
[0-9a-f ]+:	80 fc 00 24 	setlos 0x24,gr0
[0-9a-f ]+:	80 f4 00 20 	setlo 0x20,gr0
[0-9a-f ]+:	80 f8 00 00 	sethi hi\(0x0\),gr0
[0-9a-f ]+:	80 40 f0 0c 	addi gr15,12,gr0
[0-9a-f ]+:	80 fc 00 18 	setlos 0x18,gr0
[0-9a-f ]+:	80 f4 00 14 	setlo 0x14,gr0
[0-9a-f ]+:	80 f8 00 00 	sethi hi\(0x0\),gr0
[0-9a-f ]+:	80 40 ff f8 	addi gr15,-8,gr0
[0-9a-f ]+:	80 fc ff d0 	setlos 0xf+fd0,gr0
[0-9a-f ]+:	80 f4 ff c8 	setlo 0xffc8,gr0
[0-9a-f ]+:	80 f8 ff ff 	sethi 0xffff,gr0
[0-9a-f ]+:	80 40 ff c0 	addi gr15,-64,gr0
[0-9a-f ]+:	80 fc ff c0 	setlos 0xf+fc0,gr0
[0-9a-f ]+:	80 f4 ff c0 	setlo 0xffc0,gr0
[0-9a-f ]+:	80 f8 ff ff 	sethi 0xffff,gr0
[0-9a-f ]+:	80 f4 00 1c 	setlo 0x1c,gr0
[0-9a-f ]+:	80 f8 00 00 	sethi hi\(0x0\),gr0
Disassembly of section \.dat[0-9a-f ]+:

[0-9a-f ]+<D2>:
[0-9a-f ]+:	00 00 00 04 	add\.p gr0,gr4,gr0
[0-9a-f	 ]+: R_FRV_32	\.data

[0-9a-f ]+<GD0>:
[0-9a-f ]+:	00 00 00 18 	add\.p gr0,gr24,gr0
[0-9a-f	 ]+: R_FRV_32	\.got
[0-9a-f ]+:	00 00 00 04 	add\.p gr0,gr4,gr0
[0-9a-f	 ]+: R_FRV_32	\.text
Disassembly of section \.got:

[0-9a-f ]+<.got>:
[0-9a-f ]+:	00 00 00 04 	add\.p gr0,gr4,gr0
[0-9a-f	 ]+: R_FRV_FUNCDESC_VALUE	\.text
[0-9a-f ]+:	00 00 00 00 	add\.p gr0,gr0,gr0
[0-9a-f ]+:	00 00 00 04 	add\.p gr0,gr4,gr0
[0-9a-f	 ]+: R_FRV_FUNCDESC_VALUE	\.text
[0-9a-f ]+:	00 00 00 00 	add\.p gr0,gr0,gr0
[0-9a-f ]+:	00 00 00 04 	add\.p gr0,gr4,gr0
[0-9a-f	 ]+: R_FRV_FUNCDESC_VALUE	\.text
[0-9a-f ]+:	00 00 00 00 	add\.p gr0,gr0,gr0
[0-9a-f ]+:	00 00 00 04 	add\.p gr0,gr4,gr0
[0-9a-f	 ]+: R_FRV_FUNCDESC_VALUE	\.text
[0-9a-f ]+:	00 00 00 00 	add\.p gr0,gr0,gr0
[0-9a-f ]+:	00 00 00 04 	add\.p gr0,gr4,gr0
[0-9a-f	 ]+: R_FRV_FUNCDESC_VALUE	\.text
[0-9a-f ]+:	00 00 00 00 	add\.p gr0,gr0,gr0
[0-9a-f ]+:	00 00 00 04 	add\.p gr0,gr4,gr0
[0-9a-f	 ]+: R_FRV_FUNCDESC_VALUE	\.text
[0-9a-f ]+:	00 00 00 00 	add\.p gr0,gr0,gr0
[0-9a-f ]+:	00 00 00 04 	add\.p gr0,gr4,gr0
[0-9a-f	 ]+: R_FRV_FUNCDESC_VALUE	\.text
[0-9a-f ]+:	00 00 00 00 	add\.p gr0,gr0,gr0

[0-9a-f ]+<_GLOBAL_OFFSET_TABLE_>:
	\.\.\.
[0-9a-f ]+:	00 00 00 10 	add\.p gr0,gr16,gr0
[0-9a-f	 ]+: R_FRV_32	\.got
[0-9a-f ]+:	00 00 00 04 	add\.p gr0,gr4,gr0
[0-9a-f	 ]+: R_FRV_32	\.text
[0-9a-f ]+:	00 00 00 28 	add\.p gr0,gr40,gr0
[0-9a-f	 ]+: R_FRV_32	\.got
[0-9a-f ]+:	00 00 00 20 	add\.p gr0,gr32,gr0
[0-9a-f	 ]+: R_FRV_32	\.got
[0-9a-f ]+:	00 00 00 04 	add\.p gr0,gr4,gr0
[0-9a-f	 ]+: R_FRV_32	\.data
[0-9a-f ]+:	00 00 00 04 	add\.p gr0,gr4,gr0
[0-9a-f	 ]+: R_FRV_32	\.text
[0-9a-f ]+:	00 00 00 04 	add\.p gr0,gr4,gr0
[0-9a-f	 ]+: R_FRV_32	\.text
