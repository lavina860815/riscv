// { dg-do compile { target c++2a } }
// { dg-additional-options "-fconcepts-ts" }

template<typename X, typename Y = X>
concept bool HasBinaryAdd = requires(X x, Y y)
{
  {x + y} -> decltype(x + y);
};

void proc(HasBinaryAdd x, HasBinaryAdd y);
