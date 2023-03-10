// PR c++/83921
// { dg-options "" }
// { dg-do compile { target c++11 } }

struct test { const int *addr; };

const test* setup()
{
  static constexpr test atest =
    { ({ int inner; (const int*)(0); }) };  // { dg-error "uninitialized" "" { target c++17_down } }

  return &atest;
}
