/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sve_acle.h"

/*
** bsl1n_u16_tied1:
**	bsl1n	z0\.d, z0\.d, z1\.d, z2\.d
**	ret
*/
TEST_UNIFORM_Z (bsl1n_u16_tied1, svuint16_t,
		z0 = svbsl1n_u16 (z0, z1, z2),
		z0 = svbsl1n (z0, z1, z2))

/*
** bsl1n_u16_tied2:
**	mov	(z[0-9]+\.d), z0\.d
**	movprfx	z0, z1
**	bsl1n	z0\.d, z0\.d, \1, z2\.d
**	ret
*/
TEST_UNIFORM_Z (bsl1n_u16_tied2, svuint16_t,
		z0 = svbsl1n_u16 (z1, z0, z2),
		z0 = svbsl1n (z1, z0, z2))

/*
** bsl1n_u16_tied3:
**	mov	(z[0-9]+\.d), z0\.d
**	movprfx	z0, z1
**	bsl1n	z0\.d, z0\.d, z2\.d, \1
**	ret
*/
TEST_UNIFORM_Z (bsl1n_u16_tied3, svuint16_t,
		z0 = svbsl1n_u16 (z1, z2, z0),
		z0 = svbsl1n (z1, z2, z0))

/*
** bsl1n_u16_untied:
**	movprfx	z0, z1
**	bsl1n	z0\.d, z0\.d, z2\.d, z3\.d
**	ret
*/
TEST_UNIFORM_Z (bsl1n_u16_untied, svuint16_t,
		z0 = svbsl1n_u16 (z1, z2, z3),
		z0 = svbsl1n (z1, z2, z3))

/*
** bsl1n_w0_u16_tied1:
**	mov	(z[0-9]+)\.h, w0
**	bsl1n	z0\.d, z0\.d, z1\.d, \1\.d
**	ret
*/
TEST_UNIFORM_ZX (bsl1n_w0_u16_tied1, svuint16_t, uint16_t,
		 z0 = svbsl1n_n_u16 (z0, z1, x0),
		 z0 = svbsl1n (z0, z1, x0))

/*
** bsl1n_w0_u16_tied2:
**	mov	(z[0-9]+)\.h, w0
**	mov	(z[0-9]+\.d), z0\.d
**	movprfx	z0, z1
**	bsl1n	z0\.d, z0\.d, \2, \1\.d
**	ret
*/
TEST_UNIFORM_ZX (bsl1n_w0_u16_tied2, svuint16_t, uint16_t,
		 z0 = svbsl1n_n_u16 (z1, z0, x0),
		 z0 = svbsl1n (z1, z0, x0))

/*
** bsl1n_w0_u16_untied:
**	mov	(z[0-9]+)\.h, w0
**	movprfx	z0, z1
**	bsl1n	z0\.d, z0\.d, z2\.d, \1\.d
**	ret
*/
TEST_UNIFORM_ZX (bsl1n_w0_u16_untied, svuint16_t, uint16_t,
		 z0 = svbsl1n_n_u16 (z1, z2, x0),
		 z0 = svbsl1n (z1, z2, x0))

/*
** bsl1n_11_u16_tied1:
**	mov	(z[0-9]+)\.h, #11
**	bsl1n	z0\.d, z0\.d, z1\.d, \1\.d
**	ret
*/
TEST_UNIFORM_Z (bsl1n_11_u16_tied1, svuint16_t,
		z0 = svbsl1n_n_u16 (z0, z1, 11),
		z0 = svbsl1n (z0, z1, 11))

/*
** bsl1n_11_u16_tied2:
**	mov	(z[0-9]+)\.h, #11
**	mov	(z[0-9]+\.d), z0\.d
**	movprfx	z0, z1
**	bsl1n	z0\.d, z0\.d, \2, \1\.d
**	ret
*/
TEST_UNIFORM_Z (bsl1n_11_u16_tied2, svuint16_t,
		z0 = svbsl1n_n_u16 (z1, z0, 11),
		z0 = svbsl1n (z1, z0, 11))

/*
** bsl1n_11_u16_untied:
**	mov	(z[0-9]+)\.h, #11
**	movprfx	z0, z1
**	bsl1n	z0\.d, z0\.d, z2\.d, \1\.d
**	ret
*/
TEST_UNIFORM_Z (bsl1n_11_u16_untied, svuint16_t,
		z0 = svbsl1n_n_u16 (z1, z2, 11),
		z0 = svbsl1n (z1, z2, 11))
