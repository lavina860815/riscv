/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sve_acle.h"

/*
** addlb_s64_tied1:
**	saddlb	z0\.d, z0\.s, z1\.s
**	ret
*/
TEST_TYPE_CHANGE_Z (addlb_s64_tied1, svint64_t, svint32_t,
		    z0_res = svaddlb_s64 (z0, z1),
		    z0_res = svaddlb (z0, z1))

/*
** addlb_s64_tied2:
**	saddlb	z0\.d, z1\.s, z0\.s
**	ret
*/
TEST_TYPE_CHANGE_Z (addlb_s64_tied2, svint64_t, svint32_t,
		    z0_res = svaddlb_s64 (z1, z0),
		    z0_res = svaddlb (z1, z0))

/*
** addlb_s64_untied:
**	saddlb	z0\.d, z1\.s, z2\.s
**	ret
*/
TEST_TYPE_CHANGE_Z (addlb_s64_untied, svint64_t, svint32_t,
		    z0_res = svaddlb_s64 (z1, z2),
		    z0_res = svaddlb (z1, z2))

/*
** addlb_w0_s64_tied1:
**	mov	(z[0-9]+\.s), w0
**	saddlb	z0\.d, z0\.s, \1
**	ret
*/
TEST_TYPE_CHANGE_ZX (addlb_w0_s64_tied1, svint64_t, svint32_t, int32_t,
		     z0_res = svaddlb_n_s64 (z0, x0),
		     z0_res = svaddlb (z0, x0))

/*
** addlb_w0_s64_untied:
**	mov	(z[0-9]+\.s), w0
**	saddlb	z0\.d, z1\.s, \1
**	ret
*/
TEST_TYPE_CHANGE_ZX (addlb_w0_s64_untied, svint64_t, svint32_t, int32_t,
		     z0_res = svaddlb_n_s64 (z1, x0),
		     z0_res = svaddlb (z1, x0))

/*
** addlb_11_s64_tied1:
**	mov	(z[0-9]+\.s), #11
**	saddlb	z0\.d, z0\.s, \1
**	ret
*/
TEST_TYPE_CHANGE_Z (addlb_11_s64_tied1, svint64_t, svint32_t,
		    z0_res = svaddlb_n_s64 (z0, 11),
		    z0_res = svaddlb (z0, 11))

/*
** addlb_11_s64_untied:
**	mov	(z[0-9]+\.s), #11
**	saddlb	z0\.d, z1\.s, \1
**	ret
*/
TEST_TYPE_CHANGE_Z (addlb_11_s64_untied, svint64_t, svint32_t,
		    z0_res = svaddlb_n_s64 (z1, 11),
		    z0_res = svaddlb (z1, 11))
