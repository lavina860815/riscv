-- CD2A83C.TST

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
--     CHECK THAT SIZE AND COLLECTION SIZE SPECIFICATIONS
--     FOR AN ACCESS TYPE CAN BE GIVEN IN THE VISIBLE OR
--     PRIVATE PART OF A PACKAGE FOR A TYPE DECLARED IN
--     THE VISIBLE PART.

-- HISTORY:
--     JET 09/01/87  CREATED ORIGINAL TEST.
--     DHH 04/11/89  CHANGED OPERATOR ON 'SIZE CHECKS AND REMOVED
--                   APPLICABILITY CRITERIA.

--     $ACC_SIZE IS THE SIZE IN BITS FOR AN ACCESS VARIABLE WHOSE
--     DESIGNATED TYPE IS A STRING TYPE.

WITH REPORT; USE REPORT;
PROCEDURE CD2A83C IS

     SPECIFIED_SIZE : CONSTANT := $ACC_SIZE;
     COLL_SIZE : CONSTANT := 256;

     TYPE CHECK_ACC IS ACCESS STRING;

     FOR CHECK_ACC'STORAGE_SIZE USE COLL_SIZE;

     FOR CHECK_ACC'SIZE USE SPECIFIED_SIZE;

     PACKAGE P IS
          TYPE ACC_IN_P IS ACCESS STRING;
          FOR ACC_IN_P'STORAGE_SIZE USE COLL_SIZE;
          FOR ACC_IN_P'SIZE USE SPECIFIED_SIZE;
          TYPE PRIVATE_ACC IS PRIVATE;
          TYPE ALT_ACC_IN_P IS ACCESS STRING;
     PRIVATE
          TYPE PRIVATE_ACC IS ACCESS STRING;
          FOR ALT_ACC_IN_P'STORAGE_SIZE USE COLL_SIZE;
          FOR ALT_ACC_IN_P'SIZE USE SPECIFIED_SIZE;
     END P;

     USE P;

     MINIMUM_SIZE : INTEGER := IDENT_INT(SPECIFIED_SIZE);

BEGIN

     TEST("CD2A83C", "CHECK THAT WHEN SIZE AND COLLECTION SIZE " &
                     "SPECIFICATIONS FOR AN ACCESS TYPE, " &
                     "CAN BE GIVEN IN " &
                     "THE VISIBLE OR PRIVATE PART OF A PACKAGE FOR " &
                     "A TYPE DECLARED IN THE VISIBLE PART");

     IF CHECK_ACC'SIZE /= MINIMUM_SIZE THEN
          FAILED ("CHECK_ACC'SIZE /= SPECIFIED_SIZE");
     END IF;

     IF CHECK_ACC'STORAGE_SIZE < COLL_SIZE THEN
          FAILED ("CHECK_ACC'STORAGE_SIZE TOO SMALL");
     END IF;

     IF ACC_IN_P'SIZE /= MINIMUM_SIZE THEN
          FAILED ("ACC_IN_P'SIZE /= SPECIFIED_SIZE");
     END IF;

     IF ACC_IN_P'STORAGE_SIZE < COLL_SIZE THEN
          FAILED ("ACC_IN_P'STORAGE_SIZE TOO SMALL");
     END IF;

     IF ALT_ACC_IN_P'SIZE /= MINIMUM_SIZE THEN
          FAILED ("ALT_ACC_IN_P'SIZE /= SPECIFIED_SIZE");
     END IF;

     IF ALT_ACC_IN_P'STORAGE_SIZE < COLL_SIZE THEN
          FAILED ("ALT_ACC_IN_P'STORAGE_SIZE TOO SMALL");
     END IF;

     RESULT;

END CD2A83C;
