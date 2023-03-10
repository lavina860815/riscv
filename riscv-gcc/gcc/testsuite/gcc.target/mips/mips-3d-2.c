/* { dg-do run } */
/* { dg-options "-mips3d forbid_cpu=octeon.* (REQUIRES_STDLIB)" } */

/* Test MIPS-3D branch-if-any-two builtin functions */
#include <stdlib.h>
#include <stdio.h>

typedef float v2sf __attribute__ ((vector_size(8)));

NOMIPS16 int test0 (v2sf a, v2sf b);
NOMIPS16 int test1 (v2sf a, v2sf b);
NOMIPS16 int test2 (v2sf a, v2sf b);
NOMIPS16 int test3 (v2sf a, v2sf b);
NOMIPS16 int test4 (v2sf a, v2sf b);
NOMIPS16 int test5 (v2sf a, v2sf b);
NOMIPS16 int test6 (v2sf a, v2sf b);
NOMIPS16 int test7 (v2sf a, v2sf b);
NOMIPS16 int test8 (v2sf a, v2sf b);
NOMIPS16 int test9 (v2sf a, v2sf b);
NOMIPS16 int test10 (v2sf a, v2sf b);
NOMIPS16 int test11 (v2sf a, v2sf b);
NOMIPS16 int test12 (v2sf a, v2sf b);
NOMIPS16 int test13 (v2sf a, v2sf b);
NOMIPS16 int test14 (v2sf a, v2sf b);
NOMIPS16 int test15 (v2sf a, v2sf b);
NOMIPS16 int test16 (v2sf a, v2sf b);
NOMIPS16 int test17 (v2sf a, v2sf b);
NOMIPS16 int test18 (v2sf a, v2sf b);
NOMIPS16 int test19 (v2sf a, v2sf b);
NOMIPS16 int test20 (v2sf a, v2sf b);
NOMIPS16 int test21 (v2sf a, v2sf b);
NOMIPS16 int test22 (v2sf a, v2sf b);
NOMIPS16 int test23 (v2sf a, v2sf b);
NOMIPS16 int test24 (v2sf a, v2sf b);
NOMIPS16 int test25 (v2sf a, v2sf b);
NOMIPS16 int test26 (v2sf a, v2sf b);
NOMIPS16 int test27 (v2sf a, v2sf b);
NOMIPS16 int test28 (v2sf a, v2sf b);
NOMIPS16 int test29 (v2sf a, v2sf b);
NOMIPS16 int test30 (v2sf a, v2sf b);
NOMIPS16 int test31 (v2sf a, v2sf b);

float qnan = 1.0f/0.0f - 1.0f/0.0f;

