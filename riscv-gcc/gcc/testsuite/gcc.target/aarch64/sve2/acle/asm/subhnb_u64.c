/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sve_acle.h"

/*
** subhnb_u64_tied1:
**	subhnb	z0\.s, z0\.d, z1\.d
**	ret
*/
TEST_TYPE_CHANGE_Z (subhnb_u64_tied1, svuint32_t, svuint64_t,
		    z0_res = svsubhnb_u64 (z0, z1),
		    z0_res = svsubhnb (z0, z1))

/*
** subhnb_u64_tied2:
**	subhnb	z0\.s, z1\.d, z0\.d
**	ret
*/
TEST_TYPE_CHANGE_Z (subhnb_u64_tied2, svuint32_t, svuint64_t,
		    z0_res = svsubhnb_u64 (z1, z0),
		    z0_res = svsubhnb (z1, z0))

/*
** subhnb_u64_untied:
**	subhnb	z0\.s, z1\.d, z2\.d
**	ret
*/
TEST_TYPE_CHANGE_Z (subhnb_u64_untied, svuint32_t, svuint64_t,
		    z0_res = svsubhnb_u64 (z1, z2),
		    z0_res = svsubhnb (z1, z2))

/*
** subhnb_x0_u64_tied1:
**	mov	(z[0-9]+\.d), x0
**	subhnb	z0\.s, z0\.d, \1
**	ret
*/
TEST_TYPE_CHANGE_ZX (subhnb_x0_u64_tied1, svuint32_t, svuint64_t, uint64_t,
		     z0_res = svsubhnb_n_u64 (z0, x0),
		     z0_res = svsubhnb (z0, x0))

/*
** subhnb_x0_u64_untied:
**	mov	(z[0-9]+\.d), x0
**	subhnb	z0\.s, z1\.d, \1
**	ret
*/
TEST_TYPE_CHANGE_ZX (subhnb_x0_u64_untied, svuint32_t, svuint64_t, uint64_t,
		     z0_res = svsubhnb_n_u64 (z1, x0),
		     z0_res = svsubhnb (z1, x0))

/*
** subhnb_11_u64_tied1:
**	mov	(z[0-9]+\.d), #11
**	subhnb	z0\.s, z0\.d, \1
**	ret
*/
TEST_TYPE_CHANGE_Z (subhnb_11_u64_tied1, svuint32_t, svuint64_t,
		    z0_res = svsubhnb_n_u64 (z0, 11),
		    z0_res = svsubhnb (z0, 11))

/*
** subhnb_11_u64_untied:
**	mov	(z[0-9]+\.d), #11
**	subhnb	z0\.s, z1\.d, \1
**	ret
*/
TEST_TYPE_CHANGE_Z (subhnb_11_u64_untied, svuint32_t, svuint64_t,
		    z0_res = svsubhnb_n_u64 (z1, 11),
		    z0_res = svsubhnb (z1, 11))
