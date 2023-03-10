#include <arm_neon.h>
#include "arm-neon-ref.h"
#include "compute-ref-data.h"

#define INSN_NAME vmax
#define TEST_MSG "VMAX/VMAXQ"

#define HAS_FLOAT_VARIANT

#if defined (__ARM_FEATURE_FP16_VECTOR_ARITHMETIC)
#define HAS_FLOAT16_VARIANT
#endif

/* Expected results.  */
VECT_VAR_DECL(expected,int,8,8) [] = { 0xf3, 0xf3, 0xf3, 0xf3,
				       0xf4, 0xf5, 0xf6, 0xf7 };
VECT_VAR_DECL(expected,int,16,4) [] = { 0xfff2, 0xfff2, 0xfff2, 0xfff3 };
VECT_VAR_DECL(expected,int,32,2) [] = { 0xfffffff0, 0xfffffff1 };
VECT_VAR_DECL(expected,uint,8,8) [] = { 0xf3, 0xf3, 0xf3, 0xf3,
					0xf4, 0xf5, 0xf6, 0xf7 };
VECT_VAR_DECL(expected,uint,16,4) [] = { 0xfff1, 0xfff1, 0xfff2, 0xfff3 };
VECT_VAR_DECL(expected,uint,32,2) [] = { 0xfffffff0, 0xfffffff1 };
#if defined (__ARM_FEATURE_FP16_VECTOR_ARITHMETIC)
VECT_VAR_DECL(expected, hfloat, 16, 4) [] = { 0xcbc0, 0xcb80, 0xcb00, 0xca80 };
#endif
VECT_VAR_DECL(expected,hfloat,32,2) [] = { 0xc1780000, 0xc1700000 };
VECT_VAR_DECL(expected,int,8,16) [] = { 0xf4, 0xf4, 0xf4, 0xf4,
					0xf4, 0xf5, 0xf6, 0xf7,
					0xf8, 0xf9, 0xfa, 0xfb,
					0xfc, 0xfd, 0xfe, 0xff };
VECT_VAR_DECL(expected,int,16,8) [] = { 0xfff3, 0xfff3, 0xfff3, 0xfff3,
					0xfff4, 0xfff5, 0xfff6, 0xfff7 };
VECT_VAR_DECL(expected,int,32,4) [] = { 0xfffffff1, 0xfffffff1,
					0xfffffff2, 0xfffffff3 };
VECT_VAR_DECL(expected,uint,8,16) [] = { 0xf9, 0xf9, 0xf9, 0xf9,
					 0xf9, 0xf9, 0xf9, 0xf9,
					 0xf9, 0xf9, 0xfa, 0xfb,
					 0xfc, 0xfd, 0xfe, 0xff };
VECT_VAR_DECL(expected,uint,16,8) [] = { 0xfff2, 0xfff2, 0xfff2, 0xfff3,
					 0xfff4, 0xfff5, 0xfff6, 0xfff7 };
VECT_VAR_DECL(expected,uint,32,4) [] = { 0xfffffff1, 0xfffffff1,
					 0xfffffff2, 0xfffffff3 };
#if defined (__ARM_FEATURE_FP16_VECTOR_ARITHMETIC)
VECT_VAR_DECL(expected, hfloat, 16, 8) [] = { 0xcb40, 0xcb40, 0xcb00, 0xca80,
					      0xca00, 0xc980, 0xc900, 0xc880 };
#endif
VECT_VAR_DECL(expected,hfloat,32,4) [] = { 0xc1680000, 0xc1680000,
					   0xc1600000, 0xc1500000 };

/* Expected results with special FP values.  */
#if defined (__ARM_FEATURE_FP16_VECTOR_ARITHMETIC)
VECT_VAR_DECL(expected_nan, hfloat, 16, 8) [] = { 0x7e00, 0x7e00,
						  0x7e00, 0x7e00,
						  0x7e00, 0x7e00,
						  0x7e00, 0x7e00 };
VECT_VAR_DECL(expected_mnan, hfloat, 16, 8) [] = { 0x7e00, 0x7e00,
						   0x7e00, 0x7e00,
						   0x7e00, 0x7e00,
						   0x7e00, 0x7e00 };
VECT_VAR_DECL(expected_inf, hfloat, 16, 8) [] = { 0x7c00, 0x7c00,
						  0x7c00, 0x7c00,
						  0x7c00, 0x7c00,
						  0x7c00, 0x7c00 };
VECT_VAR_DECL(expected_minf, hfloat, 16, 8) [] = { 0x3c00, 0x3c00,
						   0x3c00, 0x3c00,
						   0x3c00, 0x3c00,
						   0x3c00, 0x3c00 };
VECT_VAR_DECL(expected_zero1, hfloat, 16, 8) [] = { 0x0, 0x0, 0x0, 0x0,
						    0x0, 0x0, 0x0, 0x0 };
VECT_VAR_DECL(expected_zero2, hfloat, 16, 8) [] = { 0x0, 0x0, 0x0, 0x0,
						    0x0, 0x0, 0x0, 0x0 };
#endif
VECT_VAR_DECL(expected_nan,hfloat,32,4) [] = { 0x7fc00000, 0x7fc00000,
					       0x7fc00000, 0x7fc00000 };
VECT_VAR_DECL(expected_mnan,hfloat,32,4) [] = { 0x7fc00000, 0x7fc00000,
						0x7fc00000, 0x7fc00000 };
VECT_VAR_DECL(expected_inf,hfloat,32,4) [] = { 0x7f800000, 0x7f800000,
					       0x7f800000, 0x7f800000 };
VECT_VAR_DECL(expected_minf,hfloat,32,4) [] = { 0x3f800000, 0x3f800000,
						0x3f800000, 0x3f800000 };
VECT_VAR_DECL(expected_zero1,hfloat,32,4) [] = { 0x0, 0x0, 0x0, 0x0 };
VECT_VAR_DECL(expected_zero2,hfloat,32,4) [] = { 0x0, 0x0, 0x0, 0x0 };

#include "binary_op_no64.inc"
