#include <arm_neon.h>

/* { dg-do compile } */
/* { dg-skip-if "" { *-*-* } { "-fno-fat-lto-objects" } } */

void
f_vst3_lane_u16 (uint16_t * p, uint16x4x3_t v)
{
  /* { dg-error "lane 4 out of range 0 - 3" "" { target *-*-* } 0 } */
  vst3_lane_u16 (p, v, 4);
  /* { dg-error "lane -1 out of range 0 - 3" "" { target *-*-* } 0 } */
  vst3_lane_u16 (p, v, -1);
  return;
}
