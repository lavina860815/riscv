-- C87B33A.ADA

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
-- THE SHORT CIRCUIT CONTROL FORMS "AND THEN" AND "OR ELSE" ARE
-- DEFINED AS BINARY BOOLEAN OPERATORS WHICH RETURN A BOOLEAN VALUE
-- OF THE SAME TYPE AS THE OPERANDS.
  
-- TRH  13 SEPT 82
  
WITH REPORT; USE REPORT;
   
PROCEDURE C87B33A IS
     
     TYPE ON   IS NEW BOOLEAN RANGE TRUE  .. TRUE;
     TYPE OFF  IS NEW BOOLEAN RANGE FALSE .. FALSE;
     TYPE YES  IS NEW ON;
     TYPE NO   IS NEW OFF;
     TYPE BIT  IS NEW BOOLEAN;
     TYPE FLAG IS (PASS, FAIL);
 
     TYPE BOOLEAN IS (FALSE, TRUE);  -- STANDARD BOOLEAN HIDDEN.
 
     GENERIC 
          TYPE T IS PRIVATE;
          ARG  : IN T;
          STAT : FLAG;
     FUNCTION F1 RETURN T;
     
     FUNCTION F1 RETURN T IS
     BEGIN
          IF STAT = FAIL THEN
               FAILED ("RESOLUTION INCORRECT FOR SHORT CIRCUIT " &
                       "CONTROL FORMS 'AND THEN' AND 'OR ELSE' ");
          END IF;
          RETURN ARG;
     END F1;
 
     FUNCTION A IS NEW F1 (BOOLEAN, TRUE,  FAIL);
     FUNCTION A IS NEW F1 (NO,      FALSE, PASS);
     FUNCTION A IS NEW F1 (ON,      TRUE,  FAIL);
     FUNCTION A IS NEW F1 (YES,     TRUE,  FAIL);
     FUNCTION B IS NEW F1 (BOOLEAN, TRUE,  FAIL);
     FUNCTION B IS NEW F1 (NO,      FALSE, FAIL);
     FUNCTION B IS NEW F1 (OFF,     FALSE, FAIL);
     FUNCTION B IS NEW F1 (BIT,     TRUE,  FAIL);
     FUNCTION C IS NEW F1 (BOOLEAN, FALSE, FAIL);
     FUNCTION C IS NEW F1 (YES,     TRUE,  PASS);
     FUNCTION C IS NEW F1 (ON,      TRUE,  FAIL);
     FUNCTION C IS NEW F1 (NO,      FALSE, FAIL);
     FUNCTION D IS NEW F1 (BOOLEAN, FALSE, FAIL);
     FUNCTION D IS NEW F1 (OFF,     FALSE, FAIL);
     FUNCTION D IS NEW F1 (YES,     TRUE,  FAIL);
     FUNCTION D IS NEW F1 (BIT,     TRUE,  FAIL);
     FUNCTION E IS NEW F1 (BOOLEAN, FALSE, FAIL);
     FUNCTION E IS NEW F1 (BIT,     TRUE,  PASS);
     FUNCTION E IS NEW F1 (YES,     TRUE,  FAIL);
     FUNCTION E IS NEW F1 (NO,      FALSE, FAIL);
     FUNCTION F IS NEW F1 (BOOLEAN, FALSE, FAIL);
     FUNCTION F IS NEW F1 (BIT,     TRUE,  PASS);
     FUNCTION F IS NEW F1 (ON,      TRUE,  FAIL);
     FUNCTION F IS NEW F1 (OFF,     FALSE, FAIL);
     FUNCTION G IS NEW F1 (BOOLEAN, TRUE,  FAIL);
     FUNCTION G IS NEW F1 (BIT,     FALSE, PASS);
     FUNCTION G IS NEW F1 (NO,      FALSE, FAIL);
     FUNCTION G IS NEW F1 (YES,     TRUE,  FAIL);
     FUNCTION H IS NEW F1 (BOOLEAN, TRUE,  FAIL);
     FUNCTION H IS NEW F1 (BIT,     FALSE, PASS);
     FUNCTION H IS NEW F1 (OFF,     FALSE, FAIL);
     FUNCTION H IS NEW F1 (ON,      TRUE,  FAIL);
 
BEGIN
     TEST ("C87B33A","OVERLOADED OPERANDS FOR SHORT CIRCUIT CONTROL " &
           "FORMS 'AND THEN' AND 'OR ELSE' ");
    
     IF (A AND THEN B)                        THEN
          FAILED ("RESOLUTION INCORRECT FOR SHORT CIRCUIT FORMS - A&B");
     END IF;

     IF NOT (C OR ELSE D) THEN
          FAILED ("RESOLUTION INCORRECT FOR SHORT CIRCUIT FORMS - C&D");
     END IF;

     IF NOT (E AND THEN F AND THEN E
          AND THEN F AND THEN E AND THEN F)   THEN
          FAILED ("RESOLUTION INCORRECT FOR SHORT CIRCUIT FORMS - E&F");
     END IF;

     IF (G OR ELSE H OR ELSE G
          OR ELSE H OR ELSE G OR ELSE H)      THEN
          FAILED ("RESOLUTION INCORRECT FOR SHORT CIRCUIT FORMS - G&H");
     END IF;
    
     RESULT;
END C87B33A;
