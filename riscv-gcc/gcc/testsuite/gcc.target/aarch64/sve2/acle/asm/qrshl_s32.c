/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sve_acle.h"

/*
** qrshl_s32_m_tied1:
**	sqrshl	z0\.s, p0/m, z0\.s, z4\.s
**	ret
*/
TEST_DUAL_Z (qrshl_s32_m_tied1, svint32_t, svint32_t,
	     z0 = svqrshl_s32_m (p0, z0, z4),
	     z0 = svqrshl_m (p0, z0, z4))

/*
** qrshl_s32_m_tied2:
**	mov	(z[0-9]+)\.d, z0\.d
**	movprfx	z0, z4
**	sqrshl	z0\.s, p0/m, z0\.s, \1\.s
**	ret
*/
TEST_DUAL_Z_REV (qrshl_s32_m_tied2, svint32_t, svint32_t,
		 z0_res = svqrshl_s32_m (p0, z4, z0),
		 z0_res = svqrshl_m (p0, z4, z0))

/*
** qrshl_s32_m_untied:
**	movprfx	z0, z1
**	sqrshl	z0\.s, p0/m, z0\.s, z4\.s
**	ret
*/
TEST_DUAL_Z (qrshl_s32_m_untied, svint32_t, svint32_t,
	     z0 = svqrshl_s32_m (p0, z1, z4),
	     z0 = svqrshl_m (p0, z1, z4))

/*
** qrshl_w0_s32_m_tied1:
**	mov	(z[0-9]+\.s), w0
**	sqrshl	z0\.s, p0/m, z0\.s, \1
**	ret
*/
TEST_UNIFORM_ZX (qrshl_w0_s32_m_tied1, svint32_t, int32_t,
		 z0 = svqrshl_n_s32_m (p0, z0, x0),
		 z0 = svqrshl_m (p0, z0, x0))

/*
** qrshl_w0_s32_m_untied:
**	mov	(z[0-9]+\.s), w0
**	movprfx	z0, z1
**	sqrshl	z0\.s, p0/m, z0\.s, \1
**	ret
*/
TEST_UNIFORM_ZX (qrshl_w0_s32_m_untied, svint32_t, int32_t,
		 z0 = svqrshl_n_s32_m (p0, z1, x0),
		 z0 = svqrshl_m (p0, z1, x0))

/*
** qrshl_m32_s32_m:
**	srshr	z0\.s, p0/m, z0\.s, #32
**	ret
*/
TEST_UNIFORM_Z (qrshl_m32_s32_m, svint32_t,
		z0 = svqrshl_n_s32_m (p0, z0, -32),
		z0 = svqrshl_m (p0, z0, -32))

/*
** qrshl_m2_s32_m:
**	srshr	z0\.s, p0/m, z0\.s, #2
**	ret
*/
TEST_UNIFORM_Z (qrshl_m2_s32_m, svint32_t,
		z0 = svqrshl_n_s32_m (p0, z0, -2),
		z0 = svqrshl_m (p0, z0, -2))

/*
** qrshl_m1_s32_m_tied1:
**	srshr	z0\.s, p0/m, z0\.s, #1
**	ret
*/
TEST_UNIFORM_Z (qrshl_m1_s32_m_tied1, svint32_t,
		z0 = svqrshl_n_s32_m (p0, z0, -1),
		z0 = svqrshl_m (p0, z0, -1))

/*
** qrshl_m1_s32_m_untied:
**	movprfx	z0, z1
**	srshr	z0\.s, p0/m, z0\.s, #1
**	ret
*/
TEST_UNIFORM_Z (qrshl_m1_s32_m_untied, svint32_t,
		z0 = svqrshl_n_s32_m (p0, z1, -1),
		z0 = svqrshl_m (p0, z1, -1))

/*
** qrshl_1_s32_m_tied1:
**	sqshl	z0\.s, p0/m, z0\.s, #1
**	ret
*/
TEST_UNIFORM_Z (qrshl_1_s32_m_tied1, svint32_t,
		z0 = svqrshl_n_s32_m (p0, z0, 1),
		z0 = svqrshl_m (p0, z0, 1))

