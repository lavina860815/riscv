! Check the DATE_AND_TIME intrinsic.
! Call teh intrinsic with a variety of arguments, but does not check the
! returned values.
CHARACTER(8) :: d, d1
CHARACTER(10) :: t, t1
CHARACTER(5) :: z, z1
INTEGER :: v(8), v1(8)

CALL DATE_AND_TIME

CALL DATE_AND_TIME(DATE=d)
CALL DATE_AND_TIME(TIME=t)
CALL DATE_AND_TIME(ZONE=z)

CALL DATE_AND_TIME(VALUES=v)

CALL DATE_AND_TIME(DATE=d, TIME=t)
CALL DATE_AND_TIME(DATE=d, VALUES=v)
CALL DATE_AND_TIME(TIME=t, ZONE=z)

CALL DATE_AND_TIME(DATE=d, TIME=t, ZONE=z)
CALL DATE_AND_TIME(TIME=t, ZONE=z, VALUES=v)

CALL DATE_AND_TIME(DATE=d, TIME=t, ZONE=z, VALUES=v)

END
