# split_s390x_1_z4.s: s390x specific test case for -fsplit-stack -
# conditional call, alfi.

	.text

	.global	fn1
	.type	fn1,@function
fn1:
	.cfi_startproc
	ear	%r1, %a0
	sllg	%r1, %r1, 32
	ear	%r1, %a1
	lg	%r1, 0x38(%r1)
	algfi	%r1, 0x100000
	cgr	%r15, %r1
	larl	%r1, .L1
	jgl	__morestack
	.section .rodata
	.align 8
.L1:
	.quad	0x100000
	.quad	0
	.quad	.L2-.L1
	.previous
.L2:
	stmg	%r13, %r15, 0x68(%r15)
	.cfi_offset	%r13, -0x38
	.cfi_offset	%r14, -0x30
	.cfi_offset	%r15, -0x28
	aghi	%r15, -0xa0
	.cfi_adjust_cfa_offset	0xa0
	brasl	%r14, fn2
	lmg	%r13, %r15, 0x108(%r15)
	.cfi_restore	%r13
	.cfi_restore	%r14
	.cfi_restore	%r15
	.cfi_adjust_cfa_offset	-0xa0
	br	%r14
	.cfi_endproc
	.size	fn1,. - fn1

	.section	.note.GNU-stack,"",@progbits
	.section	.note.GNU-split-stack,"",@progbits
