// PR c++/67217
// { dg-do compile { target c++2a } }

template <class T>
  requires __is_same_as(T, double)
union A {};

int main() { A<int>{}; } // { dg-error "template constraint failure" }
