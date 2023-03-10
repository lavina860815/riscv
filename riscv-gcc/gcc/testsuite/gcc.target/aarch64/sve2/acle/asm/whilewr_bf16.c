/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" { target { ! ilp32 } } } } */

#include "test_sve_acle.h"

/*
** whilewr_rr_bf16:
**	whilewr	p0\.h, x0, x1
**	ret
*/
TEST_COMPARE_S (whilewr_rr_bf16, const bfloat16_t *,
		p0 = svwhilewr_bf16 (x0, x1),
		p0 = svwhilewr (x0, x1))

/*
** whilewr_0r_bf16:
**	whilewr	p0\.h, xzr, x1
**	ret
*/
TEST_COMPARE_S (whilewr_0r_bf16, const bfloat16_t *,
		p0 = svwhilewr_bf16 ((const bfloat16_t *) 0, x1),
		p0 = svwhilewr ((const bfloat16_t *) 0, x1))

/*
** whilewr_cr_bf16:
**	mov	(x[0-9]+), #?1073741824
**	whilewr	p0\.h, \1, x1
**	ret
*/
TEST_COMPARE_S (whilewr_cr_bf16, const bfloat16_t *,
		p0 = svwhilewr_bf16 ((const bfloat16_t *) 1073741824, x1),
		p0 = svwhilewr ((const bfloat16_t *) 1073741824, x1))

/*
** whilewr_r0_bf16:
**	whilewr	p0\.h, x0, xzr
**	ret
*/
TEST_COMPARE_S (whilewr_r0_bf16, const bfloat16_t *,
		p0 = svwhilewr_bf16 (x0, (const bfloat16_t *) 0),
		p0 = svwhilewr (x0, (const bfloat16_t *) 0))

/*
** whilewr_rc_bf16:
**	mov	(x[0-9]+), #?1073741824
**	whilewr	p0\.h, x0, \1
**	ret
*/
TEST_COMPARE_S (whilewr_rc_bf16, const bfloat16_t *,
		p0 = svwhilewr_bf16 (x0, (const bfloat16_t *) 1073741824),
		p0 = svwhilewr (x0, (const bfloat16_t *) 1073741824))
