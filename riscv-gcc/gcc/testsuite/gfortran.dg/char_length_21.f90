! { dg-do run }
program rabbithole
   implicit none
   character(len=:), allocatable :: text_block(:)
   integer i, ii
   character(len=10) :: cten='abcdefghij'
   character(len=20) :: ctwenty='abcdefghijabcdefghij'
   ii = -6
   text_block = [character(len=ii) :: cten, ctwenty]
   if (any(len_trim(text_block) /= 0)) STOP 1
end program rabbithole
