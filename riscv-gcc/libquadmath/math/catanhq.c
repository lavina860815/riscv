/* Return arc hyperbolic tangent for a complex float type.
   Copyright (C) 1997-2018 Free Software Foundation, Inc.
   This file is part of the GNU C Library.
   Contributed by Ulrich Drepper <drepper@cygnus.com>, 1997.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <http://www.gnu.org/licenses/>.  */

#include "quadmath-imp.h"

__complex128
catanhq (__complex128 x)
{
  __complex128 res;
  int rcls = fpclassifyq (__real__ x);
  int icls = fpclassifyq (__imag__ x);

  if (__glibc_unlikely (rcls <= QUADFP_INFINITE || icls <= QUADFP_INFINITE))
    {
      if (icls == QUADFP_INFINITE)
	{
	  __real__ res = copysignq (0, __real__ x);
	  __imag__ res = copysignq (M_PI_2q, __imag__ x);
	}
      else if (rcls == QUADFP_INFINITE || rcls == QUADFP_ZERO)
	{
	  __real__ res = copysignq (0, __real__ x);
	  if (icls >= QUADFP_ZERO)
	    __imag__ res = copysignq (M_PI_2q, __imag__ x);
	  else
	    __imag__ res = nanq ("");
	}
      else
	{
	  __real__ res = nanq ("");
	  __imag__ res = nanq ("");
	}
    }
  else if (__glibc_unlikely (rcls == QUADFP_ZERO && icls == QUADFP_ZERO))
    {
      res = x;
    }
  else
    {
      if (fabsq (__real__ x) >= 16 / FLT128_EPSILON
	  || fabsq (__imag__ x) >= 16 / FLT128_EPSILON)
	{
	  __imag__ res = copysignq (M_PI_2q, __imag__ x);
	  if (fabsq (__imag__ x) <= 1)
	    __real__ res = 1 / __real__ x;
	  else if (fabsq (__real__ x) <= 1)
	    __real__ res = __real__ x / __imag__ x / __imag__ x;
	  else
	    {
	      __float128 h = hypotq (__real__ x / 2, __imag__ x / 2);
	      __real__ res = __real__ x / h / h / 4;
	    }
	}
      else
	{
	  if (fabsq (__real__ x) == 1
	      && fabsq (__imag__ x) < FLT128_EPSILON * FLT128_EPSILON)
	    __real__ res = (copysignq (0.5Q, __real__ x)
			    * ((__float128) M_LN2q
			       - logq (fabsq (__imag__ x))));
	  else
	    {
	      __float128 i2 = 0;
	      if (fabsq (__imag__ x) >= FLT128_EPSILON * FLT128_EPSILON)
		i2 = __imag__ x * __imag__ x;

	      __float128 num = 1 + __real__ x;
	      num = i2 + num * num;

	      __float128 den = 1 - __real__ x;
	      den = i2 + den * den;

	      __float128 f = num / den;
	      if (f < 0.5Q)
		__real__ res = 0.25Q * logq (f);
	      else
		{
		  num = 4 * __real__ x;
		  __real__ res = 0.25Q * log1pq (num / den);
		}
	    }

	  __float128 absx, absy, den;

	  absx = fabsq (__real__ x);
	  absy = fabsq (__imag__ x);
	  if (absx < absy)
	    {
	      __float128 t = absx;
	      absx = absy;
	      absy = t;
	    }

	  if (absy < FLT128_EPSILON / 2)
	    {
	      den = (1 - absx) * (1 + absx);
	      if (den == 0)
		den = 0;
	    }
	  else if (absx >= 1)
	    den = (1 - absx) * (1 + absx) - absy * absy;
	  else if (absx >= 0.75Q || absy >= 0.5Q)
	    den = -__quadmath_x2y2m1q (absx, absy);
	  else
	    den = (1 - absx) * (1 + absx) - absy * absy;

	  __imag__ res = 0.5Q * atan2q (2 * __imag__ x, den);
	}

      math_check_force_underflow_complex (res);
    }

  return res;
}
