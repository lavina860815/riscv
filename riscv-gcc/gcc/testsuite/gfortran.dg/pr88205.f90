! { dg-do compile }
! PR fortran/88205
subroutine s1
   real, parameter :: status = 0
   open (newunit=n, status=status)        ! { dg-error "must be of type CHARACTER" }
end
subroutine s2
   complex, parameter :: status = 0
   open (newunit=n, status=status)        ! { dg-error "must be of type CHARACTER" }
end
program p
  logical, parameter :: status = .false.
  open (newunit=a, status=status)         ! { dg-error "must be of type CHARACTER" }
end
