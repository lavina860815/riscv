-- C25001A.ADA

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
-- CHECK THAT ALL CHARACTER LITERALS CAN BE WRITTEN.

--      CASE A: THE BASIC CHARACTER SET.

-- TBN  3/17/86

WITH REPORT; USE REPORT;
PROCEDURE C25001A IS

BEGIN
     TEST ("C25001A", "CHECK THAT EACH CHARACTER IN THE BASIC " &
                      "CHARACTER SET CAN BE WRITTEN");

     IF CHARACTER'POS('A') /= 65 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'A'");
     END IF;
     IF CHARACTER'POS('B') /= 66 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'B'");
     END IF;
     IF CHARACTER'POS('C') /= 67 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'C'");
     END IF;
     IF CHARACTER'POS('D') /= 68 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'D'");
     END IF;
     IF CHARACTER'POS('E') /= 69 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'E'");
     END IF;
     IF CHARACTER'POS('F') /= 70 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'F'");
     END IF;
     IF CHARACTER'POS('G') /= 71 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'G'");
     END IF;
     IF CHARACTER'POS('H') /= 72 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'H'");
     END IF;
     IF CHARACTER'POS('I') /= 73 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'I'");
     END IF;
     IF CHARACTER'POS('J') /= 74 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'J'");
     END IF;
     IF CHARACTER'POS('K') /= 75 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'K'");
     END IF;
     IF CHARACTER'POS('L') /= 76 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'L'");
     END IF;
     IF CHARACTER'POS('M') /= 77 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'M'");
     END IF;
     IF CHARACTER'POS('N') /= 78 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'N'");
     END IF;
     IF CHARACTER'POS('O') /= 79 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'O'");
     END IF;
     IF CHARACTER'POS('P') /= 80 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'P'");
     END IF;
     IF CHARACTER'POS('Q') /= 81 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'Q'");
     END IF;
     IF CHARACTER'POS('R') /= 82 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'R'");
     END IF;
     IF CHARACTER'POS('S') /= 83 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'S'");
     END IF;
     IF CHARACTER'POS('T') /= 84 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'T'");
     END IF;
     IF CHARACTER'POS('U') /= 85 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'U'");
     END IF;
     IF CHARACTER'POS('V') /= 86 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'V'");
     END IF;
     IF CHARACTER'POS('W') /= 87 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'W'");
     END IF;
     IF CHARACTER'POS('X') /= 88 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'X'");
     END IF;
     IF CHARACTER'POS('Y') /= 89 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'Y'");
     END IF;
     IF CHARACTER'POS('Z') /= 90 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR 'Z'");
     END IF;

     IF CHARACTER'POS('0') /= 48 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '0'");
     END IF;
     IF CHARACTER'POS('1') /= 49 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '1'");
     END IF;
     IF CHARACTER'POS('2') /= 50 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '2'");
     END IF;
     IF CHARACTER'POS('3') /= 51 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '3'");
     END IF;
     IF CHARACTER'POS('4') /= 52 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '4'");
     END IF;
     IF CHARACTER'POS('5') /= 53 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '5'");
     END IF;
     IF CHARACTER'POS('6') /= 54 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '6'");
     END IF;
     IF CHARACTER'POS('7') /= 55 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '7'");
     END IF;
     IF CHARACTER'POS('8') /= 56 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '8'");
     END IF;
     IF CHARACTER'POS('9') /= 57 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '9'");
     END IF;

     IF CHARACTER'POS('"') /= 34 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '""'");
     END IF;
     IF CHARACTER'POS('#') /= 35 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '#'");
     END IF;
     IF CHARACTER'POS('&') /= 38 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '&'");
     END IF;
     IF CHARACTER'POS(''') /= 39 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '''");
     END IF;
     IF CHARACTER'POS('(') /= 40 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '('");
     END IF;
     IF CHARACTER'POS(')') /= 41 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR ')'");
     END IF;
     IF CHARACTER'POS('*') /= 42 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '*'");
     END IF;
     IF CHARACTER'POS('+') /= 43 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '+'");
     END IF;
     IF CHARACTER'POS(',') /= 44 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR ','");
     END IF;
     IF CHARACTER'POS('-') /= 45 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '-'");
     END IF;
     IF CHARACTER'POS('.') /= 46 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '.'");
     END IF;
     IF CHARACTER'POS('/') /= 47 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '/'");
     END IF;
     IF CHARACTER'POS(':') /= 58 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR ':'");
     END IF;
     IF CHARACTER'POS(';') /= 59 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR ';'");
     END IF;
     IF CHARACTER'POS('<') /= 60 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '<'");
     END IF;
     IF CHARACTER'POS('=') /= 61 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '='");
     END IF;
     IF CHARACTER'POS('>') /= 62 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '>'");
     END IF;
     IF CHARACTER'POS('_') /= 95 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '_'");
     END IF;
     IF CHARACTER'POS('|') /= 124 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR '|'");
     END IF;

     IF CHARACTER'POS(' ') /= 32 THEN
          FAILED ("INCORRECT POSITION NUMBER FOR ' '");
     END IF;

     RESULT;
END C25001A;
