/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sve_acle.h"

/*
** minp_u8_m_tied1:
**	uminp	z0\.b, p0/m, z0\.b, z1\.b
**	ret
*/
TEST_UNIFORM_Z (minp_u8_m_tied1, svuint8_t,
		z0 = svminp_u8_m (p0, z0, z1),
		z0 = svminp_m (p0, z0, z1))

/*
** minp_u8_m_tied2:
**	mov	(z[0-9]+)\.d, z0\.d
**	movprfx	z0, z1
**	uminp	z0\.b, p0/m, z0\.b, \1\.b
**	ret
*/
TEST_UNIFORM_Z (minp_u8_m_tied2, svuint8_t,
		z0 = svminp_u8_m (p0, z1, z0),
		z0 = svminp_m (p0, z1, z0))

/*
** minp_u8_m_untied:
**	movprfx	z0, z1
**	uminp	z0\.b, p0/m, z0\.b, z2\.b
**	ret
*/
TEST_UNIFORM_Z (minp_u8_m_untied, svuint8_t,
		z0 = svminp_u8_m (p0, z1, z2),
		z0 = svminp_m (p0, z1, z2))

/*
** minp_u8_x_tied1:
**	uminp	z0\.b, p0/m, z0\.b, z1\.b
**	ret
*/
TEST_UNIFORM_Z (minp_u8_x_tied1, svuint8_t,
		z0 = svminp_u8_x (p0, z0, z1),
		z0 = svminp_x (p0, z0, z1))

/*
** minp_u8_x_tied2:
**	mov	(z[0-9]+)\.d, z0\.d
**	movprfx	z0, z1
**	uminp	z0\.b, p0/m, z0\.b, \1\.b
**	ret
*/
TEST_UNIFORM_Z (minp_u8_x_tied2, svuint8_t,
		z0 = svminp_u8_x (p0, z1, z0),
		z0 = svminp_x (p0, z1, z0))

/*
** minp_u8_x_untied:
**	movprfx	z0, z1
**	uminp	z0\.b, p0/m, z0\.b, z2\.b
**	ret
*/
TEST_UNIFORM_Z (minp_u8_x_untied, svuint8_t,
		z0 = svminp_u8_x (p0, z1, z2),
		z0 = svminp_x (p0, z1, z2))
