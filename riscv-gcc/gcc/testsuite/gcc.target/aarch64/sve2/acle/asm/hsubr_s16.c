/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sve_acle.h"

/*
** hsubr_s16_m_tied1:
**	shsubr	z0\.h, p0/m, z0\.h, z1\.h
**	ret
*/
TEST_UNIFORM_Z (hsubr_s16_m_tied1, svint16_t,
		z0 = svhsubr_s16_m (p0, z0, z1),
		z0 = svhsubr_m (p0, z0, z1))

/*
** hsubr_s16_m_tied2:
**	mov	(z[0-9]+)\.d, z0\.d
**	movprfx	z0, z1
**	shsubr	z0\.h, p0/m, z0\.h, \1\.h
**	ret
*/
TEST_UNIFORM_Z (hsubr_s16_m_tied2, svint16_t,
		z0 = svhsubr_s16_m (p0, z1, z0),
		z0 = svhsubr_m (p0, z1, z0))

/*
** hsubr_s16_m_untied:
**	movprfx	z0, z1
**	shsubr	z0\.h, p0/m, z0\.h, z2\.h
**	ret
*/
TEST_UNIFORM_Z (hsubr_s16_m_untied, svint16_t,
		z0 = svhsubr_s16_m (p0, z1, z2),
		z0 = svhsubr_m (p0, z1, z2))

/*
** hsubr_w0_s16_m_tied1:
**	mov	(z[0-9]+\.h), w0
**	shsubr	z0\.h, p0/m, z0\.h, \1
**	ret
*/
TEST_UNIFORM_ZX (hsubr_w0_s16_m_tied1, svint16_t, int16_t,
		 z0 = svhsubr_n_s16_m (p0, z0, x0),
		 z0 = svhsubr_m (p0, z0, x0))

/*
** hsubr_w0_s16_m_untied:: { xfail *-*-*}
**	mov	(z[0-9]+\.h), w0
**	movprfx	z0, z1
**	shsubr	z0\.h, p0/m, z0\.h, \1
**	ret
*/
TEST_UNIFORM_ZX (hsubr_w0_s16_m_untied, svint16_t, int16_t,
		 z0 = svhsubr_n_s16_m (p0, z1, x0),
		 z0 = svhsubr_m (p0, z1, x0))

/*
** hsubr_11_s16_m_tied1:
**	mov	(z[0-9]+\.h), #11
**	shsubr	z0\.h, p0/m, z0\.h, \1
**	ret
*/
TEST_UNIFORM_Z (hsubr_11_s16_m_tied1, svint16_t,
		z0 = svhsubr_n_s16_m (p0, z0, 11),
		z0 = svhsubr_m (p0, z0, 11))

/*
** hsubr_11_s16_m_untied:: { xfail *-*-*}
**	mov	(z[0-9]+\.h), #11
**	movprfx	z0, z1
**	shsubr	z0\.h, p0/m, z0\.h, \1
**	ret
*/
TEST_UNIFORM_Z (hsubr_11_s16_m_untied, svint16_t,
		z0 = svhsubr_n_s16_m (p0, z1, 11),
		z0 = svhsubr_m (p0, z1, 11))

/*
** hsubr_s16_z_tied1:
**	movprfx	z0\.h, p0/z, z0\.h
**	shsubr	z0\.h, p0/m, z0\.h, z1\.h
**	ret
*/
TEST_UNIFORM_Z (hsubr_s16_z_tied1, svint16_t,
		z0 = svhsubr_s16_z (p0, z0, z1),
		z0 = svhsubr_z (p0, z0, z1))

/*
** hsubr_s16_z_tied2:
**	movprfx	z0\.h, p0/z, z0\.h
**	shsub	z0\.h, p0/m, z0\.h, z1\.h
**	ret
*/
TEST_UNIFORM_Z (hsubr_s16_z_tied2, svint16_t,
		z0 = svhsubr_s16_z (p0, z1, z0),
		z0 = svhsubr_z (p0, z1, z0))

/*
** hsubr_s16_z_untied:
** (
**	movprfx	z0\.h, p0/z, z1\.h
**	shsubr	z0\.h, p0/m, z0\.h, z2\.h
** |
**	movprfx	z0\.h, p0/z, z2\.h
**	shsub	z0\.h, p0/m, z0\.h, z1\.h
** )
**	ret
*/
TEST_UNIFORM_Z (hsubr_s16_z_untied, svint16_t,
		z0 = svhsubr_s16_z (p0, z1, z2),
		z0 = svhsubr_z (p0, z1, z2))

/*
** hsubr_w0_s16_z_tied1:
**	mov	(z[0-9]+\.h), w0
**	movprfx	z0\.h, p0/z, z0\.h
**	shsubr	z0\.h, p0/m, z0\.h, \1
**	ret
*/
TEST_UNIFORM_ZX (hsubr_w0_s16_z_tied1, svint16_t, int16_t,
		 z0 = svhsubr_n_s16_z (p0, z0, x0),
		 z0 = svhsubr_z (p0, z0, x0))

