-- CA1106A.ADA

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
--     CHECK THAT A WITH CLAUSE FOR A PACKAGE BODY (GENERIC OR
--     NONGENERIC) OR FOR A GENERIC SUBPROGRAM BODY CAN NAME THE
--     CORRESPONDING SPECIFICATION, AND A USE CLAUSE CAN ALSO BE
--     GIVEN.

-- HISTORY:
--     JET 07/14/88  CREATED ORIGINAL TEST.
--     PWN 05/25/94  ADDED A PROCEDURE TO KEEP PACKAGE BODIES LEGAL.

PACKAGE CA1106A_1 IS
     I : INTEGER := 0;
     PROCEDURE REQUIRE_BODY;
END CA1106A_1;

GENERIC
     TYPE TG IS RANGE <>;
PACKAGE CA1106A_2 IS
     J : TG := 0;
     PROCEDURE REQUIRE_BODY;
END CA1106A_2;

GENERIC
     TYPE TG IS RANGE <>;
FUNCTION CA1106A_3 RETURN TG;

WITH REPORT; USE REPORT;
WITH CA1106A_1; USE CA1106A_1;
PRAGMA ELABORATE (REPORT);
PACKAGE BODY CA1106A_1 IS
     PROCEDURE REQUIRE_BODY IS
     BEGIN
          NULL;
     END;
BEGIN
     I := IDENT_INT(1);
END CA1106A_1;

WITH REPORT; USE REPORT;
WITH CA1106A_2;
PRAGMA ELABORATE (REPORT);
PACKAGE BODY CA1106A_2 IS
     PROCEDURE REQUIRE_BODY IS
     BEGIN
          NULL;
     END;
BEGIN
     J := TG(IDENT_INT(2));
END CA1106A_2;

WITH REPORT; USE REPORT;
WITH CA1106A_3;
FUNCTION CA1106A_3 RETURN TG IS
BEGIN
     RETURN TG(IDENT_INT(3));
END CA1106A_3;

WITH REPORT; USE REPORT;
WITH CA1106A_1, CA1106A_2, CA1106A_3;
USE CA1106A_1;
PROCEDURE CA1106A IS

     PACKAGE CA1106A_2X IS NEW CA1106A_2 (INTEGER);
     FUNCTION CA1106A_3X IS NEW CA1106A_3 (INTEGER);

     USE CA1106A_2X;

BEGIN
     TEST ("CA1106A", "CHECK THAT A WITH CLAUSE FOR A PACKAGE BODY " &
                      "(GENERIC OR NONGENERIC) OR FOR A GENERIC " &
                      "SUBPROGRAM BODY CAN NAME THE CORRESPONDING " &
                      "SPECIFICATION, AND A USE CLAUSE CAN ALSO BE " &
                      "GIVEN");

     IF I /= 1 THEN
          FAILED ("INCORRECT VALUE FROM NONGENERIC PACKAGE");
     END IF;

     IF J /= 2 THEN
          FAILED ("INCORRECT VALUE FROM GENERIC PACKAGE");
     END IF;

     IF CA1106A_3X /= 3 THEN
          FAILED ("INCORRECT VALUE FROM GENERIC SUBPROGRAM");
     END IF;

     RESULT;
END CA1106A;
