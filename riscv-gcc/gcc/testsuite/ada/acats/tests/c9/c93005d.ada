-- C93005D.ADA 

--                             Grant of Unlimited Rights
--
--     Under contracts F33600-87-D-0337, F33600-84-D-0280, MDA903-79-C-0687,
--     F08630-91-C-0015, and DCA100-97-D-0025, the U.S. Government obtained 
--     unlimited rights in the software and documentation contained herein.
--     Unlimited rights are defined in DFAR 252.227-7013(a)(19).  By making 
--     this public release, the Government intends to confer upon all 
--     recipients unlimited rights  equal to those held by the Government.  
--     These rights include rights to use, duplicate, release or disclose the 
--     released technical data and computer software in whole or in part, in 
--     any manner and for any purpose whatsoever, and to have or permit others 
--     to do so.
--
--                                    DISCLAIMER
--
--     ALL MATERIALS OR INFORMATION HEREIN RELEASED, MADE AVAILABLE OR
--     DISCLOSED ARE AS IS.  THE GOVERNMENT MAKES NO EXPRESS OR IMPLIED 
--     WARRANTY AS TO ANY MATTER WHATSOEVER, INCLUDING THE CONDITIONS OF THE
--     SOFTWARE, DOCUMENTATION OR OTHER INFORMATION RELEASED, MADE AVAILABLE 
--     OR DISCLOSED, OR THE OWNERSHIP, MERCHANTABILITY, OR FITNESS FOR A
--     PARTICULAR PURPOSE OF SAID MATERIAL.
--*
-- CHECK THAT IF AN EXCEPTION IS RAISED IN A DECLARATIVE PART OR PACKAGE
-- SPECIFICATION, A TASK DECLARED IN THE SAME DECLARATIVE PART BECOMES
-- COMPLETED BEFORE IT HAS BEEN ACTIVATED; ANY TASKS AWAITING A
-- RENDEZVOUS WITH THE COMPLETED RECEIVE TASKING_ERROR.

-- CASE 2: TASKS IN DECLARATIVE PART OF A BLOCK AND PACKAGE
-- SPECIFICATION.  THE TASKS DEPEND ON THE DECLARATIVE PART.
-- OTHER TASKS HAVE BEEN QUEUED ON THE TASKS' ENTRIES.

-- RAC 19-MAR-1985
-- JBG 06/03/85
-- EG  10/30/85  ELIMINATE THE USE OF NUMERIC_ERROR IN TEST.
-- PWN 01/31/95  REMOVED PRAGMA PRIORITY FOR ADA 9X.
--               ADDED PROCEDURE TO KEEP PACKAGE BODIES LEGAL.

with Impdef;

WITH REPORT; USE REPORT;
WITH SYSTEM; USE SYSTEM;
PRAGMA ELABORATE (REPORT);
PACKAGE C93005D_PK1 IS

     -- THIS TYPE OF TASK IS ALWAYS UNACTIVATED.
     TASK TYPE UNACTIVATED IS
          ENTRY E;
     END UNACTIVATED;

     TYPE ACC_UNACTIVATED IS ACCESS UNACTIVATED;

     -- *******************************************
     -- DEFINITIONS FOR MUST NOT BE TERMINATED TASKS
     -- *******************************************
     --
     -- THIS SET OF DECLARATIONS DEFINES A RECORD TYPE MNT (MUST NOT
     -- TERMINATE).  WHENEVER SUCH A RECORD IS DECLARED, A COUNT IS
     -- INCREMENTED AND A TASK IS CREATED.   THE TASK WILL DECREMENT THE
     -- COUNT UNLESS IT IS INCORRECTLY AND PREMATURELY TERMINATED.
     -- THE ROUTINE CHECK IS CALLED TO VERIFY WHETHER THE COUNT
     -- HAS RETURNED TO 0 (ALL MNT TASKS GOT A CHANCE TO DO THEIR
     -- DECREMENT).

     -- AN MNT TASK.   SUCH TASKS MUST NOT BE TERMINATED
     -- BY ANYONE BUT THEMSELVES.
     --
     TASK TYPE MNT_TASK IS
     END MNT_TASK;

     FUNCTION F RETURN INTEGER;

     -- THE RECORD THAT IS DECLARED TO HOLD AN MNT TASK
     -- AND FORCE CALLING F BEFORE CREATING THE TASK.
     -- F INCREMENTS THE COUNT, THE TASK DECREMENTS THE
     -- COUNT.
     --
     TYPE MNT IS
          RECORD
               DUMMY : INTEGER :=  F;
               T     : MNT_TASK;
          END RECORD;

     PROCEDURE CHECK;


     -- *******************************************
     -- END OF DEFINITIONS FOR MUST NOT BE TERMINATED TASKS
     -- *******************************************