/*
** hsubr_w0_s16_z_untied:
**	mov	(z[0-9]+\.h), w0
** (
**	movprfx	z0\.h, p0/z, z1\.h
**	shsubr	z0\.h, p0/m, z0\.h, \1
** |
**	movprfx	z0\.h, p0/z, \1
**	shsub	z0\.h, p0/m, z0\.h, z1\.h
** )
**	ret
*/
TEST_UNIFORM_ZX (hsubr_w0_s16_z_untied, svint16_t, int16_t,
		 z0 = svhsubr_n_s16_z (p0, z1, x0),
		 z0 = svhsubr_z (p0, z1, x0))

/*
** hsubr_11_s16_z_tied1:
**	mov	(z[0-9]+\.h), #11
**	movprfx	z0\.h, p0/z, z0\.h
**	shsubr	z0\.h, p0/m, z0\.h, \1
**	ret
*/
TEST_UNIFORM_Z (hsubr_11_s16_z_tied1, svint16_t,
		z0 = svhsubr_n_s16_z (p0, z0, 11),
		z0 = svhsubr_z (p0, z0, 11))

/*
** hsubr_11_s16_z_untied:
**	mov	(z[0-9]+\.h), #11
** (
**	movprfx	z0\.h, p0/z, z1\.h
**	shsubr	z0\.h, p0/m, z0\.h, \1
** |
**	movprfx	z0\.h, p0/z, \1
**	shsub	z0\.h, p0/m, z0\.h, z1\.h
** )
**	ret
*/
TEST_UNIFORM_Z (hsubr_11_s16_z_untied, svint16_t,
		z0 = svhsubr_n_s16_z (p0, z1, 11),
		z0 = svhsubr_z (p0, z1, 11))

/*
** hsubr_s16_x_tied1:
**	shsubr	z0\.h, p0/m, z0\.h, z1\.h
**	ret
*/
TEST_UNIFORM_Z (hsubr_s16_x_tied1, svint16_t,
		z0 = svhsubr_s16_x (p0, z0, z1),
		z0 = svhsubr_x (p0, z0, z1))

/*
** hsubr_s16_x_tied2:
**	shsub	z0\.h, p0/m, z0\.h, z1\.h
**	ret
*/
TEST_UNIFORM_Z (hsubr_s16_x_tied2, svint16_t,
		z0 = svhsubr_s16_x (p0, z1, z0),
		z0 = svhsubr_x (p0, z1, z0))

/*
** hsubr_s16_x_untied:
** (
**	movprfx	z0, z1
**	shsubr	z0\.h, p0/m, z0\.h, z2\.h
** |
**	movprfx	z0, z2
**	shsub	z0\.h, p0/m, z0\.h, z1\.h
** )
**	ret
*/
TEST_UNIFORM_Z (hsubr_s16_x_untied, svint16_t,
		z0 = svhsubr_s16_x (p0, z1, z2),
		z0 = svhsubr_x (p0, z1, z2))

/*
** hsubr_w0_s16_x_tied1:
**	mov	(z[0-9]+\.h), w0
**	shsubr	z0\.h, p0/m, z0\.h, \1
**	ret
*/
TEST_UNIFORM_ZX (hsubr_w0_s16_x_tied1, svint16_t, int16_t,
		 z0 = svhsubr_n_s16_x (p0, z0, x0),
		 z0 = svhsubr_x (p0, z0, x0))

/*
** hsubr_w0_s16_x_untied:
**	mov	z0\.h, w0
**	shsub	z0\.h, p0/m, z0\.h, z1\.h
**	ret
*/
TEST_UNIFORM_ZX (hsubr_w0_s16_x_untied, svint16_t, int16_t,
		 z0 = svhsubr_n_s16_x (p0, z1, x0),
		 z0 = svhsubr_x (p0, z1, x0))

/*
** hsubr_11_s16_x_tied1:
**	mov	(z[0-9]+\.h), #11
**	shsubr	z0\.h, p0/m, z0\.h, \1
**	ret
*/
TEST_UNIFORM_Z (hsubr_11_s16_x_tied1, svint16_t,
		z0 = svhsubr_n_s16_x (p0, z0, 11),
		z0 = svhsubr_x (p0, z0, 11))

/*
** hsubr_11_s16_x_untied:
**	mov	z0\.h, #11
**	shsub	z0\.h, p0/m, z0\.h, z1\.h
**	ret
*/
TEST_UNIFORM_Z (hsubr_11_s16_x_untied, svint16_t,
		z0 = svhsubr_n_s16_x (p0, z1, 11),
		z0 = svhsubr_x (p0, z1, 11))
