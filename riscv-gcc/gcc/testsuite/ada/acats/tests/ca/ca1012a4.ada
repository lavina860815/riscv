-- CA1012A4M.ADA

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
--     CHECK THAT GENERIC SUBPROGRAM DECLARATIONS AND BODIES CAN BE
--     COMPILED SEPARATELY.

-- SEPARATE FILES ARE:
--   CA1012A0  A LIBRARY GENERIC PROCEDURE DECLARATION.
--   CA1012A1  A LIBRARY GENERIC PROCEDURE BODY (CA1012A0).
--   CA1012A2  A LIBRARY GENERIC FUNCTION DECLARATION.
--   CA1012A3  A LIBRARY GENERIC FUNCTION BODY (CA1012A2).
--   CA1012A4M THE MAIN PROCEDURE.

-- APPLICABILITY CRITERIA:
--     THIS TEST MUST RUN AND REPORT "PASSED" FOR ALL ADA 95 IMPLEMENTATIONS.
--     THIS WAS NOT REQUIRED FOR ADA 83.

-- HISTORY:
--     WKB 07/20/81  CREATED ORIGINAL TEST.
--     PWB 02/19/86  ADDED COMMENTS REGARDING NON-APPLICABILITY.
--     BCB 01/05/88  MODIFIED HEADER.
--     RLB 09/13/99  UPDATED APPLICABILITY CRITERIA FOR ADA 95.
--     RLB 09/15/99  REMOVED OBSOLETE COMMENT.

WITH REPORT, CA1012A0, CA1012A2;
USE REPORT;
PROCEDURE CA1012A4M IS

     N : INTEGER := 1;

     SUBTYPE S50 IS INTEGER RANGE 1..50;

     PROCEDURE P IS NEW CA1012A0 (S50);

     FUNCTION F IS NEW CA1012A2 (INTEGER);

BEGIN
     TEST ("CA1012A", "SEPARATELY COMPILED GENERIC SUBPROGRAM " &
                      "DECLARATIONS AND BODIES");

     P(N);
     IF N /= 2 THEN
          FAILED ("PROCEDURE NOT INVOKED");
     END IF;

     N := 1;
     IF F(N) /= 2 THEN
          FAILED ("FUNCTION NOT INVOKED");
     END IF;

     RESULT;
END CA1012A4M;
