.text ; foo: addr16 fstcw %es:(%si)
 fstsw; fstsw %ax;
 addr16 fstsw %ax ;addr16 rep cmpsw %es:(%di),%ss:(%si)

 es fwait

	fwait
	movl $0,%gs:fpu_owner_task

	.byte 0x66
	.byte 0xf2
	.byte 0x0f
	.byte 0x38
	.byte 0x17

	.byte 0xf2
	.byte 0x66
	.byte 0x0f
	.byte 0x54

	.byte 0xf2
	.byte 0x0f
	.byte 0x54

# data16 movsd %xmm4,(%edx)
	.byte 0xf2
	.byte 0x66
	.byte 0x0f
	.byte 0x11
	.byte 0x22

# data16 movsd %xmm4,(%bp,%si)
	.byte 0xf2
	.byte 0x67
	.byte 0x66
	.byte 0x0f
	.byte 0x11
	.byte 0x22

# lock data16 movsd %xmm4,(%bp,%si)
	.byte 0xf2
	.byte 0x67
	.byte 0xf0
	.byte 0x66
	.byte 0x0f
	.byte 0x11
	.byte 0x22

# data16 movss %xmm4,(%edx)
	.byte 0xf3
	.byte 0x66
	.byte 0x0f
	.byte 0x11
	.byte 0x22

# lock data16 movss %xmm4,(%bp,%si)
	.byte 0xf3
	.byte 0x67
	.byte 0xf0
	.byte 0x66
	.byte 0x0f
	.byte 0x11
	.byte 0x22

# repz data16 movsd %xmm4,(%bp,%si)
	.byte 0xf3
	.byte 0x67
	.byte 0xf2
	.byte 0x66
	.byte 0x0f
	.byte 0x11
	.byte 0x22

# data16 movss %xmm4,%ds:(%edx)
	.byte 0xf3
	.byte 0x66
	.byte 0x3e
	.byte 0x0f
	.byte 0x11
	.byte 0x22

# data16 movsd %xmm4,%ss:(%edx)
	.byte 0xf2
	.byte 0x66
	.byte 0x36
	.byte 0x0f
	.byte 0x11
	.byte 0x22

# repz lock data16 movsd %xmm4,%ss:(%edx)
	.byte 0xf3
	.byte 0xf0
	.byte 0xf2
	.byte 0x66
	.byte 0x36
	.byte 0x0f
	.byte 0x11
	.byte 0x22

# data16 ds movsd %xmm4,%ss:(%edx)
	.byte 0xf2
	.byte 0x66
	.byte 0x3e
	.byte 0x36
	.byte 0x0f
	.byte 0x11
	.byte 0x22

# data16 ds movsd %xmm4,%ss:(%bp,%si)
	.byte 0xf2
	.byte 0x67
	.byte 0x66
	.byte 0x3e
	.byte 0x36
	.byte 0x0f
	.byte 0x11
	.byte 0x22

# lock data16 ds movsd %xmm4,%ss:(%bp,%si)
	.byte 0xf2
	.byte 0x67
	.byte 0xf0
	.byte 0x66
	.byte 0x3e
	.byte 0x36
	.byte 0x0f
	.byte 0x11
	.byte 0x22

# data16 ds movss %xmm4,%ss:(%edx)
	.byte 0xf3
	.byte 0x66
	.byte 0x3e
	.byte 0x36
	.byte 0x0f
	.byte 0x11
	.byte 0x22

# lock data16 ds movss %xmm4,%ss:(%edx)
	.byte 0xf3
	.byte 0xf0
	.byte 0x66
	.byte 0x3e
	.byte 0x36
	.byte 0x0f
	.byte 0x11
	.byte 0x22

# repz data16 ds movsd %xmm4,%ss:(%bp,%si)
	.byte 0xf3
	.byte 0x67
	.byte 0xf2
	.byte 0x66
	.byte 0x3e
	.byte 0x36
	.byte 0x0f
	.byte 0x11
	.byte 0x22

# repnz; xchg %ax,%ax
	.byte 0xf2
	.byte 0x66
	.byte 0x90

# repnz; addr16 xchg %ax,%ax
	.byte 0xf2
	.byte 0x67
	.byte 0x66
	.byte 0x90

# repnz; addr16 lock xchg %ax,%ax
	.byte 0xf2
	.byte 0x67
	.byte 0xf0
	.byte 0x66
	.byte 0x90

# data16 pause
	.byte 0xf3
	.byte 0x66
	.byte 0x90

# addr16 lock data16 pause
	.byte 0xf3
	.byte 0x67
	.byte 0xf0
	.byte 0x66
	.byte 0x90

# repz; addr16; repnz; xchg %ax,%ax
	.byte 0xf3
	.byte 0x67
	.byte 0xf2
	.byte 0x66
	.byte 0x90

# repnz; ds nop
	.byte 0xf2
	.byte 0x3e
	.byte 0x90

# repnz; lock addr16 ds nop
	.byte 0xf2
	.byte 0xf0
	.byte 0x67
	.byte 0x3e
	.byte 0x90

# ds pause
	.byte 0xf3
	.byte 0x3e
	.byte 0x90

# data16 ds pause
	.byte 0xf3
	.byte 0x66
	.byte 0x3e
	.byte 0x90

# lock ds pause
	.byte 0xf3
	.byte 0xf0
	.byte 0x3e
	.byte 0x90

