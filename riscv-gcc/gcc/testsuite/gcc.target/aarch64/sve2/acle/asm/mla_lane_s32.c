/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sve_acle.h"

/*
** mla_lane_0_s32_tied1:
**	mla	z0\.s, z1\.s, z2\.s\[0\]
**	ret
*/
TEST_UNIFORM_Z (mla_lane_0_s32_tied1, svint32_t,
		z0 = svmla_lane_s32 (z0, z1, z2, 0),
		z0 = svmla_lane (z0, z1, z2, 0))

/*
** mla_lane_0_s32_tied2:
**	mov	(z[0-9]+)\.d, z0\.d
**	movprfx	z0, z1
**	mla	z0\.s, \1\.s, z2\.s\[0\]
**	ret
*/
TEST_UNIFORM_Z (mla_lane_0_s32_tied2, svint32_t,
		z0 = svmla_lane_s32 (z1, z0, z2, 0),
		z0 = svmla_lane (z1, z0, z2, 0))

/*
** mla_lane_0_s32_tied3:
**	mov	(z[0-9]+)\.d, z0\.d
**	movprfx	z0, z1
**	mla	z0\.s, z2\.s, \1\.s\[0\]
**	ret
*/
TEST_UNIFORM_Z (mla_lane_0_s32_tied3, svint32_t,
		z0 = svmla_lane_s32 (z1, z2, z0, 0),
		z0 = svmla_lane (z1, z2, z0, 0))

/*
** mla_lane_0_s32_untied:
**	movprfx	z0, z1
**	mla	z0\.s, z2\.s, z3\.s\[0\]
**	ret
*/
TEST_UNIFORM_Z (mla_lane_0_s32_untied, svint32_t,
		z0 = svmla_lane_s32 (z1, z2, z3, 0),
		z0 = svmla_lane (z1, z2, z3, 0))

/*
** mla_lane_1_s32:
**	mla	z0\.s, z1\.s, z2\.s\[1\]
**	ret
*/
TEST_UNIFORM_Z (mla_lane_1_s32, svint32_t,
		z0 = svmla_lane_s32 (z0, z1, z2, 1),
		z0 = svmla_lane (z0, z1, z2, 1))

/*
** mla_lane_2_s32:
**	mla	z0\.s, z1\.s, z2\.s\[2\]
**	ret
*/
TEST_UNIFORM_Z (mla_lane_2_s32, svint32_t,
		z0 = svmla_lane_s32 (z0, z1, z2, 2),
		z0 = svmla_lane (z0, z1, z2, 2))

/*
** mla_lane_3_s32:
**	mla	z0\.s, z1\.s, z2\.s\[3\]
**	ret
*/
TEST_UNIFORM_Z (mla_lane_3_s32, svint32_t,
		z0 = svmla_lane_s32 (z0, z1, z2, 3),
		z0 = svmla_lane (z0, z1, z2, 3))

/*
** mla_lane_z8_s32:
**	str	d8, \[sp, -16\]!
**	mov	(z[0-7])\.d, z8\.d
**	mla	z0\.s, z1\.s, \1\.s\[1\]
**	ldr	d8, \[sp\], 16
**	ret
*/
TEST_DUAL_LANE_REG (mla_lane_z8_s32, svint32_t, svint32_t, z8,
		    z0 = svmla_lane_s32 (z0, z1, z8, 1),
		    z0 = svmla_lane (z0, z1, z8, 1))

/*
** mla_lane_z16_s32:
**	mov	(z[0-7])\.d, z16\.d
**	mla	z0\.s, z1\.s, \1\.s\[1\]
**	ret
*/
TEST_DUAL_LANE_REG (mla_lane_z16_s32, svint32_t, svint32_t, z16,
		    z0 = svmla_lane_s32 (z0, z1, z16, 1),
		    z0 = svmla_lane (z0, z1, z16, 1))
