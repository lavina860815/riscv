/* { dg-do run } */

#include <stdlib.h>

#define MASK_F(M)                                       \
  (0                                                    \
   | ((0xf == (0xf & ((M) >> (4*0)))) ? (1 << 0) : 0)   \
   | ((0xf == (0xf & ((M) >> (4*1)))) ? (1 << 1) : 0)   \
   | ((0xf == (0xf & ((M) >> (4*2)))) ? (1 << 2) : 0)   \
   | ((0xf == (0xf & ((M) >> (4*3)))) ? (1 << 3) : 0)   \
   | ((0xf == (0xf & ((M) >> (4*4)))) ? (1 << 4) : 0)   \
   | ((0xf == (0xf & ((M) >> (4*5)))) ? (1 << 5) : 0)   \
   | ((0xf == (0xf & ((M) >> (4*6)))) ? (1 << 6) : 0)   \
   | ((0xf == (0xf & ((M) >> (4*7)))) ? (1 << 7) : 0)   \
   | 0)

#define MASK_0_7(M)                                     \
  (0                                                    \
   | ((8 > (0xf & ((M) >> (4*0)))) ? (1 << 0) : 0)      \
   | ((8 > (0xf & ((M) >> (4*1)))) ? (1 << 1) : 0)      \
   | ((8 > (0xf & ((M) >> (4*2)))) ? (1 << 2) : 0)      \
   | ((8 > (0xf & ((M) >> (4*3)))) ? (1 << 3) : 0)      \
   | ((8 > (0xf & ((M) >> (4*4)))) ? (1 << 4) : 0)      \
   | ((8 > (0xf & ((M) >> (4*5)))) ? (1 << 5) : 0)      \
   | ((8 > (0xf & ((M) >> (4*6)))) ? (1 << 6) : 0)      \
   | ((8 > (0xf & ((M) >> (4*7)))) ? (1 << 7) : 0)      \
   | 0)

#define INSERT_BITS(M,B,V)                                              \
  (__extension__({                                                      \
      unsigned char _n, _r = 0;                                         \
      _n = 0xf & (M >> (4*0)); if (_n<8) _r |= (!!(B & (1 << _n))) << 0; \
      _n = 0xf & (M >> (4*1)); if (_n<8) _r |= (!!(B & (1 << _n))) << 1; \
      _n = 0xf & (M >> (4*2)); if (_n<8) _r |= (!!(B & (1 << _n))) << 2; \
      _n = 0xf & (M >> (4*3)); if (_n<8) _r |= (!!(B & (1 << _n))) << 3; \
      _n = 0xf & (M >> (4*4)); if (_n<8) _r |= (!!(B & (1 << _n))) << 4; \
      _n = 0xf & (M >> (4*5)); if (_n<8) _r |= (!!(B & (1 << _n))) << 5; \
      _n = 0xf & (M >> (4*6)); if (_n<8) _r |= (!!(B & (1 << _n))) << 6; \
      _n = 0xf & (M >> (4*7)); if (_n<8) _r |= (!!(B & (1 << _n))) << 7; \
      (unsigned char) ((V) & MASK_F(M)) | _r;                           \
    }))

#define MASK_USED(M) (MASK_F(M) | MASK_0_7(M))

#define TEST2(M,B,V)                                    \
  do {                                                  \
    __asm volatile (";" #M);                            \
    r1 = MASK_USED (M)                                  \
      & __builtin_avr_insert_bits (M,B,V);              \
    r2 = INSERT_BITS (M,B,V);                           \
    if (r1 != r2)                                       \
      abort ();                                         \
  } while(0)

#define TEST1(M,X)                                      \
  do {                                                  \
    TEST2 (M,X,0x00); TEST2 (M,0x00,X);                 \
    TEST2 (M,X,0xff); TEST2 (M,0xff,X);                 \
    TEST2 (M,X,0xaa); TEST2 (M,0xaa,X);                 \
    TEST2 (M,X,0xcc); TEST2 (M,0xcc,X);                 \
    TEST2 (M,X,0x96); TEST2 (M,0x96,X);                 \
  } while(0)



void test8 (void)
{
  unsigned char r1, r2;
  unsigned char ib;

  static const unsigned char V[] =
    {
      0, 0xaa, 0xcc, 0xf0, 0xff, 0x5b, 0x4d
    };

  for (ib = 0; ib < sizeof (V) / sizeof (*V); ib++)
    {
      unsigned char b = V[ib];
      
      TEST1 (0x76543210, b);
      TEST1 (0x3210ffff, b);
      TEST1 (0x67452301, b);
      TEST1 (0xf0f1f2f3, b);
      TEST1 (0xff10ff54, b);
      TEST1 (0x01234567, b);
      TEST1 (0xff765f32, b);
    }
}

/****************************************************************/

int main()
{
  test8();
  
  exit(0);
}