# lock addr16 ds pause
	.byte 0xf3
	.byte 0xf0
	.byte 0x67
	.byte 0x3e
	.byte 0x90

# repz; repnz; addr16 ds nop
	.byte 0xf3
	.byte 0xf2
	.byte 0x67
	.byte 0x3e
	.byte 0x90

# lock ss xchg %ax,%ax
	.byte 0x66
	.byte 0xf0
	.byte 0x36
	.byte 0x90

# repnz; ss nop
	.byte 0xf2
	.byte 0x36
	.byte 0x90

# repnz; ss xchg %ax,%ax
	.byte 0xf2
	.byte 0x66
	.byte 0x36
	.byte 0x90

# repnz; lock ss nop
	.byte 0xf2
	.byte 0xf0
	.byte 0x36
	.byte 0x90

# repnz; lock addr16 ss nop
	.byte 0xf2
	.byte 0xf0
	.byte 0x67
	.byte 0x36
	.byte 0x90

# ss pause
	.byte 0xf3
	.byte 0x36
	.byte 0x90

# addr16 ss pause
	.byte 0xf3
	.byte 0x67
	.byte 0x36
	.byte 0x90

# lock addr16 ss pause
	.byte 0xf3
	.byte 0xf0
	.byte 0x67
	.byte 0x36
	.byte 0x90

# repz; repnz; ss nop
	.byte 0xf3
	.byte 0xf2
	.byte 0x36
	.byte 0x90

# repz; repnz; addr16 ss nop
	.byte 0xf3
	.byte 0xf2
	.byte 0x67
	.byte 0x36
	.byte 0x90

# repz; lock; repnz; ss xchg %ax,%ax
	.byte 0xf3
	.byte 0xf0
	.byte 0xf2
	.byte 0x66
	.byte 0x36
	.byte 0x90

# ds ss xchg %ax,%ax
	.byte 0x66
	.byte 0x3e
	.byte 0x36
	.byte 0x90

# addr16 ds ss xchg %ax,%ax
	.byte 0x67
	.byte 0x66
	.byte 0x3e
	.byte 0x36
	.byte 0x90

# addr16 lock ds ss xchg %ax,%ax
	.byte 0x67
	.byte 0xf0
	.byte 0x66
	.byte 0x3e
	.byte 0x36
	.byte 0x90

# data16 ds ss pause
	.byte 0xf3
	.byte 0x66
	.byte 0x3e
	.byte 0x36
	.byte 0x90

# lock data16 ds ss pause
	.byte 0xf3
	.byte 0xf0
	.byte 0x66
	.byte 0x3e
	.byte 0x36
	.byte 0x90

# repz; repnz; addr16 ds ss nop
	.byte 0xf3
	.byte 0xf2
	.byte 0x67
	.byte 0x3e
	.byte 0x36
	.byte 0x90

# repz; addr16; repnz; ds ss xchg %ax,%ax
	.byte 0xf3
	.byte 0x67
	.byte 0xf2
	.byte 0x66
	.byte 0x3e
	.byte 0x36
	.byte 0x90

# repz; rdseed %eax
	.byte 0xf3
	.byte 0x0f
	.byte 0xc7
	.byte 0xf8

	nop

# repz; rdrand %eax
	.byte 0xf3
	.byte 0x0f
	.byte 0xc7
	.byte 0xf0

	nop

# repnz; rdseed %eax
	.byte 0xf2
	.byte 0x0f
	.byte 0xc7
	.byte 0xf8

	nop

# repnz; rdrand %eax
	.byte 0xf2
	.byte 0x0f
	.byte 0xc7
	.byte 0xf0

	nop

	repz; movaps %xmm7, %xmm7
	int $3

# "repz" vmovaps %xmm7, %xmm7
	.byte 0xc5
	.byte 0xfa
	.byte 0x28
	.byte 0xff

	int $3

# "repnz" {vex3} vmovaps %xmm7, %xmm7
	.byte 0xc4
	.byte 0xe1
	.byte 0x7b
	.byte 0x28
	.byte 0xff

	int $3

# "EVEX.W1" vmovaps %xmm7, %xmm7
	.byte 0x62
	.byte 0xf1
	.byte 0xfc
	.byte 0x08
	.byte 0x28
	.byte 0xff

	int $3

# "repz" vmovaps %xmm7, %xmm7
	.byte 0x62
	.byte 0xf1
	.byte 0x7e
	.byte 0x08
	.byte 0x28
	.byte 0xff

	int $3

# "EVEX.W0" vmovapd %xmm7, %xmm7
	.byte 0x62
	.byte 0xf1
	.byte 0x7d
	.byte 0x08
	.byte 0x28
	.byte 0xff

	int $3

# "repnz" vmovapd %xmm7, %xmm7
	.byte 0x62
	.byte 0xf1
	.byte 0xff
	.byte 0x08
	.byte 0x28
	.byte 0xff

	int $3

	.byte 0x66; vmovaps %xmm0, %xmm0
	repz; {vex3} vmovaps %xmm0, %xmm0
	repnz; vmovaps %xmm0, %xmm0
	lock; {evex} vmovaps %xmm0, %xmm0

	vcvtpd2dqx 0x20(%eax),%xmm0
	vcvtpd2dq 0x20(%eax){1to2},%xmm0
	vcvtpd2dqx 0x20(%eax),%xmm0

# Get a good alignment.
 .p2align	4,0
