// { dg-do compile { target c++14 } }

union U
{
  int x = (x = x + 1);
  char y;
};

constexpr U u = {}; // { dg-error "accessing uninitialized member" }
