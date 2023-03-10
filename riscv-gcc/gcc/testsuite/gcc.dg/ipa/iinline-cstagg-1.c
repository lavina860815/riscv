/* { dg-do compile } */
/* { dg-options "-O3 -fdump-ipa-inline-details -fno-early-inlining -fno-ipa-sra -fno-ipa-cp" } */

typedef struct S
{
  int add_offset;
  int (*call)(int);
} S;

static int
bar (const S *f, int x)
{
  x = f->call(x);
  return x;
}

static int
thisisthetarget (int x)
{
  return x * x;
}

static const S s = {16, thisisthetarget};

int
outerfunction (int x)
{
  return bar (&s, x);
}

int
obfuscate (int x)
{
  return bar ((S *) 0, x);
}

/* { dg-final { scan-ipa-dump "thisisthetarget\[^\\n\]*inline copy in outerfunction"  "inline"  } } */
