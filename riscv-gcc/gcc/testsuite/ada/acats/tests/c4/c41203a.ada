-- C41203A.ADA

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
-- CHECK THAT THE NAME PART OF A SLICE MAY BE:
--   AN IDENTIFIER DENOTING A ONE DIMENSIONAL ARRAY OBJECT - N1;
--   AN IDENTIFIER DENOTING AN ACCESS OBJECT WHOSE VALUE
--        DESIGNATES A ONE DIMENSIONAL ARRAY OBJECT - N2;
--   A FUNCTION CALL DELIVERING A ONE DIMENSIONAL ARRAY OBJECT USING
--        A PREDEFINED FUNCTION - &,
--        A USER-DEFINED FUNCTION - F1;
--   A FUNCTION CALL DELIVERING AN ACCESS VALUE THAT
--        DESIGNATES A ONE DIMENSIONAL ARRAY - F2;
--   A SLICE - N3;
--   AN INDEXED COMPONENT DENOTING A ONE DIMENSIONAL ARRAY OBJECT
--        (ARRAY OF ARRAYS) - N4;
--   AN IDENTIFIER PREFIXED BY THE NAME OF THE INNERMOST UNIT
--        ENCLOSING ITS DECLARATION - C41203A.N1;
--   A RECORD COMPONENT (OF A RECORD CONTAINING ONE OR MORE
--        ARRAYS WHOSE BOUNDS DEPEND ON A DISCRIMINANT) - N5.
-- CHECK THAT THE APPROPRIATE SLICE IS ACCESSED (FOR
--   STATIC INDICES).

-- WKB 8/5/81
-- SPS 11/1/82
-- PWN 11/30/94 SUBTYPE QUALIFIED LITERALS FOR ADA 9X.

WITH REPORT;
USE REPORT;
PROCEDURE C41203A IS		

     TYPE T1 IS ARRAY (INTEGER RANGE <> ) OF INTEGER;
     SUBTYPE A1 IS T1 (1..6);
     N1 : A1 := (1,2,3,4,5,6);

