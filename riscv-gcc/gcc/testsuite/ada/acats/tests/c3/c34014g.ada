-- C34014G.ADA

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
--     CHECK THAT A DERIVED SUBPROGRAM IS VISIBLE AND FURTHER DERIVABLE
--     UNDER APPROPRIATE CIRCUMSTANCES.

--     CHECK WHEN THE DERIVED SUBPROGRAM IS IMPLICITLY DECLARED IN THE
--     VISIBLE PART OF A PACKAGE AND NO HOMOGRAPHIC SUBPROGRAM IS LATER
--     DECLARED EXPLICITLY.

-- HISTORY:
--     JRK 09/16/87  CREATED ORIGINAL TEST.

WITH REPORT; USE REPORT;

PROCEDURE C34014G IS

     PACKAGE P IS
          TYPE T IS RANGE -100 .. 100;
          FUNCTION F RETURN T;
     END P;
     USE P;

     PACKAGE BODY P IS
          FUNCTION F RETURN T IS
          BEGIN
               RETURN T (IDENT_INT (1));
          END F;
     END P;

BEGIN
     TEST ("C34014G", "CHECK THAT A DERIVED SUBPROGRAM IS VISIBLE " &
                      "AND FURTHER DERIVABLE UNDER APPROPRIATE " &
                      "CIRCUMSTANCES.  CHECK WHEN THE DERIVED " &
                      "SUBPROGRAM IS IMPLICITLY DECLARED IN THE " &
                      "VISIBLE PART OF A PACKAGE AND NO HOMOGRAPHIC " &
                      "SUBPROGRAM IS LATER DECLARED EXPLICITLY");

     -----------------------------------------------------------------

     COMMENT ("NO NEW SUBPROGRAM DECLARED EXPLICITLY");

     DECLARE

          PACKAGE Q IS
               TYPE QT IS NEW T;
               X : QT := F;
          PRIVATE
               TYPE QS IS NEW QT;
               Z : QS := F;
          END Q;
          USE Q;

          PACKAGE BODY Q IS
          BEGIN
               IF X /= 1 THEN
                    FAILED ("OLD SUBPROGRAM NOT VISIBLE - 1");
               END IF;

               IF Z /= 1 THEN
                    FAILED ("OLD SUBPROGRAM NOT DERIVED - 1");
               END IF;
          END Q;

          PACKAGE R IS
               Y : QT := F;
               TYPE RT IS NEW QT;
               Z : RT := F;
          END R;
          USE R;

     BEGIN
          IF Y /= 1 THEN
               FAILED ("OLD SUBPROGRAM NOT VISIBLE - 2");
          END IF;

          IF Z /= 1 THEN
               FAILED ("OLD SUBPROGRAM NOT DERIVED - 2");
          END IF;
     END;

     -----------------------------------------------------------------

     RESULT;
END C34014G;
