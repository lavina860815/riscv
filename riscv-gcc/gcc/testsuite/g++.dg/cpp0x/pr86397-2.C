// { dg-do compile { target c++11 } }
// { dg-options "-fdelete-null-pointer-checks" }
void e();
template <bool> void f(int() noexcept(e)) {} // { dg-error "convert" }
template void f<false>(int() noexcept); // { dg-error "does not match any template declaration" "" { target c++17 } }
