/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sve_acle.h"

/*
** qincd_pat_n_1_u32_tied:
**	uqincd	w0, pow2
**	ret
*/
TEST_UNIFORM_S (qincd_pat_n_1_u32_tied, uint32_t,
		x0 = svqincd_pat_n_u32 (x0, SV_POW2, 1),
		x0 = svqincd_pat (x0, SV_POW2, 1))

/*
** qincd_pat_n_1_u32_untied:
**	mov	w0, w1
**	uqincd	w0, pow2
**	ret
*/
TEST_UNIFORM_S (qincd_pat_n_1_u32_untied, uint32_t,
		x0 = svqincd_pat_n_u32 (x1, SV_POW2, 1),
		x0 = svqincd_pat (x1, SV_POW2, 1))

/*
** qincd_pat_n_2_u32:
**	uqincd	w0, pow2, mul #2
**	ret
*/
TEST_UNIFORM_S (qincd_pat_n_2_u32, uint32_t,
		x0 = svqincd_pat_n_u32 (x0, SV_POW2, 2),
		x0 = svqincd_pat (x0, SV_POW2, 2))

/*
** qincd_pat_n_7_u32:
**	uqincd	w0, pow2, mul #7
**	ret
*/
TEST_UNIFORM_S (qincd_pat_n_7_u32, uint32_t,
		x0 = svqincd_pat_n_u32 (x0, SV_POW2, 7),
		x0 = svqincd_pat (x0, SV_POW2, 7))

/*
** qincd_pat_n_15_u32:
**	uqincd	w0, pow2, mul #15
**	ret
*/
TEST_UNIFORM_S (qincd_pat_n_15_u32, uint32_t,
		x0 = svqincd_pat_n_u32 (x0, SV_POW2, 15),
		x0 = svqincd_pat (x0, SV_POW2, 15))

/*
** qincd_pat_n_16_u32:
**	uqincd	w0, pow2, mul #16
**	ret
*/
TEST_UNIFORM_S (qincd_pat_n_16_u32, uint32_t,
		x0 = svqincd_pat_n_u32 (x0, SV_POW2, 16),
		x0 = svqincd_pat (x0, SV_POW2, 16))

/*
** qincd_pat_n_vl1_u32:
**	uqincd	w0, vl1, mul #16
**	ret
*/
TEST_UNIFORM_S (qincd_pat_n_vl1_u32, uint32_t,
		x0 = svqincd_pat_n_u32 (x0, SV_VL1, 16),
		x0 = svqincd_pat (x0, SV_VL1, 16))

/*
** qincd_pat_n_vl2_u32:
**	uqincd	w0, vl2, mul #16
**	ret
*/
TEST_UNIFORM_S (qincd_pat_n_vl2_u32, uint32_t,
		x0 = svqincd_pat_n_u32 (x0, SV_VL2, 16),
		x0 = svqincd_pat (x0, SV_VL2, 16))

/*
** qincd_pat_n_vl3_u32:
**	uqincd	w0, vl3, mul #16
**	ret
*/
TEST_UNIFORM_S (qincd_pat_n_vl3_u32, uint32_t,
		x0 = svqincd_pat_n_u32 (x0, SV_VL3, 16),
		x0 = svqincd_pat (x0, SV_VL3, 16))

/*
** qincd_pat_n_vl4_u32:
**	uqincd	w0, vl4, mul #16
**	ret
*/
TEST_UNIFORM_S (qincd_pat_n_vl4_u32, uint32_t,
		x0 = svqincd_pat_n_u32 (x0, SV_VL4, 16),
		x0 = svqincd_pat (x0, SV_VL4, 16))

/*
** qincd_pat_n_vl5_u32:
**	uqincd	w0, vl5, mul #16
**	ret
*/
TEST_UNIFORM_S (qincd_pat_n_vl5_u32, uint32_t,
		x0 = svqincd_pat_n_u32 (x0, SV_VL5, 16),
		x0 = svqincd_pat (x0, SV_VL5, 16))