/*
** qrshl_1_s32_m_untied:
**	movprfx	z0, z1
**	sqshl	z0\.s, p0/m, z0\.s, #1
**	ret
*/
TEST_UNIFORM_Z (qrshl_1_s32_m_untied, svint32_t,
		z0 = svqrshl_n_s32_m (p0, z1, 1),
		z0 = svqrshl_m (p0, z1, 1))

/*
** qrshl_2_s32_m:
**	sqshl	z0\.s, p0/m, z0\.s, #2
**	ret
*/
TEST_UNIFORM_Z (qrshl_2_s32_m, svint32_t,
		z0 = svqrshl_n_s32_m (p0, z0, 2),
		z0 = svqrshl_m (p0, z0, 2))

/*
** qrshl_31_s32_m:
**	sqshl	z0\.s, p0/m, z0\.s, #31
**	ret
*/
TEST_UNIFORM_Z (qrshl_31_s32_m, svint32_t,
		z0 = svqrshl_n_s32_m (p0, z0, 31),
		z0 = svqrshl_m (p0, z0, 31))

/*
** qrshl_s32_z_tied1:
**	movprfx	z0\.s, p0/z, z0\.s
**	sqrshl	z0\.s, p0/m, z0\.s, z4\.s
**	ret
*/
TEST_DUAL_Z (qrshl_s32_z_tied1, svint32_t, svint32_t,
	     z0 = svqrshl_s32_z (p0, z0, z4),
	     z0 = svqrshl_z (p0, z0, z4))

/*
** qrshl_s32_z_tied2:
**	movprfx	z0\.s, p0/z, z0\.s
**	sqrshlr	z0\.s, p0/m, z0\.s, z4\.s
**	ret
*/
TEST_DUAL_Z_REV (qrshl_s32_z_tied2, svint32_t, svint32_t,
		 z0_res = svqrshl_s32_z (p0, z4, z0),
		 z0_res = svqrshl_z (p0, z4, z0))

/*
** qrshl_s32_z_untied:
** (
**	movprfx	z0\.s, p0/z, z1\.s
**	sqrshl	z0\.s, p0/m, z0\.s, z4\.s
** |
**	movprfx	z0\.s, p0/z, z4\.s
**	sqrshlr	z0\.s, p0/m, z0\.s, z1\.s
** )
**	ret
*/
TEST_DUAL_Z (qrshl_s32_z_untied, svint32_t, svint32_t,
	     z0 = svqrshl_s32_z (p0, z1, z4),
	     z0 = svqrshl_z (p0, z1, z4))

/*
** qrshl_w0_s32_z_tied1:
**	mov	(z[0-9]+\.s), w0
**	movprfx	z0\.s, p0/z, z0\.s
**	sqrshl	z0\.s, p0/m, z0\.s, \1
**	ret
*/
TEST_UNIFORM_ZX (qrshl_w0_s32_z_tied1, svint32_t, int32_t,
		 z0 = svqrshl_n_s32_z (p0, z0, x0),
		 z0 = svqrshl_z (p0, z0, x0))

/*
** qrshl_w0_s32_z_untied:
**	mov	(z[0-9]+\.s), w0
** (
**	movprfx	z0\.s, p0/z, z1\.s
**	sqrshl	z0\.s, p0/m, z0\.s, \1
** |
**	movprfx	z0\.s, p0/z, \1
**	sqrshlr	z0\.s, p0/m, z0\.s, z1\.s
** )
**	ret
*/
TEST_UNIFORM_ZX (qrshl_w0_s32_z_untied, svint32_t, int32_t,
		 z0 = svqrshl_n_s32_z (p0, z1, x0),
		 z0 = svqrshl_z (p0, z1, x0))

/*
** qrshl_m32_s32_z:
**	movprfx	z0\.s, p0/z, z0\.s
**	srshr	z0\.s, p0/m, z0\.s, #32
**	ret
*/
TEST_UNIFORM_Z (qrshl_m32_s32_z, svint32_t,
		z0 = svqrshl_n_s32_z (p0, z0, -32),
		z0 = svqrshl_z (p0, z0, -32))

