#include <arm_neon.h>

/* { dg-do compile } */
/* { dg-skip-if "" { *-*-* } { "-fno-fat-lto-objects" } } */

uint8x8x2_t
f_vld2_lane_u8 (uint8_t * p, uint8x8x2_t v)
{
  uint8x8x2_t res;
  /* { dg-error "lane 8 out of range 0 - 7" "" { target *-*-* } 0 } */
  res = vld2_lane_u8 (p, v, 8);
  /* { dg-error "lane -1 out of range 0 - 7" "" { target *-*-* } 0 } */
  res = vld2_lane_u8 (p, v, -1);
  return res;
}
