// { dg-do assemble  }
// GROUPS passed templates
template <class T>
void foo(T t) {}

void bar()
{
  (void (*)(int)) (void (*)(double)) &foo<double>;
}
