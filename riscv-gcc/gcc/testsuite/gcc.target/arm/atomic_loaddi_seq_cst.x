#include <stdatomic.h>

atomic_ullong foo;
int glob;

int
main (void)
{
  atomic_load_explicit (&foo, memory_order_seq_cst);
  return glob;
}
