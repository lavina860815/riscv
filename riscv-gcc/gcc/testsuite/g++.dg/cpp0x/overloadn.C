// { dg-do link { target c++11 } }
// { dg-options "" }
// Generated by overload.py

template<typename _Tp>
inline _Tp&&
movel(_Tp& __t)
{ return static_cast<_Tp&&>(__t); }

struct S{};

S l;                             // lvalue (l)
S const cl = l;                  // const lvalue (cl)
S r() { return l; }              // rvalue (r)
S const cr() { return l; }       // const rvalue (cr)
S & nl = l;                      // named lvalue reference (nl)
S const & ncl = l;               // named const lvalue reference (ncl)
S && nr = movel(l);              // named rvalue reference (nr)
S const && ncr = movel(l);       // named const rvalue reference (ncr)
S & ul() { return l; }           // unnamed lvalue reference (ul)
S const & ucl() { return l; }    // unnamed const lvalue reference (ucl)
S && ur() { return movel(l); }   // unnamed rvalue reference (ur)
S const && ucr() { return movel(l); } // unnamed const rvalue reference (ucr)

void l0001(const S&&) {} // { dg-message "" }

void l0010(S&&) {} // { dg-message "" }

void l0011(S&&) {} // { dg-message "" }
void l0011(const S&&);

void l0100(const S&) {}

void l0101(const S&) {}
void l0101(const S&&);

void l0110(const S&) {}
void l0110(S&&);

void l0111(const S&) {}
void l0111(S&&);
void l0111(const S&&);

void l1000(S&) {}

void l1001(S&) {}
void l1001(const S&&);

void l1010(S&) {}
void l1010(S&&);

void l1011(S&) {}
void l1011(S&&);
void l1011(const S&&);

void l1100(S&) {}
void l1100(const S&);

void l1101(S&) {}
void l1101(const S&);
void l1101(const S&&);

void l1110(S&) {}
void l1110(const S&);
void l1110(S&&);

void l1111(S&) {}
void l1111(const S&);
void l1111(S&&);
void l1111(const S&&);

void cl0001(const S&&) {} // { dg-message "" }

void cl0011(S&&);
void cl0011(const S&&) {} // { dg-message "" }

void cl0100(const S&) {}

void cl0101(const S&) {}
void cl0101(const S&&);

void cl0110(const S&) {}
void cl0110(S&&);

void cl0111(const S&) {}
void cl0111(S&&);
void cl0111(const S&&);

void cl1001(S&);
void cl1001(const S&&) {} // { dg-message "" }

void cl1011(S&);
void cl1011(S&&);
void cl1011(const S&&) {} // { dg-message "" }

void cl1100(S&);
void cl1100(const S&) {}

void cl1101(S&);
void cl1101(const S&) {}
void cl1101(const S&&);

void cl1110(S&);
void cl1110(const S&) {}
void cl1110(S&&);

void cl1111(S&);
void cl1111(const S&) {}
void cl1111(S&&);
void cl1111(const S&&);

void r0001(const S&&) {}

void r0010(S&&) {}

void r0011(S&&) {}
void r0011(const S&&);

void r0100(const S&) {}

void r0101(const S&);
void r0101(const S&&) {}

void r0110(const S&);
void r0110(S&&) {}

void r0111(const S&);
void r0111(S&&) {}
void r0111(const S&&);

void r1001(S&);
void r1001(const S&&) {}

void r1010(S&);
void r1010(S&&) {}

void r1011(S&);
void r1011(S&&) {}
void r1011(const S&&);

void r1100(S&);
void r1100(const S&) {}

void r1101(S&);
void r1101(const S&);
void r1101(const S&&) {}

void r1110(S&);
void r1110(const S&);
void r1110(S&&) {}

void r1111(S&);
void r1111(const S&);
void r1111(S&&) {}
void r1111(const S&&);

void cr0001(const S&&) {}

void cr0011(S&&);
void cr0011(const S&&) {}

void cr0100(const S&) {}

void cr0101(const S&);
void cr0101(const S&&) {}

void cr0110(const S&) {}
void cr0110(S&&);

void cr0111(const S&);
void cr0111(S&&);
void cr0111(const S&&) {}

void cr1001(S&);
void cr1001(const S&&) {}

void cr1011(S&);
void cr1011(S&&);
void cr1011(const S&&) {}

void cr1100(S&);
void cr1100(const S&) {}

