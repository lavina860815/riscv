/* { dg-final { check-function-bodies "**" "" "-DCHECK_ASM" } } */

#include "test_sve_acle.h"

/*
** uzp2_u8_tied1:
**	uzp2	z0\.b, z0\.b, z1\.b
**	ret
*/
TEST_UNIFORM_Z (uzp2_u8_tied1, svuint8_t,
		z0 = svuzp2_u8 (z0, z1),
		z0 = svuzp2 (z0, z1))

/*
** uzp2_u8_tied2:
**	uzp2	z0\.b, z1\.b, z0\.b
**	ret
*/
TEST_UNIFORM_Z (uzp2_u8_tied2, svuint8_t,
		z0 = svuzp2_u8 (z1, z0),
		z0 = svuzp2 (z1, z0))

/*
** uzp2_u8_untied:
**	uzp2	z0\.b, z1\.b, z2\.b
**	ret
*/
TEST_UNIFORM_Z (uzp2_u8_untied, svuint8_t,
		z0 = svuzp2_u8 (z1, z2),
		z0 = svuzp2 (z1, z2))
