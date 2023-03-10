-- CD2A23A.ADA

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
-- OBJECTIVE:
--     CHECK THAT WHEN A SIZE SPECIFICATION AND AN ENUMERATION
--     REPRESENTATION CLAUSE ARE GIVEN FOR AN ENUMERATION TYPE,
--     THEN OPERATIONS ON VALUES OF SUCH A TYPE ARE NOT AFFECTED
--     BY THE REPRESENTATION CLAUSE.

-- HISTORY:
--     RJW 07/28/87 CREATED ORIGINAL TEST.
--     DHH 04/18/89 CHANGED EXTENSION FROM '.DEP' TO '.ADA', CHANGED
--                  OPERATORS ON 'SIZE TESTS, AND ADDED CHECK ON
--                  REPRESENTATION CLAUSE.
--     WMC 03/27/92 ELIMINATED TEST REDUNDANCIES.


WITH REPORT; USE REPORT;
WITH LENGTH_CHECK;                      -- CONTAINS A CALL TO 'FAILED'.
PROCEDURE CD2A23A IS

     BASIC_SIZE : CONSTANT := INTEGER'SIZE/2;

     TYPE CHECK_TYPE IS (ZERO, ONE, TWO);

     FOR CHECK_TYPE USE (ZERO => 3, ONE => 4, TWO => 5);

     FOR CHECK_TYPE'SIZE USE BASIC_SIZE;

     C0 : CHECK_TYPE := ZERO;
     C1 : CHECK_TYPE := ONE;
     C2 : CHECK_TYPE := TWO;

     TYPE ARRAY_TYPE IS ARRAY (0 .. 2) OF CHECK_TYPE;
     CHARRAY : ARRAY_TYPE := (ZERO, ONE, TWO);

     TYPE REC_TYPE IS RECORD
          COMP0 : CHECK_TYPE := ZERO;
          COMP1 : CHECK_TYPE := ONE;
          COMP2 : CHECK_TYPE := TWO;
     END RECORD;

     CHREC : REC_TYPE;

     FUNCTION IDENT (CH : CHECK_TYPE) RETURN CHECK_TYPE IS
     BEGIN
          IF EQUAL (3, 3) THEN
               RETURN CH;
          ELSE
               RETURN ONE;
          END IF;
     END IDENT;

     PROCEDURE CHECK_1 IS NEW LENGTH_CHECK (CHECK_TYPE);

     PROCEDURE PROC (CI0,  CI2  :        CHECK_TYPE;
                     CIO1, CIO2 : IN OUT CHECK_TYPE;
                     CO2        :    OUT CHECK_TYPE) IS
     BEGIN
          IF NOT ((IDENT (CIO1) IN CIO1 .. CIO2)    AND
                  (CI0 NOT IN IDENT (ONE) .. CIO2)) THEN
               FAILED ("INCORRECT RESULTS FOR MEMBERSHIP OPERATORS " &
                       "- 1");
          END IF;

          IF CHECK_TYPE'VAL (0) /= IDENT (CI0)  OR
             CHECK_TYPE'VAL (1) /= IDENT (CIO1) OR
             CHECK_TYPE'VAL (2) /= IDENT (CIO2) THEN
               FAILED ("INCORRECT VALUE FOR CHECK_TYPE'VAL - 1");
          END IF;

          IF CHECK_TYPE'PRED (CIO1) /= IDENT (CI0)  OR
             CHECK_TYPE'PRED (CIO2) /= IDENT (CIO1) THEN
               FAILED ("INCORRECT VALUE FOR CHECK_TYPE'PRED - 1");
          END IF;

          IF CHECK_TYPE'VALUE ("ZERO") /= IDENT (CI0)   OR
             CHECK_TYPE'VALUE ("ONE")  /=  IDENT (CIO1) OR
             CHECK_TYPE'VALUE ("TWO")  /=  IDENT (CIO2) THEN
               FAILED ("INCORRECT VALUE FOR CHECK_TYPE'VALUE - 1");
          END IF;

          CO2 := TWO;

     END PROC;

