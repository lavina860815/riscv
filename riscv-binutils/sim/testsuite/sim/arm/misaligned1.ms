# Test LDR instructions with offsets misaligned by 1 byte.
# mach(): all

	.macro invalid
# This is "undefined" but it's not properly decoded yet.
	.word 0x07ffffff
# This is stc which isn't recognized yet.
	stc 0,cr0,[r0]
	.endm

	.global _start
_start:
# Run some simple insns to confirm the engine is at least working.
	nop

# Skip over output text.
	bl do_test

pass:
	.asciz "pass\n"
	.p2align 2

do_test:
	mov r4, r14
	bl continue
word1:
	.word 0x5555
continue:
	ldr r6, [r14, #1]
	ldr r7, word2
	cmp r6, r7
	# Failed.
	bne done

output_next:
# Output a character (in arm mode).
	mov r0,#3
	mov r1,r4
	swi #0x123456

# Load next character, see if done.
	add r4,r4,#1
	sub r3,r3,r3
	ldrb r5,[r4,r3]
	teq r5,#0
	bne output_next

done:
	mov r0,#0x18
	ldr r1,exit_code
	swi #0x123456

# If that fails, try to die with an invalid insn.
	invalid

exit_code:
	.word 0x20026
	.word 0xFFFFFFFF
word2:
	.word 0x55000055
	.word 0xFFFFFFFF
