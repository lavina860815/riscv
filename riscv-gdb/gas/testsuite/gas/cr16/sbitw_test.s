        .text
        .global main
main:
	sbitw $4,0xbcd
	sbitw $5,0xaabcd
	sbitw $3,0xfaabcd
	sbitw $10,0xbcd
	sbitw $15,0xaabcd
	sbitw $14,0xfaabcd

	sbitw $5,[r12]0x14
	sbitw $4,[r13]0xabfc
	sbitw $3,[r12]0x1234
	sbitw $3,[r13]0x1234
	sbitw $3,[r12]0x34
	sbitw $15,[r12]0x14
	sbitw $14,[r13]0xabfc
	sbitw $13,[r12]0x1234
	sbitw $13,[r13]0x1234
	sbitw $11,[r12]0x34

	sbitw $3,[r12]0xa7a(r1,r0)
	sbitw $3,[r12]0xa7a(r3,r2)
	sbitw $3,[r12]0xa7a(r4,r3)
	sbitw $3,[r12]0xa7a(r5,r4)
	sbitw $3,[r12]0xa7a(r6,r5)
	sbitw $3,[r12]0xa7a(r7,r6)
	sbitw $3,[r12]0xa7a(r9,r8)
	sbitw $3,[r12]0xa7a(r11,r10)
	sbitw $3,[r13]0xa7a(r1,r0)
	sbitw $3,[r13]0xa7a(r3,r2)
	sbitw $3,[r13]0xa7a(r4,r3)
	sbitw $3,[r13]0xa7a(r5,r4)
	sbitw $3,[r13]0xa7a(r6,r5)
	sbitw $3,[r13]0xa7a(r7,r6)
	sbitw $3,[r13]0xa7a(r9,r8)
	sbitw $3,[r13]0xa7a(r11,r10)
	sbitw $5,[r13]0xb7a(r4,r3)
	sbitw $1,[r12]0x17a(r6,r5)
	sbitw $1,[r13]0x134(r6,r5)
	sbitw $3,[r12]0xabcde(r4,r3)
	sbitw $5,[r13]0xabcd(r4,r3)
	sbitw $3,[r12]0xabcd(r6,r5)
	sbitw $3,[r13]0xbcde(r6,r5)
	sbitw $13,[r12]0xa7a(r1,r0)
	sbitw $13,[r12]0xa7a(r3,r2)
	sbitw $13,[r12]0xa7a(r4,r3)
	sbitw $13,[r12]0xa7a(r5,r4)
	sbitw $13,[r12]0xa7a(r6,r5)
	sbitw $13,[r12]0xa7a(r7,r6)
	sbitw $13,[r12]0xa7a(r9,r8)
	sbitw $13,[r12]0xa7a(r11,r10)
	sbitw $13,[r13]0xa7a(r1,r0)
	sbitw $13,[r13]0xa7a(r3,r2)
	sbitw $13,[r13]0xa7a(r4,r3)
	sbitw $13,[r13]0xa7a(r5,r4)
	sbitw $13,[r13]0xa7a(r6,r5)
	sbitw $13,[r13]0xa7a(r7,r6)
	sbitw $13,[r13]0xa7a(r9,r8)
	sbitw $13,[r13]0xa7a(r11,r10)
	sbitw $15,[r13]0xb7a(r4,r3)
	sbitw $11,[r12]0x17a(r6,r5)
	sbitw $11,[r13]0x134(r6,r5)
	sbitw $13,[r12]0xabcde(r4,r3)
	sbitw $15,[r13]0xabcd(r4,r3)
	sbitw $13,[r12]0xabcd(r6,r5)
	sbitw $13,[r13]0xbcde(r6,r5)

	sbitw $5,0x0(r2)
	sbitw $3,0x34(r12)
	sbitw $3,0xab(r13)
	sbitw $5,0xad(r1)
	sbitw $5,0xcd(r2)
	sbitw $5,0xfff(r0)
	sbitw $3,0xbcd(r4)
	sbitw $3,0xfff(r12)
	sbitw $3,0xfff(r13)
	sbitw $3,0xffff(r13)
	sbitw $3,0x2343(r12)
	sbitw $3,0x12345(r2)
	sbitw $3,0x4abcd(r8)
	sbitw $3,0xfabcd(r13)
	sbitw $3,0xfabcd(r8)
	sbitw $3,0xfabcd(r9)
	sbitw $3,0x4abcd(r9)
	sbitw $15,0x0(r2)
	sbitw $13,0x34(r12)
	sbitw $13,0xab(r13)
	sbitw $15,0xad(r1)
	sbitw $15,0xcd(r2)
	sbitw $15,0xfff(r0)
	sbitw $13,0xbcd(r4)
	sbitw $13,0xfff(r12)
	sbitw $13,0xfff(r13)
	sbitw $13,0xffff(r13)
	sbitw $13,0x2343(r12)
	sbitw $13,0x12345(r2)
	sbitw $13,0x4abcd(r8)
	sbitw $13,0xfabcd(r13)
	sbitw $13,0xfabcd(r8)
	sbitw $13,0xfabcd(r9)
	sbitw $13,0x4abcd(r9)

	sbitw $3,0x0(r2,r1)
	sbitw $5,0x1(r2,r1)
	sbitw $4,0x1234(r2,r1)
	sbitw $3,0x1234(r2,r1)
	sbitw $3,0x12345(r2,r1)
	sbitw $3,0x123(r2,r1)
	sbitw $3,0x12345(r2,r1)
	sbitw $13,0x0(r2,r1)
	sbitw $15,0x1(r2,r1)
	sbitw $14,0x1234(r2,r1)
	sbitw $13,0x1234(r2,r1)
	sbitw $13,0x12345(r2,r1)
	sbitw $13,0x123(r2,r1)
	sbitw $13,0x12345(r2,r1)
