! { dg-do run }
! inspired by PR17175
REAL X
DOUBLE PRECISION Y

INTEGER, PARAMETER :: DP = KIND(Y)

INTEGER(kind=1) I1
INTEGER(kind=2) I2
INTEGER(kind=4) I4
INTEGER(kind=8) I8

X = 1.
Y = 1._DP

I1 = 10
I2 = -10
I4 = 20
I8 = -20

X = SCALE (X, I1)
X = SCALE (X, I2)
IF (X.NE.1.) STOP 1
X = SCALE (X, I4)
X = SCALE (X, I8)
IF (X.NE.1.) STOP 2

Y = SCALE (Y, I1)
Y = SCALE (Y, I2)
IF (Y.NE.1._DP) STOP 3
Y = SCALE (Y, I4)
Y = SCALE (Y, I8)
IF (Y.NE.1._DP) STOP 4

END
