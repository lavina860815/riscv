-- C34014N.ADA

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
--     CHECK THAT A DERIVED OPERATOR IS VISIBLE AND FURTHER DERIVABLE
--     UNDER APPROPRIATE CIRCUMSTANCES.

--     CHECK WHEN THE DERIVED OPERATOR IS IMPLICITLY DECLARED IN THE
--     VISIBLE PART OF A PACKAGE AND A HOMOGRAPHIC OPERATOR IS LATER
--     DECLARED EXPLICITLY IN THE SAME VISIBLE PART.

-- HISTORY:
--     JRK 09/21/87  CREATED ORIGINAL TEST.

WITH REPORT; USE REPORT;

PROCEDURE C34014N IS

     PACKAGE P IS
          TYPE T IS RANGE -100 .. 100;
          FUNCTION "+" (X : T) RETURN T;
     END P;
     USE P;

     PACKAGE BODY P IS
          FUNCTION "+" (X : T) RETURN T IS
          BEGIN
               RETURN X + T (IDENT_INT (1));
          END "+";
     END P;

BEGIN
     TEST ("C34014N", "CHECK THAT A DERIVED OPERATOR IS VISIBLE " &
                      "AND FURTHER DERIVABLE UNDER APPROPRIATE " &
                      "CIRCUMSTANCES.  CHECK WHEN THE DERIVED " &
                      "OPERATOR IS IMPLICITLY DECLARED IN THE " &
                      "VISIBLE PART OF A PACKAGE AND A HOMOGRAPHIC " &
                      "OPERATOR IS LATER DECLARED EXPLICITLY IN " &
                      "THE SAME VISIBLE PART");

     -----------------------------------------------------------------

     COMMENT ("NEW OPERATOR DECLARED BY SUBPROGRAM DECLARATION");

     DECLARE

          PACKAGE Q IS
               TYPE QT IS NEW T;
               X : QT := +0;
               FUNCTION "+" (Y : QT) RETURN QT;
               TYPE QR IS
                    RECORD
                         C : QT := +0;
                    END RECORD;
          PRIVATE
               TYPE QS IS NEW QT;
          END Q;
          USE Q;

          PACKAGE BODY Q IS
               FUNCTION "+" (Y : QT) RETURN QT IS
               BEGIN
                    RETURN Y + QT (IDENT_INT (2));
               END "+";

               PACKAGE R IS
                    Y : QR;
                    Z : QS := +0;
               END R;
               USE R;
          BEGIN
               IF X /= 1 THEN
                    FAILED ("OLD OPERATOR NOT VISIBLE - SUBPROG " &
                            "DECL");
               END IF;

               IF Y.C /= 2 THEN
                    FAILED ("NEW OPERATOR NOT VISIBLE - SUBPROG " &
                            "DECL - 1");
               END IF;

               IF Z /= 2 THEN
                    FAILED ("NEW OPERATOR NOT DERIVED - SUBPROG " &
                            "DECL - 1");
               END IF;
          END Q;

          PACKAGE R IS
               Y : QT := +0;
               TYPE RT IS NEW QT;
               Z : RT := +0;
          END R;
          USE R;

     BEGIN
          IF Y /= 2 THEN
               FAILED ("NEW OPERATOR NOT VISIBLE - SUBPROG DECL - 2");
          END IF;

          IF Z /= 2 THEN
               FAILED ("NEW OPERATOR NOT DERIVED - SUBPROG DECL - 2");
          END IF;
     END;

     -----------------------------------------------------------------

     COMMENT ("NEW OPERATOR DECLARED BY RENAMING");

     DECLARE

          PACKAGE Q IS
               TYPE QT IS NEW T;
               X : QT := +0;
               FUNCTION G (X : QT) RETURN QT;
               FUNCTION "+" (Y : QT) RETURN QT RENAMES G;
               TYPE QR IS
                    RECORD
                         C : QT := +0;
                    END RECORD;
          PRIVATE
               TYPE QS IS NEW QT;
          END Q;
          USE Q;

          PACKAGE BODY Q IS
               FUNCTION G (X : QT) RETURN QT IS
               BEGIN
                    RETURN X + QT (IDENT_INT (2));
               END G;

               PACKAGE R IS
                    Y : QR;
                    Z : QS := +0;
               END R;
               USE R;
          BEGIN
               IF X /= 1 THEN
                    FAILED ("OLD OPERATOR NOT VISIBLE - RENAMING");
               END IF;

               IF Y.C /= 2 THEN
                    FAILED ("NEW OPERATOR NOT VISIBLE - RENAMING - " &
                            "1");
               END IF;

               IF Z /= 2 THEN
                    FAILED ("NEW OPERATOR NOT DERIVED - RENAMING - " &
                            "1");
               END IF;
          END Q;

          PACKAGE R IS
               Y : QT := +0;
               TYPE RT IS NEW QT;
               Z : RT := +0;
          END R;
          USE R;

     BEGIN
          IF Y /= 2 THEN
               FAILED ("NEW OPERATOR NOT VISIBLE - RENAMING - 2");
          END IF;

          IF Z /= 2 THEN
               FAILED ("NEW OPERATOR NOT DERIVED - RENAMING - 2");
          END IF;
     END;

     -----------------------------------------------------------------

     COMMENT ("NEW OPERATOR DECLARED BY GENERIC INSTANTIATION");

     DECLARE

          GENERIC
               TYPE T IS RANGE <>;
          FUNCTION G (Y : T) RETURN T;

          FUNCTION G (Y : T) RETURN T IS
          BEGIN
               RETURN Y + T (IDENT_INT (2));
          END G;

          PACKAGE Q IS
               TYPE QT IS NEW T;
               X : QT := +0;
               FUNCTION "+" IS NEW G (QT);
               W : QT := +0;
          PRIVATE
               TYPE QS IS NEW QT;
               Z : QS := +0;
          END Q;
          USE Q;

          PACKAGE BODY Q IS
          BEGIN
               IF X /= 1 THEN
                    FAILED ("OLD OPERATOR NOT VISIBLE - " &
                            "INSTANTIATION");
               END IF;

               IF W /= 2 THEN
                    FAILED ("NEW OPERATOR NOT VISIBLE - " &
                            "INSTANTIATION - 1");
               END IF;

               IF Z /= 2 THEN
                    FAILED ("NEW OPERATOR NOT DERIVED - " &
                            "INSTANTIATION - 1");
               END IF;
          END Q;

          PACKAGE R IS
               Y : QT := +0;
               TYPE RT IS NEW QT;
               Z : RT := +0;
          END R;
          USE R;

     BEGIN
          IF Y /= 2 THEN
               FAILED ("NEW OPERATOR NOT VISIBLE - INSTANTIATION - " &
                       "2");
          END IF;

          IF Z /= 2 THEN
               FAILED ("NEW OPERATOR NOT DERIVED - INSTANTIATION - " &
                       "2");
          END IF;
     END;

     -----------------------------------------------------------------

     RESULT;
END C34014N;
