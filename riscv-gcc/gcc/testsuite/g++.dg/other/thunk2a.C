// { dg-do compile { target arm*-*-* } }
// { dg-options "-mlong-calls -ffunction-sections" }

class a {
public:
  virtual ~a();
};

class b : virtual a {};

class c : b {
  ~c();
};

c::~c() {}
