/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sve_acle.h"

/*
** hsubr_u16_m_tied1:
**	uhsubr	z0\.h, p0/m, z0\.h, z1\.h
**	ret
*/
TEST_UNIFORM_Z (hsubr_u16_m_tied1, svuint16_t,
		z0 = svhsubr_u16_m (p0, z0, z1),
		z0 = svhsubr_m (p0, z0, z1))

/*
** hsubr_u16_m_tied2:
**	mov	(z[0-9]+)\.d, z0\.d
**	movprfx	z0, z1
**	uhsubr	z0\.h, p0/m, z0\.h, \1\.h
**	ret
*/
TEST_UNIFORM_Z (hsubr_u16_m_tied2, svuint16_t,
		z0 = svhsubr_u16_m (p0, z1, z0),
		z0 = svhsubr_m (p0, z1, z0))

/*
** hsubr_u16_m_untied:
**	movprfx	z0, z1
**	uhsubr	z0\.h, p0/m, z0\.h, z2\.h
**	ret
*/
TEST_UNIFORM_Z (hsubr_u16_m_untied, svuint16_t,
		z0 = svhsubr_u16_m (p0, z1, z2),
		z0 = svhsubr_m (p0, z1, z2))

/*
** hsubr_w0_u16_m_tied1:
**	mov	(z[0-9]+\.h), w0
**	uhsubr	z0\.h, p0/m, z0\.h, \1
**	ret
*/
TEST_UNIFORM_ZX (hsubr_w0_u16_m_tied1, svuint16_t, uint16_t,
		 z0 = svhsubr_n_u16_m (p0, z0, x0),
		 z0 = svhsubr_m (p0, z0, x0))

/*
** hsubr_w0_u16_m_untied:: { xfail *-*-*}
**	mov	(z[0-9]+\.h), w0
**	movprfx	z0, z1
**	uhsubr	z0\.h, p0/m, z0\.h, \1
**	ret
*/
TEST_UNIFORM_ZX (hsubr_w0_u16_m_untied, svuint16_t, uint16_t,
		 z0 = svhsubr_n_u16_m (p0, z1, x0),
		 z0 = svhsubr_m (p0, z1, x0))

/*
** hsubr_11_u16_m_tied1:
**	mov	(z[0-9]+\.h), #11
**	uhsubr	z0\.h, p0/m, z0\.h, \1
**	ret
*/
TEST_UNIFORM_Z (hsubr_11_u16_m_tied1, svuint16_t,
		z0 = svhsubr_n_u16_m (p0, z0, 11),
		z0 = svhsubr_m (p0, z0, 11))

/*
** hsubr_11_u16_m_untied:: { xfail *-*-*}
**	mov	(z[0-9]+\.h), #11
**	movprfx	z0, z1
**	uhsubr	z0\.h, p0/m, z0\.h, \1
**	ret
*/
TEST_UNIFORM_Z (hsubr_11_u16_m_untied, svuint16_t,
		z0 = svhsubr_n_u16_m (p0, z1, 11),
		z0 = svhsubr_m (p0, z1, 11))

/*
** hsubr_u16_z_tied1:
**	movprfx	z0\.h, p0/z, z0\.h
**	uhsubr	z0\.h, p0/m, z0\.h, z1\.h
**	ret
*/
TEST_UNIFORM_Z (hsubr_u16_z_tied1, svuint16_t,
		z0 = svhsubr_u16_z (p0, z0, z1),
		z0 = svhsubr_z (p0, z0, z1))

/*
** hsubr_u16_z_tied2:
**	movprfx	z0\.h, p0/z, z0\.h
**	uhsub	z0\.h, p0/m, z0\.h, z1\.h
**	ret
*/
TEST_UNIFORM_Z (hsubr_u16_z_tied2, svuint16_t,
		z0 = svhsubr_u16_z (p0, z1, z0),
		z0 = svhsubr_z (p0, z1, z0))

/*
** hsubr_u16_z_untied:
** (
**	movprfx	z0\.h, p0/z, z1\.h
**	uhsubr	z0\.h, p0/m, z0\.h, z2\.h
** |
**	movprfx	z0\.h, p0/z, z2\.h
**	uhsub	z0\.h, p0/m, z0\.h, z1\.h
** )
**	ret
*/
TEST_UNIFORM_Z (hsubr_u16_z_untied, svuint16_t,
		z0 = svhsubr_u16_z (p0, z1, z2),
		z0 = svhsubr_z (p0, z1, z2))

/*
** hsubr_w0_u16_z_tied1:
**	mov	(z[0-9]+\.h), w0
**	movprfx	z0\.h, p0/z, z0\.h
**	uhsubr	z0\.h, p0/m, z0\.h, \1
**	ret
*/
TEST_UNIFORM_ZX (hsubr_w0_u16_z_tied1, svuint16_t, uint16_t,
		 z0 = svhsubr_n_u16_z (p0, z0, x0),
		 z0 = svhsubr_z (p0, z0, x0))

