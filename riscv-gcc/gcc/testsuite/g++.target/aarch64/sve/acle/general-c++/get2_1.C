/* { dg-do compile } */
/* { dg-additional-options "-std=c++11 -Wall -Wextra" } */

#include <arm_sve.h>

constexpr uint64_t const_sub (uint64_t a, uint64_t b) { return a - b; }
uint64_t add (uint64_t a, uint64_t b) { return a + b; }

svfloat64_t
f1 (svbool_t pg, svuint8_t u8, svuint8x2_t u8x2, svuint8x3_t u8x3, int x)
{
  const int one = 1;
  svfloat64_t f64;

  u8 = svget2 (u8x2); /* { dg-error {no matching function for call to 'svget2\(svuint8x2_t\&\)'} } */
  u8 = svget2 (u8x2, 1, 2); /* { dg-error {no matching function for call to 'svget2\(svuint8x2_t\&, int, int\)'} } */
  u8 = svget2 (u8, 0); /* { dg-error {no matching function for call to 'svget2\(svuint8_t\&, int\)'} } */
  u8 = svget2 (u8x3, 0); /* { dg-error {no matching function for call to 'svget2\(svuint8x3_t\&, int\)'} } */
  u8 = svget2 (pg, 0); /* { dg-error {no matching function for call to 'svget2\(svbool_t\&, int\)'} } */
  u8 = svget2 (u8x2, x); /* { dg-error "argument 2 of 'svget2' must be an integer constant expression" } */
  u8 = svget2 (u8x2, 0);
  f64 = svget2 (u8x2, 0); /* { dg-error "cannot convert 'svuint8_t' to 'svfloat64_t' in assignment" } */
  u8 = svget2 (u8x2, 1);
  u8 = svget2 (u8x2, 2); /* { dg-error {passing 2 to argument 2 of 'svget2', which expects a value in the range \[0, 1\]} } */
  u8 = svget2 (u8x2, 3); /* { dg-error {passing 3 to argument 2 of 'svget2', which expects a value in the range \[0, 1\]} } */
  u8 = svget2 (u8x2, 4); /* { dg-error {passing 4 to argument 2 of 'svget2', which expects a value in the range \[0, 1\]} } */
  u8 = svget2 (u8x2, 5); /* { dg-error {passing 5 to argument 2 of 'svget2', which expects a value in the range \[0, 1\]} } */
  u8 = svget2 (u8x2, ~0U); /* { dg-error {passing [^ ]* to argument 2 of 'svget2', which expects a value in the range \[0, 1\]} } */
  u8 = svget2 (u8x2, one);
  u8 = svget2 (u8x2, 3 - 2);
  u8 = svget2 (u8x2, 1.0);
  u8 = svget2 (u8x2, const_sub (5, 4));
  u8 = svget2 (u8x2, const_sub (6, 4)); /* { dg-error {passing 2 to argument 2 of 'svget2', which expects a value in the range \[0, 1\]} } */
  u8 = svget2 (u8x2, const_sub (7, 4)); /* { dg-error {passing 3 to argument 2 of 'svget2', which expects a value in the range \[0, 1\]} } */
  u8 = svget2 (u8x2, const_sub (8, 4)); /* { dg-error {passing 4 to argument 2 of 'svget2', which expects a value in the range \[0, 1\]} } */
  u8 = svget2 (u8x2, add (0, 0)); /* { dg-error "argument 2 of 'svget2' must be an integer constant expression" } */

  return f64;
}
