; Test C64x+ S-unit compact instruction formats
	.text
	nop
	.align 16
	nop
	.align 16
s3_nosat_op_0:
	.short 0x000a
	.short 0x201b
	.short 0x512a
	.short 0x713b
	.short 0x824a
	.short 0xa25b
	.short 0xd36a
	.short 0xf37b
	.short 0xe28a
s3_nosat_op_1:
	.short 0x0a9b
	.short 0x39aa
	.short 0x59bb
	.short 0x68ca
	.short 0x88db
	.word  0xefe00000 | 0x0000
s3_sat_op_0:
	.short 0x21ea
	.short 0x41fb
	.short 0x720a
	.short 0x921b
	.short 0xc32a
	.short 0xe33b
	.short 0xf24a
	.short 0xb25b
	.short 0x816a
s3_sat_op_1:
	.short 0xa87b
	.short 0xd88a
	.short 0xfa9b
	.short 0xeaaa
	.short 0x7bbb
	.word  0xefe00000 | 0x4000
s3i:
	.short 0x040a
	.short 0x251b
	.short 0x362a
	.short 0x573b
	.short 0x444a
	.short 0x655b
	.short 0x766a
	.short 0x9ffb
	.short 0x8cea
	.short 0xaddb
	.short 0xbeca
	.short 0xdfbb
	.short 0xccaa
	.short 0xed9b
	.word  0xefe00000 | 0x0000
smvk8:
	.short 0x0012
	.short 0x1113
	.short 0x2232
	.short 0x3333
	.short 0x4752
	.short 0x5653
	.short 0x6572
	.short 0x78f3
	.short 0x8992
	.short 0x9a93
	.short 0xabb2
	.short 0xbed2
	.short 0xcdf3
	.short 0xfc92
	.word  0xefe00000 | 0x0000
ssh5_nosat:
	.short 0x0402
	.short 0x1503
	.short 0x2682
	.short 0x3783
	.short 0x4c22
	.short 0x5d23
	.short 0x6ea2
	.short 0x7fa3
	.short 0x8442
	.short 0x9543
	.short 0xa6c2
	.short 0xb7c3
	.short 0xcc42
	.short 0xdd43
	.word  0xefe00000 | 0x0000
ssh5_sat:
	.short 0xec02
	.short 0xfd03
	.short 0xe682
	.short 0xd783
	.short 0xc422
	.short 0xb523
	.short 0xaea2
	.short 0x9fa3
	.short 0x8c42
	.short 0x7d43
	.short 0x66c2
	.short 0x57c3
	.short 0x4442
	.short 0x3543
	.word  0xefe00000 | 0x4000
s2sh:
	.short 0x0462
	.short 0x2563
	.short 0x4662
	.short 0x6f63
	.short 0x8c62
	.short 0xad63
	.short 0xce62
	.short 0xf7e3
	.short 0xd4e2
	.short 0xb5e3
	.short 0x96e2
	.short 0x7fe3
	.short 0x5ce2
	.short 0x3de3
	.word  0xefe00000
sc5:
	.short 0x0002
	.short 0x1103
	.short 0x2202
	.short 0x3303
	.short 0x4a22
	.short 0x5923
	.short 0x6822
	.short 0x71a3
	.short 0x82a2
	.short 0x93c3
	.short 0xa2c2
	.short 0xb9c3
	.short 0xc8c2
	.short 0xf9c3
	.word  0xefe00000
s2ext:
	.short 0x0062
	.short 0x2163
	.short 0x4262
	.short 0x6b63
	.short 0x8862
	.short 0xa963
	.short 0xca62
	.short 0xf3e3
	.short 0xd0e2
	.short 0xb1e3
	.short 0x9ae2
	.short 0x7be3
	.short 0x58e2
	.short 0x39e3
	.word  0xefe00000
sx2op:
	.short 0x002e
	.short 0x212f
	.short 0x522e
	.short 0x732f
	.short 0x802e
	.short 0xa12f
	.short 0xd22e
	.short 0xfb2f
	.short 0x082e
	.short 0x292f
	.short 0x5a2e
	.short 0x7b2f
	.short 0x882e
	.short 0xa92f
	.word  0xefe00000
sx5:
	.short 0x042e
	.short 0x152f
	.short 0x262e
	.short 0x372f
	.short 0x4c2e
	.short 0x5d2f
	.short 0x6e2e
	.short 0x77af
	.short 0x84ae
	.short 0x95af
	.short 0xaeae
	.short 0xbfaf
	.short 0xccae
	.short 0xfdaf
	.word  0xefe00000
sx1:
	.short 0x586e
	.short 0x596f
	.short 0x5a6e
	.short 0x5b6f
	.short 0x586e
	.short 0x796f
	.short 0x7a6e
	.short 0x7bef
	.short 0x78ee
	.short 0x79ef
	.short 0xdaee
	.short 0xdbef
	.short 0xd8ee
	.short 0xd9ef
	.word  0xefe00000
sx1_rs:
	.short 0x586e
	.short 0x596f
	.short 0x5a6e
	.short 0x5b6f
	.short 0x586e
	.short 0x796f
	.short 0x7a6e
	.short 0x7bef
	.short 0x78ee
	.short 0x79ef
	.short 0xdaee
	.short 0xdbef
	.short 0xd8ee
	.short 0xd9ef
	.word  0xefe00000 | 0x00080000
sx1b:
	.short 0x006e
	.short 0x216f
	.short 0x22ee
	.short 0x43ef
	.short 0x446e
	.short 0x656f
	.short 0x66ee
	.short 0x87ef
	.short 0x866e
	.short 0xa56f
	.short 0xa4ee
	.short 0xc3ef
	.short 0xc26e
	.short 0xe16f
	.word  0xefe00000
sx1b_rs:
	.short 0x006e
	.short 0x216f
	.short 0x22ee
	.short 0x43ef
	.short 0x446e
	.short 0x656f
	.short 0x66ee
	.short 0x87ef
	.short 0x866e
	.short 0xa56f
	.short 0xa4ee
	.short 0xc3ef
	.short 0xc26e
	.short 0xe16f
	.word  0xefe00000 | 0x00080000
