/* { dg-do compile } */
/* { dg-options "-W -fdiagnostics-show-caret" } */

typedef const double cd;
double val;

const double val0() {return val;} /* { dg-warning "qualifiers ignored" } */
/* { dg-begin-multiline-output "" }
 const double val0() {return val;}
 ^~~~~
{ dg-end-multiline-output "" } */

volatile double val1() {return val;} /* { dg-warning "qualifiers ignored" } */
/* { dg-begin-multiline-output "" }
 volatile double val1() {return val;}
 ^~~~~~~~
{ dg-end-multiline-output "" } */

cd val2() {return val;} /* { dg-warning "qualifiers ignored" } */
/* { dg-begin-multiline-output "" }
 cd val2() {return val;}
 ^~
{ dg-end-multiline-output "" } */

__seg_fs int val3() {return val;} /* { dg-warning "qualifiers ignored" } */
/* { dg-begin-multiline-output "" }
 __seg_fs int val3() {return val;}
 ^~~~~~~~
{ dg-end-multiline-output "" } */

