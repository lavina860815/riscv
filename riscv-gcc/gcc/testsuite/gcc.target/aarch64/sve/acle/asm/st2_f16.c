/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" { target { ! ilp32 } } } } */

#include "test_sve_acle.h"

/*
** st2_f16_base:
**	st2h	{z0\.h(?: - |, )z1\.h}, p0, \[x0\]
**	ret
*/
TEST_STORE (st2_f16_base, svfloat16x2_t, float16_t,
	    svst2_f16 (p0, x0, z0),
	    svst2 (p0, x0, z0))

/*
** st2_f16_index:
**	st2h	{z0\.h(?: - |, )z1\.h}, p0, \[x0, x1, lsl 1\]
**	ret
*/
TEST_STORE (st2_f16_index, svfloat16x2_t, float16_t,
	    svst2_f16 (p0, x0 + x1, z0),
	    svst2 (p0, x0 + x1, z0))

/* Moving the constant into a register would also be OK.  */
/*
** st2_f16_1:
**	incb	x0
**	st2h	{z0\.h(?: - |, )z1\.h}, p0, \[x0\]
**	ret
*/
TEST_STORE (st2_f16_1, svfloat16x2_t, float16_t,
	    svst2_f16 (p0, x0 + svcnth (), z0),
	    svst2 (p0, x0 + svcnth (), z0))

/*
** st2_f16_2:
**	st2h	{z0\.h(?: - |, )z1\.h}, p0, \[x0, #2, mul vl\]
**	ret
*/
TEST_STORE (st2_f16_2, svfloat16x2_t, float16_t,
	    svst2_f16 (p0, x0 + svcnth () * 2, z0),
	    svst2 (p0, x0 + svcnth () * 2, z0))

/*
** st2_f16_14:
**	st2h	{z0\.h(?: - |, )z1\.h}, p0, \[x0, #14, mul vl\]
**	ret
*/
TEST_STORE (st2_f16_14, svfloat16x2_t, float16_t,
	    svst2_f16 (p0, x0 + svcnth () * 14, z0),
	    svst2 (p0, x0 + svcnth () * 14, z0))

/* Moving the constant into a register would also be OK.  */
/*
** st2_f16_16:
**	incb	x0, all, mul #16
**	st2h	{z0\.h(?: - |, )z1\.h}, p0, \[x0\]
**	ret
*/
TEST_STORE (st2_f16_16, svfloat16x2_t, float16_t,
	    svst2_f16 (p0, x0 + svcnth () * 16, z0),
	    svst2 (p0, x0 + svcnth () * 16, z0))

/* Moving the constant into a register would also be OK.  */
/*
** st2_f16_m1:
**	decb	x0
**	st2h	{z0\.h(?: - |, )z1\.h}, p0, \[x0\]
**	ret
*/
TEST_STORE (st2_f16_m1, svfloat16x2_t, float16_t,
	    svst2_f16 (p0, x0 - svcnth (), z0),
	    svst2 (p0, x0 - svcnth (), z0))

/*
** st2_f16_m2:
**	st2h	{z0\.h(?: - |, )z1\.h}, p0, \[x0, #-2, mul vl\]
**	ret
*/
TEST_STORE (st2_f16_m2, svfloat16x2_t, float16_t,
	    svst2_f16 (p0, x0 - svcnth () * 2, z0),
	    svst2 (p0, x0 - svcnth () * 2, z0))

/*
** st2_f16_m16:
**	st2h	{z0\.h(?: - |, )z1\.h}, p0, \[x0, #-16, mul vl\]
**	ret
*/
TEST_STORE (st2_f16_m16, svfloat16x2_t, float16_t,
	    svst2_f16 (p0, x0 - svcnth () * 16, z0),
	    svst2 (p0, x0 - svcnth () * 16, z0))

/*
** st2_f16_m18:
**	addvl	(x[0-9]+), x0, #-18
**	st2h	{z0\.h(?: - |, )z1\.h}, p0, \[\1\]
**	ret
*/
TEST_STORE (st2_f16_m18, svfloat16x2_t, float16_t,
	    svst2_f16 (p0, x0 - svcnth () * 18, z0),
	    svst2 (p0, x0 - svcnth () * 18, z0))

