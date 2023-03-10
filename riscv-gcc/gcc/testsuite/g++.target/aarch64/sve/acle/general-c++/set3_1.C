/* { dg-do compile } */
/* { dg-additional-options "-std=c++11 -Wall -Wextra" } */

#include <arm_sve.h>

constexpr uint64_t const_sub (uint64_t a, uint64_t b) { return a - b; }
uint64_t add (uint64_t a, uint64_t b) { return a + b; }

svfloat64_t
f1 (svbool_t pg, svfloat16_t f16, svfloat16x3_t f16x3, svuint16x3_t u16x3,
    svfloat16x4_t f16x4, int x)
{
  const int one = 1;
  svfloat64_t f64;

  f16x3 = svset3 (f16x3); /* { dg-error {no matching function for call to 'svset3\(svfloat16x3_t\&\)'} } */
  f16x3 = svset3 (f16x3, 1); /* { dg-error {no matching function for call to 'svset3\(svfloat16x3_t\&, int\)'} } */
  f16x3 = svset3 (f16x3, 1, f16, 2); /* { dg-error {no matching function for call to 'svset3\(svfloat16x3_t\&, int, svfloat16_t\&, int\)'} } */
  f16x3 = svset3 (f16, 0, f16); /* { dg-error {no matching function for call to 'svset3\(svfloat16_t\&, int, svfloat16_t\&\)'} } */
  f16x3 = svset3 (u16x3, 0, f16); /* { dg-error {no matching function for call to 'svset3\(svuint16x3_t\&, int, svfloat16_t\&\)'} } */
  f16x3 = svset3 (f16x4, 0, f16); /* { dg-error {no matching function for call to 'svset3\(svfloat16x4_t\&, int, svfloat16_t\&\)'} } */
  f16x3 = svset3 (pg, 0, f16); /* { dg-error {no matching function for call to 'svset3\(svbool_t\&, int, svfloat16_t\&\)'} } */
  f16x3 = svset3 (f16x3, 0, f64); /* { dg-error {no matching function for call to 'svset3\(svfloat16x3_t\&, int, svfloat64_t\&\)'} } */
  f16x3 = svset3 (f16x3, 0, f16x3); /* { dg-error {no matching function for call to 'svset3\(svfloat16x3_t\&, int, svfloat16x3_t\&\)'} } */
  f16x3 = svset3 (f16x3, 0, pg); /* { dg-error {no matching function for call to 'svset3\(svfloat16x3_t\&, int, svbool_t\&\)'} } */
  f16x3 = svset3 (f16x3, x, f16); /* { dg-error "argument 2 of 'svset3' must be an integer constant expression" } */
  f16x3 = svset3 (f16x3, 0, f16);
  u16x3 = svset3 (f16x3, 0, f16); /* { dg-error {cannot convert 'svfloat16x3_t' to 'svuint16x3_t' in assignment} } */
  f16x3 = svset3 (f16x3, 1, f16);
  f16x3 = svset3 (f16x3, 2, f16);
  f16x3 = svset3 (f16x3, 3, f16); /* { dg-error {passing 3 to argument 2 of 'svset3', which expects a value in the range \[0, 2\]} } */
  f16x3 = svset3 (f16x3, 4, f16); /* { dg-error {passing 4 to argument 2 of 'svset3', which expects a value in the range \[0, 2\]} } */
  f16x3 = svset3 (f16x3, 5, f16); /* { dg-error {passing 5 to argument 2 of 'svset3', which expects a value in the range \[0, 2\]} } */
  f16x3 = svset3 (f16x3, ~0U, f16); /* { dg-error {passing [^ ]* to argument 2 of 'svset3', which expects a value in the range \[0, 2\]} } */
  f16x3 = svset3 (f16x3, one, f16);
  f16x3 = svset3 (f16x3, 3 - 2, f16);
  f16x3 = svset3 (f16x3, 1.0, f16);
  f16x3 = svset3 (f16x3, const_sub (5, 4), f16);
  f16x3 = svset3 (f16x3, const_sub (6, 4), f16);
  f16x3 = svset3 (f16x3, const_sub (7, 4), f16); /* { dg-error {passing 3 to argument 2 of 'svset3', which expects a value in the range \[0, 2\]} } */
  f16x3 = svset3 (f16x3, const_sub (8, 4), f16); /* { dg-error {passing 4 to argument 2 of 'svset3', which expects a value in the range \[0, 2\]} } */
  f16x3 = svset3 (f16x3, add (0, 0), f16); /* { dg-error "argument 2 of 'svset3' must be an integer constant expression" } */

  return f64;
}
