-- C45282A.ADA

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
-- CHECK THAT IN AND NOT IN ARE EVALUATED CORRECTLY FOR :
--     A) ACCESS TO SCALAR TYPES;
--     B) ACCESS TO ARRAY TYPES (CONSTRAINED AND UNCONSTRAINED);
--     C) ACCESS TO RECORD, PRIVATE, AND LIMITED PRIVATE TYPES WITHOUT
--        DISCRIMINANTS;

-- TBN  8/8/86

WITH REPORT; USE REPORT;
PROCEDURE C45282A IS

     PACKAGE P IS
          TYPE KEY IS PRIVATE;
          FUNCTION INIT_KEY (X : NATURAL) RETURN KEY;
          TYPE NEWKEY IS LIMITED PRIVATE;
          TYPE ACC_NKEY IS ACCESS NEWKEY;
          PROCEDURE ASSIGN_NEWKEY (Y : IN OUT ACC_NKEY);
     PRIVATE
          TYPE KEY IS NEW NATURAL;
          TYPE NEWKEY IS NEW KEY;
     END P;

     USE P;
     SUBTYPE I IS INTEGER;
     TYPE ACC_INT IS ACCESS I;
     P_INT : ACC_INT;
     SUBTYPE INT IS INTEGER RANGE 1 .. 5;
     TYPE ARRAY_TYPE1 IS ARRAY (INT RANGE <>) OF INTEGER;
     TYPE ACC_ARA_1 IS ACCESS ARRAY_TYPE1;
     SUBTYPE ACC_ARA_2 IS ACC_ARA_1 (1 .. 2);
     SUBTYPE ACC_ARA_3 IS ACC_ARA_1 (1 .. 3);
     ARA1 : ACC_ARA_1;
     ARA2 : ACC_ARA_2;
     ARA3 : ACC_ARA_3;
     TYPE GREET IS
          RECORD
               NAME : STRING (1 .. 2);
          END RECORD;
     TYPE ACC_GREET IS ACCESS GREET;
     INTRO : ACC_GREET;
     TYPE ACC_KEY IS ACCESS KEY;
     KEY1 : ACC_KEY;
     KEY2 : ACC_NKEY;

     PACKAGE BODY P IS
          FUNCTION INIT_KEY (X : NATURAL) RETURN KEY IS
          BEGIN
               RETURN (KEY(X));
          END INIT_KEY;

          PROCEDURE ASSIGN_NEWKEY (Y : IN OUT ACC_NKEY) IS
          BEGIN
               Y.ALL := NEWKEY (1);
          END ASSIGN_NEWKEY;
     END P;

BEGIN

     TEST ("C45282A", "CHECK THAT IN AND NOT IN ARE EVALUATED FOR " &
                      "ACCESS TYPES TO SCALAR TYPES, ARRAY TYPES, " &
                      "RECORD TYPES, PRIVATE TYPES, AND LIMITED " &
                      "PRIVATE TYPES WITHOUT DISCRIMINANTS");

-- CASE A
     IF P_INT NOT IN ACC_INT THEN
          FAILED ("INCORRECT RESULTS FOR ACCESS TYPES - 1");
     END IF;
     P_INT := NEW INT'(5);
     IF P_INT IN ACC_INT THEN
          NULL;
     ELSE
          FAILED ("INCORRECT RESULTS FOR ACCESS TYPES - 2");
     END IF;

-- CASE B
     IF ARA1 NOT IN ACC_ARA_1 THEN
          FAILED ("INCORRECT RESULTS FOR ACCESS TYPES - 3");
     END IF;
     IF ARA1 NOT IN ACC_ARA_2 THEN
          FAILED ("INCORRECT RESULTS FOR ACCESS TYPES - 4");
     END IF;
     IF ARA1 IN ACC_ARA_3 THEN
          NULL;
     ELSE
          FAILED ("INCORRECT RESULTS FOR ACCESS TYPES - 5");
     END IF;
     IF ARA2 IN ACC_ARA_1 THEN
          NULL;
     ELSE
          FAILED ("INCORRECT RESULTS FOR ACCESS TYPES - 6");
     END IF;
     IF ARA3 NOT IN ACC_ARA_1 THEN
          FAILED ("INCORRECT RESULTS FOR ACCESS TYPES - 7");
     END IF;
     ARA1 := NEW ARRAY_TYPE1'(1, 2, 3);
     IF ARA1 IN ACC_ARA_1 THEN
          NULL;
     ELSE
          FAILED ("INCORRECT RESULTS FOR ACCESS TYPES - 8");
     END IF;
     IF ARA1 IN ACC_ARA_2 THEN
          FAILED ("INCORRECT RESULTS FOR ACCESS TYPES - 9");
     END IF;
     IF ARA1 NOT IN ACC_ARA_3 THEN
          FAILED ("INCORRECT RESULTS FOR ACCESS TYPES - 10");
     END IF;
     ARA2 := NEW ARRAY_TYPE1'(1, 2);
     IF ARA2 NOT IN ACC_ARA_1 THEN
          FAILED ("INCORRECT RESULTS FOR ACCESS TYPES - 11");
     END IF;
     IF ARA2 NOT IN ACC_ARA_2 THEN
          FAILED ("INCORRECT RESULTS FOR ACCESS TYPES - 12");
     END IF;

-- CASE C
     IF INTRO NOT IN ACC_GREET THEN
          FAILED ("INCORRECT RESULTS FOR ACCESS TYPES - 13");
     END IF;
     INTRO := NEW GREET'(NAME => "HI");
     IF INTRO IN ACC_GREET THEN
          NULL;
     ELSE
          FAILED ("INCORRECT RESULTS FOR ACCESS TYPES - 14");
     END IF;
     IF KEY1 NOT IN ACC_KEY THEN
          FAILED ("INCORRECT RESULTS FOR ACCESS TYPES - 15");
     END IF;
     KEY1 := NEW KEY'(INIT_KEY (1));
     IF KEY1 IN ACC_KEY THEN
          NULL;
     ELSE
          FAILED ("INCORRECT RESULTS FOR ACCESS TYPES - 16");
     END IF;
     IF KEY2 NOT IN ACC_NKEY THEN
          FAILED ("INCORRECT RESULTS FOR ACCESS TYPES - 17");
     END IF;
     KEY2 := NEW NEWKEY;
     ASSIGN_NEWKEY (KEY2);
     IF KEY2 IN ACC_NKEY THEN
          NULL;
     ELSE
          FAILED ("INCORRECT RESULTS FOR ACCESS TYPES - 18");
     END IF;

     RESULT;
END C45282A;
