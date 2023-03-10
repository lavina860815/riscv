extern void abort (void);

uint16x8x2_t
test_vuzpqu16 (uint16x8_t _a, uint16x8_t _b)
{
  return vuzpq_u16 (_a, _b);
}

int
main (int argc, char **argv)
{
  int i;
  uint16_t first[] = {1, 2, 3, 4, 5, 6, 7, 8};
  uint16_t second[] = {9, 10, 11, 12, 13, 14, 15, 16};
  uint16x8x2_t result = test_vuzpqu16 (vld1q_u16 (first), vld1q_u16 (second));
  uint16_t exp1[] = {1, 3, 5, 7, 9, 11, 13, 15};
  uint16_t exp2[] = {2, 4, 6, 8, 10, 12, 14, 16};
  uint16x8_t expect1 = vld1q_u16 (exp1);
  uint16x8_t expect2 = vld1q_u16 (exp2);

  for (i = 0; i < 8; i++)
    if ((result.val[0][i] != expect1[i]) || (result.val[1][i] != expect2[i]))
      abort ();

  return 0;
}
