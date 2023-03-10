extern void abort (void);

poly8x16x2_t
test_vuzpqp8 (poly8x16_t _a, poly8x16_t _b)
{
  return vuzpq_p8 (_a, _b);
}

int
main (int argc, char **argv)
{
  int i;
  poly8_t first[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
  poly8_t second[] =
      {17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32};
  poly8x16x2_t result = test_vuzpqp8 (vld1q_p8 (first), vld1q_p8 (second));
  poly8_t exp1[] = {1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31};
  poly8_t exp2[] = {2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32};
  poly8x16_t expect1 = vld1q_p8 (exp1);
  poly8x16_t expect2 = vld1q_p8 (exp2);

  for (i = 0; i < 16; i++)
    if ((result.val[0][i] != expect1[i]) || (result.val[1][i] != expect2[i]))
      abort ();

  return 0;
}
