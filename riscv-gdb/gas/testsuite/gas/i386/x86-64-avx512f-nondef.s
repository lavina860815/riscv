# Check if objdump works correctly when some bits in instruction
# has non-default value

# vrndscalesd	{sae}, $123, %xmm4, %xmm5, %xmm6{%k7}	 # with null RC
.byte 0x62, 0xf3, 0xd5, 0x1f, 0x0b, 0xf4, 0x7b
# vrndscalesd	{sae}, $123, %xmm4, %xmm5, %xmm6{%k7}	 # with not-null RC
.byte 0x62, 0xf3, 0xd5, 0x5f, 0x0b, 0xf4, 0x7b
# vpminud	%zmm4, %zmm5, %zmm6{%k7}	 # with 111 REX
.byte 0x62, 0xf2, 0x55, 0x1f, 0x3b, 0xf4
# vpminud	%zmm4, %zmm5, %zmm6{%k7}	 # with not-111 REX
.byte 0x62, 0xc2, 0x55, 0x1f, 0x3b, 0xf4
# vpmovdb	%zmm6, 2032(%rdx) # with unset EVEX.B bit
.byte 0x62, 0xf2, 0x7e, 0x48, 0x31, 0x72, 0x7f
# vpmovdb	%zmm6, 2032(%rdx) # with set EVEX.B bit - we should get (bad) operand
.byte 0x62, 0xf2, 0x7e, 0x58, 0x31, 0x72, 0x7f
