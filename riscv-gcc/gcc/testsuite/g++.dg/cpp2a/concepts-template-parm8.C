// { dg-do compile { target c++2a } }

template<typename T>
  concept C = __is_class(T);

template<typename T>
  concept D = C<T> and __is_empty(T);

template<template<typename Q> requires C<Q> class X>
  struct S { };

// An unconstrained template can be used as an argument for any
// constrained template template parameter.
template<typename A> struct T0 { };
S<T0> x1;

// Matching constraints are valid.
template<typename A> requires C<A> struct T1 { };
S<T1> x2;

int main() { }
