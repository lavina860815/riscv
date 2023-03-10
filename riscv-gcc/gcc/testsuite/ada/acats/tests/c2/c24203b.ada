-- C24203B.ADA

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
--     CHECK THAT BASED REAL LITERALS WITH BASES 2 THROUGH 16 ALL
--     YIELD CORRECT VALUES.

--     THIS TEST USES MODEL NUMBERS OF DIGITS 6.

-- HISTORY:
--     DHH 06/15/88 CREATED ORIGINAL TEST.
--     DTN 11/30/95 REMOVED CONFORMANCE CHECKS WHERE RULES RELAXED.

WITH REPORT; USE REPORT;
PROCEDURE C24203B IS

     TYPE CHECK IS DIGITS 6;

BEGIN
     TEST("C24203B", "CHECK THAT BASED REAL LITERALS WITH BASES " &
                     "2 THROUGH 16 ALL YIELD CORRECT VALUES");

     IF
      2#0.0000000000000000000000000000000000000000000000000000000000001#
      /= 2.0 ** (-61) THEN
          FAILED ("INCORRECT VALUE FOR BASE 2 REAL LITERAL");
     END IF;

     IF 3#0.00000000001# <
        ((2.0 ** (-18)) + (251558.0 * (2.0 ** (-37)))) OR
        3#0.00000000001# >
        ((2.0 ** (-18)) + (251559.0 * (2.0 ** (-37)))) THEN
          FAILED ("INCORRECT VALUE FOR BASE 3 REAL LITERAL");
     END IF;

     IF 4#13333333.213# /= 32767.609375 THEN
          FAILED ("INCORRECT VALUE FOR BASE 4 REAL LITERAL");
     END IF;

     IF 5#2021444.4241121# < 32749.90625 OR
        5#2021444.4241121# > 32749.921875 THEN
          FAILED ("INCORRECT VALUE FOR BASE 5 REAL LITERAL");
     END IF;

     IF 6#411355.531043# /= 32759.921875 THEN
          FAILED ("INCORRECT VALUE FOR BASE 6 REAL LITERAL");
     END IF;

     IF 7#164366.625344# < 32780.90625 OR
        7#164366.625344# > 32780.9375 THEN
          FAILED ("INCORRECT VALUE FOR BASE 7 REAL LITERAL");
     END IF;

     IF 8#77777.07# /= 32767.109375 THEN
          FAILED ("INCORRECT VALUE FOR BASE 8 REAL LITERAL");
     END IF;

     IF 9#48888.820314# < 32804.90625 OR
        9#48888.820314# > 32804.9375 THEN
          FAILED ("INCORRECT VALUE FOR BASE 9 REAL LITERAL");
     END IF;

     IF 10#32767.921875# /= 32767.921875 THEN
          FAILED ("INCORRECT VALUE FOR BASE 10 REAL LITERAL");
     END IF;

     IF 11#2267A.A06682# < 32757.90625 OR
        11#2267A.A06682# > 32757.921875 THEN
          FAILED ("INCORRECT VALUE FOR BASE 11 REAL LITERAL");
     END IF;

     IF 12#16B5B.B09# /= 32759.921875  THEN
          FAILED ("INCORRECT VALUE FOR BASE 12 REAL LITERAL");
     END IF;

     IF 13#11B9C.BB616# < 32746.90625 OR
        13#11B9C.BB616# > 32746.921875 THEN
          FAILED ("INCORRECT VALUE FOR BASE 13 REAL LITERAL");
     END IF;

     IF 14#BD1D.CC98A7# /= 32759.921875  THEN
          FAILED ("INCORRECT VALUE FOR BASE 14 REAL LITERAL");
     END IF;

     IF 15#3D28188D45881111111111.0# <
                                  (((2.0 ** 21) -2.0) * (2.0 ** 63)) THEN
          FAILED ("INCORRECT VALUE FOR BASE 15 REAL LITERAL");
     END IF;


     RESULT;
END C24203B;