void cr1101(S&);
void cr1101(const S&);
void cr1101(const S&&) {}

void cr1110(S&);
void cr1110(const S&) {}
void cr1110(S&&);

void cr1111(S&);
void cr1111(const S&);
void cr1111(S&&);
void cr1111(const S&&) {}

void nl0001(const S&&) {} // { dg-message "" }

void nl0010(S&&) {} // { dg-message "" }

void nl0011(S&&) {} // { dg-message "" }
void nl0011(const S&&);

void nl0100(const S&) {}

void nl0101(const S&) {}
void nl0101(const S&&);

void nl0110(const S&) {}
void nl0110(S&&);

void nl0111(const S&) {}
void nl0111(S&&);
void nl0111(const S&&);

void nl1000(S&) {}

void nl1001(S&) {}
void nl1001(const S&&);

void nl1010(S&) {}
void nl1010(S&&);

void nl1011(S&) {}
void nl1011(S&&);
void nl1011(const S&&);

void nl1100(S&) {}
void nl1100(const S&);

void nl1101(S&) {}
void nl1101(const S&);
void nl1101(const S&&);

void nl1110(S&) {}
void nl1110(const S&);
void nl1110(S&&);

void nl1111(S&) {}
void nl1111(const S&);
void nl1111(S&&);
void nl1111(const S&&);

void ncl0001(const S&&) {} // { dg-message "" }

void ncl0011(S&&);
void ncl0011(const S&&) {} // { dg-message "" }

void ncl0100(const S&) {}

void ncl0101(const S&) {}
void ncl0101(const S&&);

void ncl0110(const S&) {}
void ncl0110(S&&);

void ncl0111(const S&) {}
void ncl0111(S&&);
void ncl0111(const S&&);

void ncl1001(S&);
void ncl1001(const S&&) {} // { dg-message "" }

void ncl1011(S&);
void ncl1011(S&&);
void ncl1011(const S&&) {} // { dg-message "" }

void ncl1100(S&);
void ncl1100(const S&) {}

void ncl1101(S&);
void ncl1101(const S&) {}
void ncl1101(const S&&);

void ncl1110(S&);
void ncl1110(const S&) {}
void ncl1110(S&&);

void ncl1111(S&);
void ncl1111(const S&) {}
void ncl1111(S&&);
void ncl1111(const S&&);

void nr0001(const S&&) {} // { dg-message "" }

void nr0010(S&&) {} // { dg-message "" }

void nr0011(S&&) {} // { dg-message "" }
void nr0011(const S&&);

void nr0100(const S&) {}

void nr0101(const S&) {}
void nr0101(const S&&);

void nr0110(const S&) {}
void nr0110(S&&);

void nr0111(const S&) {}
void nr0111(S&&);
void nr0111(const S&&);

void nr1000(S&) {}

void nr1001(S&) {}
void nr1001(const S&&);

void nr1010(S&) {}
void nr1010(S&&);

void nr1011(S&) {}
void nr1011(S&&);
void nr1011(const S&&);

void nr1100(S&) {}
void nr1100(const S&);

void nr1101(S&) {}
void nr1101(const S&);
void nr1101(const S&&);

void nr1110(S&) {}
void nr1110(const S&);
void nr1110(S&&);

void nr1111(S&) {}
void nr1111(const S&);
void nr1111(S&&);
void nr1111(const S&&);

void ncr0001(const S&&) {} // { dg-message "" }

void ncr0011(S&&);
void ncr0011(const S&&) {} // { dg-message "" }

void ncr0100(const S&) {}

void ncr0101(const S&) {}
void ncr0101(const S&&);

void ncr0110(const S&) {}
void ncr0110(S&&);

void ncr0111(const S&) {}
void ncr0111(S&&);
void ncr0111(const S&&);

void ncr1001(S&);
void ncr1001(const S&&) {} // { dg-message "" }

void ncr1011(S&);
void ncr1011(S&&);
void ncr1011(const S&&) {} // { dg-message "" }

void ncr1100(S&);
void ncr1100(const S&) {}

void ncr1101(S&);
void ncr1101(const S&) {}
void ncr1101(const S&&);

void ncr1110(S&);
void ncr1110(const S&) {}
void ncr1110(S&&);

void ncr1111(S&);
void ncr1111(const S&) {}
void ncr1111(S&&);
void ncr1111(const S&&);

void ul0001(const S&&) {} // { dg-message "" }

