-- C35A05N.ADA

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
-- CHECK THAT FOR FIXED POINT TYPES THE FORE AND AFT ATTRIBUTES YIELD
-- THE CORRECT VALUES.

-- CASE N: BASIC TYPES THAT FIT THE CHARACTERISTICS OF DURATION'BASE,
--         FOR GENERICS.

-- WRG 8/15/86

WITH REPORT; USE REPORT;
PROCEDURE C35A05N IS

     -- THE NAME OF EACH TYPE OR SUBTYPE ENDS WITH THAT TYPE'S
     -- 'MANTISSA VALUE.

     TYPE LEFT_OUT_M1       IS DELTA 0.25  RANGE -0.5 .. 0.5;
     TYPE LEFT_EDGE_M1      IS DELTA 0.5   RANGE -1.0 .. 1.0;
     TYPE RIGHT_EDGE_M1     IS DELTA 1.0   RANGE -2.0 .. 2.0;
     TYPE RIGHT_OUT_M1      IS DELTA 2.0   RANGE -4.0 .. 4.0;
     TYPE MIDDLE_M2         IS DELTA 0.5   RANGE -2.0 .. 2.0;
     TYPE MIDDLE_M3         IS DELTA 0.5   RANGE  0.0 .. 2.5;
     TYPE MIDDLE_M15        IS DELTA 2.0 **(-6) RANGE  -512.0 ..  512.0;
     TYPE MIDDLE_M16        IS DELTA 2.0 **(-6) RANGE -1024.0 .. 1024.0;
     TYPE LIKE_DURATION_M23 IS DELTA 0.020 RANGE -86_400.0 .. 86_400.0;
     TYPE DECIMAL_M18       IS DELTA 0.1   RANGE -10_000.0 .. 10_000.0;
     TYPE DECIMAL_M4        IS DELTA 100.0 RANGE   -1000.0 ..   1000.0;
     TYPE DECIMAL_M11       IS DELTA 0.09999 RANGE  -100.0 ..    100.0;
     TYPE DECIMAL2_M18      IS DELTA 0.1   RANGE   -9999.0 ..   9999.0;

     -------------------------------------------------------------------

     SUBTYPE ST_LEFT_EDGE_M6 IS MIDDLE_M15
          DELTA 2.0 ** (-6) RANGE IDENT_INT (1) * (-1.0) .. 1.0;
     SUBTYPE ST_MIDDLE_M14   IS MIDDLE_M16
          DELTA 2.0 ** (-5) RANGE -512.0 .. IDENT_INT (1) * 512.0;
     SUBTYPE ST_MIDDLE_M2    IS LIKE_DURATION_M23
          DELTA 0.5 RANGE -2.0 .. 2.0;
     SUBTYPE ST_MIDDLE_M3    IS LIKE_DURATION_M23
          DELTA 0.5 RANGE  0.0 .. 2.5;
     SUBTYPE ST_DECIMAL_M7   IS DECIMAL_M18
          DELTA  10.0 RANGE -1000.0 .. 1000.0;
     SUBTYPE ST_DECIMAL_M3   IS DECIMAL_M4
          DELTA 100.0 RANGE  -500.0 ..  500.0;

     -------------------------------------------------------------------

     TYPE FORE_AND_AFT IS
          RECORD
               FORE, AFT : INTEGER;
          END RECORD;

     GENERIC
          TYPE T IS DELTA <>;
     FUNCTION ATTRIBUTES RETURN FORE_AND_AFT;

     FUNCTION ATTRIBUTES RETURN FORE_AND_AFT IS
     BEGIN
          RETURN ( IDENT_INT (T'FORE), IDENT_INT (T'AFT) );
     END ATTRIBUTES;

     -------------------------------------------------------------------

     PROCEDURE CHECK_ATTRIBUTES
         (NAME : STRING;
          ACTUAL_ATTRIBUTES, CORRECT_ATTRIBUTES : FORE_AND_AFT) IS
     BEGIN
          IF ACTUAL_ATTRIBUTES.FORE /= CORRECT_ATTRIBUTES.FORE THEN
               FAILED ("GENERIC 'FORE FOR " & NAME & " =" &
                       INTEGER'IMAGE(ACTUAL_ATTRIBUTES.FORE) );
          END IF;
          IF ACTUAL_ATTRIBUTES.AFT  /= CORRECT_ATTRIBUTES.AFT  THEN
               FAILED ("GENERIC 'AFT  FOR " & NAME & " =" &
                       INTEGER'IMAGE(ACTUAL_ATTRIBUTES.AFT ) );
          END IF;
     END CHECK_ATTRIBUTES;

     -------------------------------------------------------------------

     FUNCTION FA_LEFT_OUT_M1       IS NEW ATTRIBUTES(LEFT_OUT_M1      );
     FUNCTION FA_LEFT_EDGE_M1      IS NEW ATTRIBUTES(LEFT_EDGE_M1     );
     FUNCTION FA_RIGHT_EDGE_M1     IS NEW ATTRIBUTES(RIGHT_EDGE_M1    );
     FUNCTION FA_RIGHT_OUT_M1      IS NEW ATTRIBUTES(RIGHT_OUT_M1     );
     FUNCTION FA_MIDDLE_M2         IS NEW ATTRIBUTES(MIDDLE_M2        );
     FUNCTION FA_MIDDLE_M3         IS NEW ATTRIBUTES(MIDDLE_M3        );
     FUNCTION FA_MIDDLE_M15        IS NEW ATTRIBUTES(MIDDLE_M15       );
     FUNCTION FA_MIDDLE_M16        IS NEW ATTRIBUTES(MIDDLE_M16       );
     FUNCTION FA_LIKE_DURATION_M23 IS NEW ATTRIBUTES(LIKE_DURATION_M23);
     FUNCTION FA_DECIMAL_M18       IS NEW ATTRIBUTES(DECIMAL_M18      );
     FUNCTION FA_DECIMAL_M4        IS NEW ATTRIBUTES(DECIMAL_M4       );
     FUNCTION FA_DECIMAL_M11       IS NEW ATTRIBUTES(DECIMAL_M11      );
     FUNCTION FA_DECIMAL2_M18      IS NEW ATTRIBUTES(DECIMAL2_M18     );
     FUNCTION FA_ST_LEFT_EDGE_M6   IS NEW ATTRIBUTES(ST_LEFT_EDGE_M6  );
     FUNCTION FA_ST_MIDDLE_M14     IS NEW ATTRIBUTES(ST_MIDDLE_M14    );
     FUNCTION FA_ST_MIDDLE_M2      IS NEW ATTRIBUTES(ST_MIDDLE_M2     );
     FUNCTION FA_ST_MIDDLE_M3      IS NEW ATTRIBUTES(ST_MIDDLE_M3     );
     FUNCTION FA_ST_DECIMAL_M7     IS NEW ATTRIBUTES(ST_DECIMAL_M7    );
     FUNCTION FA_ST_DECIMAL_M3     IS NEW ATTRIBUTES(ST_DECIMAL_M3    );

BEGIN

     TEST ("C35A05N", "CHECK THAT FOR FIXED POINT TYPES THE FORE AND " &
                      "AFT ATTRIBUTES YIELD THE CORRECT VALUES - " &
                      "BASIC TYPES, GENERICS");

     CHECK_ATTRIBUTES ("LEFT_OUT_M1",     FA_LEFT_OUT_M1,     (2, 1) );
     CHECK_ATTRIBUTES ("LEFT_EDGE_M1",    FA_LEFT_EDGE_M1,    (2, 1) );
     CHECK_ATTRIBUTES ("RIGHT_EDGE_M1",   FA_RIGHT_EDGE_M1,   (2, 1) );
     CHECK_ATTRIBUTES ("RIGHT_OUT_M1",    FA_RIGHT_OUT_M1,    (2, 1) );
     CHECK_ATTRIBUTES ("MIDDLE_M2",       FA_MIDDLE_M2,       (2, 1) );
     CHECK_ATTRIBUTES ("MIDDLE_M3",       FA_MIDDLE_M3,       (2, 1) );
     CHECK_ATTRIBUTES ("MIDDLE_M15",      FA_MIDDLE_M15,      (4, 2) );
     CHECK_ATTRIBUTES ("MIDDLE_M16",      FA_MIDDLE_M16,      (5, 2) );
     CHECK_ATTRIBUTES ("LIKE_DURATION_M23",
                                        FA_LIKE_DURATION_M23, (6, 2) );
     CHECK_ATTRIBUTES ("DECIMAL_M18",     FA_DECIMAL_M18,     (6, 1) );

     IF FA_DECIMAL_M4.FORE /= 5 AND FA_DECIMAL_M4.FORE /= 4 THEN
          FAILED ("GENERIC 'FORE FOR DECIMAL_M4 =" &
                  INTEGER'IMAGE(FA_DECIMAL_M4.FORE) );
     END IF;
     IF FA_DECIMAL_M4.AFT /= 1 THEN
          FAILED ("GENERIC 'AFT  FOR DECIMAL_M4 =" &
                  INTEGER'IMAGE(FA_DECIMAL_M4.AFT) );
     END IF;

     CHECK_ATTRIBUTES ("DECIMAL_M11",     FA_DECIMAL_M11,     (4, 2) );
     CHECK_ATTRIBUTES ("DECIMAL2_M18",    FA_DECIMAL2_M18,    (5, 1) );
     CHECK_ATTRIBUTES ("ST_LEFT_EDGE_M6", FA_ST_LEFT_EDGE_M6, (2, 2) );
     CHECK_ATTRIBUTES ("ST_MIDDLE_M14",   FA_ST_MIDDLE_M14,   (4, 2) );
     CHECK_ATTRIBUTES ("ST_MIDDLE_M2",    FA_ST_MIDDLE_M2,    (2, 1) );
     CHECK_ATTRIBUTES ("ST_MIDDLE_M3",    FA_ST_MIDDLE_M3,    (2, 1) );
     CHECK_ATTRIBUTES ("ST_DECIMAL_M7",   FA_ST_DECIMAL_M7,   (5, 1) );
     CHECK_ATTRIBUTES ("ST_DECIMAL_M3",   FA_ST_DECIMAL_M3,   (4, 1) );

     RESULT;

END C35A05N;
