-- CD4051C.ADA

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
--     CHECK THAT A RECORD REPRESENTATION CLAUSE CAN BE GIVEN FOR
--     A DERIVED TYPE WHOSE PARENT TYPE IS A RECORD WITH A
--     DISCRIMINANT.

-- HISTORY:
--     BCB 03/20/89  CHANGED EXTENSION FROM '.ADA' TO '.DEP'.
--     RJW 08/25/87  CREATED ORIGINAL TEST.

WITH REPORT; USE REPORT;
WITH SYSTEM;
PROCEDURE CD4051C IS

     UNITS_PER_INTEGER : CONSTANT :=
                      (INTEGER'SIZE + SYSTEM.STORAGE_UNIT - 1) /
                      SYSTEM.STORAGE_UNIT;

     TYPE BASIC_CLAUSE (DISC : BOOLEAN) IS RECORD
          INT_COMP    : INTEGER;
          CHAR_COMP   : CHARACTER;
     END RECORD;

     TYPE CHECK_CLAUSE IS NEW BASIC_CLAUSE;

     FOR CHECK_CLAUSE USE
          RECORD
               DISC AT 0
                           RANGE 0..BOOLEAN'SIZE - 1;
               INT_COMP AT 1*UNITS_PER_INTEGER
                           RANGE 0..INTEGER'SIZE - 1;
               CHAR_COMP AT 2*UNITS_PER_INTEGER
                           RANGE 0..CHARACTER'SIZE - 1;
          END RECORD;

     CHECK_RECORD : CHECK_CLAUSE (TRUE) := (TRUE, 1, 'A');

BEGIN
     TEST ("CD4051C", "CHECK THAT A RECORD REPRESENTATION " &
                      "CLAUSE CAN BE GIVEN FOR A DERIVED TYPE " &
                      "WHOSE PARENT TYPE IS IS A RECORD TYPE " &
                      "WITH DISCRIMINANTS");

     IF CHECK_RECORD.DISC'FIRST_BIT /= 0 THEN
          FAILED ("INCORRECT VALUE FOR FIRST_BIT OF DISC");
     END IF;

     IF CHECK_RECORD.DISC'LAST_BIT /= BOOLEAN'SIZE - 1 THEN
          FAILED ("INCORRECT VALUE FOR LAST_BIT OF DISC");
     END IF;

     IF CHECK_RECORD.DISC'POSITION /= IDENT_INT (0) THEN
          FAILED ("INCORRECT VALUE FOR POSITION OF DISC");
     END IF;

     IF CHECK_RECORD.INT_COMP'FIRST_BIT /= 0 THEN
          FAILED ("INCORRECT VALUE FOR FIRST_BIT OF INT_COMP");
     END IF;

     IF CHECK_RECORD.INT_COMP'LAST_BIT /=
               IDENT_INT (INTEGER'SIZE - 1) THEN
          FAILED ("INCORRECT VALUE FOR LAST_BIT OF INT_COMP");
     END IF;

     IF CHECK_RECORD.INT_COMP'POSITION /=
               IDENT_INT (UNITS_PER_INTEGER) THEN
          FAILED ("INCORRECT VALUE FOR POSITION OF INT_COMP");
     END IF;

     IF CHECK_RECORD.CHAR_COMP'FIRST_BIT /= IDENT_INT (0) THEN
          FAILED ("INCORRECT VALUE FOR FIRST_BIT OF CHAR_COMP");
     END IF;

     IF CHECK_RECORD.CHAR_COMP'LAST_BIT /=
               IDENT_INT (CHARACTER'SIZE - 1) THEN
          FAILED ("INCORRECT VALUE FOR LAST_BIT OF CHAR_COMP");
     END IF;

     IF CHECK_RECORD.CHAR_COMP'POSITION /=
               IDENT_INT (2 * UNITS_PER_INTEGER) THEN
          FAILED ("INCORRECT VALUE FOR POSITION OF CHAR_COMP");
     END IF;

     RESULT;
END CD4051C;
