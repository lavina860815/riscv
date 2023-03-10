extern void abort (void);

int8x8x2_t
test_vzips8 (int8x8_t _a, int8x8_t _b)
{
  return vzip_s8 (_a, _b);
}

int
main (int argc, char **argv)
{
  int i;
  int8_t first[] = {1, 2, 3, 4, 5, 6, 7, 8};
  int8_t second[] = {9, 10, 11, 12, 13, 14, 15, 16};
  int8x8x2_t result = test_vzips8 (vld1_s8 (first), vld1_s8 (second));
  int8x8_t res1 = result.val[0], res2 = result.val[1];
  int8_t exp1[] = {1, 9, 2, 10, 3, 11, 4, 12};
  int8_t exp2[] = {5, 13, 6, 14, 7, 15, 8, 16};
  int8x8_t expected1 = vld1_s8 (exp1);
  int8x8_t expected2 = vld1_s8 (exp2);

  for (i = 0; i < 8; i++)
    if ((res1[i] != expected1[i]) || (res2[i] != expected2[i]))
      abort ();

  return 0;
}
