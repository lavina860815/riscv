// { dg-do assemble  }
// g++ 1.36.1 bug 900215_01

// g++ allows the definition of a type conversion operator `operator void'
// for class types, but subsequently fails to generate calls (where needed)
// for such type conversion operators.

// Cfront 2.0 does generate such calls.

// The following program exits with status 0 when compiled with Cfront 2.0
// but exits with status 1 when compiled with g++.

// Cfront 2.0 passes this test.

// 4/27/94 (jason): The pre-San Diego working paper prohibits operator
// void, so we can go back to just ignoring void values.

// keywords: user-defined type conversion operators, void type, explicit casts

// 8/3/2000 (nathan): The std allows you to define such an op, but
// it will never be called. [class.conv.fct]. Make it an unconditional warning.

// { dg-options "-Wconversion" }

struct struct0 {

  operator void ();  // { dg-warning "3:converting .struct0. to .void. will never use a type conversion operator" }
};

int exit_status = 1;

struct0::operator void ()
{
  exit_status = 0;
}

struct struct0 s0_object;

int test ()
{
  (void) s0_object;
  return exit_status;
}

int main () { return test (); }
