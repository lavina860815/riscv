	.global bar#
	.data
bar:
	data4 0
	.global foo#
	foo# = bar#
	.text
	addl	r3 = @ltoffx(foo#), gp
	nop.i	0
	nop.i	0
	ld8.mov r3 = [r3], foo#
	nop.i	0
	nop.i	0
