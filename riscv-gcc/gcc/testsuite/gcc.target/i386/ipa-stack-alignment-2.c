/* { dg-do compile } */
/* { dg-options "-flive-patching -O -fomit-frame-pointer" } */

typedef struct {
  long a;
  long b[];
} c;

c *d;
void e() { d->b[0] = 5; }
void f() { e(); }

/* { dg-final { scan-assembler "sub.*%.sp" } } */
