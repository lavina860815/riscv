-- CZ1101A.ADA
--
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
--
-- OBJECTIVE:
--     CHECK THAT THE REPORT ROUTINES OF THE REPORT PACKAGE WORK
--     CORRECTLY.
--
-- PASS/FAIL CRITERIA:
--     THIS TEST PASSES IF THE OUTPUT MATCHES THAT SUPPLIED IN THE
--     APPLICABLE VERSION OF THE ACVC USERS' GUIDE.  THE EXPECTED
--     TEST RESULT IS "TENTATIVELY PASSED."

-- HISTORY:
--     JRK 08/07/81  CREATED ORIGINAL TEST.
--     JRK 10/27/82
--     JRK 06/01/84
--     JET 01/13/88  ADDED TESTS OF SPECIAL_ACTION AND UPDATED HEADER.
--     PWB 06/24/88  CORRECTED LENGTH OF ONE OUTPUT STRING AND ADDED
--                   PASS/FAIL CRITERIA.
--     BCB 05/17/90  CORRECTED LENGTH OF 'MAX_LEN LONG' OUTPUT STRING.
--                   ADDED CODE TO CREATE REPFILE.
--     LDC 05/17/90  REMOVED DIRECT_IO REFERENCES.
--     PWN 12/03/94  REMOVED ADA 9X INCOMPATIBILITIES.

WITH REPORT;
USE REPORT;

PROCEDURE CZ1101A IS


     DATE_AND_TIME : STRING(1..17);

     DATE, TIME : STRING(1..7);

BEGIN

     COMMENT ("(CZ1101A) CHECK REPORT ROUTINES");
     COMMENT ("   INITIAL VALUES SHOULD BE 'NO_NAME' AND 'FAILED'");
     RESULT;

     TEST ("PASS_TEST", "CHECKING 'TEST' AND 'RESULT' FOR 'PASSED'");
     COMMENT ("THIS LINE IS EXACTLY 'MAX_LEN' LONG. " &
              "...5...60....5...70");
     COMMENT ("THIS COMMENT HAS A WORD THAT SPANS THE FOLD " &
              "POINT. THIS COMMENT FITS EXACTLY ON TWO LINES. " &
              "..5...60....5...70");
     COMMENT ("THIS_COMMENT_IS_ONE_VERY_LONG_WORD_AND_SO_" &
              "IT_SHOULD_BE_SPLIT_AT_THE_FOLD_POINT");
     RESULT;

     COMMENT ("CHECK THAT 'RESULT' RESETS VALUES TO 'NO_NAME' " &
              "AND 'FAILED'");
     RESULT;

     TEST ("FAIL_TEST", "CHECKING 'FAILED' AND 'RESULT' FOR 'FAILED'");
     FAILED ("'RESULT' SHOULD NOW BE 'FAILED'");
     RESULT;

     TEST ("NA_TEST", "CHECKING 'NOT-APPLICABLE'");
     NOT_APPLICABLE ("'RESULT' SHOULD NOW BE 'NOT-APPLICABLE'");
     RESULT;

     TEST ("FAIL_NA_TEST", "CHECKING 'NOT_APPLICABLE', 'FAILED', " &
                           "'NOT_APPLICABLE'");
     NOT_APPLICABLE ("'RESULT' BECOMES 'NOT-APPLICABLE'");
     FAILED ("'RESULT' BECOMES 'FAILED'");
     NOT_APPLICABLE ("CALLING 'NOT_APPLICABLE' DOESN'T CHANGE " &
                     "'RESULT'");
     RESULT;

     TEST ("SPEC_NA_TEST", "CHECKING 'SPEC_ACT', 'NOT_APPLICABLE', " &
                           "'SPEC_ACT'");
     SPECIAL_ACTION("'RESULT' BECOMES 'TENTATIVELY PASSED'");
     NOT_APPLICABLE ("'RESULT' BECOMES 'NOT APPLICABLE'");
     SPECIAL_ACTION("CALLING 'SPECIAL_ACTION' DOESN'T CHANGE 'RESULT'");
     RESULT;

     TEST ("SPEC_FAIL_TEST", "CHECKING 'SPEC_ACT', 'FAILED', " &
                             "'SPEC_ACT'");
     SPECIAL_ACTION("'RESULT' BECOMES 'TENTATIVELY PASSED'");
     FAILED ("'RESULT' BECOMES 'FAILED'");
     SPECIAL_ACTION("CALLING 'SPECIAL_ACTION' DOESN'T CHANGE 'RESULT'");
     RESULT;

     TEST ("CZ1101A", "CHECKING 'SPECIAL_ACTION' ALONE");
     SPECIAL_ACTION("'RESULT' BECOMES 'TENTATIVELY PASSED'");
     RESULT;

END CZ1101A;
