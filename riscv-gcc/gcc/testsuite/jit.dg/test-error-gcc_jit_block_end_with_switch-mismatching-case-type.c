#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "libgccjit.h"

#include "harness.h"

void
create_code (gcc_jit_context *ctxt, void *user_data)
{
  /* Let's try to inject the equivalent of:
      int
      test_switch (int x)
      {
	switch (x)
	  {
	  case (long long)0 ... (long long)5:
	     return 3;
	  default:
	     return 10;
	  }
      }
      and verify that the floating-point case is an error.
   */
  gcc_jit_type *t_int =
    gcc_jit_context_get_type (ctxt, GCC_JIT_TYPE_INT);
  gcc_jit_type *t_long_long =
    gcc_jit_context_get_type (ctxt, GCC_JIT_TYPE_LONG_LONG);
  gcc_jit_type *return_type = t_int;
  gcc_jit_param *x =
    gcc_jit_context_new_param (ctxt, NULL, t_int, "x");
  gcc_jit_param *params[1] = {x};
  gcc_jit_function *func =
    gcc_jit_context_new_function (ctxt, NULL,
				  GCC_JIT_FUNCTION_EXPORTED,
				  return_type,
				  "test_switch",
				  1, params, 0);

  gcc_jit_block *b_initial =
    gcc_jit_function_new_block (func, "initial");

  gcc_jit_block *b_default =
    gcc_jit_function_new_block (func, "default");
  gcc_jit_block *b_case_0 =
    gcc_jit_function_new_block (func, "case_0");

  /* Note the erroneous use of "t_float" here.  */
  gcc_jit_case *cases[1] = {
    gcc_jit_context_new_case (
      ctxt,
      gcc_jit_context_new_rvalue_from_int (ctxt, t_long_long, 0),
      gcc_jit_context_new_rvalue_from_int (ctxt, t_long_long, 5),
      b_case_0)
  };

  gcc_jit_block_end_with_switch (
    b_initial, NULL,
    gcc_jit_param_as_rvalue (x),
    b_default,
    1,
    cases);

  gcc_jit_block_end_with_return (
    b_case_0, NULL,
    gcc_jit_context_new_rvalue_from_int (ctxt, t_int, 3));
  gcc_jit_block_end_with_return (
    b_default, NULL,
    gcc_jit_context_new_rvalue_from_int (ctxt, t_int, 10));
}

void
verify_code (gcc_jit_context *ctxt, gcc_jit_result *result)
{
  CHECK_VALUE (result, NULL);

  CHECK_STRING_VALUE (gcc_jit_context_get_first_error (ctxt),
		      "gcc_jit_block_end_with_switch:"
		      " mismatching types between case and expression:"
		      " cases[0]->min_value: (long long)0 (type: long long)"
		      " expr: x (type: int)");
}
