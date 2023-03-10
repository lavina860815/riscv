-- C74302B.ADA

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
--     CHECK THAT WHEN THE FULL DECLARATION OF A DEFERRED CONSTANT IS
--     GIVEN AS A MULTIPLE DECLARATION, THE INITIALIZATION EXPRESSION
--     IS EVALUATED ONCE FOR EACH DEFERRED CONSTANT.  (USE ENUMERATION,
--     INTEGER, FIXED POINT, FLOATING POINT, ARRAY, RECORD (INCLUDING
--     USE OF DEFAULT EXPRESSIONS FOR COMPONENTS), ACCESS, AND PRIVATE
--     TYPES AS FULL DECLARATION OF PRIVATE TYPE)

-- HISTORY:
--     BCB 07/25/88  CREATED ORIGINAL TEST.

WITH REPORT; USE REPORT;

PROCEDURE C74302B IS

     TYPE ARR_RAN IS RANGE 1..2;

     BUMP : INTEGER := IDENT_INT(0);

     GENERIC
          TYPE DT IS (<>);
     FUNCTION F1 RETURN DT;

     GENERIC
          TYPE FE IS DELTA <>;
     FUNCTION F2 RETURN FE;

     GENERIC
          TYPE FLE IS DIGITS <>;
     FUNCTION F3 RETURN FLE;

     GENERIC
          TYPE CA IS ARRAY(ARR_RAN) OF INTEGER;
     FUNCTION F4 RETURN CA;

     GENERIC
          TYPE GP IS LIMITED PRIVATE;
     FUNCTION F5 (V : GP) RETURN GP;

     GENERIC
          TYPE GP1 IS LIMITED PRIVATE;
     FUNCTION F6 (V1 : GP1) RETURN GP1;

     GENERIC
          TYPE AC IS ACCESS INTEGER;
     FUNCTION F7 RETURN AC;

     GENERIC
          TYPE PP IS PRIVATE;
     FUNCTION F8 (P1 : PP) RETURN PP;

     FUNCTION F1 RETURN DT IS
     BEGIN
          BUMP := BUMP + 1;
          RETURN DT'VAL(BUMP);
     END F1;

     FUNCTION F2 RETURN FE IS
     BEGIN
          BUMP := BUMP + 1;
          RETURN FE(BUMP);
     END F2;

     FUNCTION F3 RETURN FLE IS
     BEGIN
          BUMP := BUMP + 1;
          RETURN FLE(BUMP);
     END F3;

     FUNCTION F4 RETURN CA IS
     BEGIN
          BUMP := BUMP + 1;
          RETURN ((BUMP,BUMP-1));
     END F4;

     FUNCTION F5 (V : GP) RETURN GP IS
     BEGIN
          BUMP := BUMP + 1;
          RETURN V;
     END F5;

     FUNCTION F6 (V1 : GP1) RETURN GP1 IS
     BEGIN
          BUMP := BUMP + 1;
          RETURN V1;
     END F6;

     FUNCTION F7 RETURN AC IS
          VAR : AC;
     BEGIN
          BUMP := BUMP + 1;
          VAR := NEW INTEGER'(BUMP);
          RETURN VAR;
     END F7;

     FUNCTION F8 (P1 : PP) RETURN PP IS
     BEGIN
          BUMP := BUMP + 1;
          RETURN P1;
     END F8;

     PACKAGE PACK IS
          TYPE SP IS PRIVATE;
          CONS : CONSTANT SP;
     PRIVATE
          TYPE SP IS RANGE 1 .. 100;
          CONS : CONSTANT SP := 50;
     END PACK;

     USE PACK;

     PACKAGE P IS
          TYPE INT IS PRIVATE;
          TYPE ENUM IS PRIVATE;
          TYPE FIX IS PRIVATE;
          TYPE FLT IS PRIVATE;
          TYPE CON_ARR IS PRIVATE;
          TYPE REC IS PRIVATE;
          TYPE REC1 IS PRIVATE;
          TYPE ACC IS PRIVATE;
          TYPE PRIV IS PRIVATE;

          GENERIC
               TYPE LP IS PRIVATE;
          FUNCTION GEN_EQUAL (Z1, Z2 : LP) RETURN BOOLEAN;

          I1, I2, I3, I4 : CONSTANT INT;
          E1, E2, E3, E4 : CONSTANT ENUM;
          FI1, FI2, FI3, FI4 : CONSTANT FIX;
          FL1, FL2, FL3, FL4 : CONSTANT FLT;
          CA1, CA2, CA3, CA4 : CONSTANT CON_ARR;
          R1, R2, R3, R4 : CONSTANT REC;
          R1A, R2A, R3A, R4A : CONSTANT REC1;
          A1, A2, A3, A4 : CONSTANT ACC;
          PR1, PR2, PR3, PR4 : CONSTANT PRIV;
     PRIVATE
          TYPE INT IS RANGE 1 .. 100;

          TYPE ENUM IS (ONE,TWO,THREE,FOUR,FIVE,SIX,SEVEN,EIGHT,NINE);

          TYPE FIX IS DELTA 2.0**(-1) RANGE -100.0 .. 100.0;

          TYPE FLT IS DIGITS 5 RANGE -100.0 .. 100.0;

          TYPE CON_ARR IS ARRAY(ARR_RAN) OF INTEGER;

          TYPE REC IS RECORD
               COMP1 : INTEGER;
               COMP2 : INTEGER;
               COMP3 : BOOLEAN;
          END RECORD;

          TYPE REC1 IS RECORD
               COMP1 : INTEGER := 10;
               COMP2 : INTEGER := 20;
               COMP3 : BOOLEAN := FALSE;
          END RECORD;

          TYPE ACC IS ACCESS INTEGER;

          TYPE PRIV IS NEW SP;

          FUNCTION DDT IS NEW F1 (INT);
          FUNCTION EDT IS NEW F1 (ENUM);
          FUNCTION FDT IS NEW F2 (FIX);
          FUNCTION FLDT IS NEW F3 (FLT);
          FUNCTION CADT IS NEW F4 (CON_ARR);
          FUNCTION RDT IS NEW F5 (REC);
          FUNCTION R1DT IS NEW F6 (REC1);
          FUNCTION ADT IS NEW F7 (ACC);
          FUNCTION PDT IS NEW F8 (PRIV);

          REC_OBJ : REC := (1,2,TRUE);
          REC1_OBJ : REC1 := (3,4,FALSE);

          I1, I2, I3, I4 : CONSTANT INT := DDT;
          E1, E2, E3, E4 : CONSTANT ENUM := EDT;
          FI1, FI2, FI3, FI4 : CONSTANT FIX := FDT;
          FL1, FL2, FL3, FL4 : CONSTANT FLT := FLDT;
          CA1, CA2, CA3, CA4 : CONSTANT CON_ARR := CADT;
          R1, R2, R3, R4 : CONSTANT REC := RDT(REC_OBJ);
          R1A, R2A, R3A, R4A : CONSTANT REC1 := R1DT(REC1_OBJ);
          A1, A2, A3, A4 : CONSTANT ACC := ADT;
          PR1, PR2, PR3, PR4 : CONSTANT PRIV := PDT(PRIV(CONS));
     END P;

     PACKAGE BODY P IS
          AVAR1 : ACC := NEW INTEGER'(29);
          AVAR2 : ACC := NEW INTEGER'(30);
          AVAR3 : ACC := NEW INTEGER'(31);
          AVAR4 : ACC := NEW INTEGER'(32);

          FUNCTION GEN_EQUAL (Z1, Z2 : LP) RETURN BOOLEAN IS
          BEGIN
               RETURN Z1 = Z2;
          END GEN_EQUAL;

          FUNCTION INT_EQUAL IS NEW GEN_EQUAL (INT);
          FUNCTION ENUM_EQUAL IS NEW GEN_EQUAL (ENUM);
          FUNCTION FIX_EQUAL IS NEW GEN_EQUAL (FIX);
          FUNCTION FLT_EQUAL IS NEW GEN_EQUAL (FLT);
          FUNCTION ARR_EQUAL IS NEW GEN_EQUAL (CON_ARR);
          FUNCTION REC_EQUAL IS NEW GEN_EQUAL (REC);
          FUNCTION REC1_EQUAL IS NEW GEN_EQUAL (REC1);
          FUNCTION ACC_EQUAL IS NEW GEN_EQUAL (INTEGER);
          FUNCTION PRIV_EQUAL IS NEW GEN_EQUAL (PRIV);
     BEGIN
          TEST ("C74302B", "CHECK THAT WHEN THE FULL DECLARATION OF " &
                           "A DEFERRED CONSTANT IS GIVEN AS A " &
                           "MULTIPLE DECLARATION, THE INITIALIZATION " &
                           "EXPRESSION IS EVALUATED ONCE FOR EACH " &
                           "DEFERRED CONSTANT");

          IF NOT EQUAL(BUMP,36) THEN
               FAILED ("IMPROPER RESULTS FROM INITIALIZATION OF " &
                       "DEFERRED CONSTANTS IN A MULIPLE DECLARATION");
          END IF;

          IF NOT INT_EQUAL(I1,1) OR NOT INT_EQUAL(I2,2) OR
             NOT INT_EQUAL(I3,3) OR NOT INT_EQUAL(I4,4) THEN
               FAILED ("IMPROPER RESULTS FROM INITIALIZATION OF " &
                       "DEFERRED INTEGER CONSTANTS");
          END IF;

          IF NOT ENUM_EQUAL(E1,SIX) OR NOT ENUM_EQUAL(E2,SEVEN) OR
             NOT ENUM_EQUAL(E3,EIGHT) OR NOT ENUM_EQUAL(E4,NINE) THEN
               FAILED ("IMPROPER RESULTS FROM INITIALIZATION OF " &
                       "DEFERRED ENUMERATION CONSTANTS");
          END IF;

          IF NOT FIX_EQUAL(FI1,9.0) OR NOT FIX_EQUAL(FI2,10.0) OR
             NOT FIX_EQUAL(FI3,11.0) OR NOT FIX_EQUAL(FI4,12.0) THEN
               FAILED ("IMPROPER RESULTS FROM INITIALIZATION OF " &
                       "DEFERRED FIXED POINT CONSTANTS");
          END IF;

          IF NOT FLT_EQUAL(FL1,13.0) OR NOT FLT_EQUAL(FL2,14.0) OR
             NOT FLT_EQUAL(FL3,15.0) OR NOT FLT_EQUAL(FL4,16.0) THEN
               FAILED ("IMPROPER RESULTS FROM INITIALIZATION OF " &
                       "DEFERRED FLOATING POINT CONSTANTS");
          END IF;

          IF NOT ARR_EQUAL(CA1,(17,16)) OR NOT ARR_EQUAL(CA2,(18,17))
           OR NOT ARR_EQUAL(CA3,(19,18)) OR NOT ARR_EQUAL(CA4,(20,19))
               THEN FAILED ("IMPROPER RESULTS FROM INITIALIZATION OF " &
                            "DEFERRED ARRAY CONSTANTS");
          END IF;

          IF NOT REC_EQUAL(R1,REC_OBJ) OR NOT REC_EQUAL(R2,REC_OBJ)
             OR NOT REC_EQUAL(R3,REC_OBJ) OR NOT REC_EQUAL(R4,REC_OBJ)
               THEN FAILED ("IMPROPER RESULTS FROM INITIALIZATION OF " &
                            "DEFERRED RECORD CONSTANTS");
          END IF;

          IF NOT REC1_EQUAL(R1A,REC1_OBJ) OR NOT REC1_EQUAL(R2A,
             REC1_OBJ) OR NOT REC1_EQUAL(R3A,REC1_OBJ) OR NOT
             REC1_EQUAL(R4A,REC1_OBJ) THEN
               FAILED ("IMPROPER RESULTS FROM INITIALIZATION OF " &
                       "DEFERRED RECORD CONSTANTS WITH DEFAULT " &
                       "EXPRESSIONS");
          END IF;

          IF NOT ACC_EQUAL(A1.ALL,AVAR1.ALL) OR NOT ACC_EQUAL(A2.ALL,
             AVAR2.ALL) OR NOT ACC_EQUAL(A3.ALL,AVAR3.ALL) OR NOT
             ACC_EQUAL(A4.ALL,AVAR4.ALL) THEN
               FAILED ("IMPROPER RESULTS FROM INITIALIZATION OF " &
                       "DEFERRED ACCESS CONSTANTS");
          END IF;

          IF NOT PRIV_EQUAL(PR1,PRIV(CONS)) OR NOT PRIV_EQUAL(PR2,
             PRIV(CONS)) OR NOT PRIV_EQUAL(PR3,PRIV(CONS)) OR NOT
             PRIV_EQUAL(PR4,PRIV(CONS)) THEN
               FAILED ("IMPROPER RESULTS FROM INITIALIZATION OF " &
                       "DEFERRED PRIVATE CONSTANTS");
          END IF;

          RESULT;
     END P;

     USE P;

BEGIN
     NULL;
END C74302B;
