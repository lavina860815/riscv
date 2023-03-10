/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sve_acle.h"

/*
** raddhnb_s16_tied1:
**	raddhnb	z0\.b, (z0\.h, z1\.h|z1\.h, z0\.h)
**	ret
*/
TEST_TYPE_CHANGE_Z (raddhnb_s16_tied1, svint8_t, svint16_t,
		    z0_res = svraddhnb_s16 (z0, z1),
		    z0_res = svraddhnb (z0, z1))

/*
** raddhnb_s16_tied2:
**	raddhnb	z0\.b, (z0\.h, z1\.h|z1\.h, z0\.h)
**	ret
*/
TEST_TYPE_CHANGE_Z (raddhnb_s16_tied2, svint8_t, svint16_t,
		    z0_res = svraddhnb_s16 (z1, z0),
		    z0_res = svraddhnb (z1, z0))

/*
** raddhnb_s16_untied:
**	raddhnb	z0\.b, (z1\.h, z2\.h|z2\.h, z1\.h)
**	ret
*/
TEST_TYPE_CHANGE_Z (raddhnb_s16_untied, svint8_t, svint16_t,
		    z0_res = svraddhnb_s16 (z1, z2),
		    z0_res = svraddhnb (z1, z2))

/*
** raddhnb_w0_s16_tied1:
**	mov	(z[0-9]+\.h), w0
**	raddhnb	z0\.b, (z0\.h, \1|\1, z0\.h)
**	ret
*/
TEST_TYPE_CHANGE_ZX (raddhnb_w0_s16_tied1, svint8_t, svint16_t, int16_t,
		     z0_res = svraddhnb_n_s16 (z0, x0),
		     z0_res = svraddhnb (z0, x0))

/*
** raddhnb_w0_s16_untied:
**	mov	(z[0-9]+\.h), w0
**	raddhnb	z0\.b, (z1\.h, \1|\1, z1\.h)
**	ret
*/
TEST_TYPE_CHANGE_ZX (raddhnb_w0_s16_untied, svint8_t, svint16_t, int16_t,
		     z0_res = svraddhnb_n_s16 (z1, x0),
		     z0_res = svraddhnb (z1, x0))

/*
** raddhnb_11_s16_tied1:
**	mov	(z[0-9]+\.h), #11
**	raddhnb	z0\.b, (z0\.h, \1|\1, z0\.h)
**	ret
*/
TEST_TYPE_CHANGE_Z (raddhnb_11_s16_tied1, svint8_t, svint16_t,
		    z0_res = svraddhnb_n_s16 (z0, 11),
		    z0_res = svraddhnb (z0, 11))

/*
** raddhnb_11_s16_untied:
**	mov	(z[0-9]+\.h), #11
**	raddhnb	z0\.b, (z1\.h, \1|\1, z1\.h)
**	ret
*/
TEST_TYPE_CHANGE_Z (raddhnb_11_s16_untied, svint8_t, svint16_t,
		    z0_res = svraddhnb_n_s16 (z1, 11),
		    z0_res = svraddhnb (z1, 11))
