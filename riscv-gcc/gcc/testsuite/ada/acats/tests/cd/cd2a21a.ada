-- CD2A21A.ADA

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
--     CHECK THAT WHEN A SIZE SPECIFICATION IS GIVEN FOR AN
--     ENUMERATION TYPE, THEN OPERATIONS ON VALUES OF SUCH A TYPE
--     ARE NOT AFFECTED BY THE REPRESENTATION CLAUSE.

-- HISTORY:
--     RJW 07/28/87 CREATED ORIGINAL TEST.
--     DHH 04/17/89 CHANGED EXTENSION FROM '.DEP' TO '.ADA', CHANGED
--                  OPERATORS ON 'SIZE TESTS, AND ADDED CHECK ON
--                  REPRESENTATION CLAUSE.
--     JRL 03/26/92 ELIMINATED REDUNDANT TESTING.

WITH REPORT; USE REPORT;
WITH LENGTH_CHECK;                    -- CONTAINS A CALLED TO 'FAILED'.
PROCEDURE CD2A21A IS

     BASIC_SIZE : CONSTANT := INTEGER'SIZE/2;

     TYPE CHECK_TYPE IS (ZERO, ONE, TWO);

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

     PROCEDURE CHECK_1 IS NEW LENGTH_CHECK (CHECK_TYPE);

     FUNCTION IDENT (CH : CHECK_TYPE) RETURN CHECK_TYPE IS
     BEGIN
          IF EQUAL (3, 3) THEN
               RETURN CH;
          ELSE
               RETURN ONE;
          END IF;
     END IDENT;

     PROCEDURE PROC (CI0,  CI2  :        CHECK_TYPE;
                     CIO1, CIO2 : IN OUT CHECK_TYPE;
                     CO2        :    OUT CHECK_TYPE) IS
     BEGIN
          IF NOT ((CI0 <  IDENT (ONE))                          AND
                  (IDENT (CI2)  > IDENT (CIO1))                 AND
                  (CIO1 <= IDENT (ONE)) AND(IDENT (TWO) = CI2)) THEN
               FAILED ("INCORRECT RESULTS FOR RELATIONAL OPERATORS " &
                       "- 1");
          END IF;

          IF CHECK_TYPE'POS (CI0)  /= IDENT_INT (0) OR
             CHECK_TYPE'POS (CIO1) /= IDENT_INT (1) OR
             CHECK_TYPE'POS (CI2)  /= IDENT_INT (2) THEN
               FAILED ("INCORRECT VALUE FOR CHECK_TYPE'POS - 1");
          END IF;

          IF CHECK_TYPE'SUCC (CI0)  /=  IDENT (CIO1) OR
             CHECK_TYPE'SUCC (CIO1) /= IDENT (CI2)   THEN
               FAILED ("INCORRECT VALUE FOR CHECK_TYPE'SUCC - 1");
          END IF;

          IF CHECK_TYPE'IMAGE (CI0)  /= IDENT_STR ("ZERO") OR
             CHECK_TYPE'IMAGE (CIO1) /= IDENT_STR ("ONE")  OR
             CHECK_TYPE'IMAGE (CI2)  /= IDENT_STR ("TWO")  THEN
               FAILED ("INCORRECT VALUE FOR CHECK_TYPE'IMAGE - 1");
          END IF;

          CO2 := TWO;

     END PROC;

