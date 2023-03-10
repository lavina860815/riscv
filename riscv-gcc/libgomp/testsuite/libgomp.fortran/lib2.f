C { dg-do run }

      USE OMP_LIB

      DOUBLE PRECISION :: D, E
      LOGICAL :: L
      INTEGER (KIND = OMP_LOCK_KIND) :: LCK
      INTEGER (KIND = OMP_NEST_LOCK_KIND) :: NLCK

      D = OMP_GET_WTIME ()

      CALL OMP_INIT_LOCK (LCK)
      CALL OMP_SET_LOCK (LCK)
      IF (OMP_TEST_LOCK (LCK)) STOP 1
      CALL OMP_UNSET_LOCK (LCK)
      IF (.NOT. OMP_TEST_LOCK (LCK)) STOP 2
      IF (OMP_TEST_LOCK (LCK)) STOP 3
      CALL OMP_UNSET_LOCK (LCK)
      CALL OMP_DESTROY_LOCK (LCK)

      CALL OMP_INIT_NEST_LOCK (NLCK)
      IF (OMP_TEST_NEST_LOCK (NLCK) .NE. 1) STOP 4
      CALL OMP_SET_NEST_LOCK (NLCK)
      IF (OMP_TEST_NEST_LOCK (NLCK) .NE. 3) STOP 5
      CALL OMP_UNSET_NEST_LOCK (NLCK)
      CALL OMP_UNSET_NEST_LOCK (NLCK)
      IF (OMP_TEST_NEST_LOCK (NLCK) .NE. 2) STOP 6
      CALL OMP_UNSET_NEST_LOCK (NLCK)
      CALL OMP_UNSET_NEST_LOCK (NLCK)
      CALL OMP_DESTROY_NEST_LOCK (NLCK)

      CALL OMP_SET_DYNAMIC (.TRUE.)
      IF (.NOT. OMP_GET_DYNAMIC ()) STOP 7
      CALL OMP_SET_DYNAMIC (.FALSE.)
      IF (OMP_GET_DYNAMIC ()) STOP 8

      CALL OMP_SET_NESTED (.TRUE.)
      IF (.NOT. OMP_GET_NESTED ()) STOP 9
      CALL OMP_SET_NESTED (.FALSE.)
      IF (OMP_GET_NESTED ()) STOP 10

      CALL OMP_SET_NUM_THREADS (5)
      IF (OMP_GET_NUM_THREADS () .NE. 1) STOP 11
      IF (OMP_GET_MAX_THREADS () .NE. 5) STOP 12
      IF (OMP_GET_THREAD_NUM () .NE. 0) STOP 13
      CALL OMP_SET_NUM_THREADS (3)
      IF (OMP_GET_NUM_THREADS () .NE. 1) STOP 14
      IF (OMP_GET_MAX_THREADS () .NE. 3) STOP 15
      IF (OMP_GET_THREAD_NUM () .NE. 0) STOP 16
      L = .FALSE.
C$OMP PARALLEL REDUCTION (.OR.:L)
      L = OMP_GET_NUM_THREADS () .NE. 3
      L = L .OR. (OMP_GET_THREAD_NUM () .LT. 0)
      L = L .OR. (OMP_GET_THREAD_NUM () .GE. 3)
C$OMP MASTER
      L = L .OR. (OMP_GET_THREAD_NUM () .NE. 0)
C$OMP END MASTER
C$OMP END PARALLEL
      IF (L) STOP 17

      IF (OMP_GET_NUM_PROCS () .LE. 0) STOP 18
      IF (OMP_IN_PARALLEL ()) STOP 19
C$OMP PARALLEL REDUCTION (.OR.:L)
      L = .NOT. OMP_IN_PARALLEL ()
C$OMP END PARALLEL
C$OMP PARALLEL REDUCTION (.OR.:L) IF (.TRUE.)
      L = .NOT. OMP_IN_PARALLEL ()
C$OMP END PARALLEL
      IF (L) STOP 20

      E = OMP_GET_WTIME ()
      IF (D .GT. E) STOP 21
      D = OMP_GET_WTICK ()
C Negative precision is definitely wrong,
C bigger than 1s clock resolution is also strange
      IF (D .LE. 0 .OR. D .GT. 1.) STOP 22
      END
