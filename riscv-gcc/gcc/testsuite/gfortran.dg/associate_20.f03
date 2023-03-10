! { dg-do run }
!
! Contributed by mrestelli@gmail.com
! Adapated by Andre Vehreschild  <vehre@gcc.gnu.org>
! Test that fix for PR69296 is working.

program p
  implicit none

  type foo
    integer :: i
  end type

  integer :: j, i(3,2)
  class(foo), allocatable :: a(:,:)

  allocate (a(2,6))

  a(1,:)%i = (/ (     j , j=1,6) /)
  a(2,:)%i = (/ ( -10*j , j=1,6) /)

  i(:,1) = (/ 1 , 3 , 5 /)
  i(:,2) = (/ 4 , 5 , 6 /)

  associate( ai => a(:,i(:,1))%i )
    if (any(shape(ai) /= [2, 3])) STOP 1
    if (any(reshape(ai, [6]) /= [1 , -10, 3, -30, 5, -50])) STOP 2
  end associate

  deallocate(a)
end program p
