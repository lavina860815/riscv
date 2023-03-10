-- CE3402C.ADA

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
--     CHECK THAT NEW_LINE INCREMENTS THE CURRENT PAGE BY ONE AND
--     SETS THE CURRENT LINE NUMBER TO ONE WHEN THE PAGE LENGTH IS
--     BOUNDED AND THE LINE NUMBER WOULD HAVE EXCEEDED THE
--     MAXIMUM PAGE LENGTH.

-- APPLICABILITY CRITERIA:
--     THIS TEST IS APPLICABLE ONLY TO IMPLEMENTATIONS WHICH SUPPORT
--     TEXT FILES.

-- HISTORY:
--     ABW 09/01/82
--     SPS 11/30/82
--     SPS 01/24/82
--     TBN 11/04/86  REVISED TEST TO OUTPUT A NON_APPLICABLE
--                   RESULT WHEN FILES ARE NOT SUPPORTED.
--     DWC 08/19/87  ADDED ORIGINAL_LINE_LENGTH AND
--                   ORIGINAL_PAGE_LENGTH VARIABLES AND CLOSED FILE.

WITH REPORT;
USE REPORT;
WITH TEXT_IO;
USE TEXT_IO;
WITH CHECK_FILE;

PROCEDURE CE3402C IS

     INCOMPLETE : EXCEPTION;
     FILE : FILE_TYPE;
     ONE : POSITIVE_COUNT := POSITIVE_COUNT(IDENT_INT(1));
     TWO : POSITIVE_COUNT := POSITIVE_COUNT(IDENT_INT(2));
     THREE : POSITIVE_COUNT := POSITIVE_COUNT(IDENT_INT(3));
     CHAR : CHARACTER := ('C');
     ITEM_CHAR : CHARACTER;
     ORIGINAL_LINE_LENGTH : COUNT := LINE_LENGTH;
     ORIGINAL_PAGE_LENGTH : COUNT := PAGE_LENGTH;

BEGIN

     TEST ("CE3402C" , "CHECK END_OF_PAGE BEHAVIOR OF NEW_LINE");

     BEGIN
          CREATE (FILE);
     EXCEPTION
          WHEN USE_ERROR =>
               NOT_APPLICABLE ("USE_ERROR RAISED; TEXT CREATE");
               RAISE INCOMPLETE;
          WHEN OTHERS =>
               FAILED ("UNEXPECTED EXCEPTION RAISED; TEXT CREATE");
               RAISE INCOMPLETE;
     END;

     SET_LINE_LENGTH (FILE,THREE);
     SET_PAGE_LENGTH (FILE,TWO);

     FOR I IN 1..6
     LOOP
          PUT (FILE,CHAR);
     END LOOP;

     NEW_LINE (FILE);

     IF PAGE (FILE) /= TWO THEN
          FAILED ("PAGE NOT INCREMENTED BY ONE");
     END IF;

     IF LINE (FILE) /= ONE THEN
          FAILED ("LINE NOT SET TO ONE");
     END IF;

     NEW_LINE (FILE, 7);
     IF PAGE (FILE) /= POSITIVE_COUNT(IDENT_INT (5)) THEN
          FAILED ("MULTIPLE PAGES NOT CREATED BY NEW_LINE");
     END IF;

     SET_LINE_LENGTH (FILE, ORIGINAL_LINE_LENGTH);
     SET_PAGE_LENGTH (FILE, ORIGINAL_PAGE_LENGTH);
     CHECK_FILE (FILE, "CCC#CCC#@##@##@##@#@%");

     CLOSE (FILE);

     RESULT;

EXCEPTION
     WHEN INCOMPLETE =>
          RESULT;

END CE3402C;
