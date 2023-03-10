-- C95087A.ADA

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
-- CHECK THAT UNCONSTRAINED RECORD, PRIVATE, LIMITED PRIVATE, AND ARRAY
--   FORMAL PARAMETERS USE THE CONSTRAINTS OF ACTUAL PARAMETERS.
--   SUBTESTS ARE:
--        (A) RECORD TYPE, UNCONSTRAINED ACTUALS, DEFAULTS.
--        (B) PRIVATE TYPE, CONSTRAINED ACTUALS, NO DEFAULTS.
--        (C) LIMITED PRIVATE TYPE, UNCONSTRAINED ACTUALS, NO DEFAULTS.
--        (D) ARRAY TYPE, CONSTRAINED ACTUALS, DEFAULTS.

-- GLH  7/19/85
-- JRK 8/23/85

WITH REPORT; USE REPORT;
PROCEDURE C95087A IS

BEGIN
     TEST ("C95087A", "CHECK USE OF ACTUAL CONSTRAINTS BY " &
                      "UNCONSTRAINED FORMAL PARAMETERS");

     DECLARE  -- (A)

          PACKAGE PKG IS

              SUBTYPE INT IS INTEGER RANGE 0..100;

              TYPE RECTYPE (CONSTRAINT : INT := 80) IS
                    RECORD
                         INTFIELD : INTEGER;
                         STRFIELD : STRING (1..CONSTRAINT);
                    END RECORD;

               REC1 : RECTYPE := (10,10,"0123456789");
               REC2 : RECTYPE := (17,7,"C95087A..........");
               REC3 : RECTYPE := (1,1,"A");
               REC4 : RECTYPE;  -- 80.

               TASK T1 IS
                    ENTRY E1 (REC1 : IN RECTYPE := (2,0,"AB");
                              REC2 : OUT RECTYPE;
                              REC3 : IN OUT RECTYPE);
               END T1;

               TASK T2 IS
                    ENTRY E2 (REC : OUT RECTYPE);
               END T2;
          END PKG;

          PACKAGE BODY PKG IS

               TASK BODY T1 IS
               BEGIN
                    ACCEPT E1 (REC1 : IN RECTYPE := (2,0,"AB");
                               REC2 : OUT RECTYPE;
                               REC3 : IN OUT RECTYPE) DO

                         IF REC1.CONSTRAINT /= IDENT_INT (10) THEN
                              FAILED ("RECORD TYPE IN PARAMETER " &
                                      "DID NOT USE CONSTRAINT " &
                                      "OF ACTUAL");
                         END IF;
                         IF REC2.CONSTRAINT /= IDENT_INT (17) THEN
                              FAILED ("RECORD TYPE OUT " &
                                      "PARAMETER DID NOT USE " &
                                      "CONSTRAINT OF ACTUAL");
                         END IF;
                         IF REC3.CONSTRAINT /= IDENT_INT (1) THEN
                              FAILED ("RECORD TYPE IN OUT " &
                                      "PARAMETER DID NOT USE " &
                                      "CONSTRAINT OF ACTUAL");
                         END IF;
                         REC2 := PKG.REC2;
                    END E1;
               END T1;

               TASK BODY T2 IS
               BEGIN
                    ACCEPT E2 (REC : OUT RECTYPE) DO
                         IF REC.CONSTRAINT /= IDENT_INT (80) THEN
                              FAILED ("RECORD TYPE OUT " &
                                      "PARAMETER DID " &
                                      "NOT USE CONSTRAINT OF " &
                                      "UNINITIALIZED ACTUAL");
                         END IF;
                         REC := (10,10,"9876543210");
                    END E2;
               END T2;
          END PKG;

     BEGIN  -- (A)

          PKG.T1.E1 (PKG.REC1, PKG.REC2, PKG.REC3);
          PKG.T2.E2 (PKG.REC4);

     END;   -- (A)

     ---------------------------------------------

