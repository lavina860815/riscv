/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sve_acle.h"

/*
** minp_u32_m_tied1:
**	uminp	z0\.s, p0/m, z0\.s, z1\.s
**	ret
*/
TEST_UNIFORM_Z (minp_u32_m_tied1, svuint32_t,
		z0 = svminp_u32_m (p0, z0, z1),
		z0 = svminp_m (p0, z0, z1))

/*
** minp_u32_m_tied2:
**	mov	(z[0-9]+)\.d, z0\.d
**	movprfx	z0, z1
**	uminp	z0\.s, p0/m, z0\.s, \1\.s
**	ret
*/
TEST_UNIFORM_Z (minp_u32_m_tied2, svuint32_t,
		z0 = svminp_u32_m (p0, z1, z0),
		z0 = svminp_m (p0, z1, z0))

/*
** minp_u32_m_untied:
**	movprfx	z0, z1
**	uminp	z0\.s, p0/m, z0\.s, z2\.s
**	ret
*/
TEST_UNIFORM_Z (minp_u32_m_untied, svuint32_t,
		z0 = svminp_u32_m (p0, z1, z2),
		z0 = svminp_m (p0, z1, z2))

/*
** minp_u32_x_tied1:
**	uminp	z0\.s, p0/m, z0\.s, z1\.s
**	ret
*/
TEST_UNIFORM_Z (minp_u32_x_tied1, svuint32_t,
		z0 = svminp_u32_x (p0, z0, z1),
		z0 = svminp_x (p0, z0, z1))

/*
** minp_u32_x_tied2:
**	mov	(z[0-9]+)\.d, z0\.d
**	movprfx	z0, z1
**	uminp	z0\.s, p0/m, z0\.s, \1\.s
**	ret
*/
TEST_UNIFORM_Z (minp_u32_x_tied2, svuint32_t,
		z0 = svminp_u32_x (p0, z1, z0),
		z0 = svminp_x (p0, z1, z0))

/*
** minp_u32_x_untied:
**	movprfx	z0, z1
**	uminp	z0\.s, p0/m, z0\.s, z2\.s
**	ret
*/
TEST_UNIFORM_Z (minp_u32_x_untied, svuint32_t,
		z0 = svminp_u32_x (p0, z1, z2),
		z0 = svminp_x (p0, z1, z2))
