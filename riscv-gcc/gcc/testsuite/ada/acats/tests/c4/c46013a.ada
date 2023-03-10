-- C46013A.ADA

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
--     CHECK THAT INTEGER CONVERSIONS ARE PERFORMED CORRECTLY WHEN THE
--     OPERAND TYPE IS A FIXED POINT TYPE.

-- HISTORY:
--     JET 02/09/88  CREATED ORIGINAL TEST.

WITH REPORT; USE REPORT;

PROCEDURE C46013A IS

     TYPE FIX1 IS DELTA 2#0.01# RANGE -16#20.0# .. 16#20.0#;
     TYPE FIX2 IS DELTA 2#0.0001# RANGE -16#80.0# .. 16#80.0#;
     TYPE FIX3 IS DELTA 2#0.000001# RANGE -16#200.0# .. 16#200.0#;
     TYPE FIX4 IS NEW FIX1;

     F1 : FIX1 := 7.75;
     F2 : FIX2 := -111.25;
     F3 : FIX3 := 0.875;
     F4 : FIX4 := -15.25;

     TYPE INT IS RANGE -512 .. 512;

     FUNCTION IDENT (I : INT) RETURN INT IS
     BEGIN
          RETURN I * INT(IDENT_INT(1));
     END IDENT;

BEGIN
     TEST ("C46013A", "CHECK THAT INTEGER CONVERSIONS ARE PERFORMED " &
                      "CORRECTLY WHEN THE OPERAND TYPE IS A FIXED " &
                      "POINT TYPE");

     IF INTEGER(FIX1'(-7.25)) /= IDENT_INT(-7) THEN
          FAILED ("INCORRECT VALUE (1)");
     END IF;

     IF INTEGER(FIX1'(6.75)) /= IDENT_INT(7) THEN
          FAILED ("INCORRECT VALUE (2)");
     END IF;

     IF INTEGER(F1) /= IDENT_INT(8) THEN
          FAILED ("INCORRECT VALUE (3)");
     END IF;

     IF INT(FIX1'(-7.25)) /= IDENT(-7) THEN
          FAILED ("INCORRECT VALUE (4)");
     END IF;

     IF INTEGER(FIX1'(3.33)) /= IDENT_INT(3) AND
        INTEGER(FIX1'(3.33)) /= IDENT_INT(4) THEN
          FAILED ("INCORRECT VALUE (5)");
     END IF;

     IF INTEGER(FIX1'(-2.5)) = IDENT_INT(-2) AND
        INTEGER(FIX1'(-1.5)) = IDENT_INT(-1) AND
        INTEGER(FIX1'(1.5)) = IDENT_INT(2) AND
        INTEGER(FIX1'(2.5)) = IDENT_INT(3) THEN
          COMMENT ("FIX1 HALF VALUES ROUND UP");
     ELSIF INTEGER(FIX1'(-2.5)) = IDENT_INT(-3) AND
           INTEGER(FIX1'(-1.5)) = IDENT_INT(-2) AND
           INTEGER(FIX1'(1.5)) = IDENT_INT(1) AND
           INTEGER(FIX1'(2.5)) = IDENT_INT(2) THEN
          COMMENT ("FIX1 HALF VALUES ROUND DOWN");
     ELSIF INTEGER(FIX1'(-2.5)) = IDENT_INT(-2) AND
           INTEGER(FIX1'(-1.5)) = IDENT_INT(-2) AND
           INTEGER(FIX1'(1.5)) = IDENT_INT(2) AND
           INTEGER(FIX1'(2.5)) = IDENT_INT(2) THEN
          COMMENT ("FIX1 HALF VALUES ROUND TO EVEN");
     ELSIF INTEGER(FIX1'(-2.5)) = IDENT_INT(-2) AND
           INTEGER(FIX1'(-1.5)) = IDENT_INT(-1) AND
           INTEGER(FIX1'(1.5)) = IDENT_INT(1) AND
           INTEGER(FIX1'(2.5)) = IDENT_INT(2) THEN
          COMMENT ("FIX1 HALF VALUES ROUND TOWARD ZERO");
     ELSIF INTEGER(FIX1'(-2.5)) = IDENT_INT(-3) AND
           INTEGER(FIX1'(-1.5)) = IDENT_INT(-2) AND
           INTEGER(FIX1'(1.5)) = IDENT_INT(2) AND
           INTEGER(FIX1'(2.5)) = IDENT_INT(3) THEN
          COMMENT ("FIX1 HALF VALUES ROUND AWAY FROM ZERO");
     ELSE
          COMMENT ("FIX1 HALF VALUES ROUND ERRATICALLY");
     END IF;

     IF INTEGER(FIX2'(-127.9375)) /= IDENT_INT(-128) THEN
          FAILED ("INCORRECT VALUE (6)");
     END IF;

     IF INTEGER(FIX2'(127.0625)) /= IDENT_INT(127) THEN
          FAILED ("INCORRECT VALUE (7)");
     END IF;

     IF INTEGER(F2) /= IDENT_INT(-111) THEN
          FAILED ("INCORRECT VALUE (8)");
     END IF;

     IF INT(FIX2'(-0.25)) /= IDENT(0) THEN
          FAILED ("INCORRECT VALUE (9)");
     END IF;

     IF INTEGER(FIX2'(66.67)) /= IDENT_INT(67) AND
        INTEGER(FIX2'(66.67)) /= IDENT_INT(66) THEN
          FAILED ("INCORRECT VALUE (10)");
     END IF;

     IF INTEGER(FIX2'(-2.5)) = IDENT_INT(-2) AND
        INTEGER(FIX2'(-1.5)) = IDENT_INT(-1) AND
        INTEGER(FIX2'(1.5)) = IDENT_INT(2) AND
        INTEGER(FIX2'(2.5)) = IDENT_INT(3) THEN
          COMMENT ("FIX2 HALF VALUES ROUND UP");
     ELSIF INTEGER(FIX2'(-2.5)) = IDENT_INT(-3) AND
           INTEGER(FIX2'(-1.5)) = IDENT_INT(-2) AND
           INTEGER(FIX2'(1.5)) = IDENT_INT(1) AND
           INTEGER(FIX2'(2.5)) = IDENT_INT(2) THEN
          COMMENT ("FIX2 HALF VALUES ROUND DOWN");
     ELSIF INTEGER(FIX2'(-2.5)) = IDENT_INT(-2) AND
           INTEGER(FIX2'(-1.5)) = IDENT_INT(-2) AND
           INTEGER(FIX2'(1.5)) = IDENT_INT(2) AND
           INTEGER(FIX2'(2.5)) = IDENT_INT(2) THEN
          COMMENT ("FIX2 HALF VALUES ROUND TO EVEN");
     ELSIF INTEGER(FIX2'(-2.5)) = IDENT_INT(-2) AND
           INTEGER(FIX2'(-1.5)) = IDENT_INT(-1) AND
           INTEGER(FIX2'(1.5)) = IDENT_INT(1) AND
           INTEGER(FIX2'(2.5)) = IDENT_INT(2) THEN
          COMMENT ("FIX2 HALF VALUES ROUND TOWARD ZERO");
     ELSIF INTEGER(FIX2'(-2.5)) = IDENT_INT(-3) AND
           INTEGER(FIX2'(-1.5)) = IDENT_INT(-2) AND
           INTEGER(FIX2'(1.5)) = IDENT_INT(2) AND
           INTEGER(FIX2'(2.5)) = IDENT_INT(3) THEN
          COMMENT ("FIX2 HALF VALUES ROUND AWAY FROM ZERO");
     ELSE
          COMMENT ("FIX2 HALF VALUES ROUND ERRATICALLY");
     END IF;

     IF INTEGER(FIX3'(-0.25)) /= IDENT_INT(0) THEN
          FAILED ("INCORRECT VALUE (11)");
     END IF;

     IF INTEGER(FIX3'(511.75)) /= IDENT_INT(512) THEN
          FAILED ("INCORRECT VALUE (12)");
     END IF;

     IF INTEGER(F3) /= IDENT_INT(1) THEN
          FAILED ("INCORRECT VALUE (13)");
     END IF;

     IF INT(FIX3'(-7.0)) /= IDENT(-7) THEN
          FAILED ("INCORRECT VALUE (14)");
     END IF;

     IF INTEGER(FIX3'(-66.67)) /= IDENT_INT(-67) AND
        INTEGER(FIX3'(-66.67)) /= IDENT_INT(-66) THEN
          FAILED ("INCORRECT VALUE (15)");
     END IF;

     IF INTEGER(FIX3'(-2.5)) = IDENT_INT(-2) AND
        INTEGER(FIX3'(-1.5)) = IDENT_INT(-1) AND
        INTEGER(FIX3'(1.5)) = IDENT_INT(2) AND
        INTEGER(FIX3'(2.5)) = IDENT_INT(3) THEN
          COMMENT ("FIX3 HALF VALUES ROUND UP");
     ELSIF INTEGER(FIX3'(-2.5)) = IDENT_INT(-3) AND
           INTEGER(FIX3'(-1.5)) = IDENT_INT(-2) AND
           INTEGER(FIX3'(1.5)) = IDENT_INT(1) AND
           INTEGER(FIX3'(2.5)) = IDENT_INT(2) THEN
          COMMENT ("FIX3 HALF VALUES ROUND DOWN");
     ELSIF INTEGER(FIX3'(-2.5)) = IDENT_INT(-2) AND
           INTEGER(FIX3'(-1.5)) = IDENT_INT(-2) AND
           INTEGER(FIX3'(1.5)) = IDENT_INT(2) AND
           INTEGER(FIX3'(2.5)) = IDENT_INT(2) THEN
          COMMENT ("FIX3 HALF VALUES ROUND TO EVEN");
     ELSIF INTEGER(FIX3'(-2.5)) = IDENT_INT(-2) AND
           INTEGER(FIX3'(-1.5)) = IDENT_INT(-1) AND
           INTEGER(FIX3'(1.5)) = IDENT_INT(1) AND
           INTEGER(FIX3'(2.5)) = IDENT_INT(2) THEN
          COMMENT ("FIX3 HALF VALUES ROUND TOWARD ZERO");
     ELSIF INTEGER(FIX3'(-2.5)) = IDENT_INT(-3) AND
           INTEGER(FIX3'(-1.5)) = IDENT_INT(-2) AND
           INTEGER(FIX3'(1.5)) = IDENT_INT(2) AND
           INTEGER(FIX3'(2.5)) = IDENT_INT(3) THEN
          COMMENT ("FIX3 HALF VALUES ROUND AWAY FROM ZERO");
     ELSE
          COMMENT ("FIX3 HALF VALUES ROUND ERRATICALLY");
     END IF;

     IF INTEGER(FIX4'(-7.25)) /= IDENT_INT(-7) THEN
          FAILED ("INCORRECT VALUE (16)");
     END IF;

     IF INTEGER(FIX4'(6.75)) /= IDENT_INT(7) THEN
          FAILED ("INCORRECT VALUE (17)");
     END IF;

     IF INTEGER(F4) /= IDENT_INT(-15) THEN
          FAILED ("INCORRECT VALUE (18)");
     END IF;

     IF INT(FIX4'(-31.75)) /= IDENT(-32) THEN
          FAILED ("INCORRECT VALUE (19)");
     END IF;

     IF INTEGER(FIX4'(3.33)) /= IDENT_INT(3) AND
        INTEGER(FIX4'(3.33)) /= IDENT_INT(4) THEN
          FAILED ("INCORRECT VALUE (20)");
     END IF;

     IF INTEGER(FIX4'(-2.5)) = IDENT_INT(-2) AND
        INTEGER(FIX4'(-1.5)) = IDENT_INT(-1) AND
        INTEGER(FIX4'(1.5)) = IDENT_INT(2) AND
        INTEGER(FIX4'(2.5)) = IDENT_INT(3) THEN
          COMMENT ("FIX4 HALF VALUES ROUND UP");
     ELSIF INTEGER(FIX4'(-2.5)) = IDENT_INT(-3) AND
           INTEGER(FIX4'(-1.5)) = IDENT_INT(-2) AND
           INTEGER(FIX4'(1.5)) = IDENT_INT(1) AND
           INTEGER(FIX4'(2.5)) = IDENT_INT(2) THEN
          COMMENT ("FIX4 HALF VALUES ROUND DOWN");
     ELSIF INTEGER(FIX4'(-2.5)) = IDENT_INT(-2) AND
           INTEGER(FIX4'(-1.5)) = IDENT_INT(-2) AND
           INTEGER(FIX4'(1.5)) = IDENT_INT(2) AND
           INTEGER(FIX4'(2.5)) = IDENT_INT(2) THEN
          COMMENT ("FIX4 HALF VALUES ROUND TO EVEN");
     ELSIF INTEGER(FIX4'(-2.5)) = IDENT_INT(-2) AND
           INTEGER(FIX4'(-1.5)) = IDENT_INT(-1) AND
           INTEGER(FIX4'(1.5)) = IDENT_INT(1) AND
           INTEGER(FIX4'(2.5)) = IDENT_INT(2) THEN
          COMMENT ("FIX4 HALF VALUES ROUND TOWARD ZERO");
     ELSIF INTEGER(FIX4'(-2.5)) = IDENT_INT(-3) AND
           INTEGER(FIX4'(-1.5)) = IDENT_INT(-2) AND
           INTEGER(FIX4'(1.5)) = IDENT_INT(2) AND
           INTEGER(FIX4'(2.5)) = IDENT_INT(3) THEN
          COMMENT ("FIX4 HALF VALUES ROUND AWAY FROM ZERO");
     ELSE
          COMMENT ("FIX4 HALF VALUES ROUND ERRATICALLY");
     END IF;

     RESULT;

END C46013A;
