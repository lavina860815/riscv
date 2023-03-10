-- EE3402B.ADA

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
--     CHECK THAT NEW_LINE HAS AN OPTIONAL SPACING PARAMETER WITH
--     DEFAULT VALUE ONE, AND CHECK THAT NEW_LINE OPERATES ON THE
--     CURRENT DEFAULT OUTPUT FILE IF NO FILE IS SPECIFIED.

-- APPLICABILITY CRITERIA:
--     THIS TEST IS APPLICABLE ONLY TO IMPLEMENTATIONS WHICH SUPPORT
--     TEXT FILES.

-- PASS/FAIL CRITERIA:
--     THIS TEST IS PASSED IF IT EXECUTES, PRINTS TENTATIVELY PASSED,
--     AND THE CONTENTS OF THE STANDARD OUTPUT FILE ARE CORRECT.

-- HISTORY:
--     ABW 08/26/82
--     SPS 09/16/82
--     TBN 11/04/86  REVISED TEST TO OUTPUT A NON_APPLICABLE
--                   RESULT WHEN FILES ARE NOT SUPPORTED.
--     DWC 08/19/87  ADDED SPECIAL ACTION FUNCTION AND REMOVED
--                   EXCEPTION HANDLERS.  CHANGED TO AN E TEST.

WITH REPORT;
USE REPORT;
WITH TEXT_IO;
USE TEXT_IO;
WITH CHECK_FILE;

PROCEDURE EE3402B IS

     INCOMPLETE : EXCEPTION;
     FILE, FILE_OUT : FILE_TYPE;
     SPAC : CONSTANT POSITIVE_COUNT := POSITIVE_COUNT (IDENT_INT(4));
     TWO : CONSTANT POSITIVE_COUNT := POSITIVE_COUNT (IDENT_INT(2));
     FOUR : CONSTANT POSITIVE_COUNT := POSITIVE_COUNT (IDENT_INT(4));
     CUR_LINE : COUNT;

BEGIN

     TEST ("EE3402B", "CHECK THAT NEW_LINE HAS AN OPTIONAL " &
                      "SPACING PARAMETER WITH DEFAULT VALUE ONE, " &
                      "AND CHECK THAT NEW_LINE OPERATES ON THE " &
                      "CURRENT DEFAULT OUTPUT FILE IF NO FILE IS " &
                      "SPECIFIED.");

     BEGIN
          CREATE (FILE);
     EXCEPTION
          WHEN USE_ERROR =>
               NOT_APPLICABLE ("USE_ERROR RAISED; TEXT CREATE " &
                               "WITH OUT_FILE MODE");
               RAISE INCOMPLETE;
          WHEN OTHERS =>
               FAILED ("UNEXPECTED EXCEPTION RAISED; TEXT CREATE - 1");
               RAISE INCOMPLETE;
     END;

     CREATE (FILE_OUT);

     SPECIAL_ACTION ("CHECK OUTPUT FOR FOUR BLANK LINES");

     NEW_LINE (FILE);
     IF LINE (FILE) /= TWO THEN
          FAILED ("SPACING DEFAULT NOT ONE");
     END IF;

     SPECIAL_ACTION ("FOUR BLANK LINES SHOULD FOLLOW THIS COMMENT");
     CUR_LINE := LINE (STANDARD_OUTPUT);
     NEW_LINE (SPAC);
     IF LINE (STANDARD_OUTPUT) /= CUR_LINE + 4 THEN
          FAILED ("FILE DEFAULT NOT CORRECT FOR STANDARD_OUTPUT");
     END IF;

     SET_OUTPUT (FILE_OUT);
     NEW_LINE (SPAC);
     IF LINE (CURRENT_OUTPUT) /= FOUR + 1 THEN
          FAILED ("FILE DEFAULT NOT CORRECT FOR CURRENT_OUTPUT");
     END IF;

     SET_OUTPUT (STANDARD_OUTPUT);      -- RESET STANDARD OUTPUT
     COMMENT ("CHECKING FILE");
     CHECK_FILE (FILE, "#@%");
     COMMENT ("CHECKING FILE_OUT");
     CHECK_FILE (FILE_OUT, "####@%");

     CLOSE (FILE);
     CLOSE (FILE_OUT);

     RESULT;

EXCEPTION
     WHEN INCOMPLETE =>
          RESULT;

END EE3402B;
