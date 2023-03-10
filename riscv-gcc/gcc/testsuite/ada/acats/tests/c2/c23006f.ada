-- C23006F.ADA

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
-- CHECK THAT UNDERSCORES ARE SIGNIFICANT IN LIBRARY PACKAGE NAMES
-- CREATED BY A GENERIC INSTANTIATION.

-- JBG 5/26/85

GENERIC
     C : INTEGER;
PACKAGE C23006F_PKG IS
     A : INTEGER := C;
END C23006F_PKG;

WITH C23006F_PKG;
PRAGMA ELABORATE (C23006F_PKG);
PACKAGE C23006F_INST IS NEW C23006F_PKG (1);

WITH REPORT; USE REPORT;
WITH C23006F_PKG;
PRAGMA ELABORATE (REPORT, C23006F_PKG);
PACKAGE C23006FINST IS NEW C23006F_PKG (IDENT_INT(2));

WITH C23006F_INST, C23006FINST;
WITH REPORT; USE REPORT;
PROCEDURE C23006F IS
BEGIN
     TEST ("C23006F", "CHECK THAT UNDERSCORES ARE SIGNIFICANT IN " &
                      "NAMES USED FOR A LIBRARY PACKAGE INSTANTIATION");

     IF C23006F_INST.A + IDENT_INT(1) /= C23006FINST.A THEN
          FAILED ("INCORRECT PACKAGE IDENTIFICATION - 1");
     END IF;

     RESULT;
END C23006F; 
