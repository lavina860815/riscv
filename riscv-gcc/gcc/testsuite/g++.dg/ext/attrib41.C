// PR c++/45267
// { dg-options "-O" }

template<typename T> struct Vector {
  Vector(long long x);
  inline Vector<T> operator<<(int x) const __attribute__((always_inline));
};
long long bar (long long);
template<> inline Vector<int> Vector<int>::operator<<(int x) const {
  return bar(x);
}
bool b;
int main() {
  Vector<int> a(1);
  if ((a << 2), b) {
    a << 2;
    throw 1;
  }
}
