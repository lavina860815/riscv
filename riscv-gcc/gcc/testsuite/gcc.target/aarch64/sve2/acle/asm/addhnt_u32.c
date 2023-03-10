/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sve_acle.h"

/*
** addhnt_u32_tied1:
**	addhnt	z0\.h, (z4\.s, z5\.s|z5\.s, z4\.s)
**	ret
*/
TEST_DUAL_Z (addhnt_u32_tied1, svuint16_t, svuint32_t,
	     z0 = svaddhnt_u32 (z0, z4, z5),
	     z0 = svaddhnt (z0, z4, z5))

/* Bad RA choice: no preferred output sequence.  */
TEST_DUAL_Z_REV (addhnt_u32_tied2, svuint16_t, svuint32_t,
		 z0_res = svaddhnt_u32 (z4, z0, z1),
		 z0_res = svaddhnt (z4, z0, z1))

/* Bad RA choice: no preferred output sequence.  */
TEST_DUAL_Z_REV (addhnt_u32_tied3, svuint16_t, svuint32_t,
		 z0_res = svaddhnt_u32 (z4, z1, z0),
		 z0_res = svaddhnt (z4, z1, z0))

/*
** addhnt_u32_untied:
** (
**	mov	z0\.d, z1\.d
**	addhnt	z0\.h, (z4\.s, z5\.s|z5\.s, z4\.s)
** |
**	addhnt	z1\.h, (z4\.s, z5\.s|z5\.s, z4\.s)
**	mov	z0\.d, z1\.d
** )
**	ret
*/
TEST_DUAL_Z (addhnt_u32_untied, svuint16_t, svuint32_t,
	     z0 = svaddhnt_u32 (z1, z4, z5),
	     z0 = svaddhnt (z1, z4, z5))

/*
** addhnt_w0_u32_tied1:
**	mov	(z[0-9]+\.s), w0
**	addhnt	z0\.h, (z4\.s, \1|\1, z4\.s)
**	ret
*/
TEST_DUAL_ZX (addhnt_w0_u32_tied1, svuint16_t, svuint32_t, uint32_t,
	      z0 = svaddhnt_n_u32 (z0, z4, x0),
	      z0 = svaddhnt (z0, z4, x0))

/*
** addhnt_w0_u32_untied:
**	mov	(z[0-9]+\.s), w0
** (
**	mov	z0\.d, z1\.d
**	addhnt	z0\.h, (z4\.s, \1|\1, z4\.s)
** |
**	addhnt	z1\.h, (z4\.s, \1|\1, z4\.s)
**	mov	z0\.d, z1\.d
** )
**	ret
*/
TEST_DUAL_ZX (addhnt_w0_u32_untied, svuint16_t, svuint32_t, uint32_t,
	      z0 = svaddhnt_n_u32 (z1, z4, x0),
	      z0 = svaddhnt (z1, z4, x0))

/*
** addhnt_11_u32_tied1:
**	mov	(z[0-9]+\.s), #11
**	addhnt	z0\.h, (z4\.s, \1|\1, z4\.s)
**	ret
*/
TEST_DUAL_Z (addhnt_11_u32_tied1, svuint16_t, svuint32_t,
	     z0 = svaddhnt_n_u32 (z0, z4, 11),
	     z0 = svaddhnt (z0, z4, 11))

/*
** addhnt_11_u32_untied:
**	mov	(z[0-9]+\.s), #11
** (
**	mov	z0\.d, z1\.d
**	addhnt	z0\.h, (z4\.s, \1|\1, z4\.s)
** |
**	addhnt	z1\.h, (z4\.s, \1|\1, z4\.s)
**	mov	z0\.d, z1\.d
** )
**	ret
*/
TEST_DUAL_Z (addhnt_11_u32_untied, svuint16_t, svuint32_t,
	     z0 = svaddhnt_n_u32 (z1, z4, 11),
	     z0 = svaddhnt (z1, z4, 11))
