	.syntax unified

arm:	.arm
	udf
	udf	#0xabcd

thumb:	.thumb
	udf	#0xab
	udf.n	#0xcd
	udf
	nop
	udf.w
	udf	#0x1234
	udf.w	#0xccdd
	it	eq
	udf	#0x12
	udf	#0x23
	udf	#0x34
	udf	#0x56
	it	ne
	udf	#0x1234
	udf	#0x2345
	udf	#0x3456
	udf	#0x5678