END C93005D_PK1;


PACKAGE BODY C93005D_PK1 IS

-- THIS TASK IS CALLED IF AN UNACTIVATED TASK
-- IS EVER INCORRECTLY ACTIVATED.  IT REPORTS FAILURE.

     TASK T IS
          ENTRY E;
     END;

     -- ***********************************************
     -- START OF DEFINITIONS FOR MUST NOT TERMINATE TASKS
     -- ***********************************************

-- COUNT OF TASKS THAT MUST NOT BE TERMINATED AND
-- ARE STILL ACTIVE.

     MNT_COUNT : INTEGER := 0;

-- TASK TO SYNCHRONIZE THE MNT_COUNT VARIABLE

     TASK MNT_COUNTER IS
          ENTRY INCR;
          ENTRY DECR;
     END MNT_COUNTER;

-- SYNCHRONIZING TASK

     TASK BODY MNT_COUNTER IS
     BEGIN
          LOOP
               SELECT
                    ACCEPT INCR DO
                         MNT_COUNT := MNT_COUNT +1;
                    END INCR;

               OR  ACCEPT DECR DO
                         MNT_COUNT := MNT_COUNT -1;
                    END DECR;

               OR  TERMINATE;

               END SELECT;
          END LOOP;
     END MNT_COUNTER;

-- INCREMENT THE MNT_COUNT WHEN A TASK IS CREATED
--
     FUNCTION F RETURN INTEGER IS
     BEGIN
          MNT_COUNTER.INCR;
          RETURN 0;
     END F;

-- CHECK THAT THE MUST NOT BE TERMINATED TASKS ARE
-- NOT YET TERMINATED AND THAT THE SYNCRHONIZING TASK
-- ITSELF IS NOT TERMINATED.
--
     PROCEDURE CHECK IS
     BEGIN
          IF MNT_COUNT /= 0 OR MNT_COUNTER'TERMINATED THEN
               FAILED ("SOME MUST-NOT-TERMINATE TASK WAS PREMATURELY " &
                       "TERMINATED");
          END IF;
-- RESET THE COUNT FOR THE NEXT SUBTEST:
          MNT_COUNT := 0;
     END CHECK;

-- A MUST NOT BE TERMINATED TASK.  DELAY LONG ENOUGH
-- TO BE THE LAST TASK OF A SCOPE TO TERMINATE.   THEN
-- DECREMENT THE COUNTER.
--
     TASK BODY MNT_TASK IS
     BEGIN
          DELAY 5.0 * Impdef.One_Second;
          MNT_COUNTER.DECR;
     END MNT_TASK;

     -- ***********************************************
     -- END OF DEFINITIONS FOR MUST NOT TERMINATE TASKS
     -- ***********************************************

     TASK BODY T IS
     BEGIN
          LOOP
               SELECT
                    ACCEPT E DO
                         FAILED ("SOME TYPE U TASK WAS ACTIVATED");
                    END E;

               OR   TERMINATE;
               END SELECT;
          END LOOP;
     END T;

     -- TASKS OF TYPE UNACTIVATED MUST NEVER BE ACTIVATED.
     --
     TASK BODY UNACTIVATED IS
     BEGIN
          T.E;
     END UNACTIVATED;