/*
** qrshl_m2_s32_z:
**	movprfx	z0\.s, p0/z, z0\.s
**	srshr	z0\.s, p0/m, z0\.s, #2
**	ret
*/
TEST_UNIFORM_Z (qrshl_m2_s32_z, svint32_t,
		z0 = svqrshl_n_s32_z (p0, z0, -2),
		z0 = svqrshl_z (p0, z0, -2))

/*
** qrshl_m1_s32_z_tied1:
**	movprfx	z0\.s, p0/z, z0\.s
**	srshr	z0\.s, p0/m, z0\.s, #1
**	ret
*/
TEST_UNIFORM_Z (qrshl_m1_s32_z_tied1, svint32_t,
		z0 = svqrshl_n_s32_z (p0, z0, -1),
		z0 = svqrshl_z (p0, z0, -1))

/*
** qrshl_m1_s32_z_untied:
**	movprfx	z0\.s, p0/z, z1\.s
**	srshr	z0\.s, p0/m, z0\.s, #1
**	ret
*/
TEST_UNIFORM_Z (qrshl_m1_s32_z_untied, svint32_t,
		z0 = svqrshl_n_s32_z (p0, z1, -1),
		z0 = svqrshl_z (p0, z1, -1))

/*
** qrshl_1_s32_z_tied1:
**	movprfx	z0\.s, p0/z, z0\.s
**	sqshl	z0\.s, p0/m, z0\.s, #1
**	ret
*/
TEST_UNIFORM_Z (qrshl_1_s32_z_tied1, svint32_t,
		z0 = svqrshl_n_s32_z (p0, z0, 1),
		z0 = svqrshl_z (p0, z0, 1))

/*
** qrshl_1_s32_z_untied:
**	movprfx	z0\.s, p0/z, z1\.s
**	sqshl	z0\.s, p0/m, z0\.s, #1
**	ret
*/
TEST_UNIFORM_Z (qrshl_1_s32_z_untied, svint32_t,
		z0 = svqrshl_n_s32_z (p0, z1, 1),
		z0 = svqrshl_z (p0, z1, 1))

/*
** qrshl_2_s32_z:
**	movprfx	z0\.s, p0/z, z0\.s
**	sqshl	z0\.s, p0/m, z0\.s, #2
**	ret
*/
TEST_UNIFORM_Z (qrshl_2_s32_z, svint32_t,
		z0 = svqrshl_n_s32_z (p0, z0, 2),
		z0 = svqrshl_z (p0, z0, 2))

/*
** qrshl_31_s32_z:
**	movprfx	z0\.s, p0/z, z0\.s
**	sqshl	z0\.s, p0/m, z0\.s, #31
**	ret
*/
TEST_UNIFORM_Z (qrshl_31_s32_z, svint32_t,
		z0 = svqrshl_n_s32_z (p0, z0, 31),
		z0 = svqrshl_z (p0, z0, 31))

/*
** qrshl_s32_x_tied1:
**	sqrshl	z0\.s, p0/m, z0\.s, z4\.s
**	ret
*/
TEST_DUAL_Z (qrshl_s32_x_tied1, svint32_t, svint32_t,
	     z0 = svqrshl_s32_x (p0, z0, z4),
	     z0 = svqrshl_x (p0, z0, z4))

/*
** qrshl_s32_x_tied2:
**	sqrshlr	z0\.s, p0/m, z0\.s, z4\.s
**	ret
*/
TEST_DUAL_Z_REV (qrshl_s32_x_tied2, svint32_t, svint32_t,
		 z0_res = svqrshl_s32_x (p0, z4, z0),
		 z0_res = svqrshl_x (p0, z4, z0))

