! { dg-do compile }
! { dg-options "-Wall" }
! The compiler_options() function is dependent on the
! command line options and thus incompatible with -fcompare-debug.
! { dg-skip-if "-fcompare-debug incompatible test" { *-*-* } { "-fcompare-debug" } { "" } } */
!
! PR fortran/45823
!
! We used to warn about 
!  "Type specified for intrinsic function" for this file
!

use iso_c_binding
use iso_Fortran_env
implicit none
intrinsic sin
real :: x = 3.4
print *, sin(x), c_sizeof(c_int), compiler_options(), compiler_version()
end


module test_mod
    use iso_fortran_env
end module test_mod

subroutine test
use test_mod
end subroutine test
