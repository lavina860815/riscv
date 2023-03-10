/* { dg-require-effective-target arm_v8_1m_mve_fp_ok } */
/* { dg-add-options arm_v8_1m_mve_fp } */
/* { dg-additional-options "-O2" } */

#include "arm_mve.h"
int16x8_t value1;
int8x16_t value2;
int32x4_t value3;
uint8x16_t value4;
uint16x8_t value5;
uint64x2_t value6;
uint32x4_t value7;
float16x8_t value8;
float32x4_t value9;

int64x2_t
foo (mve_pred16_t __p)
{
  int64x2_t r1,r2,r3,r4,r5,r6,r7;
  r1 = vpselq_s64 (vreinterpretq_s64_s16 (value1), vreinterpretq_s64_s8 (value2),
		   __p);
  r2 = vpselq_s64 (r1, vreinterpretq_s64_s32 (value3), __p);
  r3 = vpselq_s64 (r2, vreinterpretq_s64_u8 (value4), __p);
  r4 = vpselq_s64 (r3, vreinterpretq_s64_u16 (value5), __p);
  r5 = vpselq_s64 (r4, vreinterpretq_s64_u64 (value6), __p);
  r6 = vpselq_s64 (r5, vreinterpretq_s64_u32 (value7), __p);
  r7 = vpselq_s64 (r6, vreinterpretq_s64_f16 (value8), __p);
  return vpselq_s64 (r7, vreinterpretq_s64_f32 (value9), __p);
}

int64x2_t
foo1 (mve_pred16_t __p)
{
  int64x2_t r1,r2,r3,r4,r5,r6,r7;
  r1 = vpselq_s64 (vreinterpretq_s64 (value1), vreinterpretq_s64 (value2), __p);
  r2 = vpselq_s64 (r1, vreinterpretq_s64 (value3), __p);
  r3 = vpselq_s64 (r2, vreinterpretq_s64 (value4), __p);
  r4 = vpselq_s64 (r3, vreinterpretq_s64 (value5), __p);
  r5 = vpselq_s64 (r4, vreinterpretq_s64 (value6), __p);
  r6 = vpselq_s64 (r5, vreinterpretq_s64 (value7), __p);
  r7 = vpselq_s64 (r6, vreinterpretq_s64 (value8), __p);
  return vpselq_s64 (r7, vreinterpretq_s64 (value9), __p);
}

/* { dg-final { scan-assembler-times "vpsel" 8 } } */
