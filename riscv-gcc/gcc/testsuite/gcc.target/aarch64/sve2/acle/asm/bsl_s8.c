/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sve_acle.h"

/*
** bsl_s8_tied1:
**	bsl	z0\.d, z0\.d, z1\.d, z2\.d
**	ret
*/
TEST_UNIFORM_Z (bsl_s8_tied1, svint8_t,
		z0 = svbsl_s8 (z0, z1, z2),
		z0 = svbsl (z0, z1, z2))

/*
** bsl_s8_tied2:
**	mov	(z[0-9]+\.d), z0\.d
**	movprfx	z0, z1
**	bsl	z0\.d, z0\.d, \1, z2\.d
**	ret
*/
TEST_UNIFORM_Z (bsl_s8_tied2, svint8_t,
		z0 = svbsl_s8 (z1, z0, z2),
		z0 = svbsl (z1, z0, z2))

/*
** bsl_s8_tied3:
**	mov	(z[0-9]+\.d), z0\.d
**	movprfx	z0, z1
**	bsl	z0\.d, z0\.d, z2\.d, \1
**	ret
*/
TEST_UNIFORM_Z (bsl_s8_tied3, svint8_t,
		z0 = svbsl_s8 (z1, z2, z0),
		z0 = svbsl (z1, z2, z0))

/*
** bsl_s8_untied:
**	movprfx	z0, z1
**	bsl	z0\.d, z0\.d, z2\.d, z3\.d
**	ret
*/
TEST_UNIFORM_Z (bsl_s8_untied, svint8_t,
		z0 = svbsl_s8 (z1, z2, z3),
		z0 = svbsl (z1, z2, z3))

/*
** bsl_w0_s8_tied1:
**	mov	(z[0-9]+)\.b, w0
**	bsl	z0\.d, z0\.d, z1\.d, \1\.d
**	ret
*/
TEST_UNIFORM_ZX (bsl_w0_s8_tied1, svint8_t, int8_t,
		 z0 = svbsl_n_s8 (z0, z1, x0),
		 z0 = svbsl (z0, z1, x0))

/*
** bsl_w0_s8_tied2:
**	mov	(z[0-9]+)\.b, w0
**	mov	(z[0-9]+\.d), z0\.d
**	movprfx	z0, z1
**	bsl	z0\.d, z0\.d, \2, \1\.d
**	ret
*/
TEST_UNIFORM_ZX (bsl_w0_s8_tied2, svint8_t, int8_t,
		 z0 = svbsl_n_s8 (z1, z0, x0),
		 z0 = svbsl (z1, z0, x0))

/*
** bsl_w0_s8_untied:
**	mov	(z[0-9]+)\.b, w0
**	movprfx	z0, z1
**	bsl	z0\.d, z0\.d, z2\.d, \1\.d
**	ret
*/
TEST_UNIFORM_ZX (bsl_w0_s8_untied, svint8_t, int8_t,
		 z0 = svbsl_n_s8 (z1, z2, x0),
		 z0 = svbsl (z1, z2, x0))

/*
** bsl_11_s8_tied1:
**	mov	(z[0-9]+)\.b, #11
**	bsl	z0\.d, z0\.d, z1\.d, \1\.d
**	ret
*/
TEST_UNIFORM_Z (bsl_11_s8_tied1, svint8_t,
		z0 = svbsl_n_s8 (z0, z1, 11),
		z0 = svbsl (z0, z1, 11))

/*
** bsl_11_s8_tied2:
**	mov	(z[0-9]+)\.b, #11
**	mov	(z[0-9]+\.d), z0\.d
**	movprfx	z0, z1
**	bsl	z0\.d, z0\.d, \2, \1\.d
**	ret
*/
TEST_UNIFORM_Z (bsl_11_s8_tied2, svint8_t,
		z0 = svbsl_n_s8 (z1, z0, 11),
		z0 = svbsl (z1, z0, 11))

/*
** bsl_11_s8_untied:
**	mov	(z[0-9]+)\.b, #11
**	movprfx	z0, z1
**	bsl	z0\.d, z0\.d, z2\.d, \1\.d
**	ret
*/
TEST_UNIFORM_Z (bsl_11_s8_untied, svint8_t,
		z0 = svbsl_n_s8 (z1, z2, 11),
		z0 = svbsl (z1, z2, 11))
