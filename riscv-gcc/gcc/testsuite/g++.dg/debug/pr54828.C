// PR debug/54828
// { dg-do compile }
// { dg-options "-g" }
// { dg-require-effective-target alloca }

struct T { T (); virtual ~T (); };
struct S : public virtual T { S (); virtual ~S (); };
int v;
void foo (char *);

S::S ()
{
  char s[v];
  foo (s);
}