BEGIN
     TEST ("CD2A21A", "CHECK THAT WHEN A SIZE SPECIFICATION IS " &
                      "GIVEN FOR AN ENUMERATION TYPE, THEN " &
                      "OPERATIONS ON VALUES OF SUCH A TYPE ARE " &
                      "NOT AFFECTED BY THE REPRESENTATION CLAUSE");

     PROC (ZERO, TWO, C1, C2, C2);
     CHECK_1 (TWO, INTEGER'SIZE/2, "CHECK_TYPE");

     IF CHECK_TYPE'SIZE /= IDENT_INT (BASIC_SIZE) THEN
          FAILED ("INCORRECT VALUE FOR CHECK_TYPE'SIZE");
     END IF;

     IF C0'SIZE < IDENT_INT (BASIC_SIZE) THEN
          FAILED ("INCORRECT VALUE FOR C0'SIZE");
     END IF;

     IF NOT ((IDENT (C1) IN C1 .. C2)       AND
             (C0 NOT IN IDENT (ONE) .. C2)) THEN
          FAILED ("INCORRECT RESULTS FOR MEMBERSHIP OPERATORS - 2");
     END IF;

     IF CHECK_TYPE'FIRST /= IDENT (ZERO) THEN
          FAILED ("INCORRECT VALUE FOR CHECK_TYPE'FIRST - 2");
     END IF;

     IF CHECK_TYPE'VAL (0) /= IDENT (C0) OR
        CHECK_TYPE'VAL (1) /= IDENT (C1) OR
        CHECK_TYPE'VAL (2) /= IDENT (C2) THEN
          FAILED ("INCORRECT VALUE FOR CHECK_TYPE'VAL - 2");
     END IF;

     IF CHECK_TYPE'PRED (C1) /= IDENT (C0) OR
        CHECK_TYPE'PRED (C2) /= IDENT (C1) THEN
          FAILED ("INCORRECT VALUE FOR CHECK_TYPE'PRED - 2");
     END IF;

     IF CHECK_TYPE'VALUE ("ZERO") /= IDENT (C0)  OR
        CHECK_TYPE'VALUE ("ONE")  /=  IDENT (C1) OR
        CHECK_TYPE'VALUE ("TWO")  /=  IDENT (C2) THEN
          FAILED ("INCORRECT VALUE FOR CHECK_TYPE'VALUE - 2");
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

     IF CHECK_TYPE'POS (CHARRAY (0)) /= IDENT_INT (0) OR
        CHECK_TYPE'POS (CHARRAY (1)) /= IDENT_INT (1) OR
        CHECK_TYPE'POS (CHARRAY (2)) /= IDENT_INT (2) THEN
          FAILED ("INCORRECT VALUE FOR CHECK_TYPE'POS - 3");
     END IF;

     IF CHECK_TYPE'SUCC (CHARRAY (0)) /= IDENT (CHARRAY (1)) OR
        CHECK_TYPE'SUCC (CHARRAY (1)) /= IDENT (CHARRAY (2)) THEN
          FAILED ("INCORRECT VALUE FOR CHECK_TYPE'SUCC - 3");
     END IF;

     IF CHECK_TYPE'IMAGE (CHARRAY (0)) /= IDENT_STR ("ZERO") OR
        CHECK_TYPE'IMAGE (CHARRAY (1)) /= IDENT_STR ("ONE")  OR
        CHECK_TYPE'IMAGE (CHARRAY (2)) /= IDENT_STR ("TWO")  THEN
          FAILED ("INCORRECT VALUE FOR CHECK_TYPE'IMAGE - 3");
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

     IF CHECK_TYPE'VAL (0) /= IDENT (CHREC.COMP0) OR
        CHECK_TYPE'VAL (1) /= IDENT (CHREC.COMP1) OR
        CHECK_TYPE'VAL (2) /= IDENT (CHREC.COMP2) THEN
          FAILED ("INCORRECT VALUE FOR CHECK_TYPE'VAL - 4");
     END IF;

     IF CHECK_TYPE'PRED (CHREC.COMP1) /= IDENT (CHREC.COMP0) OR
        CHECK_TYPE'PRED (CHREC.COMP2) /= IDENT (CHREC.COMP1) THEN
          FAILED ("INCORRECT VALUE FOR CHECK_TYPE'PRED - 4");
     END IF;

     IF CHECK_TYPE'VALUE ("ZERO") /= IDENT (CHREC.COMP0) OR
        CHECK_TYPE'VALUE ("ONE")  /= IDENT (CHREC.COMP1) OR
        CHECK_TYPE'VALUE ("TWO")  /= IDENT (CHREC.COMP2) THEN
          FAILED ("INCORRECT VALUE FOR CHECK_TYPE'VALUE - 4");
     END IF;

     RESULT;
END CD2A21A;
