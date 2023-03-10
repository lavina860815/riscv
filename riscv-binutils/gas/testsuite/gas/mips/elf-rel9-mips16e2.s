	.set	mips16
	.ent	foo
foo:
	move	$28, $2
	lw	$4,%got(l1)($28)
	addiu	$4,%lo(l1)

	lw	$4,%got(l1 + 16)($28)
	addiu	$4,%lo(l1 + 16)

	lw	$4,%got(l1 + 0x7fec)($28)
	addiu	$4,%lo(l1 + 0x7fec)

	lw	$4,%got(l1 + 0x7ff0)($28)
	addiu	$4,%lo(l1 + 0x7ff0)

	lw	$4,%got(l1 + 0xffec)($28)
	addiu	$4,%lo(l1 + 0xffec)

	lw	$4,%got(l1 + 0xfff0)($28)
	addiu	$4,%lo(l1 + 0xfff0)

	lw	$4,%got(l1 + 0x18000)($28)
	addiu	$4,%lo(l1 + 0x18000)

	lw	$4,%got(l2)($28)
	addiu	$4,%lo(l2)

	lw	$4,%got(l2 + 0xfff)($28)
	addiu	$4,%lo(l2 + 0xfff)

	lw	$4,%got(l2 + 0x1000)($28)
	addiu	$4,%lo(l2 + 0x1000)

	lw	$4,%got(l2 + 0x12345)($28)
	addiu	$4,%lo(l2 + 0x12345)

	lw	$4,%gprel(l3)($28)
	lw	$4,%gprel(l3 + 4)($28)
	lw	$4,%gprel(l4)($28)
	lw	$4,%gprel(l4 + 4)($28)
	lw	$4,%gprel(l5)($28)
	lw	$4,%gprel(l5 + 8)($28)
	lw	$4,%gprel(l5 + 12)($28)

	.end	foo

# Force some (non-delay-slot) zero bytes, to make 'objdump' print ...
	.space	16
	.align	4, 0

	.data
	.word	1,2,3,4
l1:	.word	4,5
	.space	0x1f000 - 24
l2:	.word	7,8

	.sdata
l3:	.word	1
l4:	.word	2
	.word	3
l5:	.word	4
