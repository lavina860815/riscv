/* Positive test case for constant string layout.  */
/* Contributed by Ziemowit Laski  <zlaski@apple.com>.  */

/* { dg-do compile } */
/* { dg-options "-fconstant-string-class=MyConstantString" } */
/* { dg-options "-mno-constant-cfstrings -fconstant-string-class=MyConstantString" { target *-*-darwin* } } */ 

@interface MyBase {
  const char *p;
}
@end

@interface MyConstantString: MyBase {
  union {
    void     *u;
    unsigned char   *c;
  } _contents;
  unsigned int  _count;
}
@end

/* The NeXT runtime initializes the 'isa' pointer of string constants at
   compile time.  */
#ifdef __NEXT_RUNTIME__
extern void *_MyConstantStringClassReference;
#endif

MyConstantString *str = @"Hello";
