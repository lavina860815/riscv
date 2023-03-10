/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sve_acle.h"

/*
** recpe_u32_m_tied12:
**	urecpe	z0\.s, p0/m, z0\.s
**	ret
*/
TEST_UNIFORM_Z (recpe_u32_m_tied12, svuint32_t,
		z0 = svrecpe_u32_m (z0, p0, z0),
		z0 = svrecpe_m (z0, p0, z0))

/*
** recpe_u32_m_tied1:
**	urecpe	z0\.s, p0/m, z1\.s
**	ret
*/
TEST_UNIFORM_Z (recpe_u32_m_tied1, svuint32_t,
		z0 = svrecpe_u32_m (z0, p0, z1),
		z0 = svrecpe_m (z0, p0, z1))

/*
** recpe_u32_m_tied2:
**	mov	(z[0-9]+)\.d, z0\.d
**	movprfx	z0, z1
**	urecpe	z0\.s, p0/m, \1\.s
**	ret
*/
TEST_UNIFORM_Z (recpe_u32_m_tied2, svuint32_t,
		z0 = svrecpe_u32_m (z1, p0, z0),
		z0 = svrecpe_m (z1, p0, z0))

/*
** recpe_u32_m_untied:
**	movprfx	z0, z2
**	urecpe	z0\.s, p0/m, z1\.s
**	ret
*/
TEST_UNIFORM_Z (recpe_u32_m_untied, svuint32_t,
		z0 = svrecpe_u32_m (z2, p0, z1),
		z0 = svrecpe_m (z2, p0, z1))

/*
** recpe_u32_z_tied1:
**	mov	(z[0-9]+)\.d, z0\.d
**	movprfx	z0\.s, p0/z, \1\.s
**	urecpe	z0\.s, p0/m, \1\.s
**	ret
*/
TEST_UNIFORM_Z (recpe_u32_z_tied1, svuint32_t,
		z0 = svrecpe_u32_z (p0, z0),
		z0 = svrecpe_z (p0, z0))

/*
** recpe_u32_z_untied:
**	movprfx	z0\.s, p0/z, z1\.s
**	urecpe	z0\.s, p0/m, z1\.s
**	ret
*/
TEST_UNIFORM_Z (recpe_u32_z_untied, svuint32_t,
		z0 = svrecpe_u32_z (p0, z1),
		z0 = svrecpe_z (p0, z1))

/*
** recpe_u32_x_tied1:
**	urecpe	z0\.s, p0/m, z0\.s
**	ret
*/
TEST_UNIFORM_Z (recpe_u32_x_tied1, svuint32_t,
		z0 = svrecpe_u32_x (p0, z0),
		z0 = svrecpe_x (p0, z0))

/*
** recpe_u32_x_untied:
**	urecpe	z0\.s, p0/m, z1\.s
**	ret
*/
TEST_UNIFORM_Z (recpe_u32_x_untied, svuint32_t,
		z0 = svrecpe_u32_x (p0, z1),
		z0 = svrecpe_x (p0, z1))
