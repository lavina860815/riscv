! { dg-do compile }
! { dg-options "-Warray-temporaries" }
! Tests the fix for PR80164, in which the compiler segfaulted on this
! when using -Warray-temporaries
!
!******************************************************************************
module global
  type :: a
    integer :: b
    character(8):: c
  end type a
  interface assignment(=)
    module procedure a_to_a, c_to_a, a_to_c
  end interface
  interface operator(.ne.)
    module procedure a_ne_a
  end interface

  type(a) :: x(4), y(4)
  logical :: l1(4), t = .true., f= .false.
contains
!******************************************************************************
  elemental subroutine a_to_a (m, n)
    type(a), intent(in) :: n
    type(a), intent(out) :: m
    m%b = len ( trim(n%c))
    m%c = n%c
  end subroutine a_to_a
  elemental subroutine c_to_a (m, n)
    character(8), intent(in) :: n
    type(a), intent(out) :: m
    m%b = m%b + 1
    m%c = n
  end subroutine c_to_a
  elemental subroutine a_to_c (m, n)
    type(a), intent(in) :: n
    character(8), intent(out) :: m
    m = n%c
  end subroutine a_to_c
!******************************************************************************
  elemental logical function a_ne_a (m, n)
    type(a), intent(in) :: n
    type(a), intent(in) :: m
    a_ne_a = (m%b .ne. n%b) .or. (m%c .ne. n%c)
  end function a_ne_a
!******************************************************************************
  elemental function foo (m)
    type(a) :: foo
    type(a), intent(in) :: m
    foo%b = 0
    foo%c = m%c
  end function foo  
end module global
!******************************************************************************
program test
  use global
  x = (/a (0, "one"),a (0, "two"),a (0, "three"),a (0, "four")/) ! { dg-warning "Creating array temporary" }
  y = x
end program test 
