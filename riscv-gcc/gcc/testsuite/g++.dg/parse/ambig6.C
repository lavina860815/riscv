// PR c++/48046

namespace N1 { typedef int   T; } // { dg-message "" }
namespace N2 { typedef float T; } // { dg-message "" }

int main()
{
  using namespace N1;
  using namespace N2;

  static T t;			// { dg-error "" }
}
