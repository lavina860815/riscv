// PR c++/28879
// { dg-options "" }
// { dg-require-effective-target alloca }

struct A
{
  int i;
  A(): i(1) {}
};

template<int> void foo()
{
  int x[A().i];
}

void f()
{
  foo<1>();
}
