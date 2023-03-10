#include <arm_sve.h>

void
test (svbool_t pg, svint8_t s8, svuint8_t u8,
      svint16_t s16, svuint16_t u16, svint32_t s32, svuint32_t u32,
      svint64_t s64, svuint64_t u64, int16_t sh, uint16_t uh,
      int32_t sw, uint32_t uw, int64_t sd, uint64_t ud,
      float f)
{
  svqincd_pat (pg, SV_ALL, 1); /* { dg-error {'svqincd_pat' has no form that takes 'svbool_t' arguments} } */
  svqincd_pat (s8, SV_ALL, 1); /* { dg-error {'svqincd_pat' has no form that takes 'svint8_t' arguments} } */
  svqincd_pat (u8, SV_ALL, 1); /* { dg-error {'svqincd_pat' has no form that takes 'svuint8_t' arguments} } */
  svqincd_pat (s16, SV_ALL, 1); /* { dg-error {'svqincd_pat' has no form that takes 'svint16_t' arguments} } */
  svqincd_pat (u16, SV_ALL, 1); /* { dg-error {'svqincd_pat' has no form that takes 'svuint16_t' arguments} } */
  svqincd_pat (s32, SV_ALL, 1); /* { dg-error {'svqincd_pat' has no form that takes 'svint32_t' arguments} } */
  svqincd_pat (u32, SV_ALL, 1); /* { dg-error {'svqincd_pat' has no form that takes 'svuint32_t' arguments} } */
  svqincd_pat (s64, SV_ALL, 1);
  svqincd_pat (u64, SV_ALL, 1);
  svqincd_pat (sh, SV_ALL, 1);
  svqincd_pat (sw, SV_ALL, 1);
  svqincd_pat (sd, SV_ALL, 1);
  svqincd_pat (uh, SV_ALL, 1);
  svqincd_pat (uw, SV_ALL, 1);
  svqincd_pat (ud, SV_ALL, 1);
  svqincd_pat (f, SV_ALL, 1); /* { dg-error {passing 'float' to argument 1 of 'svqincd_pat', which expects a 32-bit or 64-bit integer type} } */
}
