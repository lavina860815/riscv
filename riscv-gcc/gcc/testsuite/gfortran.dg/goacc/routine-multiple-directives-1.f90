! Check for valid cases of multiple OpenACC 'routine' directives.

      SUBROUTINE s_1
!$ACC ROUTINE(s_1)
!$ACC ROUTINE(s_1) SEQ
!$ACC ROUTINE SEQ
      END SUBROUTINE s_1

      SUBROUTINE s_2
!$ACC ROUTINE
!$ACC ROUTINE SEQ
!$ACC ROUTINE(s_2)
      END SUBROUTINE s_2

      SUBROUTINE v_1
!$ACC ROUTINE VECTOR
!$ACC ROUTINE VECTOR
!$ACC ROUTINE(v_1) VECTOR
!$ACC ROUTINE VECTOR
      END SUBROUTINE v_1

      SUBROUTINE v_2
!$ACC ROUTINE(v_2) VECTOR
!$ACC ROUTINE VECTOR
!$ACC ROUTINE(v_2) VECTOR
      END SUBROUTINE v_2

      SUBROUTINE sub_1
      IMPLICIT NONE
      EXTERNAL :: g_1
!$ACC ROUTINE (g_1) GANG
!$ACC ROUTINE (g_1) GANG
!$ACC ROUTINE (g_1) GANG

      CALL s_1
      CALL s_2
      CALL v_1
      CALL v_2
      CALL g_1
      CALL ABORT
      END SUBROUTINE sub_1

      MODULE m_w_1
      IMPLICIT NONE
      EXTERNAL :: w_1
!$ACC ROUTINE (w_1) WORKER
!$ACC ROUTINE (w_1) WORKER

      CONTAINS
      SUBROUTINE sub_2
      CALL s_1
      CALL s_2
      CALL v_1
      CALL v_2
      CALL w_1
      CALL ABORT
      END SUBROUTINE sub_2
      END MODULE m_w_1
