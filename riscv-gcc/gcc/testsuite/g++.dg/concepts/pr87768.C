// { dg-do compile { target c++17 } }
// { dg-options "-fconcepts" }

struct a {};
template <bool> using b = a;

template <typename> struct c;
template <typename d>
  requires requires(d e) { e[0]; }
struct c<d> {
  static constexpr bool f = [] { return false; }();
};

struct g : b<c<unsigned[]>::f> {};
