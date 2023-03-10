// PR middle-end/83608
// { dg-do compile }
// { dg-options "-O2" }

template <typename> class B;
template <> struct B<float>
{
  float foo () { return __real__ b; }
  _Complex double b;
};

void bar (int);

template <class T>
void
baz ()
{
  B<T> h;
  T *a = (T *) &h;
  a[0] = a[1] = 6;
  h.foo () ? void () : bar (7);
}

int
main ()
{
  baz<float> ();
}
