	.code
	.align 4
	.EXPORT foo,CODE
	.EXPORT foo,ENTRY,PRIV_LEV=3
foo:
	.PROC
	.CALLINFO FRAME=0
	.PROCEND
