-- CA1022A6M.ADA

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
-- CHECK THAT IF A SUBPROGRAM BODY IS INITIALLY COMPILED WITH A CONTEXT
-- CLAUSE AND A UNIT NAMED IN THE CONTEXT CLAUSE IS RECOMPILED, THEN AN
-- ATTEMPT TO COMPILE THE BODY AGAIN WILL SUCCEED IF THE CONTEXT CLAUSE
-- IS PRESENT.
-- CHECK THAT IF THE RECOMPILED UNIT IS NOT NEEDED IN THE SUBPROGRAM
-- BODY, THE BODY CAN BE SUCCESSFULLY RECOMPILED WITHOUT MENTIONING THE
-- RECOMPILED UNIT.

-- SEPARATE FILES ARE:
--     CA1022A0  A LIBRARY PACKAGE.
--     CA1022A1  A LIBRARY PROCEDURE.
--     CA1022A2  A LIBRARY FUNCTION.
--     CA1022A3  A LIBRARY PACKAGE (CA1022A0).
--     CA1022A4  A LIBRARY PROCEDURE (CA1022A1).
--     CA1022A5  A LIBRARY FUNCTION (CA1022A2).
--     CA1022A6M THE MAIN PROCEDURE.

-- BHS 7/23/84

WITH CA1022A1, CA1022A2;
WITH REPORT; USE REPORT;
PROCEDURE CA1022A6M IS

     I : INTEGER := 1;

BEGIN

     TEST ("CA1022A", "USE OF CONTEXT CLAUSES NAMING RECOMPILED " &
                      "UNITS WITH RECOMPILED SUBPROGRAMS");

     CA1022A1(I);
     IF I /= 5 THEN
          FAILED ("PROCEDURE CA1022A1 NOT INVOKED CORRECTLY");
     END IF;

     IF CA1022A2 THEN
          FAILED ("FUNCTION CA1022A2 NOT INVOKED CORRECTLY");
     END IF;

     RESULT;

END CA1022A6M;
