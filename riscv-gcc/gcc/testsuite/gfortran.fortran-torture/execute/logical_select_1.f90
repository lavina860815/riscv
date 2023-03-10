LOGICAL :: L = .FALSE.

SELECT CASE (L)
   CASE (.TRUE.)
      STOP 1
   CASE (.FALSE.)
      CONTINUE
   CASE DEFAULT
      STOP 2
END SELECT

SELECT CASE (L)
   CASE (.TRUE., .FALSE.)
      CONTINUE
   CASE DEFAULT
      STOP 3
END SELECT

SELECT CASE (L)
   CASE (.FALSE.)
      CONTINUE
   CASE DEFAULT
      STOP 4
END SELECT

SELECT CASE (L)
   CASE (.NOT. .TRUE.)
      CONTINUE
   CASE DEFAULT
      STOP 5
END SELECT

SELECT CASE (.NOT. L)
   CASE (.TRUE.)
      CONTINUE
   CASE DEFAULT
      STOP 6
END SELECT

SELECT CASE (Truth_or_Dare() .OR. L)
   CASE (.TRUE.)
      CONTINUE
   CASE DEFAULT
      STOP 7
END SELECT

CONTAINS

   FUNCTION Truth_or_Dare ()
      LOGICAL Truth_or_Dare
      Truth_or_Dare = .TRUE.
   END FUNCTION

END