BEGIN
     TEST ("CD2A23A", "CHECK THAT WHEN A SIZE SPECIFICATION AND " &
                      "AN ENUMERATION REPRESENTATION CLAUSE ARE " &
                      "GIVEN FOR AN ENUMERATION TYPE, THEN " &
                      "OPERATIONS ON VALUES OF SUCH A TYPE ARE " &
                      "NOT AFFECTED BY THE REPRESENTATION CLAUSE");

     CHECK_1 (C0, BASIC_SIZE, "CHECK_TYPE");
     PROC (ZERO, TWO, C1, C2, C2);

     IF CHECK_TYPE'SIZE /= IDENT_INT (BASIC_SIZE) THEN
          FAILED ("INCORRECT VALUE FOR CHECK_TYPE'SIZE");
     END IF;

     IF C0'SIZE < IDENT_INT (BASIC_SIZE) THEN
          FAILED ("INCORRECT VALUE FOR C0'SIZE");
     END IF;

     IF NOT ((C0 <  IDENT (ONE)) AND(IDENT (C2)  > IDENT (C1)) AND
             (C1 <= IDENT (ONE)) AND(IDENT (TWO) = C2))        THEN
          FAILED ("INCORRECT RESULTS FOR RELATIONAL OPERATORS - 2");
     END IF;

     IF CHECK_TYPE'LAST /= IDENT (TWO) THEN
          FAILED ("INCORRECT VALUE FOR CHECK_TYPE'LAST - 2");
     END IF;

     IF CHECK_TYPE'POS (C0) /= IDENT_INT (0) OR
        CHECK_TYPE'POS (C1) /= IDENT_INT (1) OR
        CHECK_TYPE'POS (C2) /= IDENT_INT (2) THEN
          FAILED ("INCORRECT VALUE FOR CHECK_TYPE'POS - 2");
     END IF;

     IF CHECK_TYPE'SUCC (C0) /= IDENT (C1) OR
        CHECK_TYPE'SUCC (C1) /= IDENT (C2) THEN
          FAILED ("INCORRECT VALUE FOR CHECK_TYPE'SUCC - 2");
     END IF;

     IF CHECK_TYPE'IMAGE (C0) /= IDENT_STR ("ZERO") OR
        CHECK_TYPE'IMAGE (C1) /= IDENT_STR ("ONE")  OR
        CHECK_TYPE'IMAGE (C2) /= IDENT_STR ("TWO")  THEN
          FAILED ("INCORRECT VALUE FOR CHECK_TYPE'IMAGE - 2");
     END IF;

     IF CHARRAY (1)'SIZE < IDENT_INT (BASIC_SIZE) THEN
          FAILED ("INCORRECT VALUE FOR CHARRAY (1)'SIZE");
     END IF;

     IF NOT ((CHARRAY (0) <  IDENT (ONE))                 AND
             (IDENT (CHARRAY (2))  > IDENT (CHARRAY (1))) AND
             (CHARRAY (1) <= IDENT (ONE))                 AND
             (IDENT (TWO) = CHARRAY (2)))                 THEN
          FAILED ("INCORRECT RESULTS FOR RELATIONAL OPERATORS - 3");
     END IF;

     IF NOT ((IDENT (CHARRAY (1)) IN CHARRAY (1) .. CHARRAY (2)) AND
             (CHARRAY (0) NOT IN IDENT (ONE) .. CHARRAY (2)))    THEN
          FAILED ("INCORRECT RESULTS FOR MEMBERSHIP OPERATORS - 3");
     END IF;

     IF CHECK_TYPE'VAL (0) /= IDENT (CHARRAY (0)) OR
        CHECK_TYPE'VAL (1) /= IDENT (CHARRAY (1)) OR
        CHECK_TYPE'VAL (2) /= IDENT (CHARRAY (2)) THEN
          FAILED ("INCORRECT VALUE FOR CHECK_TYPE'VAL - 3");
     END IF;

     IF CHECK_TYPE'PRED (CHARRAY (1)) /= IDENT (CHARRAY (0)) OR
        CHECK_TYPE'PRED (CHARRAY (2)) /= IDENT (CHARRAY (1)) THEN
          FAILED ("INCORRECT VALUE FOR CHECK_TYPE'PRED - 3");
     END IF;

     IF CHECK_TYPE'VALUE ("ZERO") /= IDENT (CHARRAY (0)) OR
        CHECK_TYPE'VALUE ("ONE")  /= IDENT (CHARRAY (1)) OR
        CHECK_TYPE'VALUE ("TWO")  /= IDENT (CHARRAY (2)) THEN
          FAILED ("INCORRECT VALUE FOR CHECK_TYPE'VALUE - 3");
     END IF;

     IF CHREC.COMP2'SIZE < IDENT_INT (BASIC_SIZE) THEN
          FAILED ("INCORRECT VALUE FOR CHREC.COMP2'SIZE");
     END IF;

     IF NOT ((CHREC.COMP0 <  IDENT (ONE))                 AND
             (IDENT (CHREC.COMP2)  > IDENT (CHREC.COMP1)) AND
             (CHREC.COMP1 <= IDENT (ONE))                 AND
             (IDENT (TWO) = CHREC.COMP2))                 THEN
          FAILED ("INCORRECT RESULTS FOR RELATIONAL OPERATORS - 4");
     END IF;

     IF NOT ((IDENT (CHREC.COMP1) IN CHREC.COMP1 .. CHREC.COMP2) AND
             (CHREC.COMP0 NOT IN IDENT (ONE) .. CHREC.COMP2))    THEN
          FAILED ("INCORRECT RESULTS FOR MEMBERSHIP OPERATORS - 4");
     END IF;

     IF CHECK_TYPE'POS (CHREC.COMP0) /= IDENT_INT (0) OR
        CHECK_TYPE'POS (CHREC.COMP1) /= IDENT_INT (1) OR
        CHECK_TYPE'POS (CHREC.COMP2) /= IDENT_INT (2) THEN
          FAILED ("INCORRECT VALUE FOR CHECK_TYPE'POS - 4");
     END IF;

     IF CHECK_TYPE'SUCC (CHREC.COMP0) /= IDENT (CHREC.COMP1) OR
        CHECK_TYPE'SUCC (CHREC.COMP1) /= IDENT (CHREC.COMP2) THEN
          FAILED ("INCORRECT VALUE FOR CHECK_TYPE'SUCC - 4");
     END IF;

     IF CHECK_TYPE'IMAGE (CHREC.COMP0) /= IDENT_STR ("ZERO") OR
        CHECK_TYPE'IMAGE (CHREC.COMP1) /= IDENT_STR ("ONE")  OR
        CHECK_TYPE'IMAGE (CHREC.COMP2) /= IDENT_STR ("TWO")  THEN
          FAILED ("INCORRECT VALUE FOR CHECK_TYPE'IMAGE - 4");
     END IF;


     RESULT;

END CD2A23A;
