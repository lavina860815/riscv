/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sve_acle.h"

/*
** not_s16_m_tied12:
**	not	z0\.h, p0/m, z0\.h
**	ret
*/
TEST_UNIFORM_Z (not_s16_m_tied12, svint16_t,
		z0 = svnot_s16_m (z0, p0, z0),
		z0 = svnot_m (z0, p0, z0))

/*
** not_s16_m_tied1:
**	not	z0\.h, p0/m, z1\.h
**	ret
*/
TEST_UNIFORM_Z (not_s16_m_tied1, svint16_t,
		z0 = svnot_s16_m (z0, p0, z1),
		z0 = svnot_m (z0, p0, z1))

/*
** not_s16_m_tied2:
**	mov	(z[0-9]+)\.d, z0\.d
**	movprfx	z0, z1
**	not	z0\.h, p0/m, \1\.h
**	ret
*/
TEST_UNIFORM_Z (not_s16_m_tied2, svint16_t,
		z0 = svnot_s16_m (z1, p0, z0),
		z0 = svnot_m (z1, p0, z0))

/*
** not_s16_m_untied:
**	movprfx	z0, z2
**	not	z0\.h, p0/m, z1\.h
**	ret
*/
TEST_UNIFORM_Z (not_s16_m_untied, svint16_t,
		z0 = svnot_s16_m (z2, p0, z1),
		z0 = svnot_m (z2, p0, z1))

/*
** not_s16_z_tied1:
**	mov	(z[0-9]+)\.d, z0\.d
**	movprfx	z0\.h, p0/z, \1\.h
**	not	z0\.h, p0/m, \1\.h
**	ret
*/
TEST_UNIFORM_Z (not_s16_z_tied1, svint16_t,
		z0 = svnot_s16_z (p0, z0),
		z0 = svnot_z (p0, z0))

/*
** not_s16_z_untied:
**	movprfx	z0\.h, p0/z, z1\.h
**	not	z0\.h, p0/m, z1\.h
**	ret
*/
TEST_UNIFORM_Z (not_s16_z_untied, svint16_t,
		z0 = svnot_s16_z (p0, z1),
		z0 = svnot_z (p0, z1))

/*
** not_s16_x_tied1:
**	not	z0\.h, p0/m, z0\.h
**	ret
*/
TEST_UNIFORM_Z (not_s16_x_tied1, svint16_t,
		z0 = svnot_s16_x (p0, z0),
		z0 = svnot_x (p0, z0))

/*
** not_s16_x_untied:
**	not	z0\.h, p0/m, z1\.h
**	ret
*/
TEST_UNIFORM_Z (not_s16_x_untied, svint16_t,
		z0 = svnot_s16_x (p0, z1),
		z0 = svnot_x (p0, z1))
