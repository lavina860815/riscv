-- CD2A21C.ADA

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
--     CHECK THAT A SIZE SPECIFICATION CAN BE GIVEN FOR AN ENUMERATION
--     TYPE:
--          IN THE VISIBLE OR PRIVATE PART OF A PACKAGE FOR A TYPE
--            DECLARED IN THE VISIBLE PART;
--          FOR A DERIVED ENUMERATION TYPE;
--          FOR A DERIVED PRIVATE TYPE WHOSE FULL DECLARATION IS AS
--            AN ENUMERATION TYPE.

-- HISTORY:
--     PWB 06/17/87  CREATED ORIGINAL TEST.
--     DHH 04/17/89  CHANGED EXTENSION FROM '.DEP' TO '.ADA', CHANGED
--                   OPERATORS ON 'SIZE TESTS, AND ADDED CHECK ON
--                   REPRESENTATION CLAUSE.
--     JRL 03/26/92  REMOVED TESTING OF NONOBJECTIVE TYPES.

WITH REPORT; USE REPORT;
WITH LENGTH_CHECK;                      -- CONTAINS A CALL TO 'FAILED'.
PROCEDURE CD2A21C IS

     TYPE BASIC_ENUM IS (A, B, C, D, E);
     SPECIFIED_SIZE : CONSTANT := BASIC_ENUM'SIZE;

     MINIMUM_SIZE : INTEGER := IDENT_INT(SPECIFIED_SIZE);

     TYPE DERIVED_ENUM IS NEW BASIC_ENUM;
     FOR DERIVED_ENUM'SIZE USE SPECIFIED_SIZE;

     PACKAGE P IS
          TYPE ENUM_IN_P IS (A1, B1, C1, D1, E1, F1, G1);
          FOR ENUM_IN_P'SIZE USE SPECIFIED_SIZE;
          TYPE PRIVATE_ENUM IS PRIVATE;
          TYPE ALT_ENUM_IN_P IS (A2, B2, C2, D2, E2, F2, G2);
     PRIVATE
          TYPE PRIVATE_ENUM IS (A3, B3, C3, D3, E3, F3, G3);
          FOR ALT_ENUM_IN_P'SIZE USE SPECIFIED_SIZE;
     END P;

     TYPE DERIVED_PRIVATE_ENUM IS NEW P.PRIVATE_ENUM;
     FOR DERIVED_PRIVATE_ENUM'SIZE USE SPECIFIED_SIZE;

     USE P;

     PROCEDURE CHECK_1 IS NEW LENGTH_CHECK (DERIVED_ENUM);
     PROCEDURE CHECK_2 IS NEW LENGTH_CHECK (ENUM_IN_P);
     PROCEDURE CHECK_3 IS NEW LENGTH_CHECK (ALT_ENUM_IN_P);

BEGIN

     TEST("CD2A21C", "CHECK THAT 'SIZE SPECIFICATIONS CAN BE GIVEN " &
                     "IN THE VISIBLE OR PRIVATE PART OF A PACKAGE " &
                     "FOR ENUMERATION TYPES DECLARED IN THE VISIBLE " &
                     "PART, AND FOR DERIVED ENUMERATION " &
                     "TYPES AND DERIVED PRIVATE TYPES WHOSE FULL " &
                     "DECLARATIONS ARE AS ENUMERATION TYPES");

     CHECK_1 (C,  SPECIFIED_SIZE, "DERIVED_ENUM");
     CHECK_2 (C1, SPECIFIED_SIZE, "ENUM_IN_P");
     CHECK_3 (C2, SPECIFIED_SIZE, "ALT_ENUM_IN_P");

     IF DERIVED_ENUM'SIZE /= MINIMUM_SIZE THEN
          FAILED ("DERIVED_ENUM'SIZE SHOULD NOT BE GREATER THAN" &
                  INTEGER'IMAGE(MINIMUM_SIZE) &
                  ".  ACTUAL SIZE IS" &
                  INTEGER'IMAGE(DERIVED_ENUM'SIZE));
     END IF;

     IF ENUM_IN_P'SIZE /= MINIMUM_SIZE THEN
          FAILED ("ENUM_IN_P'SIZE SHOULD NOT BE GREATER THAN" &
                  INTEGER'IMAGE(MINIMUM_SIZE) &
                  ".  ACTUAL SIZE IS" &
                  INTEGER'IMAGE(ENUM_IN_P'SIZE));
     END IF;

     IF ALT_ENUM_IN_P'SIZE /= MINIMUM_SIZE THEN
          FAILED ("ALT_ENUM_IN_P'SIZE SHOULD NOT BE GREATER THAN" &
                  INTEGER'IMAGE(MINIMUM_SIZE) &
                  ".  ACTUAL SIZE IS" &
                  INTEGER'IMAGE(ALT_ENUM_IN_P'SIZE));
     END IF;

     IF DERIVED_PRIVATE_ENUM'SIZE /= MINIMUM_SIZE THEN

          FAILED ("DERIVED_PRIVATE_ENUM'SIZE SHOULD NOT BE GREATER " &
                  "THAN " & INTEGER'IMAGE(MINIMUM_SIZE) &
                  ".  ACTUAL SIZE IS" &
                  INTEGER'IMAGE(DERIVED_PRIVATE_ENUM'SIZE));
     END IF;

     RESULT;

END CD2A21C;
