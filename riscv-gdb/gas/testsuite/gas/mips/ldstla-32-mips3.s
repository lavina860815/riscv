	.set	mips3
	.text
	ld $2, 0xffffffffffffffff($4)
	ld $2, 0xffffffffabcdef01($4)
	ld $2, 0xffffffff80000000($4)
	ld $2, 0xffffffff7fffffff($4)
	ld $2, 0xffffffff01234567($4)
	ld $2, 0xffffffff00000000($4)
	ld $2, 0xffffffff($4)
	ld $2, 0xabcdef01($4)
	ld $2, 0x80000000($4)
	ld $2, 0x7fffffff($4)
	ld $2, 0x01234567($4)
	ld $2, 0x00000000($4)

	ld $2, 0xffffffffffffffff
	ld $2, 0xffffffffabcdef01
	ld $2, 0xffffffff80000000
	ld $2, 0xffffffff7fffffff
	ld $2, 0xffffffff01234567
	ld $2, 0xffffffff00000000
	ld $2, 0xffffffff
	ld $2, 0xabcdef01
	ld $2, 0x80000000
	ld $2, 0x7fffffff
	ld $2, 0x01234567
	ld $2, 0x00000000

	sd $2, 0xffffffffffffffff($4)
	sd $2, 0xffffffffabcdef01($4)
	sd $2, 0xffffffff80000000($4)
	sd $2, 0xffffffff7fffffff($4)
	sd $2, 0xffffffff01234567($4)
	sd $2, 0xffffffff00000000($4)
	sd $2, 0xffffffff($4)
	sd $2, 0xabcdef01($4)
	sd $2, 0x80000000($4)
	sd $2, 0x7fffffff($4)
	sd $2, 0x01234567($4)
	sd $2, 0x00000000($4)

	sd $2, 0xffffffffffffffff
	sd $2, 0xffffffffabcdef01
	sd $2, 0xffffffff80000000
	sd $2, 0xffffffff7fffffff
	sd $2, 0xffffffff01234567
	sd $2, 0xffffffff00000000
	sd $2, 0xffffffff
	sd $2, 0xabcdef01
	sd $2, 0x80000000
	sd $2, 0x7fffffff
	sd $2, 0x01234567
	sd $2, 0x00000000

	lw $2, 0xffffffffffffffff($4)
	lw $2, 0xffffffffabcdef01($4)
	lw $2, 0xffffffff80000000($4)
	lw $2, 0xffffffff7fffffff($4)
	lw $2, 0xffffffff01234567($4)
	lw $2, 0xffffffff00000000($4)
	lw $2, 0xffffffff($4)
	lw $2, 0xabcdef01($4)
	lw $2, 0x80000000($4)
	lw $2, 0x7fffffff($4)
	lw $2, 0x01234567($4)
	lw $2, 0x00000000($4)

	lw $2, 0xffffffffffffffff
	lw $2, 0xffffffffabcdef01
	lw $2, 0xffffffff80000000
	lw $2, 0xffffffff7fffffff
	lw $2, 0xffffffff01234567
	lw $2, 0xffffffff00000000
	lw $2, 0xffffffff
	lw $2, 0xabcdef01
	lw $2, 0x80000000
	lw $2, 0x7fffffff
	lw $2, 0x01234567
	lw $2, 0x00000000

	sw $2, 0xffffffffffffffff($4)
	sw $2, 0xffffffffabcdef01($4)
	sw $2, 0xffffffff80000000($4)
	sw $2, 0xffffffff7fffffff($4)
	sw $2, 0xffffffff01234567($4)
	sw $2, 0xffffffff00000000($4)
	sw $2, 0xffffffff($4)
	sw $2, 0xabcdef01($4)
	sw $2, 0x80000000($4)
	sw $2, 0x7fffffff($4)
	sw $2, 0x01234567($4)
	sw $2, 0x00000000($4)

	sw $2, 0xffffffffffffffff
	sw $2, 0xffffffffabcdef01
	sw $2, 0xffffffff80000000
	sw $2, 0xffffffff7fffffff
	sw $2, 0xffffffff01234567
	sw $2, 0xffffffff00000000
	sw $2, 0xffffffff
	sw $2, 0xabcdef01
	sw $2, 0x80000000
	sw $2, 0x7fffffff
	sw $2, 0x01234567
	sw $2, 0x00000000

	la $2, 0xffffffffffffffff($4)
	la $2, 0xffffffffabcdef01($4)
	la $2, 0xffffffff80000000($4)
	la $2, 0xffffffff7fffffff($4)
	la $2, 0xffffffff01234567($4)
	la $2, 0xffffffff00000000($4)
	la $2, 0xffffffff($4)
	la $2, 0xabcdef01($4)
	la $2, 0x80000000($4)
	la $2, 0x7fffffff($4)
	la $2, 0x01234567($4)
	la $2, 0x00000000($4)

	la $2, 0xffffffffffffffff
	la $2, 0xffffffffabcdef01
	la $2, 0xffffffff80000000
	la $2, 0xffffffff7fffffff
	la $2, 0xffffffff01234567
	la $2, 0xffffffff00000000
	la $2, 0xffffffff
	la $2, 0xabcdef01
	la $2, 0x80000000
	la $2, 0x7fffffff
	la $2, 0x01234567
	la $2, 0x00000000

	.space 8
