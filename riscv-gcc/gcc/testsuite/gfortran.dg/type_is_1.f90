! { dg-do compile }
! PR fortran/66245
! Original testcase by Gerhard Steinmetz
! <gerhard dot steinmetz dot fortran at t-online dot de>
program p
   type t; end type
   class(t), allocatable :: x
   call s
   contains
      subroutine s
         select type ( x )
         type is ( )       ! { dg-error "error in TYPE IS" }
         end select
      end subroutine s
end program p
