	.code

	.align 4
	.PARAM foo,RTNVAL=GR
foo:
	.PROC
	.CALLINFO FRAME=128,NO_CALLS,ENTRY_GR=1,ENTRY_FR=11
	.ENTRY
	bv,n %r0(%r2)
	.EXIT
	.PROCEND

