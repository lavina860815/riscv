/* { dg-options { -nostartfiles below100.o -Tbelow100.ld -O2 } } */
/* { dg-final { scan-assembler "mov.w r.,32532" } } */

#define SFRA (*((volatile unsigned short*)0x7f14))
unsigned short *pA = (unsigned short *) 0x7f14;
#define SFRB (*((volatile unsigned short*)0x7f10))
unsigned short *pB = (unsigned short *) 0x7f10;

char *
Do (void)
{
  if (SFRA & 0x8000)
    {
      if (SFRB & 0x8000)
	return "Fail";
      else
	return "Success";
    }
  else
    return "Fail";
}

int
main (void)
{
  *pA = 0xedcb;
  *pB = 0x1234;
  return Do ()[0] == 'F';
}
