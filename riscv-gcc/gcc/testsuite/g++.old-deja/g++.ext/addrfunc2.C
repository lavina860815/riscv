// { dg-do run  }
// { dg-options "-fms-extensions" }
// Test for implicit & on methods.
// Contributed by Jason Merrill <jason@cygnus.com>.

struct A {
  void f (int = 0) { }
};

int
main ()
{
  void (A::*p)(int) = 0;
  p = A::f;
  if (p != A::f)
    return 1;
}
