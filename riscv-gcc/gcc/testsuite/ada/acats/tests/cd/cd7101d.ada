-- CD7101D.ADA

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
--     CHECK THAT FOR MIN_INT AND MAX_INT IN PACKAGE SYSTEM,
--     INTEGER'FIRST >= MIN_INT AND INTEGER'LAST <= MAX_INT.

-- HISTORY:
--     JET 09/10/87  CREATED ORIGINAL TEST.

WITH SYSTEM;
WITH REPORT;  USE REPORT;

PROCEDURE CD7101D IS

BEGIN

     TEST ("CD7101D", "CHECK THAT FOR MIN_INT AND MAX_INT IN PACKAGE " &
                      "SYSTEM, INTEGER'FIRST >= MIN_INT AND INTEGER'" &
                      "LAST <= MAX_INT");

     IF INTEGER'POS (INTEGER'FIRST) < SYSTEM.MIN_INT THEN
          FAILED ("INCORRECT VALUE FOR SYSTEM.MIN_INT");
     END IF;

     IF INTEGER'POS (INTEGER'LAST) > SYSTEM.MAX_INT THEN
          FAILED ("INCORRECT VALUE FOR SYSTEM.MAX_INT");
     END IF;

     RESULT;

END CD7101D;
