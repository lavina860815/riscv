! { dg-lto-do run }
! { dg-lto-options {{ -O3 -flto }} }
! This testcase will abort if C_SIGNED_CHAR is not interoperable with signed
! char
module lto_type_merge_test
  use, intrinsic :: iso_c_binding
  implicit none

  type, bind(c) :: MYFTYPE_1
     integer(c_signed_char) :: chr
     integer(c_signed_char) :: chrb
  end type MYFTYPE_1

  type(myftype_1), bind(c, name="myVar") :: myVar

contains
  subroutine types_test() bind(c)
    myVar%chr = myVar%chrb
  end subroutine types_test
end module lto_type_merge_test

