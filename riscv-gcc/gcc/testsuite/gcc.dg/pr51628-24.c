/* PR c/51628.  */
/* { dg-do compile } */
/* { dg-options "-O -Wno-incompatible-pointer-types" } */

struct A {
  int i;
} __attribute__ ((packed));

short* f2 (struct A *p) { return &p->i; }
/* { dg-warning "may result in an unaligned pointer value" "" { target *-*-* } .-1 } */
