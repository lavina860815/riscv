/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sve_acle.h"

/*
** pmullt_u16_tied1:
**	pmullt	z0\.h, z0\.b, z1\.b
**	ret
*/
TEST_TYPE_CHANGE_Z (pmullt_u16_tied1, svuint16_t, svuint8_t,
		    z0_res = svpmullt_u16 (z0, z1),
		    z0_res = svpmullt (z0, z1))

/*
** pmullt_u16_tied2:
**	pmullt	z0\.h, z1\.b, z0\.b
**	ret
*/
TEST_TYPE_CHANGE_Z (pmullt_u16_tied2, svuint16_t, svuint8_t,
		    z0_res = svpmullt_u16 (z1, z0),
		    z0_res = svpmullt (z1, z0))

/*
** pmullt_u16_untied:
**	pmullt	z0\.h, z1\.b, z2\.b
**	ret
*/
TEST_TYPE_CHANGE_Z (pmullt_u16_untied, svuint16_t, svuint8_t,
		    z0_res = svpmullt_u16 (z1, z2),
		    z0_res = svpmullt (z1, z2))

/*
** pmullt_w0_u16_tied1:
**	mov	(z[0-9]+\.b), w0
**	pmullt	z0\.h, z0\.b, \1
**	ret
*/
TEST_TYPE_CHANGE_ZX (pmullt_w0_u16_tied1, svuint16_t, svuint8_t, uint8_t,
		     z0_res = svpmullt_n_u16 (z0, x0),
		     z0_res = svpmullt (z0, x0))

/*
** pmullt_w0_u16_untied:
**	mov	(z[0-9]+\.b), w0
**	pmullt	z0\.h, z1\.b, \1
**	ret
*/
TEST_TYPE_CHANGE_ZX (pmullt_w0_u16_untied, svuint16_t, svuint8_t, uint8_t,
		     z0_res = svpmullt_n_u16 (z1, x0),
		     z0_res = svpmullt (z1, x0))

/*
** pmullt_11_u16_tied1:
**	mov	(z[0-9]+\.b), #11
**	pmullt	z0\.h, z0\.b, \1
**	ret
*/
TEST_TYPE_CHANGE_Z (pmullt_11_u16_tied1, svuint16_t, svuint8_t,
		    z0_res = svpmullt_n_u16 (z0, 11),
		    z0_res = svpmullt (z0, 11))

/*
** pmullt_11_u16_untied:
**	mov	(z[0-9]+\.b), #11
**	pmullt	z0\.h, z1\.b, \1
**	ret
*/
TEST_TYPE_CHANGE_Z (pmullt_11_u16_untied, svuint16_t, svuint8_t,
		    z0_res = svpmullt_n_u16 (z1, 11),
		    z0_res = svpmullt (z1, 11))
