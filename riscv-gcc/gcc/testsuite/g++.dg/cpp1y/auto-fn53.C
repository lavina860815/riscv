// PR c++/86942
// { dg-do compile { target c++14 } }

using T = decltype(auto) () -> int; // { dg-error "11:invalid use of" }
