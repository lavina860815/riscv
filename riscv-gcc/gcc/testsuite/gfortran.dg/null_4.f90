! { dg-do run }
!
! PR fortran/42936
!
! Contributed by Mat Cross
!
PROGRAM PASSES_NULL
  CALL SUB(NULL())
CONTAINS
  SUBROUTINE SUB(I)
    INTEGER, POINTER :: I(:,:,:)
    IF (ASSOCIATED (I)) STOP 1
  END SUBROUTINE SUB
END PROGRAM PASSES_NULL
