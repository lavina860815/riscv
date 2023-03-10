#define NT_GNU_PROPERTY_TYPE_0 5

#define GNU_PROPERTY_STACK_SIZE 1
#define GNU_PROPERTY_NO_COPY_ON_PROTECTED 2
#define GNU_PROPERTY_X86_ISA_1_USED 0xc0000000
#define GNU_PROPERTY_X86_ISA_1_NEEDED 0xc0000001
#define GNU_PROPERTY_X86_FEATURE_1_AND 0xc0000002

#if __SIZEOF_PTRDIFF_T__  == 8
# define ALIGN 3
#elif __SIZEOF_PTRDIFF_T__  == 4
# define ALIGN 2
#endif

        .section ".note.gnu.property", "a"
        .p2align ALIGN
        .long 1f - 0f           /* name length */
        .long 3f - 2f           /* data length */
        .long NT_GNU_PROPERTY_TYPE_0    /* note type */
0:      .asciz "GNU"            /* vendor name */
1:
        .p2align ALIGN
2:      .long GNU_PROPERTY_NO_COPY_ON_PROTECTED /* pr_type.  */
        .long 0 /* pr_datasz.  */
        .p2align ALIGN
	.long GNU_PROPERTY_X86_ISA_1_USED
	.long 4
	.byte 0x01,0x11,0x00,0x00
        .p2align ALIGN
	.long GNU_PROPERTY_X86_ISA_1_NEEDED
	.long 4
	.byte 0x01,0x11,0x00,0x00
        .p2align ALIGN
	.long GNU_PROPERTY_X86_FEATURE_1_AND
	.long 4
	.byte 0x03,0x00,0x00,0x00
        .p2align ALIGN
3:
