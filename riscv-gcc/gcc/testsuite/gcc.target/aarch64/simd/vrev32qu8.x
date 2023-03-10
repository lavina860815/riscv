extern void abort (void);

uint8x16_t
test_vrev32qu8 (uint8x16_t _arg)
{
  return vrev32q_u8 (_arg);
}

int
main (int argc, char **argv)
{
  int i;
  uint8x16_t inorder = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
  uint8x16_t reversed = test_vrev32qu8 (inorder);
  uint8x16_t expected = {4, 3, 2, 1, 8, 7, 6, 5, 12, 11, 10, 9, 16, 15, 14, 13};

  for (i = 0; i < 16; i++)
    if (reversed[i] != expected[i])
      abort ();
  return 0;
}

