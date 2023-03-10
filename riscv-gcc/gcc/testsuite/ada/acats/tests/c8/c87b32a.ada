-- C87B32A.ADA

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
-- CHECK THAT OVERLOADING RESOLUTION USES THE FOLLOWING RULES:
    
-- FOR ATTRIBUTES OF THE FORM: T'SUCC (X), T'PRED (X), T'POS (X),
-- AND T'IMAGE (X) , THE OPERAND X MUST BE OF TYPE T.
--
-- FOR THE ATTRIBUTE OF THE FORM T'VAL (X), THE OPERAND X MUST BE
-- OF AN INTEGER TYPE.
--
-- FOR THE ATTRIBUTE OF THE FORM T'VALUE (X), THE OPERAND X MUST 
-- BE OF THE PREDEFINED TYPE STRING.
  
-- TRH  13 SEPT 82
-- JRK  12 JAN  84

WITH REPORT; USE REPORT;
   
PROCEDURE C87B32A IS
 
     TYPE COLOR  IS (BROWN, RED, WHITE);
     TYPE SCHOOL IS (HARVARD, BROWN, YALE);
     TYPE COOK   IS (SIMMER, SAUTE, BROWN, BOIL);
     TYPE SUGAR  IS (DEXTROSE, CANE, GLUCOSE, BROWN);
     TYPE WHOLE  IS NEW INTEGER RANGE 0 .. INTEGER'LAST;
     TYPE LIT_CHAR IS ('+', '-', '0', '1', '2', '3', '4', '5', '6', '7',
                       '8', '9');
     TYPE LIT_STRING IS ARRAY (POSITIVE RANGE <>) OF LIT_CHAR;

     FUNCTION "+" (X, Y : WHOLE) RETURN WHOLE 
          RENAMES "*";
 
     FUNCTION F1 RETURN STRING IS
     BEGIN 
          RETURN "+10";
     END F1;
  
     FUNCTION F1 RETURN LIT_STRING IS
     BEGIN 
          FAILED ("THE VALUE ATTRIBUTE TAKES A PREDEFINED STRING " &
                  "OPERAND");
          RETURN "+3";
     END F1;
  
     FUNCTION F1 RETURN CHARACTER IS
     BEGIN
          FAILED ("THE VALUE ATTRIBUTE TAKES A STRING OPERAND");
          RETURN '2';
     END F1;
   
     FUNCTION F2 (X : INTEGER) RETURN FLOAT IS
     BEGIN
          FAILED ("THE VAL ATTRIBUTE TAKES AN INTEGER TYPE OPERAND");
          RETURN 0.0;
     END F2;
  
     FUNCTION F2 (X : INTEGER := 1) RETURN INTEGER IS
     BEGIN 
          RETURN X;
     END F2;
 
