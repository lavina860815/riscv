# 64bit unlockable Instructions

	.text
foo:
	lock mov %ecx, %eax
	lock mov (%rbx), %eax

	lock add %ebx, %eax
	lock add $0x64, %ebx
	lock adc %ebx, %eax
	lock adc $0x64, %ebx
	lock and %ebx, %eax
	lock and $0x64, %ebx
	lock btc %eax, %ebx
	lock btc $0x64, %ebx
	lock btr %eax, %ebx
	lock btr $0x64, %ebx
	lock bts %eax, %ebx
	lock bts $0x64, %ebx
	lock cmpxchg %eax,%ebx
	lock decl %ebx
	lock incl %ebx
	lock negl %ebx
	lock notl %ebx
	lock or %ebx, %eax
	lock or $0x64, %ebx
	lock sbb %ebx, %eax
	lock sbb $0x64, %ebx
	lock sub %ebx, %eax
	lock sub $0x64, %ebx
	lock xadd %eax, %ebx
	lock xchg %ebx, %eax
	lock xchg %eax, %ebx
	lock xor %ebx, %eax
	lock xor $0x64, %ebx

	lock add (%rbx), %eax
	lock adc (%rbx), %eax
	lock and (%rbx), %eax
	lock or (%rbx), %eax
	lock sbb (%rbx), %eax
	lock sub (%rbx), %eax
	lock xor (%rbx), %eax

	.intel_syntax noprefix
	lock mov eax,ebx
	lock mov eax,DWORD PTR [rbx]

	lock add eax,ebx
	lock add ebx,0x64
	lock adc eax,ebx
	lock adc ebx,0x64
	lock and eax,ebx
	lock and ebx,0x64
	lock btc ebx,eax
	lock btc ebx,0x64
	lock btr ebx,eax
	lock btr ebx,0x64
	lock bts ebx,eax
	lock bts ebx,0x64
	lock cmpxchg ebx,eax
	lock dec ebx
	lock inc ebx
	lock neg ebx
	lock not ebx
	lock or eax,ebx
	lock or ebx,0x64
	lock sbb eax,ebx
	lock sbb ebx,0x64
	lock sub eax,ebx
	lock sub ebx,0x64
	lock xadd ebx,eax
	lock xchg ebx,eax
	lock xchg ebx,eax
	lock xor eax,ebx
	lock xor ebx,0x64

	lock add eax,DWORD PTR [rbx]
	lock adc eax,DWORD PTR [rbx]
	lock and eax,DWORD PTR [rbx]
	lock or eax,DWORD PTR [rbx]
	lock sbb eax,DWORD PTR [rbx]
	lock sub eax,DWORD PTR [rbx]
	lock xor eax,DWORD PTR [rbx]
