/* Contributed by Nicola Pero <nicola.pero@meta-innovation.com>, November 2010.  */
/* { dg-do compile } */

#include <objc/objc.h>

/* Test that if you have a property declared in a class and a
   category, the attributes match.  This is almost the same as
   at-property-16.m, but for a category.  It is a separate file
   because it is difficult to test multiple messages for the same
   line.  */

@interface MyRootClass
{
  Class isa;
}
@property (assign) id a;     /* { dg-line MyRootClass_property_a } */
@property (retain) id b;     /* { dg-line MyRootClass_property_b } */
@property int c;             /* { dg-line MyRootClass_property_c } */
@property (nonatomic) int d; /* { dg-line MyRootClass_property_d } */
@property int e;             /* { dg-line MyRootClass_property_e } */
@property int f;             /* { dg-line MyRootClass_property_f } */
@property int g;             /* { dg-line MyRootClass_property_g } */
@property (readonly) int h;
@property (readonly,getter=getMe) int i; /* { dg-line MyRootClass_property_i } */
@property (nonatomic) float j;
@end

@interface MyRootClass (Category)
@property (retain) id a;         /* { dg-warning "assign semantics attributes of property .a. conflict with previous declaration" } */
                                 /* { dg-message "originally specified here" "" { target *-*-* } MyRootClass_property_a } */
@property (assign) id b;         /* { dg-warning "assign semantics attributes of property .b. conflict with previous declaration" } */
                                 /* { dg-message "originally specified here" "" { target *-*-* } MyRootClass_property_b } */
@property (nonatomic) int c;     /* { dg-warning ".nonatomic. attribute of property .c. conflicts with previous declaration" } */
                                 /* { dg-message "originally specified here" "" { target *-*-* } MyRootClass_property_c } */
@property int d;                 /* { dg-warning ".nonatomic. attribute of property .d. conflicts with previous declaration" } */
                                 /* { dg-message "originally specified here" "" { target *-*-* } MyRootClass_property_d } */
@property (setter=setX:) int e;  /* { dg-warning ".setter. attribute of property .e. conflicts with previous declaration" } */
                                 /* { dg-message "originally specified here" "" { target *-*-* } MyRootClass_property_e } */
@property (getter=x) int f;      /* { dg-warning ".getter. attribute of property .f. conflicts with previous declaration" } */
                                 /* { dg-message "originally specified here" "" { target *-*-* } MyRootClass_property_f } */
@property (readonly) int g;      /* { dg-warning ".readonly. attribute of property .g. conflicts with previous declaration" } */
                                 /* { dg-message "originally specified here" "" { target *-*-* } MyRootClass_property_g } */
@property (readwrite) int h;     /* Ok */
@property (readonly) int i;      /* { dg-warning ".getter. attribute of property .i. conflicts with previous declaration" } */
                                 /* { dg-message "originally specified here" "" { target *-*-* } MyRootClass_property_i } */
@property (nonatomic) float j;   /* Ok */
@end
