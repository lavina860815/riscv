! { dg-do compile }
! { dg-options "-std=gnu" }
! PR fortran/44491
      character*2 escape /z'1B'/  ! { dg-error "cannot appear in" }
      end
