/* { dg-do compile } */
/* { dg-options "-mfix-r10000" } */
/* { dg-final { scan-assembler-times "\tbeql\t" 3 } } */

/* { dg-message "note: '__sync_fetch_and_nand' changed semantics in GCC 4.4" "" { target *-*-* } 0 } */

NOMIPS16 int
f1 (int *z)
{
  return __sync_fetch_and_nand (z, 42);
}

NOMIPS16 short
f2 (short *z)
{
  return __sync_fetch_and_nand (z, 42);
}

NOMIPS16 char
f3 (char *z)
{
  return __sync_fetch_and_nand (z, 42);
}
