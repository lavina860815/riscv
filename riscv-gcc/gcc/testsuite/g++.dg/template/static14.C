struct Base {
  int x;
};

template <typename T>
struct A {
  static const int N = sizeof(static_cast<Base*>(T()));
  int a[N];
};

struct Derived : Base {
  A<Derived*> a;
};
