/* { dg-do assemble } */
/* { dg-options "-std=c99" } */
#include <arm_neon.h>

int
main (int argc, char **argv)
{
  uint64x1_t base_b = vcreate_u64 (0x5555666677778888ULL);
  uint64x1_t base_c = vcreate_u64 (0x9999aaaabbbbccccULL);
  uint64x2_t baseq_b = vcombine_u64 (base_b, base_c);
  uint64x1_t base_a = vcreate_u64 (0x1111222233334444ULL);
  uint64x2_t baseq_c = vcombine_u64 (base_c, base_a);
  uint64x2_t baseq_a = vcombine_u64 (base_a, base_b);
  int32x4_t int32x4_b = vreinterpretq_s32_u64 (baseq_b);
  int32x4_t int32x4_c = vreinterpretq_s32_u64 (baseq_c);
  int64x2_t int64x2_a = vreinterpretq_s64_u64 (baseq_a);

  /* { dg-error "lane -1 out of range 0 - 3" "" {target *-*-*} 0 } */
  vqdmlsl_high_laneq_s32 (int64x2_a, int32x4_b, int32x4_c, -1);
  /* { dg-error "lane 4 out of range 0 - 3" "" {target *-*-*} 0 } */
  vqdmlsl_high_laneq_s32 (int64x2_a, int32x4_b, int32x4_c, 4);
}
