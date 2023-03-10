// { dg-do compile }
// { dg-options "-O -fpartial-inlining -flto -fconserve-stack -fcompare-debug" }
// { dg-require-effective-target lto }
// { dg-xfail-if "AIX compare debug" { powerpc-ibm-aix* } }

void end (int, int) __attribute__ ((__noreturn__));

struct S
{
  int i;
  S *s;
};

inline bool f (S *s)
{
  if (!s->s)
    end (0, 0);
  return s->s == s;
}

inline bool
baz (S s1, S)
{
  while (f (&s1));

  return true;
}

inline bool
bar (S s1, S s2, S)
{
  return baz (s1, s2);
}

S getS ();

bool
foo ()
{
  return bar (getS (), getS (), getS ());
}
