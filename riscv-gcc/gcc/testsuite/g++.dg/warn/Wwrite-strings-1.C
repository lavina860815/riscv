// PR c++/79791
// { dg-do compile { target c++11 } }
// { dg-options "" }

char *s = "foo"; // { dg-warning "ISO C\\+\\+ forbids converting a string constant" }
