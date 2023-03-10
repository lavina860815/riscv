-- CA1108B.ADA

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
-- CHECK THAT IF WITH_CLAUSES ARE GIVEN FOR BOTH A SPEC AND A BODY, AND
-- THE CLAUSES NAME DIFFERENT LIBRARY UNITS, THE UNITS NAMED IN ALL THE
-- CLAUSES ARE VISIBLE IN THE BODY AND IN SUBUNITS OF THE BODY.

-- BHS 7/31/84
-- JBG 5/1/85

PACKAGE FIRST_PKG IS

     FUNCTION F (X : INTEGER := 1) RETURN INTEGER;

END FIRST_PKG;

PACKAGE BODY FIRST_PKG IS

     FUNCTION F (X : INTEGER := 1) RETURN INTEGER IS
     BEGIN
          RETURN X;
     END F;

END FIRST_PKG;

PACKAGE LATER_PKG IS

     FUNCTION F (Y : INTEGER := 2) RETURN INTEGER;

END LATER_PKG;

PACKAGE BODY LATER_PKG IS

     FUNCTION F (Y : INTEGER := 2) RETURN INTEGER IS
     BEGIN
          RETURN Y + 1;
     END F;

END LATER_PKG;

WITH REPORT, FIRST_PKG;
USE REPORT;
PRAGMA ELABORATE (FIRST_PKG);
PACKAGE CA1108B_PKG IS

     I, J : INTEGER;
     PROCEDURE PROC;
     PROCEDURE CALL_SUBS (X, Y : IN OUT INTEGER);

END CA1108B_PKG;

WITH LATER_PKG;
PRAGMA ELABORATE (LATER_PKG);
PACKAGE BODY CA1108B_PKG IS

     PROCEDURE SUB (X, Y : IN OUT INTEGER) IS SEPARATE;

     PROCEDURE PROC IS
          I, J : INTEGER;
     BEGIN
          I := FIRST_PKG.F;
          IF I /= 1 THEN
               FAILED ("FIRST_PKG FUNCTION NOT VISIBLE IN " &
                       "PACKAGE BODY PROCEDURE");
          END IF;
          J := LATER_PKG.F;
          IF J /= 3 THEN
               FAILED ("LATER_PKG FUNCITON NOT VISIBLE IN " &
                       "PACKAGE BODY PROCEDURE");
          END IF;
     END PROC;

     PROCEDURE CALL_SUBS (X, Y : IN OUT INTEGER) IS
     BEGIN
          SUB (X, Y);
     END CALL_SUBS;

BEGIN

     I := FIRST_PKG.F;
     IF I /= 1 THEN
          FAILED ("FIRST_PKG FUNCTION NOT VISIBLE IN PACKAGE BODY");
     END IF;
     J := LATER_PKG.F;
     IF J /= 3 THEN
          FAILED ("LATER_PKG FUNCTION NOT VISIBLE IN PACKAGE BODY");
     END IF;

END CA1108B_PKG;

WITH REPORT, CA1108B_PKG;
USE REPORT, CA1108B_PKG;
PROCEDURE CA1108B IS

     VAR1, VAR2 : INTEGER;

BEGIN

     TEST ("CA1108B", "IF DIFFERENT WITH_CLAUSES GIVEN FOR PACKAGE " &
                      "SPEC AND BODY, ALL NAMED UNITS ARE VISIBLE " &
                      "IN THE BODY AND ITS SUBUNITS");

     PROC;

     VAR1 := 0;
     VAR2 := 1;
     CALL_SUBS (VAR1, VAR2);
     IF VAR1 /= 1 THEN
          FAILED ("FIRST_PKG FUNCTION NOT VISIBLE IN SUBUNIT");
     END IF;

     IF VAR2 /= 3 THEN
          FAILED ("LATER_PKG FUNCTION NOT VISIBLE IN SUBUNIT");
     END IF;

     RESULT;

END CA1108B;


SEPARATE (CA1108B_PKG)
PROCEDURE SUB (X, Y : IN OUT INTEGER) IS
     PROCEDURE SUB2 (A, B : IN OUT INTEGER) IS SEPARATE;
BEGIN

     SUB2 (Y, X);
     IF Y /= 1 THEN
          FAILED ("FIRST_PKG FUNCTION NOT VISIBLE IN SUBUNIT " &
                  "OF SUBUNIT");
     END IF;
     IF X /= 3 THEN
          FAILED ("LATER_PKG FUNCTION NOT VISIBLE IN SUBUNIT " &
                  "OF SUBUNIT");
     END IF;
     X := FIRST_PKG.F;
     Y := LATER_PKG.F;

END SUB;

SEPARATE (CA1108B_PKG.SUB)
PROCEDURE SUB2 (A, B : IN OUT INTEGER) IS
BEGIN

     A := FIRST_PKG.F;
     B := LATER_PKG.F;

END SUB2;
