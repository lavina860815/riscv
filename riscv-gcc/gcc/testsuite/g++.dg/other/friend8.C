// PR c++/59480

class test {
  friend int foo(bool = true);  // { dg-error "14:friend declaration" }
  template<typename> friend int bar(bool = true);  // { dg-error "33:friend declaration" }
};
