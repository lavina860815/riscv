! check F2.x edit descriptors
! PR 14746
      CHARACTER*15 LINE
      RCON21 = 9.
      RCON22 = .9
      WRITE(LINE,'(F2.0,1H,,F2.1)')RCON21,RCON22
      READ(LINE,'(F2.0,1X,F2.1)')XRCON21,XRCON22
      IF (RCON21.NE.XRCON21) STOP 1
      IF (RCON22.NE.XRCON22) STOP 2
      END
