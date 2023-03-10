! { dg-do compile }
!
! Test the fix for PR82121
!
! Contributed by Iain Miller  <iain.miller@ecmwf.int>
!
MODULE YOMCDDH
  IMPLICIT NONE
  SAVE
  TYPE :: TCDDH
    CHARACTER(len=12),ALLOCATABLE :: CADHTLS(:)
  END TYPE TCDDH
  CHARACTER(len=12),ALLOCATABLE :: CADHTTS(:)
  TYPE(TCDDH), POINTER :: YRCDDH => NULL()
END MODULE YOMCDDH


SUBROUTINE SUCDDH()
  USE YOMCDDH  , ONLY : YRCDDH,CADHTTS
  IMPLICIT NONE
  ALLOCATE (YRCDDH%CADHTLS(20))
  ALLOCATE (CADHTTS(20))
  ASSOCIATE(CADHTLS=>YRCDDH%CADHTLS, NORMCHAR=>CADHTTS)
! Direct reference to character array compiled correctly
!    YRCDDH%CADHTLS(1)='SVGTLF'
! Reference to associated variable name failed to compile
    CADHTLS(2)='SVGTLT'
    NORMCHAR(1)='SVLTTC'
  END ASSOCIATE
END SUBROUTINE SUCDDH
