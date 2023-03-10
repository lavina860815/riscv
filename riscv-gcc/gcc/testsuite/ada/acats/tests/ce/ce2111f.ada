-- CE2111F.ADA

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
--     CHECK THAT A SUCCESSFUL RESET POSITIONS THE FILE CORRECTLY
--     TO THE START OF THE FILE FOR SEQUENTIAL IO.

-- APPLICABILITY CRITERIA:
--     THIS TEST IS APPLICABLE ONLY TO IMPLEMENTATIONS WHICH SUPPORT
--     RESET FOR SEQUENTIAL FILES.

-- HISTORY:
--     JLH 08/03/87 CREATED ORIGINAL TEST.

WITH REPORT; USE REPORT;
WITH SEQUENTIAL_IO;

PROCEDURE CE2111F IS

     PACKAGE SEQ_IO IS NEW SEQUENTIAL_IO (INTEGER);
          USE SEQ_IO;
     TEST_FILE_ONE : SEQ_IO.FILE_TYPE;
     DATUM : INTEGER;
     INCOMPLETE : EXCEPTION;

BEGIN
     TEST ("CE2111F", "CHECK THAT SUCCESSFUL RESET POSITIONS THE " &
                      "FILE CORRECTLY");

-- CREATE AND INITIALIZE TEST FILE

     BEGIN
          CREATE (TEST_FILE_ONE, OUT_FILE, LEGAL_FILE_NAME);
     EXCEPTION
          WHEN USE_ERROR =>
               NOT_APPLICABLE ("USE_ERROR RAISED ON CREATE");
               RAISE INCOMPLETE;
          WHEN NAME_ERROR =>
               NOT_APPLICABLE ("NAME_ERROR RAISED ON CREATE");
               RAISE INCOMPLETE;
     END;

     WRITE (TEST_FILE_ONE, 5);
     WRITE (TEST_FILE_ONE, 6);

-- CHECK THAT RESET POSITIONS INDEX CORRECTLY FOR OUT_FILE

     BEGIN
          RESET (TEST_FILE_ONE);
     EXCEPTION
          WHEN USE_ERROR =>
               NOT_APPLICABLE ("RESET NOT SUPPORTED FOR OUT_FILE");
               RAISE INCOMPLETE;
     END;

-- WRITE MORE DATA

     WRITE (TEST_FILE_ONE, 2);
     CLOSE (TEST_FILE_ONE);

-- NOW CHECK TO SEE THAT RESET WORKED FOR OUT_FILE

     BEGIN
          OPEN (TEST_FILE_ONE, IN_FILE, LEGAL_FILE_NAME);
     EXCEPTION
          WHEN USE_ERROR =>
               NOT_APPLICABLE ("SEQ_IO NOT SUPPORTED FOR IN_FILE OPEN");
               RAISE INCOMPLETE;
     END;

     READ (TEST_FILE_ONE, DATUM);

     IF DATUM /= 2 THEN
          FAILED ("RESET INCORRECTLY POSITIONED FILE FOR OUT_FILE");
     END IF;


-- RESET IN_FILE

     BEGIN
          RESET (TEST_FILE_ONE);
     EXCEPTION
          WHEN USE_ERROR =>
               NOT_APPLICABLE ("RESET NOT SUPPORTED FOR IN_FILE");
               RAISE INCOMPLETE;
     END;

-- VALIDATE IN_FILE RESET

     READ (TEST_FILE_ONE, DATUM);

     IF DATUM /= 2 THEN
          FAILED ("RESET INCORRECTLY POSITIONED FILE FOR IN_FILE");
     END IF;

-- DELETE TEST FILE

     BEGIN
          DELETE (TEST_FILE_ONE);
     EXCEPTION
          WHEN USE_ERROR =>
               NULL;
     END;

     RESULT;

EXCEPTION
     WHEN INCOMPLETE =>
          RESULT;

END CE2111F;
