-- C87B48A.ADA

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
-- CHECK THAT OVERLOADING RESOLUTION USES THE RULE THAT:
--
-- NAMED ACTUAL PARAMETERS CAN RESOLVE OVERLOADING OF SUBPROGRAMS.
-- THIS TEST USES FUNCTIONS AND OPERATOR SYMBOLS ONLY.
  
-- TRH  13 AUG 82
  
WITH REPORT; USE REPORT;
   
PROCEDURE C87B48A IS
 
     ERR, B1, B2 : BOOLEAN := FALSE;
 
     PACKAGE A IS
          FUNCTION "-"    (X : BOOLEAN) RETURN BOOLEAN;
          FUNCTION TOGGLE (X : BOOLEAN) RETURN BOOLEAN
               RENAMES "-";
     END A;
     
     PACKAGE BODY A IS
          FUNCTION "-" (X : BOOLEAN) RETURN BOOLEAN IS
          BEGIN
               RETURN NOT X;
          END "-";
     END A;
 
     PACKAGE B IS
          FUNCTION "-"    (Y : BOOLEAN) RETURN BOOLEAN;
          FUNCTION TOGGLE (Y : BOOLEAN) RETURN BOOLEAN
               RENAMES "-";
     END B;
     
     PACKAGE BODY B IS
          FUNCTION "-" (Y : BOOLEAN) RETURN BOOLEAN IS
          BEGIN
               ERR := TRUE;
               RETURN NOT Y;
          END "-";
     END B;
 
     PACKAGE C IS
          FUNCTION "-"    (Z : BOOLEAN) RETURN BOOLEAN;
          FUNCTION TOGGLE (Z : BOOLEAN) RETURN BOOLEAN
               RENAMES "-";
     END C;
     
     PACKAGE BODY C IS
          FUNCTION "-" (Z : BOOLEAN) RETURN BOOLEAN IS
          BEGIN
               ERR := TRUE;
               RETURN NOT Z;
          END "-";
     END C;
   
     USE A, B, C;
 
BEGIN
     TEST ("C87B48A","RESOLUTION OF OVERLOADED SUBPROGRAMS BY NAMED " &
           "ACTUAL PARAMETERS");
 
     B1 := "-"    (X => FALSE);
     B2 := TOGGLE (X => FALSE);
   
     IF ERR OR ELSE NOT B1 OR ELSE NOT B2 THEN 
          FAILED ("RESOLUTION INCORRECT FOR OVERLOADED SUBPROGRAMS" &
                  " WITH NAMED ACTUAL PARAMETERS");
     END IF;
 
     RESULT;
END C87B48A;
