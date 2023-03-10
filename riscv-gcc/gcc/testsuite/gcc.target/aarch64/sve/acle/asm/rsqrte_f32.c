/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sve_acle.h"

/*
** rsqrte_f32_tied1:
**	frsqrte	z0\.s, z0\.s
**	ret
*/
TEST_UNIFORM_Z (rsqrte_f32_tied1, svfloat32_t,
		z0 = svrsqrte_f32 (z0),
		z0 = svrsqrte (z0))

/*
** rsqrte_f32_untied:
**	frsqrte	z0\.s, z1\.s
**	ret
*/
TEST_UNIFORM_Z (rsqrte_f32_untied, svfloat32_t,
		z0 = svrsqrte_f32 (z1),
		z0 = svrsqrte (z1))