/*
** qincd_pat_n_vl6_u32:
**	uqincd	w0, vl6, mul #16
**	ret
*/
TEST_UNIFORM_S (qincd_pat_n_vl6_u32, uint32_t,
		x0 = svqincd_pat_n_u32 (x0, SV_VL6, 16),
		x0 = svqincd_pat (x0, SV_VL6, 16))

/*
** qincd_pat_n_vl7_u32:
**	uqincd	w0, vl7, mul #16
**	ret
*/
TEST_UNIFORM_S (qincd_pat_n_vl7_u32, uint32_t,
		x0 = svqincd_pat_n_u32 (x0, SV_VL7, 16),
		x0 = svqincd_pat (x0, SV_VL7, 16))

/*
** qincd_pat_n_vl8_u32:
**	uqincd	w0, vl8, mul #16
**	ret
*/
TEST_UNIFORM_S (qincd_pat_n_vl8_u32, uint32_t,
		x0 = svqincd_pat_n_u32 (x0, SV_VL8, 16),
		x0 = svqincd_pat (x0, SV_VL8, 16))

/*
** qincd_pat_n_vl16_u32:
**	uqincd	w0, vl16, mul #16
**	ret
*/
TEST_UNIFORM_S (qincd_pat_n_vl16_u32, uint32_t,
		x0 = svqincd_pat_n_u32 (x0, SV_VL16, 16),
		x0 = svqincd_pat (x0, SV_VL16, 16))

/*
** qincd_pat_n_vl32_u32:
**	uqincd	w0, vl32, mul #16
**	ret
*/
TEST_UNIFORM_S (qincd_pat_n_vl32_u32, uint32_t,
		x0 = svqincd_pat_n_u32 (x0, SV_VL32, 16),
		x0 = svqincd_pat (x0, SV_VL32, 16))

/*
** qincd_pat_n_vl64_u32:
**	uqincd	w0, vl64, mul #16
**	ret
*/
TEST_UNIFORM_S (qincd_pat_n_vl64_u32, uint32_t,
		x0 = svqincd_pat_n_u32 (x0, SV_VL64, 16),
		x0 = svqincd_pat (x0, SV_VL64, 16))

/*
** qincd_pat_n_vl128_u32:
**	uqincd	w0, vl128, mul #16
**	ret
*/
TEST_UNIFORM_S (qincd_pat_n_vl128_u32, uint32_t,
		x0 = svqincd_pat_n_u32 (x0, SV_VL128, 16),
		x0 = svqincd_pat (x0, SV_VL128, 16))

/*
** qincd_pat_n_vl256_u32:
**	uqincd	w0, vl256, mul #16
**	ret
*/
TEST_UNIFORM_S (qincd_pat_n_vl256_u32, uint32_t,
		x0 = svqincd_pat_n_u32 (x0, SV_VL256, 16),
		x0 = svqincd_pat (x0, SV_VL256, 16))

/*
** qincd_pat_n_mul4_u32:
**	uqincd	w0, mul4, mul #16
**	ret
*/
TEST_UNIFORM_S (qincd_pat_n_mul4_u32, uint32_t,
		x0 = svqincd_pat_n_u32 (x0, SV_MUL4, 16),
		x0 = svqincd_pat (x0, SV_MUL4, 16))

/*
** qincd_pat_n_mul3_u32:
**	uqincd	w0, mul3, mul #16
**	ret
*/
TEST_UNIFORM_S (qincd_pat_n_mul3_u32, uint32_t,
		x0 = svqincd_pat_n_u32 (x0, SV_MUL3, 16),
		x0 = svqincd_pat (x0, SV_MUL3, 16))

/*
** qincd_pat_n_all_u32:
**	uqincd	w0, all, mul #16
**	ret
*/
TEST_UNIFORM_S (qincd_pat_n_all_u32, uint32_t,
		x0 = svqincd_pat_n_u32 (x0, SV_ALL, 16),
		x0 = svqincd_pat (x0, SV_ALL, 16))
