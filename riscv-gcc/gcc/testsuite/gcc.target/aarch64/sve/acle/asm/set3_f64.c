/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sve_acle.h"

/*
** set3_f64_z24_0:
**	mov	z25\.d, z5\.d
**	mov	z26\.d, z6\.d
**	mov	z24\.d, z0\.d
**	ret
*/
TEST_SET (set3_f64_z24_0, svfloat64x3_t, svfloat64_t,
	  z24 = svset3_f64 (z4, 0, z0),
	  z24 = svset3 (z4, 0, z0))

/*
** set3_f64_z24_1:
**	mov	z24\.d, z4\.d
**	mov	z26\.d, z6\.d
**	mov	z25\.d, z0\.d
**	ret
*/
TEST_SET (set3_f64_z24_1, svfloat64x3_t, svfloat64_t,
	  z24 = svset3_f64 (z4, 1, z0),
	  z24 = svset3 (z4, 1, z0))

/*
** set3_f64_z24_2:
**	mov	z24\.d, z4\.d
**	mov	z25\.d, z5\.d
**	mov	z26\.d, z0\.d
**	ret
*/
TEST_SET (set3_f64_z24_2, svfloat64x3_t, svfloat64_t,
	  z24 = svset3_f64 (z4, 2, z0),
	  z24 = svset3 (z4, 2, z0))

/*
** set3_f64_z4_0:
**	mov	z4\.d, z0\.d
**	ret
*/
TEST_SET (set3_f64_z4_0, svfloat64x3_t, svfloat64_t,
	  z4 = svset3_f64 (z4, 0, z0),
	  z4 = svset3 (z4, 0, z0))

/*
** set3_f64_z4_1:
**	mov	z5\.d, z0\.d
**	ret
*/
TEST_SET (set3_f64_z4_1, svfloat64x3_t, svfloat64_t,
	  z4 = svset3_f64 (z4, 1, z0),
	  z4 = svset3 (z4, 1, z0))

/*
** set3_f64_z4_2:
**	mov	z6\.d, z0\.d
**	ret
*/
TEST_SET (set3_f64_z4_2, svfloat64x3_t, svfloat64_t,
	  z4 = svset3_f64 (z4, 2, z0),
	  z4 = svset3 (z4, 2, z0))
