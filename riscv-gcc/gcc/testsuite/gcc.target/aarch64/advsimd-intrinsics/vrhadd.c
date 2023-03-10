#include <arm_neon.h>
#include "arm-neon-ref.h"
#include "compute-ref-data.h"

#define INSN_NAME vrhadd
#define TEST_MSG "VRHADD/VRHADDQ"

/* Expected results.  */
VECT_VAR_DECL(expected,int,8,8) [] = { 0xf2, 0xf2, 0xf3, 0xf3,
				       0xf4, 0xf4, 0xf5, 0xf5 };
VECT_VAR_DECL(expected,int,16,4) [] = { 0xfff1, 0xfff2, 0xfff2, 0xfff3 };
VECT_VAR_DECL(expected,int,32,2) [] = { 0xfffffff0, 0xfffffff1 };
VECT_VAR_DECL(expected,uint,8,8) [] = { 0xf2, 0xf2, 0xf3, 0xf3,
					0xf4, 0xf4, 0xf5, 0xf5 };
VECT_VAR_DECL(expected,uint,16,4) [] = { 0xfff1, 0xfff1, 0xfff2, 0xfff2 };
VECT_VAR_DECL(expected,uint,32,2) [] = { 0xfffffff0, 0xfffffff1 };
VECT_VAR_DECL(expected,int,8,16) [] = { 0xf2, 0xf3, 0xf3, 0xf4,
					0xf4, 0xf5, 0xf5, 0xf6,
					0xf6, 0xf7, 0xf7, 0xf8,
					0xf8, 0xf9, 0xf9, 0xfa };
VECT_VAR_DECL(expected,int,16,8) [] = { 0xfff2, 0xfff2, 0xfff3, 0xfff3,
					0xfff4, 0xfff4, 0xfff5, 0xfff5 };
VECT_VAR_DECL(expected,int,32,4) [] = { 0xfffffff1, 0xfffffff1,
					0xfffffff2, 0xfffffff2 };
VECT_VAR_DECL(expected,uint,8,16) [] = { 0xf5, 0xf5, 0xf6, 0xf6,
					 0xf7, 0xf7, 0xf8, 0xf8,
					 0xf9, 0xf9, 0xfa, 0xfa,
					 0xfb, 0xfb, 0xfc, 0xfc };
VECT_VAR_DECL(expected,uint,16,8) [] = { 0xfff1, 0xfff2, 0xfff2, 0xfff3,
					 0xfff3, 0xfff4, 0xfff4, 0xfff5 };
VECT_VAR_DECL(expected,uint,32,4) [] = { 0xfffffff1, 0xfffffff1,
					 0xfffffff2, 0xfffffff2 };

#include "binary_op_no64.inc"