/*
** qrshl_s32_x_untied:
** (
**	movprfx	z0, z1
**	sqrshl	z0\.s, p0/m, z0\.s, z4\.s
** |
**	movprfx	z0, z4
**	sqrshlr	z0\.s, p0/m, z0\.s, z1\.s
** )
**	ret
*/
TEST_DUAL_Z (qrshl_s32_x_untied, svint32_t, svint32_t,
	     z0 = svqrshl_s32_x (p0, z1, z4),
	     z0 = svqrshl_x (p0, z1, z4))

/*
** qrshl_w0_s32_x_tied1:
**	mov	(z[0-9]+\.s), w0
**	sqrshl	z0\.s, p0/m, z0\.s, \1
**	ret
*/
TEST_UNIFORM_ZX (qrshl_w0_s32_x_tied1, svint32_t, int32_t,
		 z0 = svqrshl_n_s32_x (p0, z0, x0),
		 z0 = svqrshl_x (p0, z0, x0))

/*
** qrshl_w0_s32_x_untied:
**	mov	z0\.s, w0
**	sqrshlr	z0\.s, p0/m, z0\.s, z1\.s
**	ret
*/
TEST_UNIFORM_ZX (qrshl_w0_s32_x_untied, svint32_t, int32_t,
		 z0 = svqrshl_n_s32_x (p0, z1, x0),
		 z0 = svqrshl_x (p0, z1, x0))

/*
** qrshl_m32_s32_x:
**	srshr	z0\.s, p0/m, z0\.s, #32
**	ret
*/
TEST_UNIFORM_Z (qrshl_m32_s32_x, svint32_t,
		z0 = svqrshl_n_s32_x (p0, z0, -32),
		z0 = svqrshl_x (p0, z0, -32))

/*
** qrshl_m2_s32_x:
**	srshr	z0\.s, p0/m, z0\.s, #2
**	ret
*/
TEST_UNIFORM_Z (qrshl_m2_s32_x, svint32_t,
		z0 = svqrshl_n_s32_x (p0, z0, -2),
		z0 = svqrshl_x (p0, z0, -2))

/*
** qrshl_m1_s32_x_tied1:
**	srshr	z0\.s, p0/m, z0\.s, #1
**	ret
*/
TEST_UNIFORM_Z (qrshl_m1_s32_x_tied1, svint32_t,
		z0 = svqrshl_n_s32_x (p0, z0, -1),
		z0 = svqrshl_x (p0, z0, -1))

/*
** qrshl_m1_s32_x_untied:
**	movprfx	z0, z1
**	srshr	z0\.s, p0/m, z0\.s, #1
**	ret
*/
TEST_UNIFORM_Z (qrshl_m1_s32_x_untied, svint32_t,
		z0 = svqrshl_n_s32_x (p0, z1, -1),
		z0 = svqrshl_x (p0, z1, -1))

/*
** qrshl_1_s32_x_tied1:
**	sqshl	z0\.s, p0/m, z0\.s, #1
**	ret
*/
TEST_UNIFORM_Z (qrshl_1_s32_x_tied1, svint32_t,
		z0 = svqrshl_n_s32_x (p0, z0, 1),
		z0 = svqrshl_x (p0, z0, 1))

/*
** qrshl_1_s32_x_untied:
**	movprfx	z0, z1
**	sqshl	z0\.s, p0/m, z0\.s, #1
**	ret
*/
TEST_UNIFORM_Z (qrshl_1_s32_x_untied, svint32_t,
		z0 = svqrshl_n_s32_x (p0, z1, 1),
		z0 = svqrshl_x (p0, z1, 1))

/*
** qrshl_2_s32_x:
**	sqshl	z0\.s, p0/m, z0\.s, #2
**	ret
*/
TEST_UNIFORM_Z (qrshl_2_s32_x, svint32_t,
		z0 = svqrshl_n_s32_x (p0, z0, 2),
		z0 = svqrshl_x (p0, z0, 2))

/*
** qrshl_31_s32_x:
**	sqshl	z0\.s, p0/m, z0\.s, #31
**	ret
*/
TEST_UNIFORM_Z (qrshl_31_s32_x, svint32_t,
		z0 = svqrshl_n_s32_x (p0, z0, 31),
		z0 = svqrshl_x (p0, z0, 31))
