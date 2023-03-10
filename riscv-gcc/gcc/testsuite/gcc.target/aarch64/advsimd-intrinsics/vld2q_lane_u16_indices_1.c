#include <arm_neon.h>

/* { dg-do compile } */
/* { dg-skip-if "" { *-*-* } { "-fno-fat-lto-objects" } } */

uint16x8x2_t
f_vld2q_lane_u16 (uint16_t * p, uint16x8x2_t v)
{
  uint16x8x2_t res;
  /* { dg-error "lane 8 out of range 0 - 7" "" { target *-*-* } 0 } */
  res = vld2q_lane_u16 (p, v, 8);
  /* { dg-error "lane -1 out of range 0 - 7" "" { target *-*-* } 0 } */
  res = vld2q_lane_u16 (p, v, -1);
  return res;
}