/*
** hsubr_w0_u16_z_untied:
**	mov	(z[0-9]+\.h), w0
** (
**	movprfx	z0\.h, p0/z, z1\.h
**	uhsubr	z0\.h, p0/m, z0\.h, \1
** |
**	movprfx	z0\.h, p0/z, \1
**	uhsub	z0\.h, p0/m, z0\.h, z1\.h
** )
**	ret
*/
TEST_UNIFORM_ZX (hsubr_w0_u16_z_untied, svuint16_t, uint16_t,
		 z0 = svhsubr_n_u16_z (p0, z1, x0),
		 z0 = svhsubr_z (p0, z1, x0))

/*
** hsubr_11_u16_z_tied1:
**	mov	(z[0-9]+\.h), #11
**	movprfx	z0\.h, p0/z, z0\.h
**	uhsubr	z0\.h, p0/m, z0\.h, \1
**	ret
*/
TEST_UNIFORM_Z (hsubr_11_u16_z_tied1, svuint16_t,
		z0 = svhsubr_n_u16_z (p0, z0, 11),
		z0 = svhsubr_z (p0, z0, 11))

/*
** hsubr_11_u16_z_untied:
**	mov	(z[0-9]+\.h), #11
** (
**	movprfx	z0\.h, p0/z, z1\.h
**	uhsubr	z0\.h, p0/m, z0\.h, \1
** |
**	movprfx	z0\.h, p0/z, \1
**	uhsub	z0\.h, p0/m, z0\.h, z1\.h
** )
**	ret
*/
TEST_UNIFORM_Z (hsubr_11_u16_z_untied, svuint16_t,
		z0 = svhsubr_n_u16_z (p0, z1, 11),
		z0 = svhsubr_z (p0, z1, 11))

/*
** hsubr_u16_x_tied1:
**	uhsubr	z0\.h, p0/m, z0\.h, z1\.h
**	ret
*/
TEST_UNIFORM_Z (hsubr_u16_x_tied1, svuint16_t,
		z0 = svhsubr_u16_x (p0, z0, z1),
		z0 = svhsubr_x (p0, z0, z1))

/*
** hsubr_u16_x_tied2:
**	uhsub	z0\.h, p0/m, z0\.h, z1\.h
**	ret
*/
TEST_UNIFORM_Z (hsubr_u16_x_tied2, svuint16_t,
		z0 = svhsubr_u16_x (p0, z1, z0),
		z0 = svhsubr_x (p0, z1, z0))

/*
** hsubr_u16_x_untied:
** (
**	movprfx	z0, z1
**	uhsubr	z0\.h, p0/m, z0\.h, z2\.h
** |
**	movprfx	z0, z2
**	uhsub	z0\.h, p0/m, z0\.h, z1\.h
** )
**	ret
*/
TEST_UNIFORM_Z (hsubr_u16_x_untied, svuint16_t,
		z0 = svhsubr_u16_x (p0, z1, z2),
		z0 = svhsubr_x (p0, z1, z2))

/*
** hsubr_w0_u16_x_tied1:
**	mov	(z[0-9]+\.h), w0
**	uhsubr	z0\.h, p0/m, z0\.h, \1
**	ret
*/
TEST_UNIFORM_ZX (hsubr_w0_u16_x_tied1, svuint16_t, uint16_t,
		 z0 = svhsubr_n_u16_x (p0, z0, x0),
		 z0 = svhsubr_x (p0, z0, x0))

/*
** hsubr_w0_u16_x_untied:
**	mov	z0\.h, w0
**	uhsub	z0\.h, p0/m, z0\.h, z1\.h
**	ret
*/
TEST_UNIFORM_ZX (hsubr_w0_u16_x_untied, svuint16_t, uint16_t,
		 z0 = svhsubr_n_u16_x (p0, z1, x0),
		 z0 = svhsubr_x (p0, z1, x0))

/*
** hsubr_11_u16_x_tied1:
**	mov	(z[0-9]+\.h), #11
**	uhsubr	z0\.h, p0/m, z0\.h, \1
**	ret
*/
TEST_UNIFORM_Z (hsubr_11_u16_x_tied1, svuint16_t,
		z0 = svhsubr_n_u16_x (p0, z0, 11),
		z0 = svhsubr_x (p0, z0, 11))

/*
** hsubr_11_u16_x_untied:
**	mov	z0\.h, #11
**	uhsub	z0\.h, p0/m, z0\.h, z1\.h
**	ret
*/
TEST_UNIFORM_Z (hsubr_11_u16_x_untied, svuint16_t,
		z0 = svhsubr_n_u16_x (p0, z1, 11),
		z0 = svhsubr_x (p0, z1, 11))
