struct B;
struct A
{
  long a;
  struct B *foo;
};

static struct A *foo __attribute__((used));
