/* { dg-options "-mgp64 (-mips16)" } */
/* { dg-final { scan-assembler "\tdivu\t" } } */
/* { dg-final { scan-assembler-not "\tmflo\t" } } */
/* { dg-final { scan-assembler "\tmfhi\t" } } */

typedef unsigned int SI __attribute__((mode(SI)));

MIPS16 SI
f (SI x, SI y)
{
  return x % y;
}
