-- CD5014E.ADA

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
--     CHECK THAT AN ADDRESS CLAUSE CAN BE GIVEN IN THE VISIBLE PART
--     OF A GENERIC PACKAGE SPECIFICATION FOR A VARIABLE OF A FLOATING
--     POINT TYPE, WHERE THE VARIABLE IS DECLARED IN THE VISIBLE PART
--     OF THE SPECIFICATION.


-- HISTORY:
--     CDJ 08/19/87  CREATED ORIGINAL TEST.
--     BCB 09/30/87  CHANGED TEST TO STANDARD FORMAT.
--     PWB 05/11/89  CHANGED EXTENSION FROM '.DEP' TO '.ADA'.
--     MCH 04/03/90  ADDED INSTANTIATION.

WITH SYSTEM; USE SYSTEM;
WITH SPPRT13; USE SPPRT13;
WITH REPORT; USE REPORT;

PROCEDURE CD5014E IS

BEGIN

     TEST ("CD5014E", " AN ADDRESS CLAUSE CAN BE GIVEN " &
                      "IN THE VISIBLE PART OF A GENERIC PACKAGE " &
                      "SPECIFICATION FOR A VARIABLE OF A FLOATING " &
                      "POINT TYPE, WHERE THE VARIABLE IS DECLARED " &
                      "IN THE VISIBLE PART OF THE SPECIFICATION");

     DECLARE

     GENERIC
     PACKAGE PKG IS
          TYPE FLOAT_TYPE IS DIGITS SYSTEM.MAX_DIGITS
               RANGE 0.0 .. 100.0;
          FLOAT_OBJ1 : FLOAT_TYPE := 50.0;
          FOR FLOAT_OBJ1 USE AT VARIABLE_ADDRESS;
     END PKG;

     PACKAGE BODY PKG IS
     BEGIN
          IF EQUAL(3,3) THEN
               FLOAT_OBJ1 := 5.0;
          END IF;

          IF FLOAT_OBJ1 /= 5.0 THEN
               FAILED ("INCORRECT VALUE FOR FLOATING POINT VARIABLE");
          END IF;

          IF FLOAT_OBJ1'ADDRESS /= VARIABLE_ADDRESS THEN
               FAILED ("INCORRECT ADDRESS FOR FLOATING POINT VARIABLE");
          END IF;
     END PKG;

     PACKAGE INSTANTIATE IS NEW PKG;

     BEGIN
          NULL;
     END;

     RESULT;
END CD5014E;
