; Test C64x+ D-unit compact instruction formats
	.text
	nop
	.align 16
	nop
	.align 16
dstk:				; op = 0 | STW (.unit) src, *B15[ucst5]
				; op = 1 | LDW (.unit)*B15[ucst5], dst
	.short 0x8c05
	.short 0x9c05
	.short 0x8c05
	.short 0x9c05
	.short 0xcc35
	.short 0xfc05
	.short 0xdcf5
	.short 0x8c0d
	.short 0x9c0d
	.short 0x8c0d
	.short 0x9c0d
	.short 0xcc3d
	.short 0xfc0d
	.short 0xdcfd
	.word  0xefe00000
dx2op: 				; op = 0 | ADD (.unit) src1, src2, dst (src1 = dst)
				; op = 1 | SUB (.unit) src1, src2, dst (src1 = dst, dst = src1 - src2
	.short 0x0036
	.short 0x0037
	.short 0x0836
	.short 0x0837
	.short 0x1036
	.short 0x1837
	.short 0x8036
	.short 0xc037
	.short 0xe836
	.short 0x8837
	.short 0xda36
	.short 0xe037
	.short 0xd236
	.short 0xe3b7
	.word  0xefe00000
dx5:				; ADDAW (.unit)B15, ucst5, dst
	.short 0x0436
	.short 0x0437
	.short 0x0c36
	.short 0x0c37
	.short 0x1436
	.short 0x1c37
	.short 0x8436
	.short 0xc437
	.short 0xec36
	.short 0x8c37
	.short 0xde36
	.short 0xe437
	.short 0xd636
	.short 0xe7b7
	.word  0xefe00000
dx5p:
	.short 0x0c77
	.short 0x2d77
	.short 0x4e77
	.short 0x6f77
	.short 0x8c77
	.short 0xad77
	.short 0xce77
	.short 0xeff7
	.short 0x2cf7
	.short 0x4df7
	.short 0x6ef7
	.short 0x8ff7
	.short 0xacf7
	.short 0xcdf7
	.word  0xefe00000
dx1:
	.short 0x7876
	.short 0x7877
	.short 0x78f6
	.short 0x79f7
	.short 0x5876
	.short 0x9877
	.short 0xd876
	.short 0x7877
	.short 0x7876
	.short 0x7877
	.short 0x7876
	.short 0x7877
	.short 0x7876
	.short 0x7877
	.word  0xefe00000
dpp:
	.short 0x0077
	.short 0x4177
	.short 0xa277
	.short 0xe377
	.short 0x2477
	.short 0x6577
	.short 0x8677
	.short 0x0777
	.short 0x11f7
	.short 0x52f7
	.short 0x4777
	.short 0x6777
	.short 0x15f7
	.short 0x56f7
	.word  0xefe80000
