-- C85006G.ADA

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
--     CHECK THAT ANY SUBTYPE CONSTRAINT IMPOSED BY THE TYPE MARK USED
--     IN THE SLICE RENAMING DECLARATION IS IGNORED, AND THAT THE
--     SUBTYPE CONSTRAINT ASSOCIATED WITH THE RENAMED VARIABLE IS
--     USED INSTEAD.

-- HISTORY:
--     JET 07/26/88  CREATED ORIGINAL TEST.

WITH REPORT; USE REPORT;
PROCEDURE C85006G IS

     SUBTYPE STR IS STRING(1..10);

     S : STRING(1..30) := IDENT_STR("IT WAS A DARK AND STORMY NIGHT");
     T : STR := IDENT_STR("0123456789");

     DG1 : STRING(1..30) := IDENT_STR("IT WAS A DARK AND STORMY NIGHT");
     DG2 : STR := IDENT_STR("0123456789");

     XS : STR RENAMES S(10..24);
     XT : STRING RENAMES T(1..5);

     GENERIC
          G1 : IN OUT STR;
          G2 : IN OUT STRING;
     PACKAGE GEN IS
          XG1 : STR RENAMES G1(10..24);
          XG2 : STRING RENAMES G2(1..5);
     END GEN;

     PACKAGE PACK IS NEW GEN(DG1, DG2);
     USE PACK;

BEGIN
     TEST ("C85006G", "CHECK THAT ANY SUBTYPE CONSTRAINT IMPOSED BY " &
                      "THE TYPE MARK USED IN THE SLICE RENAMING " &
                      "DECLARATION IS IGNORED, AND THAT THE SUBTYPE " &
                      "CONSTRAINT ASSOCIATED WITH THE RENAMED " &
                      "VARIABLE IS USED INSTEAD");

     IF XS'FIRST /= IDENT_INT(10) OR
        XS'LAST /= IDENT_INT(24) OR
        XS'LENGTH /= IDENT_INT(15) THEN
          FAILED("INCORRECT VALUE OF SLICE ATTRIBUTES - 1");
     END IF;

     IF XS /= "DARK AND STORMY" THEN
          FAILED("INCORRECT VALUE OF RENAMING SLICE - 1");
     END IF;

     XS := IDENT_STR("STORMY AND DARK");

     IF S /= "IT WAS A STORMY AND DARK NIGHT" THEN
          FAILED("INCORRECT VALUE OF ORIGINAL STRING - 1");
     END IF;

     IF XT'FIRST /= IDENT_INT(1) OR
        XT'LAST /= IDENT_INT(5) OR
        XT'LENGTH /= IDENT_INT(5) THEN
          FAILED("INCORRECT VALUE OF SLICE ATTRIBUTES - 2");
     END IF;

     IF XT /= "01234" THEN
          FAILED("INCORRECT VALUE OF RENAMING SLICE - 2");
     END IF;

     XT := IDENT_STR("43210");

     IF T /= "4321056789" THEN
          FAILED("INCORRECT VALUE OF ORIGINAL STRING - 2");
     END IF;

     IF XG1'FIRST /= IDENT_INT(10) OR
        XG1'LAST /= IDENT_INT(24) OR
        XG1'LENGTH /= IDENT_INT(15) THEN
          FAILED("INCORRECT VALUE OF SLICE ATTRIBUTES - G1");
     END IF;

     IF XG1 /= "DARK AND STORMY" THEN
          FAILED("INCORRECT VALUE OF RENAMING SLICE - G1");
     END IF;

     XG1 := IDENT_STR("STORMY AND DARK");

     IF DG1 /= "IT WAS A STORMY AND DARK NIGHT" THEN
          FAILED("INCORRECT VALUE OF ORIGINAL STRING - G1");
     END IF;

     IF XG2'FIRST /= IDENT_INT(1) OR
        XG2'LAST /= IDENT_INT(5) OR
        XG2'LENGTH /= IDENT_INT(5) THEN
          FAILED("INCORRECT VALUE OF SLICE ATTRIBUTES - G2");
     END IF;

     IF XG2 /= "01234" THEN
          FAILED("INCORRECT VALUE OF RENAMING SLICE - G2");
     END IF;

     XG2 := IDENT_STR("43210");

     IF DG2 /= "4321056789" THEN
          FAILED("INCORRECT VALUE OF ORIGINAL STRING - G2");
     END IF;

     RESULT;

EXCEPTION
     WHEN OTHERS =>
          FAILED("UNEXPECTED EXCEPTION RAISED");
          RESULT;
END C85006G;
