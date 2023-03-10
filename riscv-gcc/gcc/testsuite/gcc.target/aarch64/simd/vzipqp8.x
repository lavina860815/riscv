extern void abort (void);

poly8x16x2_t
test_vzipqp8 (poly8x16_t _a, poly8x16_t _b)
{
  return vzipq_p8 (_a, _b);
}

int
main (int argc, char **argv)
{
  int i;
  poly8_t first[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
  poly8_t second[] =
      {17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32};
  poly8x16x2_t result = test_vzipqp8 (vld1q_p8 (first), vld1q_p8 (second));
  poly8x16_t res1 = result.val[0], res2 = result.val[1];
  poly8_t exp1[] = {1, 17, 2, 18, 3, 19, 4, 20, 5, 21, 6, 22, 7, 23, 8, 24};
  poly8_t exp2[] =
      {9, 25, 10, 26, 11, 27, 12, 28, 13, 29, 14, 30, 15, 31, 16, 32};
  poly8x16_t expected1 = vld1q_p8 (exp1);
  poly8x16_t expected2 = vld1q_p8 (exp2);

  for (i = 0; i < 16; i++)
    if ((res1[i] != expected1[i]) || (res2[i] != expected2[i]))
      abort ();

  return 0;
}