void ul0010(S&&) {} // { dg-message "" }

void ul0011(S&&) {} // { dg-message "" }
void ul0011(const S&&);

void ul0100(const S&) {}

void ul0101(const S&) {}
void ul0101(const S&&);

void ul0110(const S&) {}
void ul0110(S&&);

void ul0111(const S&) {}
void ul0111(S&&);
void ul0111(const S&&);

void ul1000(S&) {}

void ul1001(S&) {}
void ul1001(const S&&);

void ul1010(S&) {}
void ul1010(S&&);

void ul1011(S&) {}
void ul1011(S&&);
void ul1011(const S&&);

void ul1100(S&) {}
void ul1100(const S&);

void ul1101(S&) {}
void ul1101(const S&);
void ul1101(const S&&);

void ul1110(S&) {}
void ul1110(const S&);
void ul1110(S&&);

void ul1111(S&) {}
void ul1111(const S&);
void ul1111(S&&);
void ul1111(const S&&);

void ucl0001(const S&&) {} // { dg-message "" }

void ucl0011(S&&);
void ucl0011(const S&&) {} // { dg-message "" }

void ucl0100(const S&) {}

void ucl0101(const S&) {}
void ucl0101(const S&&);

void ucl0110(const S&) {}
void ucl0110(S&&);

void ucl0111(const S&) {}
void ucl0111(S&&);
void ucl0111(const S&&);

void ucl1001(S&);
void ucl1001(const S&&) {} // { dg-message "" }

void ucl1011(S&);
void ucl1011(S&&);
void ucl1011(const S&&) {} // { dg-message "" }

void ucl1100(S&);
void ucl1100(const S&) {}

void ucl1101(S&);
void ucl1101(const S&) {}
void ucl1101(const S&&);

void ucl1110(S&);
void ucl1110(const S&) {}
void ucl1110(S&&);

void ucl1111(S&);
void ucl1111(const S&) {}
void ucl1111(S&&);
void ucl1111(const S&&);

void ur0001(const S&&) {}

void ur0010(S&&) {}

void ur0011(S&&) {}
void ur0011(const S&&);

void ur0100(const S&) {}

void ur0101(const S&);
void ur0101(const S&&) {}

void ur0110(const S&);
void ur0110(S&&) {}

void ur0111(const S&);
void ur0111(S&&) {}
void ur0111(const S&&);

void ur1001(S&);
void ur1001(const S&&) {}

void ur1010(S&);
void ur1010(S&&) {}

void ur1011(S&);
void ur1011(S&&) {}
void ur1011(const S&&);

void ur1100(S&);
void ur1100(const S&) {}

void ur1101(S&);
void ur1101(const S&);
void ur1101(const S&&) {}

void ur1110(S&);
void ur1110(const S&);
void ur1110(S&&) {}

void ur1111(S&);
void ur1111(const S&);
void ur1111(S&&) {}
void ur1111(const S&&);

void ucr0001(const S&&) {}

void ucr0011(S&&);
void ucr0011(const S&&) {}

void ucr0100(const S&) {}

void ucr0101(const S&);
void ucr0101(const S&&) {}

void ucr0110(const S&) {}
void ucr0110(S&&);

void ucr0111(const S&);
void ucr0111(S&&);
void ucr0111(const S&&) {}

void ucr1001(S&);
void ucr1001(const S&&) {}

void ucr1011(S&);
void ucr1011(S&&);
void ucr1011(const S&&) {}

void ucr1100(S&);
void ucr1100(const S&) {}

void ucr1101(S&);
void ucr1101(const S&);
void ucr1101(const S&&) {}

void ucr1110(S&);
void ucr1110(const S&) {}
void ucr1110(S&&);

void ucr1111(S&);
void ucr1111(const S&);
void ucr1111(S&&);
void ucr1111(const S&&) {}


