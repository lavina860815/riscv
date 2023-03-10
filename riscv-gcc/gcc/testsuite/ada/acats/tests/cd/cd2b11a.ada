-- CD2B11A.ADA

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
--     CHECK THAT IF A COLLECTION SIZE SPECIFICATION CAN BE GIVEN FOR AN
--     ACCESS TYPE, THEN OPERATIONS ON VALUES OF THE ACCESS TYPE ARE NOT
--     AFFECTED.

-- HISTORY:
--     BCB 11/01/88  CREATED ORIGINAL TEST.
--     RJW 05/17/89  CHANGED FROM '.DEP' TEST TO '.ADA' TEST.
--                   ADDED CHECK FOR UNCHECKED_DEALLOCATION.

WITH REPORT;  USE REPORT;
WITH SYSTEM;
WITH UNCHECKED_DEALLOCATION;
PROCEDURE CD2B11A IS

     BASIC_SIZE : CONSTANT := 1024;

     TYPE MAINTYPE IS ARRAY (INTEGER RANGE <>) OF INTEGER;
     TYPE ACC_TYPE IS ACCESS MAINTYPE;
     SUBTYPE ACC_RANGE IS ACC_TYPE (1 .. 3);

     FOR ACC_TYPE'STORAGE_SIZE USE BASIC_SIZE;

     TYPE RECORD_TYPE IS RECORD
          COMP : ACC_TYPE;
     END RECORD;

     CHECK_TYPE1 : ACC_TYPE;
     CHECK_TYPE2 : ACC_TYPE;
     CHECK_TYPE3 : ACC_TYPE(1..3);

     CHECK_ARRAY : ARRAY (1..2) OF ACC_TYPE;

     CHECK_RECORD1 : RECORD_TYPE;
     CHECK_RECORD2 : RECORD_TYPE;

     CHECK_PARAM1 : ACC_TYPE;
     CHECK_PARAM2 : ACC_TYPE;

     CHECK_NULL : ACC_TYPE := NULL;

     PROCEDURE PROC (ACC1,ACC2 : IN OUT ACC_TYPE) IS

     BEGIN

          IF (ACC1.ALL /= ACC2.ALL) THEN
               FAILED ("INCORRECT VALUES FOR DESIGNATED OBJECTS " &
                       "- 1");
          END IF;

          IF EQUAL (3,3) THEN
               ACC2 := ACC1;
          END IF;

          IF ACC2 /= ACC1 THEN
               FAILED ("INCORRECT RESULTS FOR RELATIONAL OPERATORS " &
                       "-1");
          END IF;

          IF (ACC1 IN ACC_RANGE) THEN
               FAILED ("INCORRECT RESULTS FOR MEMBERSHIP TEST - 1");
          END IF;

     END PROC;

