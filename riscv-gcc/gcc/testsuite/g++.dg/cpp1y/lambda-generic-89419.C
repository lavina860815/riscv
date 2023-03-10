// PR c++/89419
// { dg-do compile { target c++14 } }

struct A;
struct B {
  struct C { C (); C (C &); } b;
};
struct D { A operator* (); };
struct A {
  template <typename T> void foo (T x) { x (this); }
};
struct E {
  auto bar () { return e; }
  D e;
};
struct F { B f; int g; };

int
main ()
{
  E e;
  auto f = *e.bar ();
  auto i = [&] { F g; g.g = 1; auto h = [&](auto) { g.g = 0; }; f.foo (h); return g; };
}
