/* { dg-do compile } */
/* { dg-require-effective-target arm_v8_vfp_ok } */
/* { dg-options "-O2" } */
/* { dg-add-options arm_v8_vfp } */

float
foo (float x)
{
  return __builtin_roundf (x);
}

/* { dg-final { scan-assembler-times "vrinta.f32\ts\[0-9\]+" 1 } } */
