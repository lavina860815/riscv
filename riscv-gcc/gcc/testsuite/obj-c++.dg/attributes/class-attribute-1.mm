/* { dg-do compile } */
/* { dg-skip-if "No API#2 pre-Darwin9" { *-*-darwin[5-8]* } { "-fnext-runtime" } { "" } } */

/* Test deprecate attribute with an @interface declaration.  */

#include <objc/objc.h>
#include <objc/runtime.h>

__attribute__ ((deprecated)) 
@interface DeprecatedClass
{
  Class isa;
}
+ (id) classObject;
+ (id) new;
@end

@implementation DeprecatedClass
+ (id) classObject { return self; }
+ (id) new { return nil; }
@end

@interface DeprecatedClass (Category) /* { dg-warning "is deprecated" } */
@end

@interface Subclass : DeprecatedClass /* { dg-warning "is deprecated" } */
@end

DeprecatedClass *object; /* { dg-warning "is deprecated" } */

int function (DeprecatedClass *object) /* { dg-warning "is deprecated" } */
{
  /* Note how the following deprecation warning is generated by
     "DeprecatedClass *", not by "[DeprecatedClass ...].  */
  DeprecatedClass *x = [DeprecatedClass new]; /* { dg-warning "is deprecated" } */

  if (x == object)
    return 0;
  else
    return 1;
}

id function2 (void)
{
  return DeprecatedClass.classObject; /* { dg-warning "is deprecated" } */
}

@interface NormalClass
{
  Class isa;
  DeprecatedClass *object; /* { dg-warning "is deprecated" } */
}
- (DeprecatedClass *)method; /* { dg-warning "is deprecated" } */
@end

@implementation NormalClass
- (DeprecatedClass *)method /* { dg-warning "is deprecated" } */
{
  return nil;
}
@end
