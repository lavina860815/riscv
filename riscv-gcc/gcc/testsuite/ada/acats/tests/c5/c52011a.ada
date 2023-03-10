-- C52011A.ADA

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
-- CHECK INDEX CONSTRAINTS FOR ASSIGNMENT OF ACCESS SUBTYPES.
-- SPECIFICALLY, CHECK THAT:

-- A) ANY ACCESS TYPE VARIABLE AND CONSTRAINED SUBTYPE VARIABLES OF THAT
-- TYPE MAY BE ASSIGNED TO ONE ANOTHER IF THE VALUE BEING ASSIGNED
-- IS NULL.

-- B) VARIABLES OF THE SAME CONSTRAINED ACCESS SUBTYPE MAY BE ASSIGNED
-- TO ONE ANOTHER OR TO VARIABLES OF THE BASE ACCESS TYPE.

-- C) CONSTRAINT_ERROR IS RAISED UPON ASSIGNMENT OF NON-NULL OBJECTS
-- BETWEEN DIFFERENTLY CONSTRAINED ACCESS SUBTYPES.

-- D) CONSTRAINT_ERROR IS RAISED UPON ASSIGNMENT OF A NON-NULL OBJECT
-- OF A BASE ACCESS TYPE VARIABLE TO A VARIABLE OF ONE OF ITS
-- CONSTRAINED SUBTYPES IF THE CONSTRAINTS ON THE OBJECT DIFFER
-- FROM THOSE ON THE SUBTYPE.

-- E) NULL CAN BE ASSIGNED TO BASE ACCESS TYPES AND ANY CONSTRAINED
-- SUBTYPES OF THIS TYPE.

-- ASL 6/29/81
--  RM 6/17/82
-- SPS 10/26/82
-- RLB  6/29/01 - FIXED TO ALLOW AGGRESIVE OPTIMIZATION.

WITH REPORT;
PROCEDURE C52011A IS

     USE REPORT;

     TYPE ARR IS ARRAY(INTEGER RANGE <>) OF INTEGER;
     TYPE ARR_NAME IS ACCESS ARR;
     SUBTYPE S1 IS ARR_NAME(IDENT_INT(1)..IDENT_INT(10));
     SUBTYPE S2 IS ARR_NAME(IDENT_INT(3)..IDENT_INT(6));

     W : ARR_NAME := NULL;                    -- E.
     X1,X2 : S1 := NULL;                      -- E.
     Y1,Y2 : S2 := NULL;                      -- E.

     W_NONNULL  : ARR_NAME := NEW ARR'(3..5=>7) ;
     X1_NONNULL : S1       := NEW ARR'(IDENT_INT(1)..IDENT_INT(10)=>7);
     Y1_NONNULL : S2       := NEW ARR'(IDENT_INT(3)..IDENT_INT( 6)=>7);

     TOO_EARLY : BOOLEAN := TRUE;

BEGIN

     TEST ("C52011A", "INDEX CONSTRAINTS ON ACCESS SUBTYPE OBJECTS " &
                      "MUST BE SATISFIED FOR ASSIGNMENT");

     BEGIN

          IF EQUAL(3,3) THEN
               W_NONNULL := X1;               -- A.
          END IF;
          IF W_NONNULL /= X1 THEN
               FAILED ("ASSIGNMENT FAILED - 1");
          END IF;

          IF EQUAL(3,3) THEN
               X1_NONNULL := X2;              -- A.
          END IF;
          IF X1_NONNULL /= X2 THEN
               FAILED ("ASSIGNMENT FAILED - 2");
          END IF;

          IF EQUAL(3,3) THEN
               X1_NONNULL := Y1;              -- A.
          END IF;
          IF X1 /= Y1 THEN
               FAILED ("ASSIGNMENT FAILED - 3");
          END IF;

          X1 := NEW ARR'(1..IDENT_INT(10) => 5);
          IF EQUAL(3,3) THEN
               X2 := X1;                      -- B.
          END IF;
          IF X2 /= X1 THEN
               FAILED ("ASSIGNMENT FAILED - 4");
          END IF;

          IF EQUAL(3,3) THEN
               W := X1;                       -- B.
          END IF;
          IF W /= X1 THEN
               FAILED ("ASSIGNMENT FAILED - 5");
          END IF;

          BEGIN
               Y1 := X1;                      -- C.
               IF Y1'FIRST /= REPORT.IDENT_INT(3) THEN
                  FAILED ("NON-NULL ASSIGNMENT MADE BETWEEN TWO " &
                     "VARIABLES OF DIFFERENT CONSTRAINED ACCESS SUBTYPES " &
                     "AND CONSTRAINT IS CHANGED");
               ELSE
                  FAILED ("NON-NULL ASSIGNMENT MADE BETWEEN TWO " &
                     "VARIABLES OF DIFFERENT CONSTRAINED ACCESS SUBTYPES " &
                     "AND CONSTRAINT IS NOT CHANGED");
               END IF;
          EXCEPTION

               WHEN CONSTRAINT_ERROR => NULL;

               WHEN OTHERS =>
                    FAILED ("WRONG EXCEPTION - 1");

          END;

          W := NEW ARR'(IDENT_INT(3)..IDENT_INT(6) => 3);

          BEGIN
               X1 := W;                            -- D.
               IF X1'FIRST /= REPORT.IDENT_INT(1) THEN
                  FAILED ("NON-NULL ASSIGNMENT MADE FROM UNCONSTRAINED " &
                          "ACCESS TYPE DESIGNATING CONSTRAINED OBJECT TO "&
                          "ACCESS SUBTYPE WITH DIFFERENT CONSTRAINT " &
                          "AND CONSTRAINT IS CHANGED");
               ELSE
                  FAILED ("NON-NULL ASSIGNMENT MADE FROM UNCONSTRAINED " &
                          "ACCESS TYPE DESIGNATING CONSTRAINED OBJECT TO "&
                          "ACCESS SUBTYPE WITH DIFFERENT CONSTRAINT " &
                          "AND CONSTRAINT IS NOT CHANGED");
               END IF;
          EXCEPTION

               WHEN CONSTRAINT_ERROR =>
                    NULL ;

               WHEN OTHERS =>
                    FAILED ("WRONG EXCEPTION - 2");

          END;

     EXCEPTION

          WHEN OTHERS =>
               FAILED ("EXCEPTION RAISED");

     END;


     RESULT;


END C52011A;