BEGIN

     TEST ("CD2B11A", "CHECK THAT IF A COLLECTION SIZE SPECIFICATION " &
                      "CAN BE GIVEN FOR AN ACCESS TYPE, THEN " &
                      "OPERATIONS ON VALUES OF THE ACCESS TYPE ARE " &
                      "NOT AFFECTED");

     CHECK_PARAM1 := NEW MAINTYPE'(25,35,45);
     CHECK_PARAM2 := NEW MAINTYPE'(25,35,45);

     PROC (CHECK_PARAM1,CHECK_PARAM2);

     IF ACC_TYPE'STORAGE_SIZE < BASIC_SIZE THEN
          FAILED ("INCORRECT VALUE FOR ACCESS TYPE STORAGE_SIZE");
     END IF;

     CHECK_TYPE1 := NEW MAINTYPE'(25,35,45);
     CHECK_TYPE2 := NEW MAINTYPE'(25,35,45);
     CHECK_TYPE3 := NEW MAINTYPE'(1 => 1,2 => 2,3 => 3);

     CHECK_ARRAY (1) := NEW MAINTYPE'(25,35,45);
     CHECK_ARRAY (2) := NEW MAINTYPE'(25,35,45);

     CHECK_RECORD1.COMP := NEW MAINTYPE'(25,35,45);
     CHECK_RECORD2.COMP := NEW MAINTYPE'(25,35,45);

     IF (CHECK_TYPE1.ALL /= CHECK_TYPE2.ALL) THEN
          FAILED ("INCORRECT VALUES FOR DESIGNATED OBJECTS - 2");
     END IF;

     IF EQUAL (3,3) THEN
          CHECK_TYPE2 := CHECK_TYPE1;
     END IF;

     IF CHECK_TYPE2 /= CHECK_TYPE1 THEN
          FAILED ("INCORRECT RESULTS FOR RELATIONAL OPERATORS - 2");
     END IF;

     IF (CHECK_TYPE1 IN ACC_RANGE) THEN
          FAILED ("INCORRECT RESULTS FOR MEMBERSHIP TEST - 2");
     END IF;

     IF (CHECK_ARRAY (1).ALL /= CHECK_ARRAY (2).ALL) THEN
          FAILED ("INCORRECT VALUES FOR DESIGNATED OBJECTS - 3");
     END IF;

     IF EQUAL (3,3) THEN
          CHECK_ARRAY (2) := CHECK_ARRAY (1);
     END IF;

     IF CHECK_ARRAY (2) /= CHECK_ARRAY (1) THEN
          FAILED ("INCORRECT RESULTS FOR RELATIONAL OPERATORS - 3");
     END IF;

     IF (CHECK_ARRAY (1) IN ACC_RANGE) THEN
          FAILED ("INCORRECT RESULTS FOR MEMBERSHIP TEST - 3");
     END IF;

     IF (CHECK_RECORD1.COMP.ALL /= CHECK_RECORD2.COMP.ALL) THEN
          FAILED ("INCORRECT VALUES FOR DESIGNATED OBJECTS - 4");
     END IF;

     IF EQUAL (3,3) THEN
          CHECK_RECORD2 := CHECK_RECORD1;
     END IF;

     IF CHECK_RECORD2 /= CHECK_RECORD1 THEN
          FAILED ("INCORRECT RESULTS FOR RELATIONAL OPERATORS - 4");
     END IF;

     IF (CHECK_RECORD1.COMP IN ACC_RANGE) THEN
          FAILED ("INCORRECT RESULTS FOR MEMBERSHIP TEST - 4");
     END IF;

     IF CHECK_TYPE3'FIRST /= IDENT_INT (1) THEN
          FAILED ("INCORRECT VALUE FOR CHECK_TYPE3'FIRST");
     END IF;

     IF CHECK_TYPE3'LAST /= IDENT_INT (3) THEN
          FAILED ("INCORRECT VALUE FOR CHECK_TYPE3'LAST");
     END IF;

     DECLARE
          TYPE ACC_CHAR IS ACCESS CHARACTER;
          FOR ACC_CHAR'STORAGE_SIZE USE 128;

          LIMIT : INTEGER :=
           (ACC_CHAR'STORAGE_SIZE * SYSTEM.STORAGE_UNIT)/CHARACTER'SIZE;

          ACC_ARRAY : ARRAY (1 .. LIMIT + 1) OF ACC_CHAR;
          PLACE : INTEGER;

          PROCEDURE FREE IS
               NEW UNCHECKED_DEALLOCATION (CHARACTER, ACC_CHAR);
     BEGIN
          FOR I IN ACC_ARRAY'RANGE LOOP
               ACC_ARRAY (IDENT_INT (I)) :=
                    NEW CHARACTER'
                         (IDENT_CHAR ((CHARACTER'VAL (I MOD 128))));
               PLACE := I;
          END LOOP;
          FAILED ("NO EXCEPTION RAISED WHEN COLLECTION SIZE EXCEEDED");
     EXCEPTION
          WHEN STORAGE_ERROR =>
               BEGIN
                    FOR I IN 1 .. PLACE LOOP
                         IF I MOD 2 = 0 THEN
                              FREE (ACC_ARRAY (IDENT_INT (I)));
                         END IF;
                    END LOOP;

                    FOR I IN 1 .. PLACE LOOP
                         IF I MOD 2 = 1 AND THEN
                            IDENT_CHAR (ACC_ARRAY (I).ALL) /=
                            CHARACTER'VAL (I MOD IDENT_INT (128)) THEN
                              FAILED ("INCORRECT VALUE IN ARRAY");
                         END IF;
                    END LOOP;
               END;
          WHEN OTHERS =>
               FAILED ("WRONG EXCEPTION RAISED");
     END;

     RESULT;
END CD2B11A;