NOMIPS16 int main ()
{
  v2sf a, b, c, d;
  int i, j;

  /* c.eq.ps */
  a = (v2sf) {12, 34};
  b = (v2sf) {56, 78};
  i = 0;
  j = 0;
  if (__builtin_mips_any_c_eq_ps(a, b) != i)
     abort ();
  if (__builtin_mips_all_c_eq_ps(a, b) != j)
     abort ();

  /* c.eq.ps */
  a = (v2sf) {12, 34};
  b = (v2sf) {12, 78};
  i = 1;
  j = 0;
  if (__builtin_mips_any_c_eq_ps(a, b) != i)
     abort ();
  if (__builtin_mips_all_c_eq_ps(a, b) != j)
     abort ();

  /* c.eq.ps */
  a = (v2sf) {12, 34};
  b = (v2sf) {56, 34};
  i = 1;
  j = 0;
  if (__builtin_mips_any_c_eq_ps(a, b) != i)
     abort ();
  if (__builtin_mips_all_c_eq_ps(a, b) != j)
     abort ();

  /* c.eq.ps */
  a = (v2sf) {12, 34};
  b = (v2sf) {12, 34};
  i = 1;
  j = 1;
  if (__builtin_mips_any_c_eq_ps(a, b) != i)
     abort ();
  if (__builtin_mips_all_c_eq_ps(a, b) != j)
     abort ();

  /* Test with 16 operators */
  a = (v2sf) {10.58, 1984.0};
  b = (v2sf) {567.345, 1984.0};

  i = test0 (a, b);
  if (i != 0)
    abort ();
  i = test1 (a, b);
  if (i != 0)
    abort ();
  i = test2 (a, b);
  if (i != 0)
    abort ();
  i = test3 (a, b);
  if (i != 0)
    abort ();
  i = test4 (a, b);
  if (i != 1)
    abort ();
  i = test5 (a, b);
  if (i != 0)
    abort ();
  i = test6 (a, b);
  if (i != 1)
    abort ();
  i = test7 (a, b);
  if (i != 0)
    abort ();
  i = test8 (a, b);
  if (i != 1)
    abort ();
  i = test9 (a, b);
  if (i != 0)
    abort ();
  i = test10 (a, b);
  if (i != 1)
    abort ();
  i = test11 (a, b);
  if (i != 0)
    abort ();
  i = test12 (a, b);
  if (i != 1)
    abort ();
  i = test13 (a, b);
  if (i != 1)
    abort ();
  i = test14 (a, b);
  if (i != 1)
    abort ();
  i = test15 (a, b);
  if (i != 1)
    abort ();
  i = test16 (a, b);
  if (i != 0)
    abort ();
  i = test17 (a, b);
  if (i != 0)
    abort ();
  i = test18 (a, b);
  if (i != 0)
    abort ();
  i = test19 (a, b);
  if (i != 0)
    abort ();
  i = test20 (a, b);
  if (i != 1)
    abort ();
  i = test21 (a, b);
  if (i != 0)
    abort ();
  i = test22 (a, b);
  if (i != 1)
    abort ();
  i = test23 (a, b);
  if (i != 0)
    abort ();
  i = test24 (a, b);
  if (i != 1)
    abort ();
  i = test25 (a, b);
  if (i != 0)
    abort ();
  i = test26 (a, b);
  if (i != 1)
    abort ();
  i = test27 (a, b);
  if (i != 0)
    abort ();
  i = test28 (a, b);
  if (i != 1)
    abort ();
  i = test29 (a, b);
  if (i != 1)
    abort ();
  i = test30 (a, b);
  if (i != 1)
    abort ();
  i = test31 (a, b);
  if (i != 1)
    abort ();

  /* Reverse arguments */
  i = test0 (b, a);
  if (i != 0)
    abort ();
  i = test1 (b, a);
  if (i != 0)
    abort ();
  i = test2 (b, a);
  if (i != 0)
    abort ();
  i = test3 (b, a);
  if (i != 0)
    abort ();
  i = test4 (b, a);
  if (i != 1)
    abort ();
  i = test5 (b, a);
  if (i != 0)
    abort ();
  i = test6 (b, a);
  if (i != 1)
    abort ();
  i = test7 (b, a);
  if (i != 0)
    abort ();
  i = test8 (b, a);
  if (i != 0)
    abort ();
  i = test9 (b, a);
  if (i != 0)
    abort ();
  i = test10 (b, a);
  if (i != 0)
    abort ();
  i = test11 (b, a);
  if (i != 0)
    abort ();
  i = test12 (b, a);
  if (i != 1)
    abort ();
  i = test13 (b, a);
  if (i != 0)
    abort ();
  i = test14 (b, a);
  if (i != 1)
    abort ();
  i = test15 (b, a);
  if (i != 0)
    abort ();
  i = test16 (b, a);
  if (i != 0)
    abort ();
  i = test17 (b, a);
  if (i != 0)
    abort ();
  i = test18 (b, a);
  if (i != 0)
    abort ();
  i = test19 (b, a);
  if (i != 0)
    abort ();
  i = test20 (b, a);
  if (i != 1)
    abort ();
  i = test21 (b, a);
  if (i != 0)
    abort ();
  i = test22 (b, a);
  if (i != 1)
    abort ();
  i = test23 (b, a);
  if (i != 0)
    abort ();
  i = test24 (b, a);
  if (i != 0)
    abort ();
  i = test25 (b, a);
  if (i != 0)
    abort ();
  i = test26 (b, a);
  if (i != 0)
    abort ();
  i = test27 (b, a);
  if (i != 0)
    abort ();
  i = test28 (b, a);
  if (i != 1)
    abort ();
  i = test29 (b, a);
  if (i != 0)
    abort ();
  i = test30 (b, a);
  if (i != 1)
    abort ();
  i = test31 (b, a);
  if (i != 0)
    abort ();

#ifndef __FAST_MATH__
  /* Test with 16 operators */
  a = (v2sf) {qnan, qnan};
  b = (v2sf) {567.345, 1984.0};

  i = test0 (a, b);
  if (i != 0)
    abort ();
  i = test1 (a, b);
  if (i != 0)
    abort ();
  i = test2 (a, b);
  if (i != 1)
    abort ();
  i = test3 (a, b);
  if (i != 1)
    abort ();
  i = test4 (a, b);
  if (i != 0)
    abort ();
  i = test5 (a, b);
  if (i != 0)
    abort ();
  i = test6 (a, b);
  if (i != 1)
    abort ();
  i = test7 (a, b);
  if (i != 1)
    abort ();
  i = test8 (a, b);
  if (i != 0)
    abort ();
  i = test9 (a, b);
  if (i != 0)
    abort ();
  i = test10 (a, b);
  if (i != 1)
    abort ();
  i = test11 (a, b);
  if (i != 1)
    abort ();
  i = test12 (a, b);
  if (i != 0)
    abort ();
  i = test13 (a, b);
  if (i != 0)
    abort ();
  i = test14 (a, b);
  if (i != 1)
    abort ();
  i = test15 (a, b);
  if (i != 1)
    abort ();
  i = test16 (a, b);
  if (i != 0)
    abort ();
  i = test17 (a, b);
  if (i != 0)
    abort ();
  i = test18 (a, b);
  if (i != 1)
    abort ();
  i = test19 (a, b);
  if (i != 1)
    abort ();
  i = test20 (a, b);
  if (i != 0)
    abort ();
  i = test21 (a, b);
  if (i != 0)
    abort ();
  i = test22 (a, b);
  if (i != 1)
    abort ();
  i = test23 (a, b);
  if (i != 1)
    abort ();
  i = test24 (a, b);
  if (i != 0)
    abort ();
  i = test25 (a, b);
  if (i != 0)
    abort ();
  i = test26 (a, b);
  if (i != 1)
    abort ();
  i = test27 (a, b);
  if (i != 1)
    abort ();
  i = test28 (a, b);
  if (i != 0)
    abort ();
  i = test29 (a, b);
  if (i != 0)
    abort ();
  i = test30 (a, b);
  if (i != 1)
    abort ();
  i = test31 (a, b);
  if (i != 1)
    abort ();
#endif

  printf ("Test Passes\n");
  exit (0);
}

