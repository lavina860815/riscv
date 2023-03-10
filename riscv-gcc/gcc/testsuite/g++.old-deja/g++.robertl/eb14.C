// { dg-do run  }

extern "C" void abort ();

template<int N>
struct I {
};

template<class T>
struct A {

  int r;

  template<class T1, class T2>
  void operator()(T1, T2)
  { r = 0; }

  template<int N1, int N2>
  void operator()(I<N1>, I<N2>)
  { r = 1; }
};

int main()
{
    A<float> x;
    I<0> a;
    I<1> b;

    x(a,b);
    if (x.r != 1)
        abort();

    x(float(), double());
    if (x.r != 0)
        abort();

    return 0;
}


