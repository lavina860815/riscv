-- CD1C04A.ADA

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
--     CHECK THAT A SIZE CLAUSE CAN BE GIVEN FOR A DERIVED TYPE, A
--     DERIVED PRIVATE TYPE, AND A DERIVED LIMITED PRIVATE TYPE EVEN
--     IF THE SIZE IS INHERITED FROM THE PARENT, AND THAT THE SIZE
--     CLAUSES FOR THE DERIVED TYPES OVERRIDE THE PARENTS'.

-- HISTORY:
--     PWB 03/25/89  MODIFIED METHOD OF CHECKING OBJECT SIZE AGAINST
--                   TYPE SIZE; CHANGED EXTENSION FROM '.ADA' TO '.DEP'.
--     JET 09/16/87  CREATED ORIGINAL TEST.

WITH REPORT; USE REPORT;
PROCEDURE CD1C04A IS

     SPECIFIED_SIZE : CONSTANT := INTEGER'SIZE / 2;

     TYPE PARENT_TYPE IS RANGE 0 .. 100;

     FOR PARENT_TYPE'SIZE USE INTEGER'SIZE;

     TYPE DERIVED_TYPE IS NEW PARENT_TYPE;

     FOR DERIVED_TYPE'SIZE USE SPECIFIED_SIZE;

     PACKAGE P IS
          TYPE PRIVATE_PARENT IS PRIVATE;
          TYPE LIM_PRIV_PARENT IS LIMITED PRIVATE;
     PRIVATE
          TYPE PRIVATE_PARENT IS RANGE 0 .. 100;
          FOR PRIVATE_PARENT'SIZE USE INTEGER'SIZE;
          TYPE LIM_PRIV_PARENT IS RANGE 0 .. 100;
          FOR LIM_PRIV_PARENT'SIZE USE INTEGER'SIZE;
     END P;

     USE P;

     TYPE DERIVED_PRIVATE_TYPE IS NEW PRIVATE_PARENT;

     FOR DERIVED_PRIVATE_TYPE'SIZE USE SPECIFIED_SIZE;

     TYPE DERIVED_LIM_PRIV_TYPE IS NEW LIM_PRIV_PARENT;

     FOR DERIVED_LIM_PRIV_TYPE'SIZE USE SPECIFIED_SIZE;

     DT : DERIVED_TYPE := 100;
     DPT : DERIVED_PRIVATE_TYPE;
     DLPT : DERIVED_LIM_PRIV_TYPE;

BEGIN

     TEST("CD1C04A", "CHECK THAT A SIZE CLAUSE CAN BE GIVEN FOR " &
                     "A DERIVED TYPE, A DERIVED PRIVATE TYPE, AND " &
                     "A DERIVED LIMITED PRIVATE TYPE EVEN IF THE " &
                     "SIZE IS INHERITED FROM THE PARENT, AND THAT " &
                     "THE SIZE CLAUSES FOR THE DERIVED TYPES " &
                     "OVERRIDE THE PARENTS'");

     IF PARENT_TYPE'SIZE /= IDENT_INT (INTEGER'SIZE) THEN
          FAILED ("PARENT_TYPE'SIZE SHOULD BE " &
                  INTEGER'IMAGE(INTEGER'SIZE) &
                  ".  ACTUAL SIZE IS" &
                  INTEGER'IMAGE(PARENT_TYPE'SIZE));
     END IF;

     IF DERIVED_TYPE'SIZE /= IDENT_INT (SPECIFIED_SIZE) THEN
          FAILED ("DERIVED_TYPE'SIZE SHOULD BE " &
                  INTEGER'IMAGE(SPECIFIED_SIZE) &
                  ".  ACTUAL SIZE IS" &
                  INTEGER'IMAGE(DERIVED_TYPE'SIZE));
     END IF;

     IF DT'SIZE < IDENT_INT (SPECIFIED_SIZE) THEN
          FAILED ("DT'SIZE SHOULD NOT BE LESS THAN" &
                  INTEGER'IMAGE(SPECIFIED_SIZE) &
                  ".  ACTUAL SIZE IS" &
                  INTEGER'IMAGE(DT'SIZE));
     END IF;

     IF PRIVATE_PARENT'SIZE < IDENT_INT (INTEGER'SIZE) THEN
          FAILED ("PRIVATE_PARENT'SIZE SHOULD NOT BE LESS THAN" &
                  INTEGER'IMAGE(INTEGER'SIZE) &
                  ".  ACTUAL SIZE IS" &
                  INTEGER'IMAGE(PRIVATE_PARENT'SIZE));
     END IF;

     IF DERIVED_PRIVATE_TYPE'SIZE /= IDENT_INT (SPECIFIED_SIZE) THEN
          FAILED ("DERIVED_PRIVATE_TYPE'SIZE SHOULD BE " &
                  INTEGER'IMAGE(SPECIFIED_SIZE) &
                  ".  ACTUAL SIZE IS" &
                  INTEGER'IMAGE(DERIVED_PRIVATE_TYPE'SIZE));
     END IF;

     IF DPT'SIZE < IDENT_INT (SPECIFIED_SIZE) THEN
          FAILED ("DPT'SIZE SHOULD NOT BE LESS THAN" &
                  INTEGER'IMAGE(SPECIFIED_SIZE) &
                  ".  ACTUAL SIZE IS" &
                  INTEGER'IMAGE(DPT'SIZE));
     END IF;

     IF LIM_PRIV_PARENT'SIZE /= IDENT_INT (INTEGER'SIZE) THEN
          FAILED ("LIM_PRIV_PARENT'SIZE SHOULD BE" &
                  INTEGER'IMAGE(INTEGER'SIZE) &
                  ".  ACTUAL SIZE IS" &
                  INTEGER'IMAGE(LIM_PRIV_PARENT'SIZE));
     END IF;

     IF DERIVED_LIM_PRIV_TYPE'SIZE /= IDENT_INT (SPECIFIED_SIZE) THEN
          FAILED ("DERIVED_LIM_PRIV_TYPE'SIZE SHOULD BE " &
                  INTEGER'IMAGE(SPECIFIED_SIZE) &
                  ".  ACTUAL SIZE IS" &
                  INTEGER'IMAGE(DERIVED_LIM_PRIV_TYPE'SIZE));
     END IF;

     IF DLPT'SIZE < IDENT_INT (SPECIFIED_SIZE) THEN
          FAILED ("DLPT'SIZE SHOULD NOT BE LESS THAN" &
                  INTEGER'IMAGE(SPECIFIED_SIZE) &
                  ".  ACTUAL SIZE IS" &
                  INTEGER'IMAGE(DLPT'SIZE));
     END IF;

     RESULT;

END CD1C04A;
