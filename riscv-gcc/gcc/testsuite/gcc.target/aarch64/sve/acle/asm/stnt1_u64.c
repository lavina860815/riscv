/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" { target { ! ilp32 } } } } */

#include "test_sve_acle.h"

/*
** stnt1_u64_base:
**	stnt1d	z0\.d, p0, \[x0\]
**	ret
*/
TEST_STORE (stnt1_u64_base, svuint64_t, uint64_t,
	    svstnt1_u64 (p0, x0, z0),
	    svstnt1 (p0, x0, z0))

/*
** stnt1_u64_index:
**	stnt1d	z0\.d, p0, \[x0, x1, lsl 3\]
**	ret
*/
TEST_STORE (stnt1_u64_index, svuint64_t, uint64_t,
	    svstnt1_u64 (p0, x0 + x1, z0),
	    svstnt1 (p0, x0 + x1, z0))

/*
** stnt1_u64_1:
**	stnt1d	z0\.d, p0, \[x0, #1, mul vl\]
**	ret
*/
TEST_STORE (stnt1_u64_1, svuint64_t, uint64_t,
	    svstnt1_u64 (p0, x0 + svcntd (), z0),
	    svstnt1 (p0, x0 + svcntd (), z0))

/*
** stnt1_u64_7:
**	stnt1d	z0\.d, p0, \[x0, #7, mul vl\]
**	ret
*/
TEST_STORE (stnt1_u64_7, svuint64_t, uint64_t,
	    svstnt1_u64 (p0, x0 + svcntd () * 7, z0),
	    svstnt1 (p0, x0 + svcntd () * 7, z0))

/* Moving the constant into a register would also be OK.  */
/*
** stnt1_u64_8:
**	incb	x0, all, mul #8
**	stnt1d	z0\.d, p0, \[x0\]
**	ret
*/
TEST_STORE (stnt1_u64_8, svuint64_t, uint64_t,
	    svstnt1_u64 (p0, x0 + svcntd () * 8, z0),
	    svstnt1 (p0, x0 + svcntd () * 8, z0))

/*
** stnt1_u64_m1:
**	stnt1d	z0\.d, p0, \[x0, #-1, mul vl\]
**	ret
*/
TEST_STORE (stnt1_u64_m1, svuint64_t, uint64_t,
	    svstnt1_u64 (p0, x0 - svcntd (), z0),
	    svstnt1 (p0, x0 - svcntd (), z0))

/*
** stnt1_u64_m8:
**	stnt1d	z0\.d, p0, \[x0, #-8, mul vl\]
**	ret
*/
TEST_STORE (stnt1_u64_m8, svuint64_t, uint64_t,
	    svstnt1_u64 (p0, x0 - svcntd () * 8, z0),
	    svstnt1 (p0, x0 - svcntd () * 8, z0))

/* Moving the constant into a register would also be OK.  */
/*
** stnt1_u64_m9:
**	decb	x0, all, mul #9
**	stnt1d	z0\.d, p0, \[x0\]
**	ret
*/
TEST_STORE (stnt1_u64_m9, svuint64_t, uint64_t,
	    svstnt1_u64 (p0, x0 - svcntd () * 9, z0),
	    svstnt1 (p0, x0 - svcntd () * 9, z0))

/*
** stnt1_vnum_u64_0:
**	stnt1d	z0\.d, p0, \[x0\]
**	ret
*/
TEST_STORE (stnt1_vnum_u64_0, svuint64_t, uint64_t,
	    svstnt1_vnum_u64 (p0, x0, 0, z0),
	    svstnt1_vnum (p0, x0, 0, z0))

/*
** stnt1_vnum_u64_1:
**	stnt1d	z0\.d, p0, \[x0, #1, mul vl\]
**	ret
*/
TEST_STORE (stnt1_vnum_u64_1, svuint64_t, uint64_t,
	    svstnt1_vnum_u64 (p0, x0, 1, z0),
	    svstnt1_vnum (p0, x0, 1, z0))

/*
** stnt1_vnum_u64_7:
**	stnt1d	z0\.d, p0, \[x0, #7, mul vl\]
**	ret
*/
TEST_STORE (stnt1_vnum_u64_7, svuint64_t, uint64_t,
	    svstnt1_vnum_u64 (p0, x0, 7, z0),
	    svstnt1_vnum (p0, x0, 7, z0))

/* Moving the constant into a register would also be OK.  */
/*
** stnt1_vnum_u64_8:
**	incb	x0, all, mul #8
**	stnt1d	z0\.d, p0, \[x0\]
**	ret
*/
TEST_STORE (stnt1_vnum_u64_8, svuint64_t, uint64_t,
	    svstnt1_vnum_u64 (p0, x0, 8, z0),
	    svstnt1_vnum (p0, x0, 8, z0))

/*
** stnt1_vnum_u64_m1:
**	stnt1d	z0\.d, p0, \[x0, #-1, mul vl\]
**	ret
*/
TEST_STORE (stnt1_vnum_u64_m1, svuint64_t, uint64_t,
	    svstnt1_vnum_u64 (p0, x0, -1, z0),
	    svstnt1_vnum (p0, x0, -1, z0))

/*
** stnt1_vnum_u64_m8:
**	stnt1d	z0\.d, p0, \[x0, #-8, mul vl\]
**	ret
*/
TEST_STORE (stnt1_vnum_u64_m8, svuint64_t, uint64_t,
	    svstnt1_vnum_u64 (p0, x0, -8, z0),
	    svstnt1_vnum (p0, x0, -8, z0))

/* Moving the constant into a register would also be OK.  */
/*
** stnt1_vnum_u64_m9:
**	decb	x0, all, mul #9
**	stnt1d	z0\.d, p0, \[x0\]
**	ret
*/
TEST_STORE (stnt1_vnum_u64_m9, svuint64_t, uint64_t,
	    svstnt1_vnum_u64 (p0, x0, -9, z0),
	    svstnt1_vnum (p0, x0, -9, z0))

/* Using MUL to calculate an index would also be OK.  */
/*
** stnt1_vnum_u64_x1:
**	cntb	(x[0-9]+)
**	madd	(x[0-9]+), (x1, \1|\1, x1), x0
**	stnt1d	z0\.d, p0, \[\2\]
**	ret
*/
TEST_STORE (stnt1_vnum_u64_x1, svuint64_t, uint64_t,
	    svstnt1_vnum_u64 (p0, x0, x1, z0),
	    svstnt1_vnum (p0, x0, x1, z0))
