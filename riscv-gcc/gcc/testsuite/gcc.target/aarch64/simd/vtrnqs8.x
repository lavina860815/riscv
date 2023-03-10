extern void abort (void);

int8x16x2_t
test_vtrnqs8 (int8x16_t _a, int8x16_t _b)
{
  return vtrnq_s8 (_a, _b);
}

int
main (int argc, char **argv)
{
  int i;
  int8_t first[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
  int8_t second[] =
      {17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32};
  int8x16x2_t result = test_vtrnqs8 (vld1q_s8 (first), vld1q_s8 (second));
  int8x16_t res1 = result.val[0], res2 = result.val[1];
  int8_t exp1[] = {1, 17, 3, 19, 5, 21, 7, 23, 9, 25, 11, 27, 13, 29, 15, 31};
  int8_t exp2[] = {2, 18, 4, 20, 6, 22, 8, 24, 10, 26, 12, 28, 14, 30, 16, 32};
  int8x16_t expected1 = vld1q_s8 (exp1);
  int8x16_t expected2 = vld1q_s8 (exp2);

  for (i = 0; i < 16; i++)
    if ((res1[i] != expected1[i]) || (res2[i] != expected2[i]))
      abort ();

  return 0;
}
