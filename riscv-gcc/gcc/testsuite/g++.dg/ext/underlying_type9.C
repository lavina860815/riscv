// { dg-do compile { target c++11 } }

template<typename T1, typename T2>
  struct is_same
  { static const bool value = false; };

template<typename T>
  struct is_same<T, T>
  { static const bool value = true; };

enum E1 : unsigned { };
enum E2 : char { };
enum class E3 { };
enum class E4 : unsigned char { c = 1 };
enum class E5 : int { a = -1, b = 1 };
enum class E6 : long { c = __LONG_MAX__ };

template<typename T, typename U>
  struct test
  {
    static_assert(is_same<T, U>::value, "Error");
  };

test<__underlying_type(E1), unsigned>       t1;
test<__underlying_type(E2), char>           t2;
test<__underlying_type(E3), int>            t3;
test<__underlying_type(E4), unsigned char>  t4;
test<__underlying_type(E5), int>            t5;
test<__underlying_type(E6), long>           t6;
