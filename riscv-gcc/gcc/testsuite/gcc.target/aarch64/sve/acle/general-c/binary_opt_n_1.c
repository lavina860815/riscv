/* { dg-do compile } */

#include <arm_sve.h>

svuint8_t
f1 (svbool_t pg, svuint8_t u8, svint8_t s8)
{
  svadd_u8_x (pg, u8, s8); /* { dg-error {incompatible type for argument 3 of 'svadd_u8_x'} } */
  svadd_u8_x (pg, u8); /* { dg-error {too few arguments to function 'svadd_u8_x'} } */
  svadd_u8_x (pg, u8, u8, u8); /* { dg-error {too many arguments to function 'svadd_u8_x'} } */
  return svadd_s8_x (pg, s8, s8); /* { dg-error {incompatible types when returning type 'svint8_t' but 'svuint8_t' was expected} } */
}
