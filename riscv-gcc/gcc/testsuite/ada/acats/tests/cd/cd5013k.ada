-- CD5013K.ADA

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
--     CHECK THAT AN ADDRESS CLAUSE CAN BE GIVEN IN THE PRIVATE PART OF
--     A PACKAGE SPECIFICATION FOR A VARIABLE OF A RECORD TYPE, WHERE
--     THE VARIABLE IS DECLARED IN THE VISIBLE PART OF THE
--     SPECIFICATION.

-- HISTORY:
--     BCB 09/16/87  CREATED ORIGINAL TEST.
--     PWB 05/11/89  CHANGED EXTENSION FROM '.DEP' TO '.ADA'.

WITH REPORT;  USE REPORT;
WITH SPPRT13; USE SPPRT13;
WITH SYSTEM;  USE SYSTEM;

PROCEDURE CD5013K IS

     TYPE REC_TYPE IS RECORD
          BOOL : BOOLEAN;
          INT  : INTEGER;
     END RECORD;

     PACKAGE PACK IS
          CHECK_VAR : REC_TYPE;
     PRIVATE
          FOR CHECK_VAR USE
               AT VARIABLE_ADDRESS;
     END PACK;

     PACKAGE BODY PACK IS
     BEGIN
          TEST ("CD5013K", "AN ADDRESS CLAUSE CAN BE GIVEN " &
                           "IN THE PRIVATE PART OF A PACKAGE " &
                           "SPECIFICATION FOR A VARIABLE OF A RECORD " &
                           "TYPE, WHERE THE VARIABLE IS DECLARED IN " &
                           "THE VISIBLE PART OF THE SPECIFICATION");

          CHECK_VAR := (TRUE, IDENT_INT(5));
          IF EQUAL(3,3) THEN
               CHECK_VAR := (FALSE, IDENT_INT(10));
          END IF;

          IF CHECK_VAR /= (FALSE, IDENT_INT (10)) THEN
               FAILED ("INCORRECT VALUE FOR RECORD VARIABLE");
          END IF;

          IF CHECK_VAR'ADDRESS /= VARIABLE_ADDRESS THEN
               FAILED ("INCORRECT ADDRESS FOR RECORD VARIABLE");
          END IF;
     END PACK;

BEGIN

     RESULT;
END CD5013K;
