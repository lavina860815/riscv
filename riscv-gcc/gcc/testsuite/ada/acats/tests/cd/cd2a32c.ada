-- CD2A32C.ADA

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
--     CHECK THAT A SIZE SPECIFICATION FOR AN INTEGER TYPE OF THE
--     SMALLEST APPROPRIATE SIGNED SIZE CAN BE GIVEN:
--        IN THE VISIBLE OR PRIVATE PART OF A PACKAGE FOR A TYPE
--          DECLARED IN THE VISIBLE PART;
--        FOR A DERIVED INTEGER TYPE;
--        FOR A DERIVED PRIVATE TYPE WHOSE FULL DECLARATION IS AS
--          AN INTEGER TYPE;
--        FOR AN INTEGER TYPE IN A GENERIC UNIT.

-- HISTORY:
--     JET 08/12/87  CREATED ORIGINAL TEST.
--     DHH 04/11/89  CHANGED EXTENSION FROM '.DEP' TO '.ADA', CHANGED
--                   SIZE CLAUSE VALUE TO 7, CHANGED OPERATOR ON 'SIZE
--                   CHECKS, ADDED REPRESENTAION CLAUSE CHECK, AND
--                   ADDED CHECK ON INTEGER IN A GENERIC UNIT.
--     BCB 10/03/90  CHANGED FAILED MESSAGES FROM "SHOULD NOT BE GREATER
--                   THAN" TO "MUST BE EQUAL TO".
--     JRL 03/27/92  REMOVED TESTING OF NONOBJECTIVE TYPES.

WITH REPORT; USE REPORT;
PROCEDURE CD2A32C IS

     TYPE BASIC_INT IS RANGE -63 .. 63;
     SPECIFIED_SIZE : CONSTANT := 7;

     TYPE DERIVED_INT IS NEW BASIC_INT;
     FOR DERIVED_INT'SIZE USE SPECIFIED_SIZE;

     PACKAGE P IS
          TYPE INT_IN_P IS RANGE -63 .. 63;
          FOR INT_IN_P'SIZE USE SPECIFIED_SIZE;
          TYPE PRIVATE_INT IS PRIVATE;
          TYPE ALT_INT_IN_P IS RANGE -63 .. 63;
     PRIVATE
          TYPE PRIVATE_INT IS RANGE -63 .. 63;
          FOR ALT_INT_IN_P'SIZE USE SPECIFIED_SIZE;
     END P;

     USE P;

     GENERIC
     PACKAGE GENPACK IS
          TYPE GEN_CHECK_INT IS RANGE -63 .. 63;
          FOR GEN_CHECK_INT'SIZE USE SPECIFIED_SIZE;
     END GENPACK;

     PACKAGE NEWPACK IS NEW GENPACK;

     USE NEWPACK;
     TYPE DERIVED_PRIVATE_INT IS NEW PRIVATE_INT;
     FOR DERIVED_PRIVATE_INT'SIZE USE SPECIFIED_SIZE;

     MINIMUM_SIZE : INTEGER := IDENT_INT(SPECIFIED_SIZE);

BEGIN

     TEST("CD2A32C", "CHECK THAT A SIZE SPECIFICATION " &
                     "FOR AN INTEGER TYPE OF THE SMALLEST " &
                     "APPROPRIATE SIGNED SIZE CAN BE GIVEN: IN THE " &
                     "VISIBLE OR PRIVATE PART OF A PACKAGE FOR A " &
                     "TYPE DECLARED IN THE VISIBLE PART; FOR A " &
                     "DERIVED INTEGER TYPE; FOR A DERIVED PRIVATE " &
                     "TYPE WHOSE FULL DECLARATION IS AS AN INTEGER " &
                     "TYPE; FOR AN INTEGER TYPE IN A GENERIC UNIT");

     IF DERIVED_INT'SIZE /= MINIMUM_SIZE THEN
          FAILED ("DERIVED_INT'SIZE MUST BE EQUAL TO" &
                  INTEGER'IMAGE(MINIMUM_SIZE) &
                  ".  ACTUAL SIZE IS" &
                  INTEGER'IMAGE(DERIVED_INT'SIZE));
     END IF;

     IF INT_IN_P'SIZE /= MINIMUM_SIZE THEN
          FAILED ("INT_IN_P'SIZE MUST BE EQUAL TO" &
                  INTEGER'IMAGE(MINIMUM_SIZE) &
                  ".  ACTUAL SIZE IS" &
                  INTEGER'IMAGE(INT_IN_P'SIZE));
     END IF;

     IF ALT_INT_IN_P'SIZE /= MINIMUM_SIZE THEN
          FAILED ("ALT_INT_IN_P'SIZE MUST BE EQUAL TO" &
                  INTEGER'IMAGE(MINIMUM_SIZE) &
                  ".  ACTUAL SIZE IS" &
                  INTEGER'IMAGE(ALT_INT_IN_P'SIZE));
     END IF;

     IF DERIVED_PRIVATE_INT'SIZE /= MINIMUM_SIZE THEN
          FAILED ("DERIVED_PRIVATE_INT'SIZE MUST BE EQUAL TO " &
                  INTEGER'IMAGE(MINIMUM_SIZE) &
                  ".  ACTUAL SIZE IS" &
                  INTEGER'IMAGE(DERIVED_PRIVATE_INT'SIZE));
     END IF;

     IF GEN_CHECK_INT'SIZE /= MINIMUM_SIZE THEN
          FAILED ("GEN_CHECK_INT'SIZE MUST BE EQUAL TO" &
                  INTEGER'IMAGE(MINIMUM_SIZE) &
                  ".  ACTUAL SIZE IS" &
                  INTEGER'IMAGE(GEN_CHECK_INT'SIZE));
     END IF;

     RESULT;

END CD2A32C;
