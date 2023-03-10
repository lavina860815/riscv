/* Test __MQLCLRHS.  */
/* { dg-options "-mcpu=fr450" } */
/* { dg-do run } */
extern void abort (void);
extern void exit (int);

int main ()
{
  struct { unsigned long long a, b, c; } entries[] = {
    { 0x10002000e800d800ULL, 0x0800080008000800ULL, 0x10002000e800d800ULL },
    { 0x10002000e800d800ULL, 0xf800f800f800f800ULL, 0xf000e00018002800ULL },
    { 0x1000100010001000ULL, 0xf000f80008001000ULL, 0x0000f00010000000ULL },
    { 0xf000f000f000f000ULL, 0xf000f80008001000ULL, 0x00001000f0000000ULL },
    { 0x8000800080008000ULL, 0x80007fff80010000ULL, 0x000080007fff8000ULL },
    { 0x7fff7fff7fff7fffULL, 0x80007fff80010000ULL, 0x0000000000007fffULL },
    { 0x8001800180018001ULL, 0x80007fff80010000ULL, 0x0000000000008001ULL },
    { 0x800080000001ffffULL, 0x0001ffff80008000ULL, 0x80007fff00000000ULL }
  };

  unsigned int i;

  for (i = 0; i < sizeof (entries) / sizeof (entries[0]); i++)
    if (__MQLCLRHS (entries[i].a, entries[i].b) != entries[i].c)
      abort ();

  exit (0);
}
