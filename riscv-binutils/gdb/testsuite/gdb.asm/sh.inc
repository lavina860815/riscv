# You'll find a bunch of nop opcodes in the below macros.  They are
# there to keep the code correctly aligned.  Be careful to maintain
# them when changing the code.

	comment "subroutine declare"
	.purgem gdbasm_declare
	.macro gdbasm_declare name
	.align	1
	.global	\name
\name:
	.endm

	comment "subroutine prologue"
	.macro gdbasm_enter
	mov.l   r14,@-r15
	sts.l   pr,@-r15
	mov     r15,r14
	nop
	.endm

	comment "subroutine epilogue"
	.macro gdbasm_leave
	mov     r14,r15
	lds.l   @r15+,pr
	mov.l   @r15+,r14
	rts
	nop
	nop
	.endm

	comment "subroutine end"
	.purgem gdbasm_end
	.macro gdbasm_end name
	.size   \name, . - \name
	.align	1
	.endm

	comment "subroutine call"
	.macro gdbasm_call subr
	mov.l   .Lconst\@,r1
	bra	.Lafterconst\@
	nop
	nop
.Lconst\@:
	.align	2
	.long	\subr
	.align	1
.Lafterconst\@:
	jsr	@r1
	nop
	.endm

	.macro gdbasm_several_nops
	nop
	nop
	nop
	nop
	.endm

	comment "exit (0)"
	.macro gdbasm_exit0
	sleep
	nop
	.endm

	comment "crt0 startup"
	.macro gdbasm_startup
	comment "If there is a _stack symbol, use it for setting up the stack"
	comment "pointer.  In hosted mode (when there is no _stack symbol),"
	comment "the operating system will have initialized it already."
	mov.l	.stackaddr, r0
	tst	r0, r0
	bt	.afterstackaddr
	mov	r0, r15
	bra	.afterstackaddr
	nop
	.align 2
.stackaddr:
	.weak	_stack
	.long	_stack
	.align	1
.afterstackaddr:
	.endm

	comment "Declare a data variable"
	.purgem gdbasm_datavar
	.macro gdbasm_datavar name value
	.data
	.align 2
	.type	\name, @object
	.size	\name, 4
\name:
	.long	\value
	.endm
