extern void abort (void);

uint16x4_t
test_vrev64u16 (uint16x4_t _arg)
{
  return vrev64_u16 (_arg);
}

int
main (int argc, char **argv)
{
  int i;
  uint16x4_t inorder = {1, 2, 3, 4};
  uint16x4_t reversed = test_vrev64u16 (inorder);
  uint16x4_t expected = {4, 3, 2, 1};

  for (i = 0; i < 4; i++)
    if (reversed[i] != expected[i])
      abort ();
  return 0;
}

