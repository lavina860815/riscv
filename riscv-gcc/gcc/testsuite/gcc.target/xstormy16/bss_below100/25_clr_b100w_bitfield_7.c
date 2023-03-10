/* { dg-options { -nostartfiles below100.o -Tbelow100.ld -O2 } } */
/* { dg-final { scan-assembler "clr1 B100,#7" } } */

typedef struct
{
  unsigned short b0:1;
  unsigned short b1:1;
  unsigned short b2:1;
  unsigned short b3:1;
  unsigned short b4:1;
  unsigned short b5:1;
  unsigned short b6:1;
  unsigned short b7:1;
  unsigned short b8:1;
  unsigned short b9:1;
  unsigned short b10:1;
  unsigned short b11:1;
  unsigned short b12:1;
  unsigned short b13:1;
  unsigned short b14:1;
  unsigned short b15:1;
} BitField;

char acDummy[0xf0] __attribute__ ((__BELOW100__));
BitField B100 __attribute__ ((__BELOW100__));
unsigned short *p = (unsigned short *) &B100;

void
Do (void)
{
  B100.b7 = 0;
}

int
main (void)
{
  *p = 0xedcb;
  Do ();
  return (*p == 0xed4b) ? 0 : 1;
}
