c  { dg-do compile }
c  PR71404 [7 Regression] 416.gamess in SPEC CPU 2006 failed to build
      SUBROUTINE SQRINT (LFILE,IREGION,LENGTH)
      DIMENSION IREGION(LENGTH)
      LOGICAL DSKWRK,MASWRK
      IF (DSKWRK.OR.MASWRK) READ(LFILE, END=200) IREGION
  200 CONTINUE
      END
