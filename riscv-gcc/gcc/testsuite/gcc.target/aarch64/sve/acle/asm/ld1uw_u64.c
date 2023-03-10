/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" { target { ! ilp32 } } } } */

#include "test_sve_acle.h"

/*
** ld1uw_u64_base:
**	ld1w	z0\.d, p0/z, \[x0\]
**	ret
*/
TEST_LOAD (ld1uw_u64_base, svuint64_t, uint32_t,
	   z0 = svld1uw_u64 (p0, x0),
	   z0 = svld1uw_u64 (p0, x0))

/*
** ld1uw_u64_index:
**	ld1w	z0\.d, p0/z, \[x0, x1, lsl 2\]
**	ret
*/
TEST_LOAD (ld1uw_u64_index, svuint64_t, uint32_t,
	   z0 = svld1uw_u64 (p0, x0 + x1),
	   z0 = svld1uw_u64 (p0, x0 + x1))

/*
** ld1uw_u64_1:
**	ld1w	z0\.d, p0/z, \[x0, #1, mul vl\]
**	ret
*/
TEST_LOAD (ld1uw_u64_1, svuint64_t, uint32_t,
	   z0 = svld1uw_u64 (p0, x0 + svcntd ()),
	   z0 = svld1uw_u64 (p0, x0 + svcntd ()))

/*
** ld1uw_u64_7:
**	ld1w	z0\.d, p0/z, \[x0, #7, mul vl\]
**	ret
*/
TEST_LOAD (ld1uw_u64_7, svuint64_t, uint32_t,
	   z0 = svld1uw_u64 (p0, x0 + svcntd () * 7),
	   z0 = svld1uw_u64 (p0, x0 + svcntd () * 7))

/* Moving the constant into a register would also be OK.  */
/*
** ld1uw_u64_8:
**	incb	x0, all, mul #4
**	ld1w	z0\.d, p0/z, \[x0\]
**	ret
*/
TEST_LOAD (ld1uw_u64_8, svuint64_t, uint32_t,
	   z0 = svld1uw_u64 (p0, x0 + svcntd () * 8),
	   z0 = svld1uw_u64 (p0, x0 + svcntd () * 8))

/*
** ld1uw_u64_m1:
**	ld1w	z0\.d, p0/z, \[x0, #-1, mul vl\]
**	ret
*/
TEST_LOAD (ld1uw_u64_m1, svuint64_t, uint32_t,
	   z0 = svld1uw_u64 (p0, x0 - svcntd ()),
	   z0 = svld1uw_u64 (p0, x0 - svcntd ()))

/*
** ld1uw_u64_m8:
**	ld1w	z0\.d, p0/z, \[x0, #-8, mul vl\]
**	ret
*/
TEST_LOAD (ld1uw_u64_m8, svuint64_t, uint32_t,
	   z0 = svld1uw_u64 (p0, x0 - svcntd () * 8),
	   z0 = svld1uw_u64 (p0, x0 - svcntd () * 8))

/* Moving the constant into a register would also be OK.  */
/*
** ld1uw_u64_m9:
**	dech	x0, all, mul #9
**	ld1w	z0\.d, p0/z, \[x0\]
**	ret
*/
TEST_LOAD (ld1uw_u64_m9, svuint64_t, uint32_t,
	   z0 = svld1uw_u64 (p0, x0 - svcntd () * 9),
	   z0 = svld1uw_u64 (p0, x0 - svcntd () * 9))

/*
** ld1uw_vnum_u64_0:
**	ld1w	z0\.d, p0/z, \[x0\]
**	ret
*/
TEST_LOAD (ld1uw_vnum_u64_0, svuint64_t, uint32_t,
	   z0 = svld1uw_vnum_u64 (p0, x0, 0),
	   z0 = svld1uw_vnum_u64 (p0, x0, 0))

/*
** ld1uw_vnum_u64_1:
**	ld1w	z0\.d, p0/z, \[x0, #1, mul vl\]
**	ret
*/
TEST_LOAD (ld1uw_vnum_u64_1, svuint64_t, uint32_t,
	   z0 = svld1uw_vnum_u64 (p0, x0, 1),
	   z0 = svld1uw_vnum_u64 (p0, x0, 1))

/*
** ld1uw_vnum_u64_7:
**	ld1w	z0\.d, p0/z, \[x0, #7, mul vl\]
**	ret
*/
TEST_LOAD (ld1uw_vnum_u64_7, svuint64_t, uint32_t,
	   z0 = svld1uw_vnum_u64 (p0, x0, 7),
	   z0 = svld1uw_vnum_u64 (p0, x0, 7))

/* Moving the constant into a register would also be OK.  */
/*
** ld1uw_vnum_u64_8:
**	incb	x0, all, mul #4
**	ld1w	z0\.d, p0/z, \[x0\]
**	ret
*/
TEST_LOAD (ld1uw_vnum_u64_8, svuint64_t, uint32_t,
	   z0 = svld1uw_vnum_u64 (p0, x0, 8),
	   z0 = svld1uw_vnum_u64 (p0, x0, 8))

/*
** ld1uw_vnum_u64_m1:
**	ld1w	z0\.d, p0/z, \[x0, #-1, mul vl\]
**	ret
*/
TEST_LOAD (ld1uw_vnum_u64_m1, svuint64_t, uint32_t,
	   z0 = svld1uw_vnum_u64 (p0, x0, -1),
	   z0 = svld1uw_vnum_u64 (p0, x0, -1))

/*
** ld1uw_vnum_u64_m8:
**	ld1w	z0\.d, p0/z, \[x0, #-8, mul vl\]
**	ret
*/
TEST_LOAD (ld1uw_vnum_u64_m8, svuint64_t, uint32_t,
	   z0 = svld1uw_vnum_u64 (p0, x0, -8),
	   z0 = svld1uw_vnum_u64 (p0, x0, -8))

/* Moving the constant into a register would also be OK.  */
/*
** ld1uw_vnum_u64_m9:
**	dech	x0, all, mul #9
**	ld1w	z0\.d, p0/z, \[x0\]
**	ret
*/
TEST_LOAD (ld1uw_vnum_u64_m9, svuint64_t, uint32_t,
	   z0 = svld1uw_vnum_u64 (p0, x0, -9),
	   z0 = svld1uw_vnum_u64 (p0, x0, -9))

/* Using MUL to calculate an index would also be OK.  */
/*
** ld1uw_vnum_u64_x1:
**	cnth	(x[0-9]+)
**	madd	(x[0-9]+), (x1, \1|\1, x1), x0
**	ld1w	z0\.d, p0/z, \[\2\]
**	ret
*/
TEST_LOAD (ld1uw_vnum_u64_x1, svuint64_t, uint32_t,
	   z0 = svld1uw_vnum_u64 (p0, x0, x1),
	   z0 = svld1uw_vnum_u64 (p0, x0, x1))