NOMIPS16 int test0 (v2sf a, v2sf b)
{
  return __builtin_mips_any_c_f_ps (a, b);
}

NOMIPS16 int test1 (v2sf a, v2sf b)
{
  return __builtin_mips_all_c_f_ps (a, b);
}

NOMIPS16 int test2 (v2sf a, v2sf b)
{
  return __builtin_mips_any_c_un_ps (a, b);
}

NOMIPS16 int test3 (v2sf a, v2sf b)
{
  return __builtin_mips_all_c_un_ps (a, b);
}

NOMIPS16 int test4 (v2sf a, v2sf b)
{
  return __builtin_mips_any_c_eq_ps (a, b);
}

NOMIPS16 int test5 (v2sf a, v2sf b)
{
  return __builtin_mips_all_c_eq_ps (a, b);
}

NOMIPS16 int test6 (v2sf a, v2sf b)
{
  return __builtin_mips_any_c_ueq_ps (a, b);
}

NOMIPS16 int test7 (v2sf a, v2sf b)
{
  return __builtin_mips_all_c_ueq_ps (a, b);
}

NOMIPS16 int test8 (v2sf a, v2sf b)
{
  return __builtin_mips_any_c_olt_ps (a, b);
}

NOMIPS16 int test9 (v2sf a, v2sf b)
{
  return __builtin_mips_all_c_olt_ps (a, b);
}

NOMIPS16 int test10 (v2sf a, v2sf b)
{
  return __builtin_mips_any_c_ult_ps (a, b);
}

NOMIPS16 int test11 (v2sf a, v2sf b)
{
  return __builtin_mips_all_c_ult_ps (a, b);
}

NOMIPS16 int test12 (v2sf a, v2sf b)
{
  return __builtin_mips_any_c_ole_ps (a, b);
}

NOMIPS16 int test13 (v2sf a, v2sf b)
{
  return __builtin_mips_all_c_ole_ps (a, b);
}

NOMIPS16 int test14 (v2sf a, v2sf b)
{
  return __builtin_mips_any_c_ule_ps (a, b);
}

NOMIPS16 int test15 (v2sf a, v2sf b)
{
  return __builtin_mips_all_c_ule_ps (a, b);
}

NOMIPS16 int test16 (v2sf a, v2sf b)
{
  return __builtin_mips_any_c_sf_ps (a, b);
}

NOMIPS16 int test17 (v2sf a, v2sf b)
{
  return __builtin_mips_all_c_sf_ps (a, b);
}

NOMIPS16 int test18 (v2sf a, v2sf b)
{
  return __builtin_mips_any_c_ngle_ps (a, b);
}

NOMIPS16 int test19 (v2sf a, v2sf b)
{
  return __builtin_mips_all_c_ngle_ps (a, b);
}

NOMIPS16 int test20 (v2sf a, v2sf b)
{
  return __builtin_mips_any_c_seq_ps (a, b);
}

NOMIPS16 int test21 (v2sf a, v2sf b)
{
  return __builtin_mips_all_c_seq_ps (a, b);
}

NOMIPS16 int test22 (v2sf a, v2sf b)
{
  return __builtin_mips_any_c_ngl_ps (a, b);
}

NOMIPS16 int test23 (v2sf a, v2sf b)
{
  return __builtin_mips_all_c_ngl_ps (a, b);
}

NOMIPS16 int test24 (v2sf a, v2sf b)
{
  return __builtin_mips_any_c_lt_ps (a, b);
}

NOMIPS16 int test25 (v2sf a, v2sf b)
{
  return __builtin_mips_all_c_lt_ps (a, b);
}

NOMIPS16 int test26 (v2sf a, v2sf b)
{
  return __builtin_mips_any_c_nge_ps (a, b);
}

NOMIPS16 int test27 (v2sf a, v2sf b)
{
  return __builtin_mips_all_c_nge_ps (a, b);
}

NOMIPS16 int test28 (v2sf a, v2sf b)
{
  return __builtin_mips_any_c_le_ps (a, b);
}

NOMIPS16 int test29 (v2sf a, v2sf b)
{
  return __builtin_mips_all_c_le_ps (a, b);
}

NOMIPS16 int test30 (v2sf a, v2sf b)
{
  return __builtin_mips_any_c_ngt_ps (a, b);
}

NOMIPS16 int test31 (v2sf a, v2sf b)
{
  return __builtin_mips_all_c_ngt_ps (a, b);
}
