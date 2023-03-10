// { dg-do assemble  }
// { dg-options "-pedantic-errors" }
// GROUPS passed sizeof
// ARM $5.3.2

int
main()
{
  // sizeof may not be applied to the type void
  int l = sizeof (void);// { dg-error "11:invalid application of .sizeof. to a void type" } .*

  return 0;
}
