// PR c++/77948
// { dg-do compile }
// { dg-options "-std=gnu++11 -std=c++11" }

void
foo ()
{
  auto qfp = 1.0q; // { dg-error "unable to find numeric literal operator" }
  auto Qfp = 1.0Q; // { dg-error "unable to find numeric literal operator" }
}
