// PR c++/45278
// { dg-options "-Wextra" } 

extern void* p;

int f1() { return ( p <  0 ? 1 : 0 ); } // { dg-warning "23:ordered comparison" }
int f2() { return ( p <= 0 ? 1 : 0 ); } // { dg-warning "23:ordered comparison" }
int f3() { return ( p >  0 ? 1 : 0 ); } // { dg-warning "23:ordered comparison" }
int f4() { return ( p >= 0 ? 1 : 0 ); } // { dg-warning "23:ordered comparison" }
