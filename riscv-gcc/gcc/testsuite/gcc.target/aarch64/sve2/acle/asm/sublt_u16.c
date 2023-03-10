/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sve_acle.h"

/*
** sublt_u16_tied1:
**	usublt	z0\.h, z0\.b, z1\.b
**	ret
*/
TEST_TYPE_CHANGE_Z (sublt_u16_tied1, svuint16_t, svuint8_t,
		    z0_res = svsublt_u16 (z0, z1),
		    z0_res = svsublt (z0, z1))

/*
** sublt_u16_tied2:
**	usublt	z0\.h, z1\.b, z0\.b
**	ret
*/
TEST_TYPE_CHANGE_Z (sublt_u16_tied2, svuint16_t, svuint8_t,
		    z0_res = svsublt_u16 (z1, z0),
		    z0_res = svsublt (z1, z0))

/*
** sublt_u16_untied:
**	usublt	z0\.h, z1\.b, z2\.b
**	ret
*/
TEST_TYPE_CHANGE_Z (sublt_u16_untied, svuint16_t, svuint8_t,
		    z0_res = svsublt_u16 (z1, z2),
		    z0_res = svsublt (z1, z2))

/*
** sublt_w0_u16_tied1:
**	mov	(z[0-9]+\.b), w0
**	usublt	z0\.h, z0\.b, \1
**	ret
*/
TEST_TYPE_CHANGE_ZX (sublt_w0_u16_tied1, svuint16_t, svuint8_t, uint8_t,
		     z0_res = svsublt_n_u16 (z0, x0),
		     z0_res = svsublt (z0, x0))

/*
** sublt_w0_u16_untied:
**	mov	(z[0-9]+\.b), w0
**	usublt	z0\.h, z1\.b, \1
**	ret
*/
TEST_TYPE_CHANGE_ZX (sublt_w0_u16_untied, svuint16_t, svuint8_t, uint8_t,
		     z0_res = svsublt_n_u16 (z1, x0),
		     z0_res = svsublt (z1, x0))

/*
** sublt_11_u16_tied1:
**	mov	(z[0-9]+\.b), #11
**	usublt	z0\.h, z0\.b, \1
**	ret
*/
TEST_TYPE_CHANGE_Z (sublt_11_u16_tied1, svuint16_t, svuint8_t,
		    z0_res = svsublt_n_u16 (z0, 11),
		    z0_res = svsublt (z0, 11))

/*
** sublt_11_u16_untied:
**	mov	(z[0-9]+\.b), #11
**	usublt	z0\.h, z1\.b, \1
**	ret
*/
TEST_TYPE_CHANGE_Z (sublt_11_u16_untied, svuint16_t, svuint8_t,
		    z0_res = svsublt_n_u16 (z1, 11),
		    z0_res = svsublt (z1, 11))
