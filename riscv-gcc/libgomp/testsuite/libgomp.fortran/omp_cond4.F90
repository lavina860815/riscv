! Test conditional compilation in free form if -fno-openmp
! { dg-options "-fno-openmp" }
   10 foo = 2&
  &56
  if (foo.ne.256) stop 1
  bar = 26
   !$  20 ba&
!$   &r = 4&
  !$2
      !$bar = 62
   !$ bar = bar + 2
#ifdef _OPENMP
bar = bar - 1
#endif
  if (bar.ne.26) stop 2
      baz = bar
!$ 30 baz = 5&     ! Comment
!$12  &  
  !$ + 2
!$X baz = 0 ! Not valid OpenMP conditional compilation lines
! $   baz = 1
baz = baz + 1 !$ baz = 2
      if (baz.ne.27) stop 3
      end
