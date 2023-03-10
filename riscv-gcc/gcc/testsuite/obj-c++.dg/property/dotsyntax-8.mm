/* Contributed by Nicola Pero <nicola.pero@meta-innovation.com>, November 2010.  */
/* { dg-do run } */
/* { dg-xfail-run-if "Needs OBJC2 ABI" { *-*-darwin* && { lp64 && { ! objc2 } } } { "-fnext-runtime" } { "" } } */

/* Test the 'dot syntax' with typedefs.  */

#include <stdlib.h>
#include <objc/objc.h>
#include <objc/runtime.h>

static int c;

@interface MyRootClass
{
  Class isa;
  int a;
}
+ (id) initialize;
+ (id) alloc;
- (id) init;
- (int) count;
- (void) setCount: (int)count;
+ (int) classCount;
+ (void) setClassCount: (int)count;
@end

@implementation MyRootClass
+ (id) initialize { return self; }
+ (id) alloc { return class_createInstance (self, 0); }
- (id) init { return self; }
- (int) count
{
  return a;
}
- (void) setCount: (int)count
{
  a = count;
}
+ (int) classCount
{
  return c;
}
+ (void) setClassCount: (int)count
{
  c = count;
}
@end

typedef MyRootClass MyType;

int main (void)
{
  MyType *object = [[MyRootClass alloc] init];

  object.count = 1974;
  if (object.count != 1974)
    abort ();

  return 0;
}


