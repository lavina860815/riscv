// { dg-do run }

extern "C" void abort ();

class A {
public:
  virtual A* getThis() { return this; }
};

class B {
int a;
public:
  virtual B* getThis() { return this; }
};

class AB : public A, public B {
public:
  virtual AB* getThis() { return this; }
};

int main ()
{
  AB ab;

  A* a = &ab;
  B* b = &ab;

  if (a->getThis() != a
      || b->getThis() != b)
    abort ();

  return 0;
}
