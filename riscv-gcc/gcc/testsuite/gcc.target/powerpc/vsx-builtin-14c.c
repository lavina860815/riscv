/* { dg-do run } */
/* { dg-require-effective-target vmx_hw } */
/* { dg-options "-maltivec" } */

/* This test should run the same on any target that supports altivec/vmx
   instructions.  Intentionally not specifying cpu in order to test
   all code generation paths.  */

#include <altivec.h>

extern void abort (void);

#define CONST0		((float) (3.1415926539))
#define CONST1		((float) (3.1415926539 * 2))
#define CONST2		((float) (3.1415926539 * 3))
#define CONST3		((float) (3.1415926539 * 4))

/* Test that indices > length of vector are applied modulo the vector
   length.  */

/* Test for vector residing in register.  */
vector float e0(vector float v, float x)
{
  return vec_insert (x, v, 0);
}

vector float e1(vector float v, float x)
{
  return vec_insert (x, v, 1);
}

vector float e7(vector float v, float x)
{
  return vec_insert (x, v, 7);
}

vector float e8(vector float v, float x)
{
  return vec_insert (x, v, 8);
}

/* Test for vector residing in memory.  */
vector float me0(vector float *vp, float x)
{
  return vec_insert (x, *vp, 0);
}

vector float me1(vector float *vp, float x)
{
  return vec_insert (x, *vp, 1);
}

vector float me13(vector float *vp, float x)
{
  return vec_insert (x, *vp, 13);
}

vector float me15(vector float *vp, float x)
{
  return vec_insert (x, *vp, 15);
}

/* Test the same with variable indices.  */

/* Test for variable selector and vector residing in register.  */
__attribute__((noinline))
vector float ei(vector float v, int i, float x)
{
  return vec_insert (x, v, i);
}

/* Test for variable selector and vector residing in memory.  */
__attribute__((noinline))
vector float mei(vector float *vp, int i, float x)
{
  return vec_insert (x, *vp, i);
}


int main (int argc, char *argv[]) {
  vector float dv = { CONST0, CONST1, CONST2, CONST3 };
  float d;

  dv = e0 (dv, CONST3);
  if (dv [0] != CONST3)
    abort ();

  dv = e1 (dv, CONST0);
  if (dv [1] != CONST0)
    abort ();

  dv = e7 (dv, CONST2);
  if (dv [3] != CONST2)
    abort ();

  dv = e8 (dv, CONST1);
  if (dv [0] != CONST1)
    abort ();

  dv = me0 (&dv, CONST2);
  if (dv [0] != CONST2)
    abort ();

  dv = me1 (&dv, CONST3);
  if (dv [1] != CONST3)
    abort ();

  dv = me13 (&dv, CONST2);
  if (dv [1] != CONST2)
    abort ();

  dv = me15 (&dv, CONST1);
  if (dv [3] != CONST1)
    abort ();

  dv = ei (dv, 0, CONST3);
  if (dv [0] != CONST3)
    abort ();

  dv = ei (dv, 2, CONST1);
  if (dv [2] != CONST1)
    abort ();

  dv = ei (dv, 11, CONST0);
  if (dv [3] != CONST0)
    abort ();

  dv = ei (dv, 17, CONST2);
  if (dv [1] != CONST2)
    abort ();

  dv = mei (&dv, 0, CONST1);
  if (dv [0] != CONST1)
    abort ();

  dv = mei (&dv, 1, CONST0);
  if (dv [1] != CONST0)
    abort ();

  dv = mei (&dv, 15, CONST1);
  if (dv [3] != CONST1)
    abort ();

  dv = mei (&dv, 6, CONST0);
  if (dv [2] != CONST0)
    abort ();

  return 0;
}
