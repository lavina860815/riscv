#NO_APP
	.text
	.align	2
	.globl	foo
	.type	foo, @function
foo:
	link.w %fp,#0
	move.l %a5,-(%sp)
	move.l #_GLOBAL_OFFSET_TABLE_@GOTPC, %a5
	lea (-6, %pc, %a5), %a5

	pea x@TLSGD(%a5)
	jbsr __tls_get_addr

	jbsr __m68k_read_tp
	move.l x@TLSIE(%a5),%a1
	add.l %a0,%a1

	move.l (%sp)+,%a5
	unlk %fp
	rts
	.size	foo, .-foo
	.section	.note.GNU-stack,"",@progbits
