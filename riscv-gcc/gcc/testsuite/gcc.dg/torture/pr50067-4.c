/* { dg-do run } */

/* Verify we do not get a bogus access function with 0B vs. 1B which
   disambiguates both accesses and leads to vectorization.  */

extern int memcmp(const void *, const void *, __SIZE_TYPE__);
extern void abort (void);
short a[33] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31 };
short b[33] = { 0, };
int main()
{
#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
  int i;
  if (sizeof (short) == 2)
    {
      for (i = 0; i < 64; ++i)
	{
	  (*((char(*)[])&a[1]))[i] = (*((char(*)[])&a[0]))[i+1];
	}
      if (memcmp (&a, &b, sizeof (a)) != 0)
	abort ();
    }
#endif
  return 0;
}
