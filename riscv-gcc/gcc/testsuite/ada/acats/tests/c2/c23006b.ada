-- C23006B.ADA

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
-- CHECK THAT UNDERSCORES ARE SIGNIFICANT IN LIBRARY PACKAGE IDENTIFIERS

-- JBG 5/26/85
-- PWN 5/25/94  ADDED A PROCEDURE TO KEEP PACKAGE BODIES LEGAL.

PACKAGE C23006B_PKG IS
     A : INTEGER := 1;
END C23006B_PKG;

PACKAGE C23006BPKG IS
     D : INTEGER := 4;
     PROCEDURE REQUIRE_BODY;
END C23006BPKG;

WITH REPORT; USE REPORT;
PRAGMA ELABORATE (REPORT);
PACKAGE BODY C23006BPKG IS
     PROCEDURE REQUIRE_BODY IS
     BEGIN
          NULL;
     END;
BEGIN
     D := IDENT_INT (5);
END C23006BPKG;

WITH C23006BPKG, C23006B_PKG;
USE C23006BPKG, C23006B_PKG;
WITH REPORT; USE REPORT;
PROCEDURE C23006B IS
BEGIN
     TEST ("C23006B", "CHECK UNDERSCORES ARE SIGNIFICANT " &
                      "FOR LIBRARY PACKAGE IDENTIFIERS");

     IF A + IDENT_INT(4) /= D THEN
          FAILED ("INCORRECT PACKAGE IDENTIFICATION");
     END IF;

     RESULT;
END C23006B; 
