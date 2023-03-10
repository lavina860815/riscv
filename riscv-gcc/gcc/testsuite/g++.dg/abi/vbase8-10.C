// { dg-options -w }
// { dg-do run }

// Copyright (C) 2001 Free Software Foundation, Inc.
// Contributed by Nathan Sidwell 26 Jul 2001 <nathan@codesourcery.com>

// Origin stefan@space.twc.de
// Bug 3145 case 10. Horribly complicated class hierarchy

class C0
{};
class C1
 :  public C0
{};
class C2
 :  public C1
 ,  virtual public C0
{};
class C3
 :  public C1
 ,  public C2
 ,  virtual public C0
{};
class C4
 :  virtual public C1
 ,  virtual public C0
 ,  virtual public C3
 ,  public C2
{};
class C5
 :  public C3
 ,  virtual public C0
 ,  virtual public C2
{};
class C6
 :  public C1
 ,  public C2
 ,  virtual public C5
 ,  virtual public C3
 ,  virtual public C0
{};
class C7
 :  public C1
 ,  virtual public C5
 ,  virtual public C4
 ,  virtual public C2
 ,  virtual public C0
 ,  virtual public C6
{};
class C8
 :  virtual public C4
 ,  public C3
 ,  public C0
 ,  virtual public C7
 ,  virtual public C6
{};
class C9
 :  virtual public C0
 ,  public C4
 ,  public C8
 ,  public C1
 ,  public C6
{};
main() {
  C0 c0;
  C1 c1;
  C2 c2;
  C3 c3;
  C4 c4;
  C5 c5;
  C6 c6;
  C7 c7;
  C8 c8;
  C9 c9;
}
