// PR c++/51223

struct A
{
  A foo(void i = 0);  // { dg-error "incomplete type|invalid use" }
};

void bar()
{
  A().foo();
}

A A::foo(void i)  // { dg-error "incomplete type|invalid use" }
{
  return A();
}
