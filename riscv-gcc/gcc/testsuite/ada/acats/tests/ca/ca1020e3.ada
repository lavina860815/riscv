-- CA1020E3M.ADA

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
--     CHECK THAT A SUBPROGRAM LIBRARY UNIT CAN BE REPLACED BY A GENERIC
--     INSTANTIATION HAVING THE SAME IDENTIFIER.  THIS FILE CONTAINS
--     GENERIC UNITS TO BE INSTANTIATED AS LIBRARY UNITS.

-- SEPARATE FILES ARE:
--     CA1020E0  -- GENERIC UNITS GENPROC_CA1020E AND GENFUNC_CA1020E.
--     CA1020E1  -- SUBPROGRAM LIBRARY UNIT BODIES (CA1020E_PROC1,
--                  CA1020E_FUNC1, CA1020E_PROC2, CA1020E_FUNC2).
--     CA1020E2  -- INSTANTIATIONS REPLACING UNITS COMPILED IN CA1020E1.
--     CA1020E3M -- MAIN PROGRAM.

-- HISTORY:
--     JBG 05/28/85  CREATED ORIGINAL TEST.
--     JET 07/29/88  ADDED CASES IN WHICH SUBPROGRAM PROFILES ARE NOT
--                   THE SAME AND ALSO WHEN SUBPROGRAM IS FIRST
--                   DECLARED WITHOUT A BODY.

WITH REPORT; USE REPORT;
WITH CA1020E_PROC1, CA1020E_FUNC1, CA1020E_PROC2, CA1020E_FUNC2;
PROCEDURE CA1020E3M IS
     TEMP : INTEGER := 0;
BEGIN
     TEST ("CA1020E", "CHECK THAT A SUBPROGRAM LIBRARY UNIT CAN BE " &
                      "REPLACED BY A GENERIC INSTANTIATION HAVING " &
                      "THE SAME IDENTIFIER");

     CA1020E_PROC1 (TEMP);
     IF TEMP /= IDENT_INT(1) THEN
          FAILED ("INSTANTIATION DID NOT REPLACE PROCEDURE");
     END IF;

     IF CA1020E_FUNC1 /= IDENT_INT(2) THEN
          FAILED ("INSTANTIATION DID NOT REPLACE FUNCTION");
     END IF;

     CA1020E_PROC2 (TEMP);
     IF TEMP /= IDENT_INT(5) THEN
          FAILED ("INSTANTIATION DID NOT REPLACE PROCEDURE");
     END IF;

     IF CA1020E_FUNC2 /= IDENT_INT(2) THEN
          FAILED ("INSTANTIATION DID NOT REPLACE FUNCTION");
     END IF;

     RESULT;
END CA1020E3M;