BEGIN
     TEST ("C87B32A","OVERLOADED OPERANDS FOR THE ATTRIBUTES " &
           "T'PRED, T'SUCC, T'POS, T'VAL, T'IMAGE AND T'VALUE");
  
     IF COLOR'POS   (BROWN) /= 0        THEN
        FAILED ("RESOLUTION INCORRECT FOR OPERANDS OF THE ATTRIBUTES" &
                " PRED, SUCC, VAL, POS, IMAGE AND VALUE - 1");
     END IF;
 
     IF SCHOOL'POS (BROWN) /= 1         THEN
        FAILED ("RESOLUTION INCORRECT FOR OPERANDS OF THE ATTRIBUTES" &
                " PRED, SUCC, VAL, POS, IMAGE AND VALUE - 2");
     END IF;
 
     IF COOK'POS    (BROWN) /= 2        THEN
        FAILED ("RESOLUTION INCORRECT FOR OPERANDS OF THE ATTRIBUTES" &
                " PRED, SUCC, VAL, POS, IMAGE AND VALUE - 3");
     END IF;
 
     IF SUGAR'POS  (BROWN) /= 3         THEN
        FAILED ("RESOLUTION INCORRECT FOR OPERANDS OF THE ATTRIBUTES" &
                " PRED, SUCC, VAL, POS, IMAGE AND VALUE - 4");
     END IF;
 
     IF SCHOOL'PRED (BROWN) /= HARVARD  THEN
        FAILED ("RESOLUTION INCORRECT FOR OPERANDS OF THE ATTRIBUTES" &
                " PRED, SUCC, VAL, POS, IMAGE AND VALUE - 5");
     END IF;
 
     IF COOK'PRED  (BROWN) /= SAUTE     THEN
        FAILED ("RESOLUTION INCORRECT FOR OPERANDS OF THE ATTRIBUTES" &
                " PRED, SUCC, VAL, POS, IMAGE AND VALUE - 6");
     END IF;
 
     IF SUGAR'PRED  (BROWN) /= GLUCOSE  THEN
        FAILED ("RESOLUTION INCORRECT FOR OPERANDS OF THE ATTRIBUTES" &
                " PRED, SUCC, VAL, POS, IMAGE AND VALUE - 7");
     END IF;
 
     IF COLOR'SUCC (BROWN) /= RED       THEN
        FAILED ("RESOLUTION INCORRECT FOR OPERANDS OF THE ATTRIBUTES" &
                " PRED, SUCC, VAL, POS, IMAGE AND VALUE - 8");
     END IF;
 
     IF SCHOOL'SUCC (BROWN) /= YALE     THEN
        FAILED ("RESOLUTION INCORRECT FOR OPERANDS OF THE ATTRIBUTES" &
                " PRED, SUCC, VAL, POS, IMAGE AND VALUE - 9");
     END IF;
 
     IF COOK'SUCC  (BROWN) /= BOIL      THEN
        FAILED ("RESOLUTION INCORRECT FOR OPERANDS OF THE ATTRIBUTES" &
                " PRED, SUCC, VAL, POS, IMAGE AND VALUE - 10");
     END IF;
 
     IF COLOR'VAL (F2 (0))  /= BROWN    THEN
        FAILED ("RESOLUTION INCORRECT FOR OPERANDS OF THE ATTRIBUTES" &
                " PRED, SUCC, VAL, POS, IMAGE AND VALUE - 11");
     END IF;
 
     IF SCHOOL'VAL (F2)    /= BROWN     THEN
        FAILED ("RESOLUTION INCORRECT FOR OPERANDS OF THE ATTRIBUTES" &
                " PRED, SUCC, VAL, POS, IMAGE AND VALUE - 12");
     END IF;
 
     IF COOK'VAL  (F2 (2))  /= BROWN    THEN
        FAILED ("RESOLUTION INCORRECT FOR OPERANDS OF THE ATTRIBUTES" &
                " PRED, SUCC, VAL, POS, IMAGE AND VALUE - 13");
     END IF;
 
     IF SUGAR'VAL  (F2)    /= CANE      THEN
        FAILED ("RESOLUTION INCORRECT FOR OPERANDS OF THE ATTRIBUTES" &
                " PRED, SUCC, VAL, POS, IMAGE AND VALUE - 14");
     END IF;
 
     IF WHOLE'POS   (1 + 1)   /= 1      THEN
        FAILED ("RESOLUTION INCORRECT FOR OPERANDS OF THE ATTRIBUTES" &
                " PRED, SUCC, VAL, POS, IMAGE AND VALUE - 15");
     END IF;
 
     IF WHOLE'VAL   (1 + 1) /= 2        THEN
        FAILED ("RESOLUTION INCORRECT FOR OPERANDS OF THE ATTRIBUTES" &
                " PRED, SUCC, VAL, POS, IMAGE AND VALUE - 16");
     END IF;
 
     IF WHOLE'SUCC  (1 + 1)   /= 2      THEN
        FAILED ("RESOLUTION INCORRECT FOR OPERANDS OF THE ATTRIBUTES" &
                " PRED, SUCC, VAL, POS, IMAGE AND VALUE - 17");
     END IF;
 
     IF WHOLE'PRED  (1 + 1) /= 0        THEN
        FAILED ("RESOLUTION INCORRECT FOR OPERANDS OF THE ATTRIBUTES" &
                " PRED, SUCC, VAL, POS, IMAGE AND VALUE - 18");
     END IF;
 
     IF WHOLE'VALUE ("+1") + 1 /= 1     THEN
        FAILED ("RESOLUTION INCORRECT FOR OPERANDS OF THE ATTRIBUTES" &
                " PRED, SUCC, VAL, POS, IMAGE AND VALUE - 19");
     END IF;
 
     IF WHOLE'IMAGE (1 + 1) /= " 1"     THEN
        FAILED ("RESOLUTION INCORRECT FOR OPERANDS OF THE ATTRIBUTES" &
                " PRED, SUCC, VAL, POS, IMAGE AND VALUE - 20");
     END IF;
 
     IF WHOLE'VALUE (F1) + 1  /= 10     THEN
        FAILED ("RESOLUTION INCORRECT FOR OPERANDS OF THE ATTRIBUTES" &
                " PRED, SUCC, VAL, POS, IMAGE AND VALUE - 21");
     END IF;
 
     IF WHOLE'VAL (1) + 1   /= 1        THEN
        FAILED ("RESOLUTION INCORRECT FOR OPERANDS OF THE ATTRIBUTES" &
                " PRED, SUCC, VAL, POS, IMAGE AND VALUE - 22");
     END IF;
 
     RESULT;
END C87B32A;
