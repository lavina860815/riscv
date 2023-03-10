extern void abort (void);

poly16x8x2_t
test_vuzpqp16 (poly16x8_t _a, poly16x8_t _b)
{
  return vuzpq_p16 (_a, _b);
}

int
main (int argc, char **argv)
{
  int i;
  poly16_t first[] = {1, 2, 3, 4, 5, 6, 7, 8};
  poly16_t second[] = {9, 10, 11, 12, 13, 14, 15, 16};
  poly16x8x2_t result = test_vuzpqp16 (vld1q_p16 (first), vld1q_p16 (second));
  poly16_t exp1[] = {1, 3, 5, 7, 9, 11, 13, 15};
  poly16_t exp2[] = {2, 4, 6, 8, 10, 12, 14, 16};
  poly16x8_t expect1 = vld1q_p16 (exp1);
  poly16x8_t expect2 = vld1q_p16 (exp2);

  for (i = 0; i < 8; i++)
    if ((result.val[0][i] != expect1[i]) || (result.val[1][i] != expect2[i]))
      abort ();

  return 0;
}
