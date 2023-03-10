/* Execution test for argument passing with SSE and local functions
   Written by Paolo Bonzini, 25 January 2005 */

/* { dg-do run } */
/* { dg-options "-O2 -msse -mfpmath=sse" } */
/* { dg-require-effective-target sse } */

#include "sse-check.h"

#include <assert.h>

static float xs (void)
{
  return 3.14159265;
}

float ys (float a)
{
  return xs () * a;
}

static double xd (void)
{
  return 3.1415926535;
}

double yd (double a)
{
  return xd () * a;
}

static void
sse_test (void)
{
  assert (ys (1) == xs ());
  assert (ys (2) == xs () * 2);
  assert (yd (1) == xd ());
  assert (yd (2) == xd () * 2);
}
