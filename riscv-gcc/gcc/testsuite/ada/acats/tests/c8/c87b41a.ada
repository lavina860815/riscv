-- C87B41A.ADA

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
-- THE NAMED VARIABLE AND THE RIGHT HAND SIDE EXPRESSION
-- IN AN ASSIGNMENT STATEMENT MUST BE OF THE SAME TYPE. THIS TYPE
-- MUST NOT BE A LIMITED TYPE.
  
-- TRH  15 SEPT 82
-- PWN 01/31/95  REMOVED INCONSISTENCIES WITH ADA 9X.
  
WITH REPORT; USE REPORT;
   
PROCEDURE C87B41A IS
     
     TYPE NOTE IS (A, B, C, D, E, F, G);
     TYPE POSITIVE IS NEW INTEGER RANGE 1 .. INTEGER'LAST;
     TYPE ACC_CHAR IS ACCESS CHARACTER;
     TYPE ACC_DUR  IS ACCESS DURATION;
     TYPE ACC_POS  IS ACCESS POSITIVE;
     TYPE ACC_INT  IS ACCESS INTEGER;
     TYPE ACC_BOOL IS ACCESS BOOLEAN;
     TYPE ACC_STR  IS ACCESS STRING;
     TYPE ACC_FLT  IS ACCESS FLOAT;
     TYPE ACC_NOTE IS ACCESS NOTE;
   
     TYPE NEW_CHAR IS NEW CHARACTER;
     TYPE NEW_DUR  IS NEW DURATION;
     TYPE NEW_POS  IS NEW POSITIVE;
     TYPE NEW_INT  IS NEW INTEGER;
     TYPE NEW_BOOL IS NEW BOOLEAN;
     TYPE NEW_FLT  IS NEW FLOAT;
     TYPE NEW_NOTE IS NEW NOTE RANGE A .. F;
     TASK TYPE T;
   
     TASK BODY T IS
     BEGIN
          NULL;
     END T;
  
     FUNCTION G RETURN T IS
          T1 : T;
     BEGIN
          FAILED ("LIMITED TYPES MAY NOT OCCUR IN ASSIGNMENT " &
                  "STATEMENTS");
          RETURN T1;
     END G;
  
     GENERIC
          TYPE T IS PRIVATE;
          ARG  : IN T;
     FUNCTION F1 RETURN T;
 
     FUNCTION F1 RETURN T IS
     BEGIN 
          FAILED ("RESOLUTION INCORRECT - RIGHT HAND SIDE OF " &
                  "ASSIGNMENT STATEMENT MUST MATCH TYPE OF VARIABLE");
          RETURN ARG;
     END F1;
  
     FUNCTION F IS NEW F1 (ACC_CHAR, NEW CHARACTER);
     FUNCTION F IS NEW F1 (ACC_DUR,  NEW DURATION);
     FUNCTION F IS NEW F1 (ACC_POS,  NEW POSITIVE);
     FUNCTION F IS NEW F1 (ACC_INT,  NEW INTEGER);
     FUNCTION F IS NEW F1 (ACC_BOOL, NEW BOOLEAN);
     FUNCTION F IS NEW F1 (ACC_STR,  NEW STRING(1..2) );
     FUNCTION F IS NEW F1 (ACC_FLT,  NEW FLOAT);

     FUNCTION F RETURN ACC_NOTE IS
     BEGIN
          RETURN  (NEW NOTE);
     END F;
 
     FUNCTION G IS NEW F1 (NEW_CHAR, 'G');
     FUNCTION G IS NEW F1 (NEW_DUR,  1.0);
     FUNCTION G IS NEW F1 (NEW_POS,  +10);
     FUNCTION G IS NEW F1 (NEW_INT,  -10);
     FUNCTION G IS NEW F1 (NEW_BOOL, TRUE);
     FUNCTION G IS NEW F1 (NEW_FLT,  1.0);
     FUNCTION G IS NEW F1 (NEW_NOTE, F);
    
BEGIN
     TEST ("C87B41A","OVERLOADED CONSTRUCTS ON BOTH SIDES OF THE " &
           "ASSIGNMENT STATEMENT");
 
     F.ALL := G;
    
     RESULT;
 
END C87B41A;