/*
** st2_vnum_f16_0:
**	st2h	{z0\.h(?: - |, )z1\.h}, p0, \[x0\]
**	ret
*/
TEST_STORE (st2_vnum_f16_0, svfloat16x2_t, float16_t,
	    svst2_vnum_f16 (p0, x0, 0, z0),
	    svst2_vnum (p0, x0, 0, z0))

/* Moving the constant into a register would also be OK.  */
/*
** st2_vnum_f16_1:
**	incb	x0
**	st2h	{z0\.h(?: - |, )z1\.h}, p0, \[x0\]
**	ret
*/
TEST_STORE (st2_vnum_f16_1, svfloat16x2_t, float16_t,
	    svst2_vnum_f16 (p0, x0, 1, z0),
	    svst2_vnum (p0, x0, 1, z0))

/*
** st2_vnum_f16_2:
**	st2h	{z0\.h(?: - |, )z1\.h}, p0, \[x0, #2, mul vl\]
**	ret
*/
TEST_STORE (st2_vnum_f16_2, svfloat16x2_t, float16_t,
	    svst2_vnum_f16 (p0, x0, 2, z0),
	    svst2_vnum (p0, x0, 2, z0))

/*
** st2_vnum_f16_14:
**	st2h	{z0\.h(?: - |, )z1\.h}, p0, \[x0, #14, mul vl\]
**	ret
*/
TEST_STORE (st2_vnum_f16_14, svfloat16x2_t, float16_t,
	    svst2_vnum_f16 (p0, x0, 14, z0),
	    svst2_vnum (p0, x0, 14, z0))

/* Moving the constant into a register would also be OK.  */
/*
** st2_vnum_f16_16:
**	incb	x0, all, mul #16
**	st2h	{z0\.h(?: - |, )z1\.h}, p0, \[x0\]
**	ret
*/
TEST_STORE (st2_vnum_f16_16, svfloat16x2_t, float16_t,
	    svst2_vnum_f16 (p0, x0, 16, z0),
	    svst2_vnum (p0, x0, 16, z0))

/* Moving the constant into a register would also be OK.  */
/*
** st2_vnum_f16_m1:
**	decb	x0
**	st2h	{z0\.h(?: - |, )z1\.h}, p0, \[x0\]
**	ret
*/
TEST_STORE (st2_vnum_f16_m1, svfloat16x2_t, float16_t,
	    svst2_vnum_f16 (p0, x0, -1, z0),
	    svst2_vnum (p0, x0, -1, z0))

/*
** st2_vnum_f16_m2:
**	st2h	{z0\.h(?: - |, )z1\.h}, p0, \[x0, #-2, mul vl\]
**	ret
*/
TEST_STORE (st2_vnum_f16_m2, svfloat16x2_t, float16_t,
	    svst2_vnum_f16 (p0, x0, -2, z0),
	    svst2_vnum (p0, x0, -2, z0))

/*
** st2_vnum_f16_m16:
**	st2h	{z0\.h(?: - |, )z1\.h}, p0, \[x0, #-16, mul vl\]
**	ret
*/
TEST_STORE (st2_vnum_f16_m16, svfloat16x2_t, float16_t,
	    svst2_vnum_f16 (p0, x0, -16, z0),
	    svst2_vnum (p0, x0, -16, z0))

/*
** st2_vnum_f16_m18:
**	addvl	(x[0-9]+), x0, #-18
**	st2h	{z0\.h(?: - |, )z1\.h}, p0, \[\1\]
**	ret
*/
TEST_STORE (st2_vnum_f16_m18, svfloat16x2_t, float16_t,
	    svst2_vnum_f16 (p0, x0, -18, z0),
	    svst2_vnum (p0, x0, -18, z0))

/* Using MUL to calculate an index would also be OK.  */
/*
** st2_vnum_f16_x1:
**	cntb	(x[0-9]+)
**	madd	(x[0-9]+), (x1, \1|\1, x1), x0
**	st2h	{z0\.h(?: - |, )z1\.h}, p0, \[\2\]
**	ret
*/
TEST_STORE (st2_vnum_f16_x1, svfloat16x2_t, float16_t,
	    svst2_vnum_f16 (p0, x0, x1, z0),
	    svst2_vnum (p0, x0, x1, z0))
