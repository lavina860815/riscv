// { dg-do assemble  }

template <class T>
class S2
{
public:
  static void f();
};

class S1
{
  template <class T>
  friend class S2;

  static int i;
};

template <class T>
void S2<T>::f() 
{
  S1::i = 3;
}

void g()
{
  S2<double>::f();
  S2<char>::f();
}
