/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sve_acle.h"

/*
** raddhnb_u64_tied1:
**	raddhnb	z0\.s, (z0\.d, z1\.d|z1\.d, z0\.d)
**	ret
*/
TEST_TYPE_CHANGE_Z (raddhnb_u64_tied1, svuint32_t, svuint64_t,
		    z0_res = svraddhnb_u64 (z0, z1),
		    z0_res = svraddhnb (z0, z1))

/*
** raddhnb_u64_tied2:
**	raddhnb	z0\.s, (z0\.d, z1\.d|z1\.d, z0\.d)
**	ret
*/
TEST_TYPE_CHANGE_Z (raddhnb_u64_tied2, svuint32_t, svuint64_t,
		    z0_res = svraddhnb_u64 (z1, z0),
		    z0_res = svraddhnb (z1, z0))

/*
** raddhnb_u64_untied:
**	raddhnb	z0\.s, (z1\.d, z2\.d|z2\.d, z1\.d)
**	ret
*/
TEST_TYPE_CHANGE_Z (raddhnb_u64_untied, svuint32_t, svuint64_t,
		    z0_res = svraddhnb_u64 (z1, z2),
		    z0_res = svraddhnb (z1, z2))

/*
** raddhnb_x0_u64_tied1:
**	mov	(z[0-9]+\.d), x0
**	raddhnb	z0\.s, (z0\.d, \1|\1, z0\.d)
**	ret
*/
TEST_TYPE_CHANGE_ZX (raddhnb_x0_u64_tied1, svuint32_t, svuint64_t, uint64_t,
		     z0_res = svraddhnb_n_u64 (z0, x0),
		     z0_res = svraddhnb (z0, x0))

/*
** raddhnb_x0_u64_untied:
**	mov	(z[0-9]+\.d), x0
**	raddhnb	z0\.s, (z1\.d, \1|\1, z1\.d)
**	ret
*/
TEST_TYPE_CHANGE_ZX (raddhnb_x0_u64_untied, svuint32_t, svuint64_t, uint64_t,
		     z0_res = svraddhnb_n_u64 (z1, x0),
		     z0_res = svraddhnb (z1, x0))

/*
** raddhnb_11_u64_tied1:
**	mov	(z[0-9]+\.d), #11
**	raddhnb	z0\.s, (z0\.d, \1|\1, z0\.d)
**	ret
*/
TEST_TYPE_CHANGE_Z (raddhnb_11_u64_tied1, svuint32_t, svuint64_t,
		    z0_res = svraddhnb_n_u64 (z0, 11),
		    z0_res = svraddhnb (z0, 11))

/*
** raddhnb_11_u64_untied:
**	mov	(z[0-9]+\.d), #11
**	raddhnb	z0\.s, (z1\.d, \1|\1, z1\.d)
**	ret
*/
TEST_TYPE_CHANGE_Z (raddhnb_11_u64_untied, svuint32_t, svuint64_t,
		    z0_res = svraddhnb_n_u64 (z1, 11),
		    z0_res = svraddhnb (z1, 11))