END C93005D_PK1;

WITH C93005D_PK1; USE C93005D_PK1;
PRAGMA ELABORATE (C93005D_PK1);
GENERIC
     T1 : IN OUT UNACTIVATED;
PACKAGE C93005D_ENQUEUE IS
     PROCEDURE REQUIRE_BODY;
END;

with Impdef;
WITH REPORT; USE REPORT;
WITH SYSTEM; USE SYSTEM;
PRAGMA ELABORATE (REPORT);
PACKAGE BODY C93005D_ENQUEUE IS

     TASK T3 IS
     END T3;

     TASK BODY T3 IS
     BEGIN
          T1.E;
          FAILED ("ENQUEUED CALLER DID NOT GET EXCEPTION");
     EXCEPTION
          WHEN TASKING_ERROR => NULL;
          WHEN OTHERS => FAILED ("WRONG EXCEPTION RAISED");
     END T3;

     PROCEDURE REQUIRE_BODY IS
     BEGIN
          NULL;
     END;
BEGIN                    -- T3 CALLS T1 HERE
     DELAY 1.0 * Impdef.One_Second;            -- ENSURE THAT T3 EXECUTES
END C93005D_ENQUEUE;

WITH REPORT, C93005D_PK1, C93005D_ENQUEUE;
USE  REPORT, C93005D_PK1;
WITH SYSTEM; USE SYSTEM;
PROCEDURE C93005D IS


BEGIN

     TEST("C93005D", "TEST EXCEPTIONS TERMINATE NOT YET ACTIVATED " &
                     "TASKS");

     COMMENT("SUBTEST 2: TASKS IN DECL PART OF A BLOCK AND A PACKAGE " &
             "SPEC");
     COMMENT("  THE TASKS DEPEND ON THE DECLARATIVE PART");
     COMMENT("  OTHER TASKS HAVE BEEN ENQUEUED ON THE TASKS' ENTRIES");
B21: DECLARE
          X : MNT;
     BEGIN
B22:      BEGIN
B23:           DECLARE
                    TYPE ACC_MNT IS ACCESS MNT;
                    T1 : UNACTIVATED;
                    Y  : ACC_MNT := NEW MNT;

                    PACKAGE HAS_UNACTIVATED IS
                         T2 : UNACTIVATED;
                         Z  : ACC_MNT := NEW MNT;
                         PACKAGE ENQUEUE1 IS NEW C93005D_ENQUEUE(T1);
                         PACKAGE ENQUEUE2 IS NEW C93005D_ENQUEUE(T2);
                         I : POSITIVE := IDENT_INT(0); -- RAISE
                                         -- CONSTRAINT_ERROR EXCEPTION.
                    -- TERMINATES T1 AND T2 AND INDIRECTLY THE 2 T3'S
                    END HAS_UNACTIVATED;
                    USE HAS_UNACTIVATED;
               BEGIN  -- WOULD HAVE BEEN ACTIVATED HERE
                    IF EQUAL (I, I) THEN
                         FAILED ("EXCEPTION NOT RAISED");
                    END IF;
               EXCEPTION
                    WHEN OTHERS =>
                         FAILED ("EXCEPTION RAISED IN WRONG SCOPE");
               END B23;
          EXCEPTION
               WHEN CONSTRAINT_ERROR =>
                    COMMENT("SUBTEST 2 COMPLETED");
               WHEN OTHERS =>
                    FAILED ("WRONG EXCEPTION RAISED IN B22");
          END B22;
     END B21;

     CHECK;

     RESULT;

EXCEPTION
     WHEN OTHERS =>
          FAILED ("EXCEPTION NOT ABSORBED");
          RESULT;
END C93005D;
