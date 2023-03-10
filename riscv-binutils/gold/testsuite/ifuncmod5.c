/* Test STT_GNU_IFUNC symbols without direct function call.  */
#include "ifunc-sel.h"

int global __attribute__ ((visibility ("hidden"))) = -1;

static int
one (void)
{
  return 1;
}

static int
minus_one (void)
{
  return -1;
}

static int
zero (void)
{
  return 0;
}

void * foo_ifunc (void) __asm__ ("foo");
__asm__(".type foo, %gnu_indirect_function");

void *
foo_ifunc (void)
{
  return ifunc_sel (one, minus_one, zero);
}

void * foo_hidden_ifunc (void) __asm__ ("foo_hidden");
__asm__(".type foo_hidden, %gnu_indirect_function");

void *
foo_hidden_ifunc (void)
{
  return ifunc_sel (minus_one, one, zero);
}

void * foo_protected_ifunc (void) __asm__ ("foo_protected");
__asm__(".type foo_protected, %gnu_indirect_function");

void *
foo_protected_ifunc (void)
{
  return ifunc_sel (one, zero, minus_one);
}

/* Test hidden indirect function.  */
__asm__(".hidden foo_hidden");

/* Test protected indirect function.  */
__asm__(".protected foo_protected");
