// PR middle-end/78201
// { dg-do compile }
// { dg-options "-O2" }
// { dg-require-effective-target alloca }

struct B { long d (); } *c;
long e;

void
foo ()
{
  char a[e] = "";
  c && c->d();
}
