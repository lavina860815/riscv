/* This file tests that things are encoded using the gcc-3.3 ABI which is only
   used by the NeXT runtime.  */
/* Test for graceful encoding of const-qualified fields and parameters.  */
/* Author: Ziemowit Laski  <zlaski@apple.com>  */

/* { dg-do compile } */
/* { dg-skip-if "" { *-*-* } { "-fgnu-runtime" } { "" } } */

struct Cxx {
  const struct Cxx *next;
};

@interface ObjC {
  const struct Cxx *obj;
}
- (ObjC *)initWithCxx: (struct Cxx *const)c and: (const struct Cxx *)d;
@end

@implementation ObjC
- (ObjC *)initWithCxx: (struct Cxx *const)c and: (const struct Cxx *)d {
  obj = d;
  return self;
}
@end 

/* { dg-final { scan-assembler "@\[0-9\]+@0:\[0-9\]+\\^{Cxx=\\^{Cxx}}\[0-9\]+r\\^{Cxx=\\^{Cxx}}" } } */
