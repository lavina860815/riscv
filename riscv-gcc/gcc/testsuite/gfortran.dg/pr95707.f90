! { dg-do compile }
! { dg-options "-fsecond-underscore" }
! PR fortran/95707 - ICE in finish_equivalences, at fortran/trans-common.c:1319

module m2345678901234567890123456789012345678901234567890123456789_123
  interface
     module subroutine s2345678901234567890123456789012345678901234567890123456789_123
     end
  end interface
end
submodule(m2345678901234567890123456789012345678901234567890123456789_123) &
          n2345678901234567890123456789012345678901234567890123456789_123
  real :: a(4), u(3,2)
  real :: b(4), v(4,2)
  equivalence (a(1),u(1,1)), (b(1),v(1,1))
end