B :  DECLARE  -- (B)

          PACKAGE PKG IS

               SUBTYPE INT IS INTEGER RANGE 0..100;

               TYPE RECTYPE (CONSTRAINT : INT := 80) IS PRIVATE;


               TASK T1 IS
                    ENTRY E1 (REC1 : IN RECTYPE;
                              REC2 : OUT RECTYPE;
                              REC3 : IN OUT RECTYPE);
               END T1;

               TASK T2 IS
                    ENTRY E2  (REC : OUT RECTYPE);
               END T2;

          PRIVATE
               TYPE RECTYPE (CONSTRAINT : INT := 80) IS
                    RECORD
                         INTFIELD : INTEGER;
                         STRFIELD : STRING (1..CONSTRAINT);
                    END RECORD;
          END PKG;

          REC1 : PKG.RECTYPE (10);
          REC2 : PKG.RECTYPE (17);
          REC3 : PKG.RECTYPE (1);
          REC4 : PKG.RECTYPE (10);

          PACKAGE BODY PKG IS

               TASK BODY T1 IS
               BEGIN
                    ACCEPT E1 (REC1 : IN RECTYPE;
                               REC2 : OUT RECTYPE;
                               REC3 : IN OUT RECTYPE) DO
                         IF REC1.CONSTRAINT /= IDENT_INT (10) THEN
                              FAILED ("PRIVATE TYPE IN " &
                                      "PARAMETER DID " &
                                      "NOT USE CONSTRAINT OF " &
                                      "ACTUAL");
                         END IF;
                         IF REC2.CONSTRAINT /= IDENT_INT (17) THEN
                              FAILED ("PRIVATE TYPE OUT " &
                                      "PARAMETER DID " &
                                      "NOT USE CONSTRAINT OF " &
                                      "ACTUAL");
                         END IF;
                         IF REC3.CONSTRAINT /= IDENT_INT (1) THEN
                              FAILED ("PRIVATE TYPE IN OUT " &
                                      "PARAMETER DID " &
                                      "NOT USE CONSTRAINT OF " &
                                      "ACTUAL");
                         END IF;
                         REC2 := B.REC2;
                    END E1;
               END T1;

               TASK BODY T2 IS
               BEGIN
                    ACCEPT E2 (REC : OUT RECTYPE) DO
                         IF REC.CONSTRAINT /= IDENT_INT (10) THEN
                              FAILED ("PRIVATE TYPE OUT " &
                                      "PARAMETER DID " &
                                      "NOT USE CONSTRAINT OF " &
                                      "UNINITIALIZED ACTUAL");
                         END IF;
                         REC := (10,10,"9876543210");
                    END E2;
               END T2;

          BEGIN
               REC1 := (10,10,"0123456789");
               REC2 := (17,7,"C95087A..........");
               REC3 := (1,1,"A");
          END PKG;

     BEGIN  -- (B)

          PKG.T1.E1 (REC1, REC2, REC3);
          PKG.T2.E2 (REC4);

     END B;  -- (B)

     ---------------------------------------------

C :  DECLARE  -- (C)

          PACKAGE PKG IS

               SUBTYPE INT IS INTEGER RANGE 0..100;

               TYPE RECTYPE (CONSTRAINT : INT := 80) IS
                    LIMITED PRIVATE;

               TASK T1 IS
                    ENTRY E1 (REC1 : IN RECTYPE;
                              REC2 : OUT RECTYPE;
                              REC3 : IN OUT RECTYPE);
               END T1;

               TASK T2 IS
                    ENTRY E2 (REC : OUT RECTYPE);
               END T2;

          PRIVATE
               TYPE RECTYPE (CONSTRAINT : INT := 80) IS
                    RECORD
                         INTFIELD : INTEGER;
                         STRFIELD : STRING (1..CONSTRAINT);
                    END RECORD;
          END PKG;

          REC1 : PKG.RECTYPE;     -- 10.
          REC2 : PKG.RECTYPE;     -- 17.
          REC3 : PKG.RECTYPE;     --  1.
          REC4 : PKG.RECTYPE;     -- 80.

          PACKAGE BODY PKG IS

               TASK BODY T1 IS
               BEGIN
                    ACCEPT E1 (REC1 : IN RECTYPE;
                               REC2 : OUT RECTYPE;
                               REC3 : IN OUT RECTYPE) DO
                         IF REC1.CONSTRAINT /= IDENT_INT (10) THEN
                              FAILED ("LIMITED PRIVATE TYPE IN " &
                                      "PARAMETER DID NOT USE " &
                                      "CONSTRAINT OF ACTUAL");
                         END IF;
                         IF REC2.CONSTRAINT /= IDENT_INT (17) THEN
                              FAILED ("LIMITED PRIVATE TYPE OUT " &
                                      "PARAMETER DID NOT USE " &
                                      "CONSTRAINT OF " &
                                      "ACTUAL");
                         END IF;
                         IF REC3.CONSTRAINT /= IDENT_INT (1) THEN
                              FAILED ("LIMITED PRIVATE TYPE IN " &
                                      "OUT PARAMETER DID NOT " &
                                      "USE CONSTRAINT OF ACTUAL");
                         END IF;
                         REC2 := C.REC2;
                    END E1;
               END T1;

               TASK BODY T2 IS
               BEGIN
                    ACCEPT E2 (REC : OUT RECTYPE) DO
                         IF REC.CONSTRAINT /= IDENT_INT (80) THEN
                              FAILED ("LIMITED PRIVATE TYPE OUT " &
                                      "PARAMETER DID NOT USE " &
                                      "CONSTRAINT OF UNINITIALIZED " &
                                      "ACTUAL");
                         END IF;
                         REC := (10,10,"9876543210");
                    END E2;
               END T2;

          BEGIN
               REC1 := (10,10,"0123456789");
               REC2 := (17,7,"C95087A..........");
               REC3 := (1,1,"A");
          END PKG;

     BEGIN  -- (C)

          PKG.T1.E1 (REC1, REC2, REC3);
          PKG.T2.E2 (REC4);

     END C;   -- (C)

     ---------------------------------------------

