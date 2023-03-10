# name: MSR register operands in thumb mode
# as: -march=armv7-a -mthumb
# source: msr-reg.s
# objdump: -dr --prefix-addresses --show-raw-insn
# warning: writing to APSR without specifying a bitmask is deprecated
# skip: *-*-pe *-*-wince

.*: +file format .*arm.*

Disassembly of section .text:
00000000 <[^>]*> f389 8800 	msr	CPSR_f, r9
00000004 <[^>]*> f389 8400 	msr	CPSR_s, r9
00000008 <[^>]*> f389 8800 	msr	CPSR_f, r9
0000000c <[^>]*> f389 8c00 	msr	CPSR_fs, r9
00000010 <[^>]*> f389 8900 	msr	CPSR_fc, r9
00000014 <[^>]*> f389 8400 	msr	CPSR_s, r9
00000018 <[^>]*> f389 8800 	msr	CPSR_f, r9
0000001c <[^>]*> f389 8100 	msr	CPSR_c, r9
00000020 <[^>]*> f389 8200 	msr	CPSR_x, r9
00000024 <[^>]*> f389 8c00 	msr	CPSR_fs, r9
00000028 <[^>]*> f389 8a00 	msr	CPSR_fx, r9
0000002c <[^>]*> f389 8900 	msr	CPSR_fc, r9
00000030 <[^>]*> f389 8c00 	msr	CPSR_fs, r9
00000034 <[^>]*> f389 8600 	msr	CPSR_sx, r9
00000038 <[^>]*> f389 8500 	msr	CPSR_sc, r9
0000003c <[^>]*> f389 8a00 	msr	CPSR_fx, r9
00000040 <[^>]*> f389 8600 	msr	CPSR_sx, r9
00000044 <[^>]*> f389 8300 	msr	CPSR_xc, r9
00000048 <[^>]*> f389 8900 	msr	CPSR_fc, r9
0000004c <[^>]*> f389 8500 	msr	CPSR_sc, r9
00000050 <[^>]*> f389 8300 	msr	CPSR_xc, r9
00000054 <[^>]*> f389 8e00 	msr	CPSR_fsx, r9
00000058 <[^>]*> f389 8d00 	msr	CPSR_fsc, r9
0000005c <[^>]*> f389 8e00 	msr	CPSR_fsx, r9
00000060 <[^>]*> f389 8b00 	msr	CPSR_fxc, r9
00000064 <[^>]*> f389 8d00 	msr	CPSR_fsc, r9
00000068 <[^>]*> f389 8b00 	msr	CPSR_fxc, r9
0000006c <[^>]*> f389 8e00 	msr	CPSR_fsx, r9
00000070 <[^>]*> f389 8d00 	msr	CPSR_fsc, r9
00000074 <[^>]*> f389 8e00 	msr	CPSR_fsx, r9
00000078 <[^>]*> f389 8700 	msr	CPSR_sxc, r9
0000007c <[^>]*> f389 8d00 	msr	CPSR_fsc, r9
00000080 <[^>]*> f389 8700 	msr	CPSR_sxc, r9
00000084 <[^>]*> f389 8e00 	msr	CPSR_fsx, r9
00000088 <[^>]*> f389 8b00 	msr	CPSR_fxc, r9
0000008c <[^>]*> f389 8e00 	msr	CPSR_fsx, r9
00000090 <[^>]*> f389 8700 	msr	CPSR_sxc, r9
00000094 <[^>]*> f389 8b00 	msr	CPSR_fxc, r9
00000098 <[^>]*> f389 8700 	msr	CPSR_sxc, r9
0000009c <[^>]*> f389 8d00 	msr	CPSR_fsc, r9
000000a0 <[^>]*> f389 8b00 	msr	CPSR_fxc, r9
000000a4 <[^>]*> f389 8d00 	msr	CPSR_fsc, r9
000000a8 <[^>]*> f389 8700 	msr	CPSR_sxc, r9
000000ac <[^>]*> f389 8b00 	msr	CPSR_fxc, r9
000000b0 <[^>]*> f389 8700 	msr	CPSR_sxc, r9
000000b4 <[^>]*> f389 8f00 	msr	CPSR_fsxc, r9
000000b8 <[^>]*> f389 8f00 	msr	CPSR_fsxc, r9
000000bc <[^>]*> f389 8f00 	msr	CPSR_fsxc, r9
000000c0 <[^>]*> f389 8f00 	msr	CPSR_fsxc, r9
000000c4 <[^>]*> f389 8f00 	msr	CPSR_fsxc, r9
000000c8 <[^>]*> f389 8f00 	msr	CPSR_fsxc, r9
000000cc <[^>]*> f389 8f00 	msr	CPSR_fsxc, r9
000000d0 <[^>]*> f389 8f00 	msr	CPSR_fsxc, r9
000000d4 <[^>]*> f389 8f00 	msr	CPSR_fsxc, r9
000000d8 <[^>]*> f389 8f00 	msr	CPSR_fsxc, r9
000000dc <[^>]*> f389 8f00 	msr	CPSR_fsxc, r9
000000e0 <[^>]*> f389 8f00 	msr	CPSR_fsxc, r9
000000e4 <[^>]*> f389 8f00 	msr	CPSR_fsxc, r9
000000e8 <[^>]*> f389 8f00 	msr	CPSR_fsxc, r9
000000ec <[^>]*> f389 8f00 	msr	CPSR_fsxc, r9
000000f0 <[^>]*> f389 8f00 	msr	CPSR_fsxc, r9
000000f4 <[^>]*> f389 8f00 	msr	CPSR_fsxc, r9
000000f8 <[^>]*> f389 8f00 	msr	CPSR_fsxc, r9
000000fc <[^>]*> f389 8f00 	msr	CPSR_fsxc, r9
00000100 <[^>]*> f389 8f00 	msr	CPSR_fsxc, r9
00000104 <[^>]*> f389 8f00 	msr	CPSR_fsxc, r9
00000108 <[^>]*> f389 8f00 	msr	CPSR_fsxc, r9
0000010c <[^>]*> f389 8f00 	msr	CPSR_fsxc, r9
00000110 <[^>]*> f389 8f00 	msr	CPSR_fsxc, r9
00000114 <[^>]*> f399 8900 	msr	SPSR_fc, r9
00000118 <[^>]*> f399 8400 	msr	SPSR_s, r9
0000011c <[^>]*> f399 8800 	msr	SPSR_f, r9
00000120 <[^>]*> f399 8100 	msr	SPSR_c, r9
00000124 <[^>]*> f399 8200 	msr	SPSR_x, r9
00000128 <[^>]*> f399 8c00 	msr	SPSR_fs, r9
0000012c <[^>]*> f399 8a00 	msr	SPSR_fx, r9
00000130 <[^>]*> f399 8900 	msr	SPSR_fc, r9
00000134 <[^>]*> f399 8c00 	msr	SPSR_fs, r9
00000138 <[^>]*> f399 8600 	msr	SPSR_sx, r9
0000013c <[^>]*> f399 8500 	msr	SPSR_sc, r9
00000140 <[^>]*> f399 8a00 	msr	SPSR_fx, r9
00000144 <[^>]*> f399 8600 	msr	SPSR_sx, r9
00000148 <[^>]*> f399 8300 	msr	SPSR_xc, r9
0000014c <[^>]*> f399 8900 	msr	SPSR_fc, r9
00000150 <[^>]*> f399 8500 	msr	SPSR_sc, r9
00000154 <[^>]*> f399 8300 	msr	SPSR_xc, r9
00000158 <[^>]*> f399 8e00 	msr	SPSR_fsx, r9
0000015c <[^>]*> f399 8d00 	msr	SPSR_fsc, r9
00000160 <[^>]*> f399 8e00 	msr	SPSR_fsx, r9
00000164 <[^>]*> f399 8b00 	msr	SPSR_fxc, r9
00000168 <[^>]*> f399 8d00 	msr	SPSR_fsc, r9
0000016c <[^>]*> f399 8b00 	msr	SPSR_fxc, r9
00000170 <[^>]*> f399 8e00 	msr	SPSR_fsx, r9
00000174 <[^>]*> f399 8d00 	msr	SPSR_fsc, r9
00000178 <[^>]*> f399 8e00 	msr	SPSR_fsx, r9
0000017c <[^>]*> f399 8700 	msr	SPSR_sxc, r9
00000180 <[^>]*> f399 8d00 	msr	SPSR_fsc, r9
00000184 <[^>]*> f399 8700 	msr	SPSR_sxc, r9
00000188 <[^>]*> f399 8e00 	msr	SPSR_fsx, r9
0000018c <[^>]*> f399 8b00 	msr	SPSR_fxc, r9
00000190 <[^>]*> f399 8e00 	msr	SPSR_fsx, r9
00000194 <[^>]*> f399 8700 	msr	SPSR_sxc, r9
00000198 <[^>]*> f399 8b00 	msr	SPSR_fxc, r9
0000019c <[^>]*> f399 8700 	msr	SPSR_sxc, r9
000001a0 <[^>]*> f399 8d00 	msr	SPSR_fsc, r9
000001a4 <[^>]*> f399 8b00 	msr	SPSR_fxc, r9
000001a8 <[^>]*> f399 8d00 	msr	SPSR_fsc, r9
000001ac <[^>]*> f399 8700 	msr	SPSR_sxc, r9
000001b0 <[^>]*> f399 8b00 	msr	SPSR_fxc, r9
000001b4 <[^>]*> f399 8700 	msr	SPSR_sxc, r9
000001b8 <[^>]*> f399 8f00 	msr	SPSR_fsxc, r9
000001bc <[^>]*> f399 8f00 	msr	SPSR_fsxc, r9
000001c0 <[^>]*> f399 8f00 	msr	SPSR_fsxc, r9
000001c4 <[^>]*> f399 8f00 	msr	SPSR_fsxc, r9
000001c8 <[^>]*> f399 8f00 	msr	SPSR_fsxc, r9
000001cc <[^>]*> f399 8f00 	msr	SPSR_fsxc, r9
000001d0 <[^>]*> f399 8f00 	msr	SPSR_fsxc, r9
000001d4 <[^>]*> f399 8f00 	msr	SPSR_fsxc, r9
000001d8 <[^>]*> f399 8f00 	msr	SPSR_fsxc, r9
000001dc <[^>]*> f399 8f00 	msr	SPSR_fsxc, r9
000001e0 <[^>]*> f399 8f00 	msr	SPSR_fsxc, r9
000001e4 <[^>]*> f399 8f00 	msr	SPSR_fsxc, r9
000001e8 <[^>]*> f399 8f00 	msr	SPSR_fsxc, r9
000001ec <[^>]*> f399 8f00 	msr	SPSR_fsxc, r9
000001f0 <[^>]*> f399 8f00 	msr	SPSR_fsxc, r9
000001f4 <[^>]*> f399 8f00 	msr	SPSR_fsxc, r9
000001f8 <[^>]*> f399 8f00 	msr	SPSR_fsxc, r9
000001fc <[^>]*> f399 8f00 	msr	SPSR_fsxc, r9
00000200 <[^>]*> f399 8f00 	msr	SPSR_fsxc, r9
00000204 <[^>]*> f399 8f00 	msr	SPSR_fsxc, r9
00000208 <[^>]*> f399 8f00 	msr	SPSR_fsxc, r9
0000020c <[^>]*> f399 8f00 	msr	SPSR_fsxc, r9
00000210 <[^>]*> f399 8f00 	msr	SPSR_fsxc, r9
00000214 <[^>]*> f399 8f00 	msr	SPSR_fsxc, r9
