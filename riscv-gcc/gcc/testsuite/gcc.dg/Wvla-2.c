/* { dg-do compile } */
/* { dg-options "-std=c99 -Wvla" } */

extern void 
func (int i, int array[i]); /* { dg-warning "ISO C90 forbids variable length array 'array'" } */