BEGIN
     TEST ("C41203A", "CHECK THAT THE NAME PART OF A SLICE MAY BE " &
                      "OF CERTAIN FORMS AND THAT THE APPROPRIATE " &
                      "SLICE IS ACCESSED (FOR STATIC INDICES)");

     DECLARE

          TYPE T2 IS ARRAY (INTEGER RANGE <> ) OF BOOLEAN;
          SUBTYPE A2 IS T2 (1..6);
          TYPE A3 IS ACCESS A1;
          SUBTYPE SI IS INTEGER RANGE 1 .. 3;
          TYPE A4 IS ARRAY (SI) OF A1;
          TYPE R (LENGTH : INTEGER) IS
               RECORD
                    S : STRING (1..LENGTH);
               END RECORD;

          N2 : A3 := NEW A1' (1,2,3,4,5,6);
          N3 : T1 (1..7) := (1,2,3,4,5,6,7);
          N4 : A4 := (1 => (1,2,3,4,5,6), 2 => (7,8,9,10,11,12),
                      3 => (13,14,15,16,17,18));
          N5 : R(6) := (LENGTH => 6, S => "ABCDEF");

          FUNCTION F1 RETURN A2 IS
          BEGIN
               RETURN (FALSE,FALSE,TRUE,FALSE,TRUE,TRUE);
          END F1;

          FUNCTION F2 RETURN A3 IS
          BEGIN
               RETURN N2;
          END F2;

          PROCEDURE P1 (X : IN T1; Y : IN OUT T1;
                        Z : OUT T1; W : IN STRING) IS
          BEGIN
               IF X /= (1,2) THEN
                    FAILED ("WRONG VALUE FOR IN PARAMETER - " & W);
               END IF;
               IF Y /= (3,4) THEN
                    FAILED ("WRONG VALUE FOR IN OUT PARAMETER - " & W);
               END IF;
               Y := (10,11);
               Z := (12,13);
          END P1;

          PROCEDURE P2 (X : STRING) IS
          BEGIN
               IF X /= "BC" THEN
                    FAILED ("WRONG VALUE FOR IN PARAMETER - '&'");
               END IF;
          END P2;

          PROCEDURE P3 (X : T2) IS
          BEGIN
               IF X /= (FALSE,TRUE,FALSE) THEN
                    FAILED ("WRONG VALUE FOR IN PARAMETER - F1");
               END IF;
          END P3;

          PROCEDURE P5 (X : IN STRING; Y : IN OUT STRING;
                        Z : OUT STRING) IS
          BEGIN 
               IF X /= "EF" THEN
                    FAILED ("WRONG VALUE FOR IN PARAMETER - N5");
               END IF;
               IF Y /= "CD" THEN
                    FAILED ("WRONG VALUE FOR IN OUT PARAMETER - N5");
               END IF;
               Y := "XY";
               Z := "WZ";
          END P5;

     BEGIN

          IF N1(1..2) /= (1,2) THEN
               FAILED ("WRONG VALUE FOR EXPRESSION - N1");
          END IF;
          N1(1..2) := (7,8);
          IF N1 /= (7,8,3,4,5,6) THEN
               FAILED ("WRONG TARGET FOR ASSIGNMENT - N1");
          END IF;
          N1 := (1,2,3,4,5,6);
          P1 (N1(1..2), N1(3..4), N1(5..6), "N1");
          IF N1 /= (1,2,10,11,12,13) THEN
               FAILED ("WRONG TARGET FOR (IN) OUT PARAMETER - N1");
          END IF;

          IF N2(4..6) /= (4,5,6) THEN
               FAILED ("WRONG VALUE FOR EXPRESSION - N2");
          END IF;
          N2(4..6) := (7,8,9);
          IF N2.ALL /= (1,2,3,7,8,9) THEN
               FAILED ("WRONG TARGET FOR ASSIGNMENT - N2");
          END IF;
          N2.ALL := (1,2,5,6,3,4);
          P1 (N2(1..2), N2(5..6), N2(3..4), "N2");
          IF N2.ALL /= (1,2,12,13,10,11) THEN
               FAILED ("WRONG TARGET FOR (IN) OUT PARAMETER - N2");
          END IF;

          IF "&" (STRING'("AB"), STRING'("CDEF"))(4..6) /= STRING'("DEF") THEN
               FAILED ("WRONG VALUE FOR EXPRESSION - '&'");
          END IF;
          P2 ("&" ("AB", "CD")(2..3));

          IF F1(1..2) /= (FALSE,FALSE) THEN
               FAILED ("WRONG VALUE FOR EXPRESSION - F1");
          END IF;
          P3 (F1(2..4));

          N2 := NEW A1' (1,2,3,4,5,6);
          IF F2(2..6) /= (2,3,4,5,6) THEN
               FAILED ("WRONG VALUE FOR EXPRESSION - F2");
          END IF;
          F2(3..3) := (5 => 7);
          IF N2.ALL /= (1,2,7,4,5,6) THEN
               FAILED ("WRONG TARGET FOR ASSIGNMENT - F2");
          END IF;
          N2.ALL := (5,6,1,2,3,4);
          P1 (F2(3..4), F2(5..6), F2(1..2), "F2");
          IF N2.ALL /= (12,13,1,2,10,11) THEN
               FAILED ("WRONG TARGET FOR (IN) OUT PARAMETER - F2");
          END IF;

          IF N3(2..7)(2..4) /= (2,3,4) THEN
               FAILED ("WRONG VALUE FOR EXPRESSION - N3");
          END IF;
          N3(2..7)(4..5) := (8,9);
          IF N3 /= (1,2,3,8,9,6,7) THEN
               FAILED ("WRONG TARGET FOR ASSIGNMENT - N3");
          END IF;
          N3 := (5,3,4,1,2,6,7);
          P1 (N3(2..7)(4..5), N3(2..7)(2..3), N3(2..7)(6..7), "N3");
          IF N3 /= (5,10,11,1,2,12,13) THEN
               FAILED ("WRONG TARGET FOR (IN) OUT PARAMETER - N3");
          END IF;

          IF N4(1)(3..5) /= (3,4,5) THEN
               FAILED ("WRONG VALUE FOR EXPRESSION - N4");
          END IF;
          N4(2)(1..3) := (21,22,23);
          IF N4 /= ((1,2,3,4,5,6),(21,22,23,10,11,12),
                    (13,14,15,16,17,18)) THEN
               FAILED ("WRONG TARGET FOR ASSIGNMENT - N4");
          END IF;
          N4 := (1 => (18,19,20,21,22,23), 2 => (17,16,15,1,2,14),
                 3 => (7,3,4,5,6,8));
          P1 (N4(2)(4..5), N4(3)(2..3), N4(1)(5..6), "N4");
          IF N4 /= ((18,19,20,21,12,13),(17,16,15,1,2,14),
                    (7,10,11,5,6,8)) THEN
               FAILED ("WRONG TARGET FOR (IN) OUT PARAMETER - N4");
          END IF;

          N1 := (1,2,3,4,5,6);
          IF C41203A.N1(1..2) /= (1,2) THEN
               FAILED ("WRONG VALUE FOR EXPRESSION - C41203A.N1");
          END IF;
          C41203A.N1(1..2) := (7,8);
          IF N1 /= (7,8,3,4,5,6) THEN
               FAILED ("WRONG TARGET FOR ASSIGNMENT - C41203A.N1");
          END IF;
          N1 := (1,2,3,4,5,6);
          P1 (C41203A.N1(1..2), C41203A.N1(3..4), C41203A.N1(5..6),
              "C41203A.N1");
          IF N1 /= (1,2,10,11,12,13) THEN
               FAILED ("WRONG TARGET FOR (IN) OUT PARAMETER " &
                       "- C41203A.N1");
          END IF;

          IF N5.S(1..5) /= "ABCDE" THEN
               FAILED ("WRONG VALUE FOR EXPRESSION - N5");
          END IF;
          N5.S(4..6) := "PQR";
          IF N5.S /= "ABCPQR" THEN
               FAILED ("WRONG TARGET FOR ASSIGNMENT - N5");
          END IF;
          N5.S := "ABCDEF";
          P5 (N5.S(5..6), N5.S(3..4), N5.S(1..2));
          IF N5.S /= "WZXYEF" THEN
               FAILED ("WRONG TARGET FOR (IN) OUT PARAMETER - N5");
          END IF;
     END;

     RESULT;
END C41203A;
