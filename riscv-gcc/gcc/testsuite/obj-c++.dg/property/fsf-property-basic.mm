/* Basic test, auto-generated getter/setter based on property name.  */
/* { dg-do run } */
/* { dg-xfail-run-if "Needs OBJC2 ABI" { *-*-darwin* && { lp64 && { ! objc2 } } } { "-fnext-runtime" } { "" } } */

#ifdef __cplusplus
extern "C" {
#endif

extern int printf (const char *fmt,...);
extern void abort (void);

#include <objc/objc.h>
#include <objc/runtime.h>

#ifdef __cplusplus
}
#endif

@interface Bar
{
@public
  Class isa;
  int FooBar;
}
+ (id) initialize;
+ (id) alloc ;
- (id) init;
- (int) whatIsFooBar;
@property int FooBar;
@end

@implementation Bar

+initialize { return self;}
+ (id) alloc { return class_createInstance (self, 0); }

- (id) init {return self;}

- (int) whatIsFooBar { return self->FooBar; }
@synthesize FooBar;
@end

int main(int argc, char *argv[]) {
  int res;
  Bar *f = [[Bar alloc] init];

  /* First, establish that the property getter & setter have been synthesized 
     and operate correctly.  */
  [f setFooBar:1];

  if ([f whatIsFooBar] != 1)
    { printf ("setFooBar did not set FooBar\n"); abort ();}
      
  res = [f FooBar];
    
  if (res != 1 )
    { printf ("[f FooBar] = %d\n",  res); abort ();}
  
  /* Now check the short-cut object.property syntax.  */
  /* Read... */
  res = f.FooBar;
  if (res != 1 )
    { printf ("f.FooBar = %d\n",  res); abort ();}
  
  /* .... write. */
  f.FooBar = 0;
  /* printf ("seems OK\n",  res); */
  return f.FooBar;
}

