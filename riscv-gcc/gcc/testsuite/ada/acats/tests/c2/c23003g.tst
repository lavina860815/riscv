-- C23003G.TST

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
-- CHECK THAT THE NAME OF A GENERIC LIBRARY UNIT PACKAGE AND THE NAME
-- OF A GENERIC LIBRARY UNIT SUBPROGRAM CAN BE AS LONG 

-- JBG 5/26/85
-- DTN 3/25/92  CONSOLIDATION OF C23003G.TST AND C23003H.TST.
-- KAS 12/4/95  CHANGE "LINE" TO "IDENTIFIER"

GENERIC
PACKAGE
$BIG_ID1
IS
  A : INTEGER := 1;
END
$BIG_ID1
;
GENERIC
PACKAGE
$BIG_ID2
IS
  B : INTEGER := 2;
END
$BIG_ID2
;

GENERIC
FUNCTION
$BIG_ID3
RETURN INTEGER;

FUNCTION
$BIG_ID3
RETURN INTEGER IS
BEGIN
     RETURN 3;
END
$BIG_ID3
;

GENERIC
FUNCTION
$BIG_ID4
RETURN INTEGER;

WITH REPORT; USE REPORT;
PRAGMA ELABORATE (REPORT);
FUNCTION
$BIG_ID4
RETURN INTEGER IS
BEGIN
     RETURN IDENT_INT(4);
END
$BIG_ID4
;

WITH
$BIG_ID3
;
PRAGMA ELABORATE (
$BIG_ID3
);
FUNCTION F1 IS NEW
$BIG_ID3
;

WITH
$BIG_ID1
;
PRAGMA ELABORATE (
$BIG_ID1
);
PACKAGE C23003G_PKG IS NEW
$BIG_ID1
;
WITH C23003G_PKG, F1,
$BIG_ID2
,
$BIG_ID4
;
USE C23003G_PKG;
WITH REPORT; USE REPORT;
PROCEDURE C23003G IS

     PACKAGE P2 IS NEW
$BIG_ID2
;
     USE P2;
     FUNCTION F2 IS NEW
$BIG_ID4
;

BEGIN
     TEST ("C23003G", "CHECK LONGEST POSSIBLE IDENTIFIER CAN BE USED " &
                      "FOR GENERIC LIBRARY PACKAGE AND SUBPROGRAM");

     IF A + IDENT_INT(1) /= B THEN
          FAILED ("INCORRECT PACKAGE IDENTIFICATION");
     END IF;


     IF F1 + IDENT_INT(1) /= F2 THEN
          FAILED ("INCORRECT FUNCTION IDENTIFICATION");
     END IF;

     RESULT;
END C23003G;
