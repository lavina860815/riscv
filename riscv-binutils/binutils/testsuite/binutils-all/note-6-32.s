	.text
	.org    0x100
	.global note_test
note_test:	
note_1_start:
	.word 0
note_1_end:
note_2_start:
	.word 0
note_2_end:
note_3_start:
	.word 0
note_3_end:
note_test_end:	
	.size   note_test, note_test_end - note_test
	
	.pushsection .gnu.build.attributes, "", %note
	.balign 4

	.dc.l 8
	.dc.l 8
	.dc.l 0x100
	.asciz "GA$3p1"
	.4byte 0x100  /* note_1_start */
	.4byte 0x102  /* note_1_end */

	.dc.l 23
	.dc.l 0
	.dc.l 0x100
	.asciz "GA$gcc 8.3.1 20190507"
	.dc.b 0

	.dc.l 10
	.dc.l 0
	.dc.l 0x100
	.dc.b 0x47, 0x41, 0x2a, 0x47, 0x4f, 0x57, 0, 0, 0x7, 0
	.dc.b 0, 0

	.dc.l 6
	.dc.l 0
	.dc.l 0x100
	.dc.b 0x47, 0x41, 0x2a, 0x2, 0, 0
	.dc.b 0, 0

	.dc.l 13
	.dc.l 0
	.dc.l 0x100
	.dc.b 0x47, 0x41, 0x2a, 0x46, 0x4f, 0x52, 0x54, 0x49, 0x46, 0x59, 0, 0xff, 0
	.dc.b 0, 0, 0

	.dc.l 6
	.dc.l 0
	.dc.l 0x100
	.dc.b 0x47, 0x41, 0x2a, 0x7, 0x2, 0
	.dc.b 0, 0

	.dc.l 5
	.dc.l 0
	.dc.l 0x100
	.dc.b 0x47, 0x41, 0x21, 0x8, 0
	.dc.b 0, 0, 0

	.dc.l 13
	.dc.l 0
	.dc.l 0x100
	.dc.b 0x47, 0x41, 0x2a, 0x6, 0xf2, 0x3, 0x38, 0xee, 0xce, 0xfa, 0x5e, 0x3c, 0
	.dc.b 0, 0, 0

	
	.dc.l 8
	.dc.l 8
	.dc.l 0x100
	.asciz "GA$3p1"
	.4byte 0x102  /* note_2_start */
	.4byte 0x106  /* note_3_end */

	.dc.l 23
	.dc.l 0
	.dc.l 0x100
	.asciz "GA$gcc 8.3.1 20190507"
	.dc.b 0

	.dc.l 10
	.dc.l 0
	.dc.l 0x100
	.dc.b 0x47, 0x41, 0x2a, 0x47, 0x4f, 0x57, 0, 0, 0x7, 0
	.dc.b 0, 0

	.dc.l 6
	.dc.l 0
	.dc.l 0x100
	.dc.b 0x47, 0x41, 0x2a, 0x2, 0, 0
	.dc.b 0, 0

	.dc.l 13
	.dc.l 0
	.dc.l 0x100
	.dc.b 0x47, 0x41, 0x2a, 0x46, 0x4f, 0x52, 0x54, 0x49, 0x46, 0x59, 0, 0xff, 0
	.dc.b 0, 0, 0

	.dc.l 6
	.dc.l 0
	.dc.l 0x100
	.dc.b 0x47, 0x41, 0x2a, 0x7, 0x2, 0
	.dc.b 0, 0

	.dc.l 5
	.dc.l 0
	.dc.l 0x100
	.dc.b 0x47, 0x41, 0x21, 0x8, 0
	.dc.b 0, 0, 0

	.dc.l 13
	.dc.l 0
	.dc.l 0x100
	.dc.b 0x47, 0x41, 0x2a, 0x6, 0xf2, 0x3, 0x38, 0xee, 0xce, 0xfa, 0x5e, 0x3c, 0
	.dc.b 0, 0, 0


	.dc.l 8
	.dc.l 8
	.dc.l 0x101
	.asciz "GA$3p1"
	.4byte 0x102  /* note_2_start */
	.4byte 0x104  /* note_2_end */

	.dc.l 16
	.dc.l 0
	.dc.l 0x101
	.asciz "GA$hello world"


	.dc.l 8
	.dc.l 8
	.dc.l 0x101
	.asciz "GA$3p1"
	.4byte 0x104  /* note_3_start */
	.4byte 0x106  /* note_3_end */

	.dc.l 16
	.dc.l 0
	.dc.l 0x101
	.asciz "GA$hello world"

	.popsection
