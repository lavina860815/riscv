/* { dg-do compile } */
/* { dg-options "-O3 -mzarch -march=arch13 -mzvector" } */

#include <vecintrin.h>

unsigned char
vstrszb ()
{
  int cc;
  vector signed char haystack = { 'h', 'o', 'l', 'a', 'h', 'i', 'h', 'o',
				  'h', 'i', 'h', 'o' };
  vector signed char needle = { 'h', 'i', 'h', 'o' };
  vector unsigned char length = { 0 };
  vector unsigned char result
    = vec_search_string_until_zero_cc (haystack, needle, length, &cc);
  return result[7];
}

/* { dg-final { scan-assembler-times "vstrszb\t" 1 } } */

unsigned char
vstrszh ()
{
  int cc;
  vector signed short haystack = { 'h', 'o', 'l', 'a', 'h', 'i', 'h', 'o' };
  vector signed short needle = { 'h', 'i', 'h', 'o' };
  vector unsigned char length = { 0 };
  vector unsigned char result
    = vec_search_string_until_zero_cc (haystack, needle, length, &cc);
  return result[7];
}

/* { dg-final { scan-assembler-times "vstrszh\t" 1 } } */

unsigned char
vstrszf ()
{
  int cc;
  vector signed int haystack = { 'h', 'i', 'h', 'o' };
  vector signed int needle = { 'h', 'o' };
  vector unsigned char length = { 0 };
  vector unsigned char result
    = vec_search_string_until_zero_cc (haystack, needle, length, &cc);
  return result[7];
}

/* { dg-final { scan-assembler-times "vstrszf\t" 1 } } */
