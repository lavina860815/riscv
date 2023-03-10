-- CE3408C.ADA

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
--     CHECK THAT THE FILE PARAMETER OF END_OF_FILE IS OPTIONAL, AND
--     THAT THE FUNCTION IS THEN APPLIED TO THE CURRENT DEFAULT INPUT
--     FILE.

-- APPLICABILITY CRITERIA:
--     THIS TEST IS APPLICABLE ONLY TO IMPLEMENTATIONS WHICH SUPPORT
--     TEXT FILES.

-- HISTORY:
--     ABW 08/26/82
--     TBN 11/10/86  REVISED TEST TO OUTPUT A NOT_APPLICABLE
--                   RESULT WHEN FILES ARE NOT SUPPORTED.
--     JLH 08/31/87  REMOVED DEPENDENCE ON RESET, REMOVED UNNECESSARY
--                   CODE, AND CHECKED FOR USE_ERROR ON DELETE.

WITH REPORT;
USE REPORT;
WITH TEXT_IO;
USE TEXT_IO;

PROCEDURE CE3408C IS

     INCOMPLETE : EXCEPTION;
     FILE_IN : FILE_TYPE;
     CHAR : CHARACTER := 'A';
     ITEM_CHAR : CHARACTER;

BEGIN

     TEST ("CE3408C", "CHECK THAT THE FILE PARAMETER OF END_OF_FILE " &
                      "IS OPTIONAL, AND THAT THE FUNCTION IS THEN " &
                      "APPLIED TO THE CURRENT DEFAULT INPUT FILE");


-- CREATE TEST FILE

     BEGIN
          CREATE (FILE_IN, OUT_FILE, LEGAL_FILE_NAME);
     EXCEPTION
          WHEN USE_ERROR =>
               NOT_APPLICABLE ("USE_ERROR RAISED ON TEXT CREATE WITH " &
                               "OUT_FILE MODE");
               RAISE INCOMPLETE;
          WHEN NAME_ERROR =>
               NOT_APPLICABLE ("NAME_ERROR RAISED ON TEXT CREATE " &
                               "WITH OUT_FILE MODE");
               RAISE INCOMPLETE;
          WHEN OTHERS =>
               FAILED ("UNEXPECTED EXCEPTION RAISED ON TEXT CREATE");
               RAISE INCOMPLETE;
     END;

     FOR I IN 1..3 LOOP
          PUT (FILE_IN, CHAR);
     END LOOP;
     NEW_PAGE (FILE_IN);

     PUT (FILE_IN, CHAR);

     CLOSE (FILE_IN);

     BEGIN
          OPEN (FILE_IN, IN_FILE, LEGAL_FILE_NAME);
     EXCEPTION
          WHEN USE_ERROR =>
               NOT_APPLICABLE ("USE_ERROR RAISED ON TEXT OPEN WITH " &
                               "MODE IN_FILE");
               RAISE INCOMPLETE;
     END;

     SET_INPUT (FILE_IN);
     IF END_OF_FILE THEN
          FAILED ("INCORRECT VALUE AT FIRST POSITION");
     END IF;

     IF END_OF_FILE /= END_OF_FILE (FILE_IN) THEN
          FAILED ("END OF FILE DOES NOT OPERATE WITH DEFAULT FILE");
     END IF;

     WHILE NOT END_OF_PAGE (FILE_IN)
     LOOP
          GET (ITEM_CHAR);
     END LOOP;

     IF END_OF_FILE THEN
          FAILED ("INCORRECT VALUE BEFORE LAST CHARACTER");
     END IF;

     IF END_OF_FILE /= END_OF_FILE (FILE_IN) THEN
          FAILED ("END_OF_FILE WITHOUT PARAMETER DOES " &
                  "NOT OPERATE ON THE DEFAULT INPUT FILE");
     END IF;

     GET (ITEM_CHAR);

     IF NOT (END_OF_FILE) THEN
          FAILED ("INCORRECT VALUE AT LAST POSITION");
     END IF;

     BEGIN
          DELETE (FILE_IN);
     EXCEPTION
          WHEN USE_ERROR =>
               NULL;
     END;

     RESULT;

EXCEPTION
     WHEN INCOMPLETE =>
          RESULT;

END CE3408C;
