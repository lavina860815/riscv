#include <stdarg.h>

#include "compat-common.h"

#ifdef SKIP_VA
const int test_va = 0;
#else
const int test_va = 1;
#endif

#define T(NAME, TYPE, INITVAL)					\
extern TYPE g01##NAME, g02##NAME, g03##NAME, g04##NAME;		\
extern TYPE g05##NAME, g06##NAME, g07##NAME, g08##NAME;		\
extern TYPE g09##NAME, g10##NAME, g11##NAME, g12##NAME;		\
extern TYPE g13##NAME, g14##NAME, g15##NAME, g16##NAME;		\
								\
extern void check##NAME (TYPE x, TYPE v);			\
								\
void								\
init##NAME (TYPE *p, TYPE v)					\
{								\
  *p = v + INITVAL;						\
}								\
								\
void								\
checkg##NAME (void)						\
{								\
  check##NAME (g01##NAME,  1);					\
  check##NAME (g02##NAME,  2);					\
  check##NAME (g03##NAME,  3);					\
  check##NAME (g04##NAME,  4);					\
  check##NAME (g05##NAME,  5);					\
  check##NAME (g06##NAME,  6);					\
  check##NAME (g07##NAME,  7);					\
  check##NAME (g08##NAME,  8);					\
  check##NAME (g09##NAME,  9);					\
  check##NAME (g10##NAME, 10);					\
  check##NAME (g11##NAME, 11);					\
  check##NAME (g12##NAME, 12);					\
  check##NAME (g13##NAME, 13);					\
  check##NAME (g14##NAME, 14);					\
  check##NAME (g15##NAME, 15);					\
  check##NAME (g16##NAME, 16);					\
}								\
								\
void								\
test##NAME (TYPE x01, TYPE x02, TYPE x03, TYPE x04,		\
            TYPE x05, TYPE x06, TYPE x07, TYPE x08,		\
            TYPE x09, TYPE x10, TYPE x11, TYPE x12,		\
            TYPE x13, TYPE x14, TYPE x15, TYPE x16)		\
{								\
  check##NAME (x01,  1);					\
  check##NAME (x02,  2);					\
  check##NAME (x03,  3);					\
  check##NAME (x04,  4);					\
  check##NAME (x05,  5);					\
  check##NAME (x06,  6);					\
  check##NAME (x07,  7);					\
  check##NAME (x08,  8);					\
  check##NAME (x09,  9);					\
  check##NAME (x10, 10);					\
  check##NAME (x11, 11);					\
  check##NAME (x12, 12);					\
  check##NAME (x13, 13);					\
  check##NAME (x14, 14);					\
  check##NAME (x15, 15);					\
  check##NAME (x16, 16);					\
}								\
								\
void								\
testva##NAME (int n, ...)					\
{								\
  int i;							\
  va_list ap;							\
  if (test_va)							\
    {								\
      va_start (ap, n);						\
      for (i = 0; i < n; i++)					\
	{							\
	  TYPE t = va_arg (ap, TYPE);				\
	  check##NAME (t, i+1);					\
	}							\
      va_end (ap);						\
    }								\
}

T(ui, unsigned int, 51)
T(si, int, (-55))
T(ul, unsigned long, 61)
T(sl, long, (-66))
T(ull, unsigned long long, 71)
T(sll, long long, (-77))
T(d, double, 91.0)
T(ld, long double, 92.0)
