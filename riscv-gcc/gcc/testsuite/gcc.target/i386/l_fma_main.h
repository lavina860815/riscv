
#ifndef l_fma_main
#define l_fma_main

#if DEBUG
#include <stdio.h>
#endif

TYPE m1[32] = {
		1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16,
	       17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32
	      };
TYPE m2[32] = {
		2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16, 17,
	       18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33
	      };
TYPE m3[32] = {
		3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 
	       19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34
	      };
TYPE m4[32];
int test_fails = 0;

void
compare_result(char *title, TYPE *res)
{
  int i;
  int good = 1;
  for (i =0; i < 32; i++)
    if (m4[i] != res[i])
      {
        if (good)
          {
#if DEBUG
             printf ("!!!! %s miscompare\n", title);
#endif
             good = 0;
          }
#if DEBUG
        printf ("res[%d] = %d, must be %d\n", i, (int)res[i], (int) m4[i]);
#endif
      }
  if (!good)
    test_fails = 1;
}

static void fma_test ()
{
  test_noneg_add_noneg_add (m1, m2, m3, m4, 32);
  compare_result ("test0000", res_test0000);

  test_noneg_add_noneg_sub (m1, m2, m3, m4, 32);
  compare_result ("test0001", res_test0001);

  test_noneg_add_neg_add (m1, m2, m3, m4, 32);
  compare_result ("test0010", res_test0010);

  test_noneg_add_neg_sub (m1, m2, m3, m4, 32);
  compare_result ("test0011", res_test0011);

  test_noneg_sub_noneg_add (m1, m2, m3, m4, 32);
  compare_result ("test0100", res_test0100);

  test_noneg_sub_noneg_sub (m1, m2, m3, m4, 32);
  compare_result ("test0101", res_test0101);

  test_noneg_sub_neg_add (m1, m2, m3, m4, 32);
  compare_result ("test0110", res_test0110);

  test_noneg_sub_neg_sub (m1, m2, m3, m4, 32);
  compare_result ("test0111", res_test0111);

  test_neg_add_noneg_add (m1, m2, m3, m4, 32);
  compare_result ("test1000", res_test1000);

  test_neg_add_noneg_sub (m1, m2, m3, m4, 32);
  compare_result ("test1001", res_test1001);

  test_neg_add_neg_add (m1, m2, m3, m4, 32);
  compare_result ("test1010", res_test1010);

  test_neg_add_neg_sub (m1, m2, m3, m4, 32);
  compare_result ("test1011", res_test1011);

  test_neg_sub_noneg_add (m1, m2, m3, m4, 32);
  compare_result ("test1100", res_test1100);

  test_neg_sub_noneg_sub (m1, m2, m3, m4, 32);
  compare_result ("test1101", res_test1101);

  test_neg_sub_neg_add (m1, m2, m3, m4, 32);
  compare_result ("test1110", res_test1110);

  test_neg_sub_neg_sub (m1, m2, m3, m4, 32);
  compare_result ("test1111", res_test1111);

  if (test_fails) abort ();
}

#endif
