class C0
{ public: int i0; };
class C1
 :  virtual public C0
{ public: int i1; };
class C2
 :  public C0
 ,  public C1
{ public: int i2; };
class C3
 :  virtual public C0
 ,  public C1
 ,  public C2
{ public: int i3; };
class C4
 :  public C2
 ,  public C3
 ,  virtual public C1
 ,  virtual public C0
{ public: int i4; };
class C5
 :  virtual public C2
 ,  public C1
 ,  public C0
{ public: int i5; };
class C6
 :  virtual public C0
 ,  virtual public C5
 ,  public C1
 ,  public C3
 ,  public C4
{ public: int i6; };
class C7
 :  public C6
 ,  virtual public C0
 ,  public C1
 ,  public C2
 ,  virtual public C4
{ public: int i7; };
class C8
 :  public C2
 ,  virtual public C6
 ,  virtual public C7
 ,  public C5
 ,  public C3
 ,  virtual public C4
{ public: int i8; };
class C9
 :  public C5
 ,  virtual public C3
 ,  virtual public C8
 ,  public C0
 ,  public C2
 ,  public C7
 ,  public C6
 ,  public C4
{ public: int i9; };