D :  DECLARE  -- (D)

          TYPE ATYPE IS ARRAY (INTEGER RANGE <>, POSITIVE RANGE <>) OF
               CHARACTER;

          A1, A2, A3 : ATYPE (-1..1, 4..5) := (('A','B'),
                                               ('C','D'),
                                               ('E','F'));

          A4  : ATYPE (-1..1, 4..5);

          CA1 : CONSTANT ATYPE (8..9, -7..INTEGER'FIRST) :=
                               (8..9 => (-7..INTEGER'FIRST => 'A'));

          S1  : STRING (1..INTEGER'FIRST) := "";
          S2  : STRING (-5..-7)           := "";
          S3  : STRING (1..0)             := "";

          TASK T1 IS
               ENTRY E1 (A1 : IN ATYPE := CA1;
                         A2 : OUT ATYPE;
                         A3 : IN OUT ATYPE);
          END T1;

          TASK T2 IS
               ENTRY E2 (A4 : OUT ATYPE);
          END T2;

          TASK T3 IS
               ENTRY E3 (S1 : IN STRING;
                         S2 : IN OUT STRING;
                         S3 : OUT STRING);
          END T3;

          TASK BODY T1 IS
          BEGIN
               ACCEPT E1 (A1 : IN ATYPE := CA1;  A2 : OUT ATYPE;
                          A3 : IN OUT ATYPE) DO
                    IF A1'FIRST(1) /= IDENT_INT (-1) OR
                       A1'LAST(1)  /= IDENT_INT (1)  OR
                       A1'FIRST(2) /= IDENT_INT (4)  OR
                       A1'LAST(2)  /= IDENT_INT (5)  THEN
                         FAILED ("ARRAY TYPE IN PARAMETER DID " &
                                 "NOT USE CONSTRAINTS OF ACTUAL");
                    END IF;
                    IF A2'FIRST(1) /= IDENT_INT (-1) OR
                       A2'LAST(1)  /= IDENT_INT (1)  OR
                       A2'FIRST(2) /= IDENT_INT (4)  OR
                       A2'LAST(2)  /= IDENT_INT (5)  THEN
                         FAILED ("ARRAY TYPE OUT PARAMETER DID " &
                                 "NOT USE CONSTRAINTS OF ACTUAL");
                    END IF;
                    IF A3'FIRST(1) /= IDENT_INT (-1) OR
                       A3'LAST(1)  /= IDENT_INT (1)  OR
                       A3'FIRST(2) /= IDENT_INT (4)  OR
                       A3'LAST(2)  /= IDENT_INT (5)  THEN
                         FAILED ("ARRAY TYPE IN OUT PARAMETER " &
                                 "DID NOT USE CONSTRAINTS OF " &
                                 "ACTUAL");
                    END IF;
                    A2 := D.A2;
               END E1;
          END T1;

          TASK BODY T2 IS
          BEGIN
               ACCEPT E2 (A4 : OUT ATYPE) DO
                    IF A4'FIRST(1) /= IDENT_INT (-1) OR
                       A4'LAST(1)  /= IDENT_INT (1)  OR
                       A4'FIRST(2) /= IDENT_INT (4)  OR
                       A4'LAST(2)  /= IDENT_INT (5)  THEN
                         FAILED ("ARRAY TYPE OUT PARAMETER DID " &
                                 "NOT USE CONSTRAINTS OF " &
                                 "UNINITIALIZED ACTUAL");
                    END IF;
                    A4 := A2;
               END E2;
          END T2;

          TASK BODY T3 IS
          BEGIN
               ACCEPT E3 (S1 : IN STRING;
                          S2 : IN OUT STRING;
                          S3 : OUT STRING) DO
                    IF S1'FIRST /= IDENT_INT (1) OR
                       S1'LAST  /= IDENT_INT (INTEGER'FIRST) THEN
                         FAILED ("STRING TYPE IN PARAMETER DID " &
                                 "NOT USE CONSTRAINTS OF ACTUAL " &
                                 "NULL STRING");
                    END IF;
                    IF S2'FIRST /= IDENT_INT (-5) OR
                       S2'LAST  /= IDENT_INT (-7) THEN
                         FAILED ("STRING TYPE IN OUT PARAMETER " &
                                 "DID NOT USE CONSTRAINTS OF " &
                                 "ACTUAL NULL STRING");
                    END IF;
                    IF S3'FIRST /= IDENT_INT (1) OR
                       S3'LAST  /= IDENT_INT (0) THEN
                         FAILED ("STRING TYPE OUT PARAMETER DID NOT " &
                                 "USE CONSTRAINTS OF ACTUAL NULL " &
                                 "STRING");
                    END IF;
                    S3 := "";
               END E3;
          END T3;

     BEGIN  -- (D)

          T1.E1 (A1, A2, A3);
          T2.E2 (A4);
          T3.E3 (S1, S2, S3);

     END D;  -- (D)

     RESULT;
END C95087A;
