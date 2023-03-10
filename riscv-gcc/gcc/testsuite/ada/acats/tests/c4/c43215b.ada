-- C43215B.ADA

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
-- CHECK THAT CONSTRAINT_ERROR IS RAISED WHEN THE UPPER BOUND
-- OF A POSITIONAL AGGREGATE DOES NOT BELONG TO THE INDEX BASE TYPE.

-- *** NOTE: This test has been modified since ACVC version 1.11 to    -- 9X
-- ***       remove incompatibilities associated with the transition   -- 9X
-- ***       to Ada 9X.                                                -- 9X

-- EG  02/13/84
-- JRL 03/30/93 REMOVED NUMERIC_ERROR FROM TEST.

WITH REPORT;
WITH SYSTEM;

PROCEDURE C43215B IS

     USE REPORT;
     USE SYSTEM;

BEGIN

     TEST("C43215B","CHECK THAT CONSTRAINT_ERROR IS RAISED "   &
                    "WHEN THE UPPER BOUND OF A POSITIONAL ARRAY " &
                    "AGGREGATE DOES NOT BELONG TO THE INDEX "     &
                    "BASE TYPE");

     BEGIN

CASE_A :  DECLARE

               LOWER_BOUND : CONSTANT := MAX_INT-3;
               UPPER_BOUND : CONSTANT := MAX_INT-1;

               TYPE STA IS RANGE LOWER_BOUND .. UPPER_BOUND;

               TYPE TA IS ARRAY(STA RANGE <>) OF INTEGER;

               A1 : TA(STA);
               OK : EXCEPTION;

               FUNCTION FUN1 RETURN TA IS
               BEGIN
                    RETURN (1, 2, 3, 4, 5);
               EXCEPTION
                    WHEN CONSTRAINT_ERROR =>
                    BEGIN
                         COMMENT ("CASE A : CONSTRAINT_ERROR RAISED");
                         RAISE OK;
                    END;
                    WHEN OTHERS =>
                    BEGIN
                         FAILED ("CASE A : EXCEPTION RAISED IN FUN1");
                         RAISE OK;
                    END;
               END FUN1;

          BEGIN

               A1 := FUN1;
               FAILED ("CASE A : CONSTRAINT OR NUMERIC ERROR WAS " &
                       "NOT RAISED");

          EXCEPTION

               WHEN OK =>
                    NULL;

               WHEN OTHERS =>
                    FAILED ("CASE A : WRONG EXCEPTION RAISED");

          END CASE_A;

CASE_B :  DECLARE

               TYPE ENUM IS (A, B, C, D);

               SUBTYPE STB IS ENUM RANGE A .. C;

               TYPE TB IS ARRAY(STB RANGE <>) OF INTEGER;

               B1 : TB(STB);
               OK : EXCEPTION;

               FUNCTION FUN1 RETURN TB IS
               BEGIN
                    RETURN (1, 2, 3, 4, 5);
               EXCEPTION
                    WHEN CONSTRAINT_ERROR =>
                    BEGIN
                         COMMENT ("CASE B : CONSTRAINT_ERROR RAISED");
                         RAISE OK;
                    END;
                    WHEN OTHERS =>
                    BEGIN
                         FAILED ("CASE B : EXCEPTION RAISED IN FUN1");
                         RAISE OK;
                    END;
               END FUN1;

          BEGIN

               B1 := FUN1;
               FAILED ("CASE B : CONSTRAINT ERROR WAS NOT RAISED");

          EXCEPTION

               WHEN OK =>
                    NULL;

               WHEN OTHERS =>
                    FAILED ("CASE B : WRONG EXCEPTION RAISED");

          END CASE_B;

     END;

     RESULT;

END C43215B;
