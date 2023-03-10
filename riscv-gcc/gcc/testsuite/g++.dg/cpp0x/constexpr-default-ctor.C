// { dg-do compile { target c++11 } }

struct A {
  int i;
  constexpr A():i(42) { };
};
struct B: A { };
constexpr int f(B b) { return b.i; }

struct C { C(); };	       // { dg-message "" }
struct D: C { };	       // { dg-message "" }
constexpr int g(D d) { return 42; } // { dg-error "invalid type" }