int main()
{
  l0001(l); // { dg-error "" }
  l0010(l); // { dg-error "" }
  l0011(l); // { dg-error "" }
  l0100(l);
  l0101(l);
  l0110(l);
  l0111(l);
  l1000(l);
  l1001(l);
  l1010(l);
  l1011(l);
  l1100(l);
  l1101(l);
  l1110(l);
  l1111(l);
  cl0001(cl); // { dg-error "lvalue" }
  cl0011(cl); // { dg-error "lvalue" }
  cl0100(cl);
  cl0101(cl);
  cl0110(cl);
  cl0111(cl);
  cl1001(cl); // { dg-error "" }
  cl1011(cl); // { dg-error "" }
  cl1100(cl);
  cl1101(cl);
  cl1110(cl);
  cl1111(cl);
  r0001(r());
  r0010(r());
  r0011(r());
  r0100(r());
  r0101(r());
  r0110(r());
  r0111(r());
  r1001(r());
  r1010(r());
  r1011(r());
  r1100(r());
  r1101(r());
  r1110(r());
  r1111(r());
  cr0001(cr());
  cr0011(cr());
  cr0100(cr());
  cr0101(cr());
  cr0110(cr());
  cr0111(cr());
  cr1001(cr());
  cr1011(cr());
  cr1100(cr());
  cr1101(cr());
  cr1110(cr());
  cr1111(cr());
  nl0001(nl); // { dg-error "lvalue" }
  nl0010(nl); // { dg-error "lvalue" }
  nl0011(nl); // { dg-error "lvalue" }
  nl0100(nl);
  nl0101(nl);
  nl0110(nl);
  nl0111(nl);
  nl1000(nl);
  nl1001(nl);
  nl1010(nl);
  nl1011(nl);
  nl1100(nl);
  nl1101(nl);
  nl1110(nl);
  nl1111(nl);
  ncl0001(ncl); // { dg-error "lvalue" }
  ncl0011(ncl); // { dg-error "lvalue" }
  ncl0100(ncl);
  ncl0101(ncl);
  ncl0110(ncl);
  ncl0111(ncl);
  ncl1001(ncl); // { dg-error "" }
  ncl1011(ncl); // { dg-error "" }
  ncl1100(ncl);
  ncl1101(ncl);
  ncl1110(ncl);
  ncl1111(ncl);
  nr0001(nr); // { dg-error "lvalue" }
  nr0010(nr); // { dg-error "lvalue" }
  nr0011(nr); // { dg-error "lvalue" }
  nr0100(nr);
  nr0101(nr);
  nr0110(nr);
  nr0111(nr);
  nr1000(nr);
  nr1001(nr);
  nr1010(nr);
  nr1011(nr);
  nr1100(nr);
  nr1101(nr);
  nr1110(nr);
  nr1111(nr);
  ncr0001(ncr); // { dg-error "lvalue" }
  ncr0011(ncr); // { dg-error "lvalue" }
  ncr0100(ncr);
  ncr0101(ncr);
  ncr0110(ncr);
  ncr0111(ncr);
  ncr1001(ncr); // { dg-error "" }
  ncr1011(ncr); // { dg-error "" }
  ncr1100(ncr);
  ncr1101(ncr);
  ncr1110(ncr);
  ncr1111(ncr);
  ul0001(ul()); // { dg-error "lvalue" }
  ul0010(ul()); // { dg-error "lvalue" }
  ul0011(ul()); // { dg-error "lvalue" }
  ul0100(ul());
  ul0101(ul());
  ul0110(ul());
  ul0111(ul());
  ul1000(ul());
  ul1001(ul());
  ul1010(ul());
  ul1011(ul());
  ul1100(ul());
  ul1101(ul());
  ul1110(ul());
  ul1111(ul());
  ucl0001(ucl()); // { dg-error "lvalue" }
  ucl0011(ucl()); // { dg-error "lvalue" }
  ucl0100(ucl());
  ucl0101(ucl());
  ucl0110(ucl());
  ucl0111(ucl());
  ucl1001(ucl()); // { dg-error "" }
  ucl1011(ucl()); // { dg-error "" }
  ucl1100(ucl());
  ucl1101(ucl());
  ucl1110(ucl());
  ucl1111(ucl());
  ur0001(ur());
  ur0010(ur());
  ur0011(ur());
  ur0100(ur());
  ur0101(ur());
  ur0110(ur());
  ur0111(ur());
  ur1001(ur());
  ur1010(ur());
  ur1011(ur());
  ur1100(ur());
  ur1101(ur());
  ur1110(ur());
  ur1111(ur());
  ucr0001(ucr());
  ucr0011(ucr());
  ucr0100(ucr());
  ucr0101(ucr());
  ucr0110(ucr());
  ucr0111(ucr());
  ucr1001(ucr());
  ucr1011(ucr());
  ucr1100(ucr());
  ucr1101(ucr());
  ucr1110(ucr());
  ucr1111(ucr());

  return 0;
}
