/* { dg-do compile } */
/* { dg-options "-O2 -ftree-vectorize" } */

#include <stdint.h>

#define eq(A, B) ((A) == (B))
#define ne(A, B) ((A) != (B))
#define olt(A, B) ((A) < (B))
#define ole(A, B) ((A) <= (B))
#define oge(A, B) ((A) >= (B))
#define ogt(A, B) ((A) > (B))
#define ordered(A, B) (!__builtin_isunordered (A, B))
#define unordered(A, B) (__builtin_isunordered (A, B))
#define ueq(A, B) (!__builtin_islessgreater (A, B))
#define ult(A, B) (__builtin_isless (A, B))
#define ule(A, B) (__builtin_islessequal (A, B))
#define uge(A, B) (__builtin_isgreaterequal (A, B))
#define ugt(A, B) (__builtin_isgreater (A, B))
#define nueq(A, B) (__builtin_islessgreater (A, B))
#define nult(A, B) (!__builtin_isless (A, B))
#define nule(A, B) (!__builtin_islessequal (A, B))
#define nuge(A, B) (!__builtin_isgreaterequal (A, B))
#define nugt(A, B) (!__builtin_isgreater (A, B))

#define TEST_LOOP(TYPE1, TYPE2, CMP)				\
  void __attribute__ ((noinline, noclone))			\
  test_##TYPE1##_##TYPE2##_##CMP##_sel (TYPE1 *restrict dest,	\
					TYPE1 if_true,		\
					TYPE1 if_false,		\
					TYPE2 *restrict a,	\
					TYPE2 b, int count)	\
  {								\
    for (int i = 0; i < count; ++i)				\
      dest[i] = CMP (a[i], b) ? if_true : if_false;		\
  }

#define TEST_CMP(CMP) \
  TEST_LOOP (int32_t, float, CMP) \
  TEST_LOOP (uint32_t, float, CMP) \
  TEST_LOOP (float, float, CMP) \
  TEST_LOOP (int64_t, double, CMP) \
  TEST_LOOP (uint64_t, double, CMP) \
  TEST_LOOP (double, double, CMP)

TEST_CMP (eq)
TEST_CMP (ne)
TEST_CMP (olt)
TEST_CMP (ole)
TEST_CMP (oge)
TEST_CMP (ogt)
TEST_CMP (ordered)
TEST_CMP (unordered)
TEST_CMP (ueq)
TEST_CMP (ult)
TEST_CMP (ule)
TEST_CMP (uge)
TEST_CMP (ugt)
TEST_CMP (nueq)
TEST_CMP (nult)
TEST_CMP (nule)
TEST_CMP (nuge)
TEST_CMP (nugt)

/* 3 each for: eq, ne, ueq, nueq.  */
/* { dg-final { scan-assembler-times {\tfcm(?:eq|ne)\tp[0-9]+\.s, p[0-7]/z, z[0-9]+\.s, z[0-9]+\.s\n} 12 } } */
/* { dg-final { scan-assembler-times {\tfcm(?:eq|ne)\tp[0-9]+\.d, p[0-7]/z, z[0-9]+\.d, z[0-9]+\.d\n} 12 } } */

/* 3 each for: olt, ult, nult, ogt, ugt, nugt.  */
/* { dg-final { scan-assembler-times {\tfcm[lg]t\tp[0-9]+\.s, p[0-7]/z, z[0-9]+\.s, z[0-9]+\.s\n} 18 } } */
/* { dg-final { scan-assembler-times {\tfcm[lg]t\tp[0-9]+\.d, p[0-7]/z, z[0-9]+\.d, z[0-9]+\.d\n} 18 } } */

/* 3 each for: ole, ule, nule, oge, uge, nuge.  */
/* { dg-final { scan-assembler-times {\tfcm[lg]e\tp[0-9]+\.s, p[0-7]/z, z[0-9]+\.s, z[0-9]+\.s\n} 18 } } */
/* { dg-final { scan-assembler-times {\tfcm[lg]e\tp[0-9]+\.d, p[0-7]/z, z[0-9]+\.d, z[0-9]+\.d\n} 18 } } */

/* 3 invocations for all 12 unordered comparisons.  */
/* { dg-final { scan-assembler-times {\tfcmuo\tp[0-9]+\.s, p[0-7]/z, z[0-9]+\.s, z[0-9]+\.s\n} 36 } } */
/* { dg-final { scan-assembler-times {\tfcmuo\tp[0-9]+\.d, p[0-7]/z, z[0-9]+\.d, z[0-9]+\.d\n} 36 } } */
