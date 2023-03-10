// PR c++/59200
// { dg-do compile { target c++11 } }

struct A
{
  static constexpr bool value = true;
};

template<typename T>
struct B
{
  template<typename U>
    using C = A;
};

template<typename T>
template<typename U>
  const bool B<T>::C<U>::value;  // { dg-error "too many" }
