/*							cbrtq.c
 *
 *	Cube root, long double precision
 *
 *
 *
 * SYNOPSIS:
 *
 * long double x, y, cbrtq();
 *
 * y = cbrtq( x );
 *
 *
 *
 * DESCRIPTION:
 *
 * Returns the cube root of the argument, which may be negative.
 *
 * Range reduction involves determining the power of 2 of
 * the argument.  A polynomial of degree 2 applied to the
 * mantissa, and multiplication by the cube root of 1, 2, or 4
 * approximates the root to within about 0.1%.  Then Newton's
 * iteration is used three times to converge to an accurate
 * result.
 *
 *
 *
 * ACCURACY:
 *
 *                      Relative error:
 * arithmetic   domain     # trials      peak         rms
 *    IEEE       -8,8       100000      1.3e-34     3.9e-35
 *    IEEE    exp(+-707)    100000      1.3e-34     4.3e-35
 *
 */

/*
Cephes Math Library Release 2.2: January, 1991
Copyright 1984, 1991 by Stephen L. Moshier
Adapted for glibc October, 2001.

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, see
    <http://www.gnu.org/licenses/>.  */

#include "quadmath-imp.h"

static const __float128 CBRT2 = 1.259921049894873164767210607278228350570251Q;
static const __float128 CBRT4 = 1.587401051968199474751705639272308260391493Q;
static const __float128 CBRT2I = 0.7937005259840997373758528196361541301957467Q;
static const __float128 CBRT4I = 0.6299605249474365823836053036391141752851257Q;


__float128
cbrtq (__float128 x)
{
  int e, rem, sign;
  __float128 z;

  if (!finiteq (x))
    return x + x;

  if (x == 0)
    return (x);

  if (x > 0)
    sign = 1;
  else
    {
      sign = -1;
      x = -x;
    }

  z = x;
 /* extract power of 2, leaving mantissa between 0.5 and 1  */
  x = frexpq (x, &e);

  /* Approximate cube root of number between .5 and 1,
     peak relative error = 1.2e-6  */
  x = ((((1.3584464340920900529734e-1Q * x
	  - 6.3986917220457538402318e-1Q) * x
	 + 1.2875551670318751538055e0Q) * x
	- 1.4897083391357284957891e0Q) * x
       + 1.3304961236013647092521e0Q) * x + 3.7568280825958912391243e-1Q;

  /* exponent divided by 3 */
  if (e >= 0)
    {
      rem = e;
      e /= 3;
      rem -= 3 * e;
      if (rem == 1)
	x *= CBRT2;
      else if (rem == 2)
	x *= CBRT4;
    }
  else
    {				/* argument less than 1 */
      e = -e;
      rem = e;
      e /= 3;
      rem -= 3 * e;
      if (rem == 1)
	x *= CBRT2I;
      else if (rem == 2)
	x *= CBRT4I;
      e = -e;
    }

  /* multiply by power of 2 */
  x = ldexpq (x, e);

  /* Newton iteration */
  x -= (x - (z / (x * x))) * 0.3333333333333333333333333333333333333333Q;
  x -= (x - (z / (x * x))) * 0.3333333333333333333333333333333333333333Q;
  x -= (x - (z / (x * x))) * 0.3333333333333333333333333333333333333333Q;

  if (sign < 0)
    x = -x;
  return (x);
}
