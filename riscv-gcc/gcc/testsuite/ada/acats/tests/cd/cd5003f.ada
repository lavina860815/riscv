-- CD5003F.ADA

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
--     CHECK THAT A 'WITH' CLAUSE NAMING 'SYSTEM' NEED NOT BE GIVEN
--     FOR A GENERIC PACKAGE BODY CONTAINING AN ADDRESS CLAUSE
--     AS LONG AS A 'WITH' CLAUSE IS GIVEN FOR THE GENERIC PACKAGE
--     SPECIFICATION.

-- HISTORY:
--     VCL  09/09/87  CREATED ORIGINAL TEST.
--     PWB 05/11/89  CHANGED EXTENSION FROM '.DEP' TO '.ADA'.
-- PWN 11/30/94 ADDED A PROCEDURE TO KEEP PACKAGE BODIES LEGAL.

WITH SYSTEM;
GENERIC
PACKAGE CD5003F_PACK2 IS 
     PROCEDURE REQUIRE_BODY;
END CD5003F_PACK2;

WITH SPPRT13;
WITH REPORT; USE REPORT;
PRAGMA ELABORATE (SPPRT13);
PRAGMA ELABORATE (REPORT);
PACKAGE BODY CD5003F_PACK2 IS
     TYPE ATYPE IS ARRAY (1 .. 10) OF INTEGER;

     TEST_VAR : ATYPE := (OTHERS => 0);
     FOR TEST_VAR USE AT SPPRT13.VARIABLE_ADDRESS;
     USE SYSTEM;

     FUNCTION IDENT (P : ATYPE) RETURN ATYPE IS
     BEGIN
          IF EQUAL (3, 3) THEN
               RETURN P;
          ELSE
               RETURN (OTHERS => 0);
          END IF;
     END IDENT;

     PROCEDURE REQUIRE_BODY IS
     BEGIN
       NULL;
     END;
BEGIN
     TEST ("CD5003F", "A 'WITH' CLAUSE NAMING 'SYSTEM' NEED NOT " &
                      "BE GIVEN FOR A GENERIC PACKAGE BODY " &
                      "CONTAINING AN ADDRESS CLAUSE AS LONG AS A " &
                      "'WITH' CLAUSE IS GIVEN FOR THE GENERIC " &
                      "PACKAGE SPECIFICATION");

     TEST_VAR := IDENT (ATYPE'(OTHERS => 3));

     IF TEST_VAR /= ATYPE'(OTHERS => 3) THEN
          FAILED ("INCORRECT VALUE FOR TEST_VAR");
     END IF;

     IF TEST_VAR'ADDRESS /= SPPRT13.VARIABLE_ADDRESS THEN
          FAILED ("INCORRECT ADDRESS FOR TEST_VAR");
     END IF;
END CD5003F_PACK2;

WITH CD5003F_PACK2;
WITH REPORT; USE REPORT;
PRAGMA ELABORATE (REPORT);
PROCEDURE CD5003F IS
     PACKAGE CD5003F_PACK3 IS NEW CD5003F_PACK2;
BEGIN
    RESULT;
END CD5003F;
