/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" { target { ! ilp32 } } } } */

#include "test_sve_acle.h"

/*
** ld1_u32_base:
**	ld1w	z0\.s, p0/z, \[x0\]
**	ret
*/
TEST_LOAD (ld1_u32_base, svuint32_t, uint32_t,
	   z0 = svld1_u32 (p0, x0),
	   z0 = svld1 (p0, x0))

/*
** ld1_u32_index:
**	ld1w	z0\.s, p0/z, \[x0, x1, lsl 2\]
**	ret
*/
TEST_LOAD (ld1_u32_index, svuint32_t, uint32_t,
	   z0 = svld1_u32 (p0, x0 + x1),
	   z0 = svld1 (p0, x0 + x1))

/*
** ld1_u32_1:
**	ld1w	z0\.s, p0/z, \[x0, #1, mul vl\]
**	ret
*/
TEST_LOAD (ld1_u32_1, svuint32_t, uint32_t,
	   z0 = svld1_u32 (p0, x0 + svcntw ()),
	   z0 = svld1 (p0, x0 + svcntw ()))

/*
** ld1_u32_7:
**	ld1w	z0\.s, p0/z, \[x0, #7, mul vl\]
**	ret
*/
TEST_LOAD (ld1_u32_7, svuint32_t, uint32_t,
	   z0 = svld1_u32 (p0, x0 + svcntw () * 7),
	   z0 = svld1 (p0, x0 + svcntw () * 7))

/* Moving the constant into a register would also be OK.  */
/*
** ld1_u32_8:
**	incb	x0, all, mul #8
**	ld1w	z0\.s, p0/z, \[x0\]
**	ret
*/
TEST_LOAD (ld1_u32_8, svuint32_t, uint32_t,
	   z0 = svld1_u32 (p0, x0 + svcntw () * 8),
	   z0 = svld1 (p0, x0 + svcntw () * 8))

/*
** ld1_u32_m1:
**	ld1w	z0\.s, p0/z, \[x0, #-1, mul vl\]
**	ret
*/
TEST_LOAD (ld1_u32_m1, svuint32_t, uint32_t,
	   z0 = svld1_u32 (p0, x0 - svcntw ()),
	   z0 = svld1 (p0, x0 - svcntw ()))

/*
** ld1_u32_m8:
**	ld1w	z0\.s, p0/z, \[x0, #-8, mul vl\]
**	ret
*/
TEST_LOAD (ld1_u32_m8, svuint32_t, uint32_t,
	   z0 = svld1_u32 (p0, x0 - svcntw () * 8),
	   z0 = svld1 (p0, x0 - svcntw () * 8))

/* Moving the constant into a register would also be OK.  */
/*
** ld1_u32_m9:
**	decb	x0, all, mul #9
**	ld1w	z0\.s, p0/z, \[x0\]
**	ret
*/
TEST_LOAD (ld1_u32_m9, svuint32_t, uint32_t,
	   z0 = svld1_u32 (p0, x0 - svcntw () * 9),
	   z0 = svld1 (p0, x0 - svcntw () * 9))

/*
** ld1_vnum_u32_0:
**	ld1w	z0\.s, p0/z, \[x0\]
**	ret
*/
TEST_LOAD (ld1_vnum_u32_0, svuint32_t, uint32_t,
	   z0 = svld1_vnum_u32 (p0, x0, 0),
	   z0 = svld1_vnum (p0, x0, 0))

/*
** ld1_vnum_u32_1:
**	ld1w	z0\.s, p0/z, \[x0, #1, mul vl\]
**	ret
*/
TEST_LOAD (ld1_vnum_u32_1, svuint32_t, uint32_t,
	   z0 = svld1_vnum_u32 (p0, x0, 1),
	   z0 = svld1_vnum (p0, x0, 1))

/*
** ld1_vnum_u32_7:
**	ld1w	z0\.s, p0/z, \[x0, #7, mul vl\]
**	ret
*/
TEST_LOAD (ld1_vnum_u32_7, svuint32_t, uint32_t,
	   z0 = svld1_vnum_u32 (p0, x0, 7),
	   z0 = svld1_vnum (p0, x0, 7))

/* Moving the constant into a register would also be OK.  */
/*
** ld1_vnum_u32_8:
**	incb	x0, all, mul #8
**	ld1w	z0\.s, p0/z, \[x0\]
**	ret
*/
TEST_LOAD (ld1_vnum_u32_8, svuint32_t, uint32_t,
	   z0 = svld1_vnum_u32 (p0, x0, 8),
	   z0 = svld1_vnum (p0, x0, 8))

/*
** ld1_vnum_u32_m1:
**	ld1w	z0\.s, p0/z, \[x0, #-1, mul vl\]
**	ret
*/
TEST_LOAD (ld1_vnum_u32_m1, svuint32_t, uint32_t,
	   z0 = svld1_vnum_u32 (p0, x0, -1),
	   z0 = svld1_vnum (p0, x0, -1))

/*
** ld1_vnum_u32_m8:
**	ld1w	z0\.s, p0/z, \[x0, #-8, mul vl\]
**	ret
*/
TEST_LOAD (ld1_vnum_u32_m8, svuint32_t, uint32_t,
	   z0 = svld1_vnum_u32 (p0, x0, -8),
	   z0 = svld1_vnum (p0, x0, -8))

/* Moving the constant into a register would also be OK.  */
/*
** ld1_vnum_u32_m9:
**	decb	x0, all, mul #9
**	ld1w	z0\.s, p0/z, \[x0\]
**	ret
*/
TEST_LOAD (ld1_vnum_u32_m9, svuint32_t, uint32_t,
	   z0 = svld1_vnum_u32 (p0, x0, -9),
	   z0 = svld1_vnum (p0, x0, -9))

/* Using MUL to calculate an index would also be OK.  */
/*
** ld1_vnum_u32_x1:
**	cntb	(x[0-9]+)
**	madd	(x[0-9]+), (x1, \1|\1, x1), x0
**	ld1w	z0\.s, p0/z, \[\2\]
**	ret
*/
TEST_LOAD (ld1_vnum_u32_x1, svuint32_t, uint32_t,
	   z0 = svld1_vnum_u32 (p0, x0, x1),
	   z0 = svld1_vnum (p0, x0, x1))
