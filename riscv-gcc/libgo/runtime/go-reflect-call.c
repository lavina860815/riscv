/* go-reflect-call.c -- call reflection support for Go.

   Copyright 2009 The Go Authors. All rights reserved.
   Use of this source code is governed by a BSD-style
   license that can be found in the LICENSE file.  */

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

#include "runtime.h"
#include "go-assert.h"

#ifdef USE_LIBFFI
#include "ffi.h"
#endif

#if defined(USE_LIBFFI) && FFI_GO_CLOSURES

/* The functions in this file are only called from reflect_call.  As
   reflect_call calls a libffi function, which will be compiled
   without -fsplit-stack, it will always run with a large stack.  */

static size_t go_results_size (const struct functype *)
  __attribute__ ((no_split_stack));
static void go_set_results (const struct functype *, unsigned char *, void **)
  __attribute__ ((no_split_stack));

/* Get the total size required for the result parameters of a
   function.  */

static size_t
go_results_size (const struct functype *func)
{
  int count;
  const struct _type **types;
  size_t off;
  size_t maxalign;
  int i;

  count = func->out.__count;
  if (count == 0)
    return 0;

  types = (const struct _type **) func->out.__values;

  /* A single integer return value is always promoted to a full word.
     There is similar code below and in libgo/go/reflect/makefunc_ffi.go.*/
  if (count == 1)
    {
      switch (types[0]->kind & kindMask)
	{
	case kindBool:
	case kindInt8:
	case kindInt16:
	case kindInt32:
	case kindUint8:
	case kindUint16:
	case kindUint32:
	  return sizeof (ffi_arg);

	default:
	  break;
	}
    }

  off = 0;
  maxalign = 0;
  for (i = 0; i < count; ++i)
    {
      size_t align;

      align = types[i]->fieldAlign;
      if (align > maxalign)
	maxalign = align;
      off = (off + align - 1) & ~ (align - 1);
      off += types[i]->size;
    }

  off = (off + maxalign - 1) & ~ (maxalign - 1);

  // The libffi library doesn't understand a struct with no fields.
  // We generate a struct with a single field of type void.  When used
  // as a return value, libffi will think that requires a byte.
  if (off == 0)
    off = 1;

  return off;
}

/* Copy the results of calling a function via FFI from CALL_RESULT
   into the addresses in RESULTS.  */

static void
go_set_results (const struct functype *func, unsigned char *call_result,
		void **results)
{
  int count;
  const struct _type **types;
  size_t off;
  int i;

  count = func->out.__count;
  if (count == 0)
    return;

  types = (const struct _type **) func->out.__values;

  /* A single integer return value is always promoted to a full word.
     There is similar code above and in libgo/go/reflect/makefunc_ffi.go.*/
  if (count == 1)
    {
      switch (types[0]->kind & kindMask)
	{
	case kindBool:
	case kindInt8:
	case kindInt16:
	case kindInt32:
	case kindUint8:
	case kindUint16:
	case kindUint32:
	  {
	    union
	    {
	      unsigned char buf[sizeof (ffi_arg)];
	      ffi_arg v;
	    } u;
	    ffi_arg v;

	    __builtin_memcpy (&u.buf, call_result, sizeof (ffi_arg));
	    v = u.v;

	    switch (types[0]->size)
	      {
	      case 1:
		{
		  uint8_t b;

		  b = (uint8_t) v;
		  __builtin_memcpy (results[0], &b, 1);
		}
		break;

	      case 2:
		{
		  uint16_t s;

		  s = (uint16_t) v;
		  __builtin_memcpy (results[0], &s, 2);
		}
		break;

	      case 4:
		{
		  uint32_t w;

		  w = (uint32_t) v;
		  __builtin_memcpy (results[0], &w, 4);
		}
		break;

	      case 8:
		{
		  uint64_t d;

		  d = (uint64_t) v;
		  __builtin_memcpy (results[0], &d, 8);
		}
		break;

	      default:
		abort ();
	      }
	  }
	  return;

	default:
	  break;
	}
    }

  off = 0;
  for (i = 0; i < count; ++i)
    {
      size_t align;
      size_t size;

      align = types[i]->fieldAlign;
      size = types[i]->size;
      off = (off + align - 1) & ~ (align - 1);
      __builtin_memcpy (results[i], call_result + off, size);
      off += size;
    }
}

/* The code that converts the Go type to an FFI type is written in Go,
   so that it can allocate Go heap memory.  */
extern void ffiFuncToCIF(const struct functype*, _Bool, _Bool, ffi_cif*)
  __asm__ ("runtime.ffiFuncToCIF");

/* Call a function.  The type of the function is FUNC_TYPE, and the
   closure is FUNC_VAL.  PARAMS is an array of parameter addresses.
   RESULTS is an array of result addresses.

   If IS_INTERFACE is true this is a call to an interface method and
   the first argument is the receiver, which is always a pointer.
   This argument, the receiver, is not described in FUNC_TYPE.

   If IS_METHOD is true this is a call to a method expression.  The
   first argument is the receiver.  It is described in FUNC_TYPE, but
   regardless of FUNC_TYPE, it is passed as a pointer.  */

void
reflect_call (const struct functype *func_type, FuncVal *func_val,
	      _Bool is_interface, _Bool is_method, void **params,
	      void **results)
{
  ffi_cif cif;
  unsigned char *call_result;

  __go_assert ((func_type->typ.kind & kindMask) == kindFunc);
  ffiFuncToCIF (func_type, is_interface, is_method, &cif);

  call_result = (unsigned char *) malloc (go_results_size (func_type));

  ffi_call_go (&cif, (void (*)(void)) func_val->fn, call_result, params,
	       func_val);

  /* Some day we may need to free result values if RESULTS is
     NULL.  */
  if (results != NULL)
    go_set_results (func_type, call_result, results);

  free (call_result);
}

#else /* !defined(USE_LIBFFI) */

void
reflect_call (const struct functype *func_type __attribute__ ((unused)),
	      FuncVal *func_val __attribute__ ((unused)),
	      _Bool is_interface __attribute__ ((unused)),
	      _Bool is_method __attribute__ ((unused)),
	      void **params __attribute__ ((unused)),
	      void **results __attribute__ ((unused)))
{
  /* Without FFI there is nothing we can do.  */
  runtime_throw("libgo built without FFI does not support "
		"reflect.Call or runtime.SetFinalizer");
}

#endif /* !defined(USE_LIBFFI) */
