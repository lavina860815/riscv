-- CC1111A.ADA

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
--     CHECK THAT AFTER A GENERIC UNIT IS INSTANTIATED, THE SUBTYPE OF
--     AN IN OUT OBJECT PARAMETER IS DETERMINED BY THE ACTUAL PARAMETER
--     (TESTS INTEGER, ENUMERATION, FLOATING POINT, FIXED POINT, ARRAY,
--     ACCESS, AND DISCRIMINATED TYPES).

-- HISTORY:
--     BCB 03/28/88  CREATED ORIGINAL TEST.
--     PWN 01/31/95  REMOVED INCONSISTENCIES WITH ADA 9X.

WITH REPORT; USE REPORT;

PROCEDURE CC1111A IS

     SUBTYPE INT IS INTEGER RANGE 0..5;
     INTVAR : INTEGER RANGE 1..3;

     TYPE ENUM IS (ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT);
     SUBTYPE SUBENUM IS ENUM RANGE ONE .. FIVE;
     ENUMVAR : ENUM RANGE TWO .. THREE;

     TYPE FLT IS DIGITS 5 RANGE -5.0 .. 5.0;
     SUBTYPE SUBFLT IS FLT RANGE -1.0 .. 1.0;
     FLTVAR : FLT RANGE 0.0 .. 1.0;

     TYPE FIX IS DELTA 0.5 RANGE -5.0 .. 5.0;
     SUBTYPE SUBFIX IS FIX RANGE -1.0 .. 1.0;
     FIXVAR : FIX RANGE 0.0 .. 1.0;

     SUBTYPE STR IS STRING (1..10);
     STRVAR : STRING (1..5);

     TYPE REC (DISC : INTEGER := 5) IS RECORD
          NULL;
     END RECORD;
     SUBTYPE SUBREC IS REC (6);
     RECVAR : REC(5);
     SUBRECVAR : SUBREC;

     TYPE ACCREC IS ACCESS REC;
     SUBTYPE A1 IS ACCREC(1);
     SUBTYPE A2 IS ACCREC(2);
     A1VAR : A1 := NEW REC(1);
     A2VAR : A2 := NEW REC(2);

     PACKAGE P IS
          TYPE PRIV IS PRIVATE;
     PRIVATE
          TYPE PRIV IS RANGE 1 .. 100;
          SUBTYPE SUBPRIV IS PRIV RANGE 5 .. 10;
          PRIVVAR : PRIV RANGE 8 .. 10;
     END P;

     PACKAGE BODY P IS
          FUNCTION PRIVEQUAL (ONE, TWO : SUBPRIV) RETURN BOOLEAN;

          FUNCTION PRIVEQUAL (ONE, TWO : SUBPRIV) RETURN BOOLEAN IS
          BEGIN
               RETURN ONE = TWO;
          END PRIVEQUAL;

          GENERIC
               INPUT : SUBPRIV;
               OUTPUT : IN OUT SUBPRIV;
          PROCEDURE I;

          PROCEDURE I IS
          BEGIN
               OUTPUT := INPUT;
               FAILED ("SUBTYPE NOT DETERMINED BY ACTUAL PARAMETER - " &
                       "PRIVATE TYPE");
               IF PRIVEQUAL (OUTPUT, OUTPUT) THEN
                    COMMENT ("DON'T OPTIMIZE OUTPUT");
               END IF;
          EXCEPTION
               WHEN CONSTRAINT_ERROR =>
                    NULL;
               WHEN OTHERS =>
                    FAILED ("WRONG EXCEPTION RAISED");
          END I;

          PROCEDURE I1 IS NEW I (5, PRIVVAR);
          PROCEDURE I2 IS NEW I (SUBPRIV'FIRST, PRIVVAR);

     BEGIN
          TEST ("CC1111A", "CHECK THAT AFTER A GENERIC UNIT IS " &
                           "INSTANTIATED, THE SUBTYPE OF AN IN OUT " &
                           "OBJECT PARAMETER IS DETERMINED BY THE " &
                           "ACTUAL PARAMETER (TESTS INTEGER, " &
                           "ENUMERATION, FLOATING POINT, FIXED POINT " &
                           ", ARRAY, ACCESS, AND DISCRIMINATED TYPES)");

          I1;
          I2;
     END P;

     USE P;

     GENERIC
          TYPE GP IS PRIVATE;
     FUNCTION GEN_IDENT (X : GP) RETURN GP;

     GENERIC
          INPUT : INT;
          OUTPUT : IN OUT INT;
     PROCEDURE B;

     GENERIC
          INPUT : SUBENUM;
          OUTPUT : IN OUT SUBENUM;
     PROCEDURE C;

     GENERIC
          INPUT : SUBFLT;
          OUTPUT : IN OUT SUBFLT;
     PROCEDURE D;

     GENERIC
          INPUT : SUBFIX;
          OUTPUT : IN OUT SUBFIX;
     PROCEDURE E;

     GENERIC
          INPUT : STR;
          OUTPUT : IN OUT STR;
     PROCEDURE F;

     GENERIC
          INPUT : A1;
          OUTPUT : IN OUT A1;
     PROCEDURE G;

     GENERIC
          INPUT : SUBREC;
          OUTPUT : IN OUT SUBREC;
     PROCEDURE H;

     GENERIC
          TYPE GP IS PRIVATE;
     FUNCTION GENEQUAL (ONE, TWO : GP) RETURN BOOLEAN;

     FUNCTION GENEQUAL (ONE, TWO : GP) RETURN BOOLEAN IS
     BEGIN
          RETURN ONE = TWO;
     END GENEQUAL;

     FUNCTION GEN_IDENT (X : GP) RETURN GP IS
     BEGIN
               RETURN X;
     END GEN_IDENT;

     FUNCTION INT_IDENT IS NEW GEN_IDENT (INT);
     FUNCTION SUBENUM_IDENT IS NEW GEN_IDENT (SUBENUM);
     FUNCTION SUBFLT_IDENT IS NEW GEN_IDENT (SUBFLT);
     FUNCTION SUBFIX_IDENT IS NEW GEN_IDENT (SUBFIX);

     FUNCTION ENUMEQUAL IS NEW GENEQUAL (SUBENUM);
     FUNCTION FLTEQUAL IS NEW GENEQUAL (SUBFLT);
     FUNCTION FIXEQUAL IS NEW GENEQUAL (SUBFIX);
     FUNCTION STREQUAL IS NEW GENEQUAL (STR);
     FUNCTION ACCEQUAL IS NEW GENEQUAL (A2);
     FUNCTION RECEQUAL IS NEW GENEQUAL (REC);

     PROCEDURE B IS
     BEGIN
          OUTPUT := INPUT;
          FAILED ("SUBTYPE NOT DETERMINED BY ACTUAL PARAMETER - " &
                  "INTEGER TYPE");
          IF EQUAL (OUTPUT, OUTPUT) THEN
               COMMENT ("DON'T OPTIMIZE OUTPUT");
          END IF;
     EXCEPTION
          WHEN CONSTRAINT_ERROR =>
               NULL;
          WHEN OTHERS =>
               FAILED ("WRONG EXCEPTION RAISED");
     END B;

     PROCEDURE C IS
     BEGIN
          OUTPUT := INPUT;
          FAILED ("SUBTYPE NOT DETERMINED BY ACTUAL PARAMETER - " &
                  "ENUMERATION TYPE");
          IF ENUMEQUAL (OUTPUT, OUTPUT) THEN
               COMMENT ("DON'T OPTIMIZE OUTPUT");
          END IF;
     EXCEPTION
          WHEN CONSTRAINT_ERROR =>
               NULL;
          WHEN OTHERS =>
               FAILED ("WRONG EXCEPTION RAISED");
     END C;

     PROCEDURE D IS
     BEGIN
          OUTPUT := INPUT;
          FAILED ("SUBTYPE NOT DETERMINED BY ACTUAL PARAMETER - " &
                  "FLOATING POINT TYPE");
          IF FLTEQUAL (OUTPUT, OUTPUT) THEN
               COMMENT ("DON'T OPTIMIZE OUTPUT");
          END IF;
     EXCEPTION
          WHEN CONSTRAINT_ERROR =>
               NULL;
          WHEN OTHERS =>
               FAILED ("WRONG EXCEPTION RAISED");
     END D;

     PROCEDURE E IS
     BEGIN
          OUTPUT := INPUT;
          FAILED ("SUBTYPE NOT DETERMINED BY ACTUAL PARAMETER - " &
                  "FIXED POINT TYPE");
          IF FIXEQUAL (OUTPUT, OUTPUT) THEN
               COMMENT ("DON'T OPTIMIZE OUTPUT");
          END IF;
     EXCEPTION
          WHEN CONSTRAINT_ERROR =>
               NULL;
          WHEN OTHERS =>
               FAILED ("WRONG EXCEPTION RAISED");
     END E;

     PROCEDURE F IS
     BEGIN
          OUTPUT := INPUT;
          FAILED ("SUBTYPE NOT DETERMINED BY ACTUAL PARAMETER - " &
                  "ARRAY TYPE");
          IF STREQUAL (OUTPUT, OUTPUT) THEN
               COMMENT ("DON'T OPTIMIZE OUTPUT");
          END IF;
     EXCEPTION
          WHEN CONSTRAINT_ERROR =>
               NULL;
          WHEN OTHERS =>
               FAILED ("WRONG EXCEPTION RAISED");
     END F;

     PROCEDURE G IS
     BEGIN
          OUTPUT := INPUT;
          FAILED ("SUBTYPE NOT DETERMINED BY ACTUAL PARAMETER - " &
                  "ACCESS TYPE");
          IF ACCEQUAL (OUTPUT, OUTPUT) THEN
               COMMENT ("DON'T OPTIMIZE OUTPUT");
          END IF;
     EXCEPTION
          WHEN CONSTRAINT_ERROR =>
               NULL;
          WHEN OTHERS =>
               FAILED ("WRONG EXCEPTION RAISED");
     END G;

     PROCEDURE H IS
     BEGIN
          OUTPUT := INPUT;
          FAILED ("SUBTYPE NOT DETERMINED BY ACTUAL PARAMETER - " &
                  "DISCRIMINATED RECORD TYPE");
          IF RECEQUAL (OUTPUT, OUTPUT) THEN
               COMMENT ("DON'T OPTIMIZE OUTPUT");
          END IF;
     EXCEPTION
          WHEN CONSTRAINT_ERROR =>
               NULL;
          WHEN OTHERS =>
               FAILED ("WRONG EXCEPTION RAISED");
     END H;

     PROCEDURE B1 IS NEW B (4, INTVAR);
     PROCEDURE C1 IS NEW C (FOUR, ENUMVAR);
     PROCEDURE D1 IS NEW D (-1.0, FLTVAR);
     PROCEDURE E1 IS NEW E (-1.0, FIXVAR);
     PROCEDURE F1 IS NEW F ("9876543210", STRVAR);
     PROCEDURE G1 IS NEW G (A1VAR, A2VAR);
     PROCEDURE H1 IS NEW H (SUBRECVAR, RECVAR);

     PROCEDURE B2 IS NEW B (INT_IDENT(INT'FIRST), INTVAR);
     PROCEDURE C2 IS NEW C (SUBENUM_IDENT(SUBENUM'FIRST), ENUMVAR);
     PROCEDURE D2 IS NEW D (SUBFLT_IDENT(SUBFLT'FIRST), FLTVAR);
     PROCEDURE E2 IS NEW E (SUBFIX_IDENT(SUBFIX'FIRST), FIXVAR);

BEGIN

     B1;
     C1;
     D1;
     E1;
     F1;
     G1;
     H1;

     B2;
     C2;
     D2;
     E2;

     RESULT;
END CC1111A;
