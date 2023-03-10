-- C96005F.ADA

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
-- CHECK THAT PACKAGE CALENDAR + AND - FUNCTIONS WORK PROPERLY,
-- ESPECIALLY WITH VALUES AT MIDNIGHT.
 
-- GOM 02/18/85
-- JWC 05/14/85
 
WITH REPORT;
USE REPORT;
WITH CALENDAR;
USE CALENDAR;
 
PROCEDURE C96005F IS

     CURR_DAY1 : CONSTANT TIME := TIME_OF(1984,1,1,0.0);
     CURR_DAY2 : CONSTANT TIME := TIME_OF(1984,1,1,DAY_DURATION'LAST);
     CURR_DAY3 : CONSTANT TIME := TIME_OF(1984,1,1,10000.0);

     TOMORROW1 : CONSTANT TIME := TIME_OF(1984,1,2,0.0);
     TOMORROW2 : CONSTANT TIME := TIME_OF(1984,1,2,DAY_DURATION'LAST);
     TOMORROW3 : CONSTANT TIME := TIME_OF(1984,1,2,10000.0);

     YESTERDAY1 : CONSTANT TIME := TIME_OF(1983,12,31,0.0);
     YESTERDAY2 : CONSTANT TIME := TIME_OF(1983,12,31,
                                           DAY_DURATION'LAST);
     YESTERDAY3 : CONSTANT TIME := TIME_OF(1983,12,31,10000.0);

BEGIN
     TEST("C96005F","CHECKING PACKAGE CALENDAR + AND - FUNCTIONS");

     -- CHECK IF ADDING ONE DAY TO 'CURR_DAY#' TIMES YIELDS
     -- TIMES EQUAL TO 'TOMORROW'.

     IF (CURR_DAY1 + DAY_DURATION'LAST) /= TOMORROW1 THEN
          FAILED("FAILURE IN ADDING 1 DAY TO 'CURR_DAY1'");
     END IF;

     IF (CURR_DAY2 + DAY_DURATION'LAST) /= TOMORROW2 THEN
          FAILED("FAILURE IN ADDING 1 DAY TO 'CURR_DAY2'");
     END IF;
 
     IF (CURR_DAY3 + DAY_DURATION'LAST) /= TOMORROW3 THEN
          FAILED("FAILURE IN ADDING 1 DAY TO 'CURR_DAY3'");
     END IF;

     IF (CURR_DAY1 + DAY_DURATION'LAST) /= CURR_DAY2 THEN
          FAILED("'CURR_DAY1' + 1 /= 'CURR_DAY2'");
     END IF;
 
     -- CHECK IF SUBTRACTING ONE DAY FROM 'CURR_DAY#' TIMES YIELDS
     -- TIMES EQUAL TO 'YESTERDAY'.

     IF (CURR_DAY1 - DAY_DURATION'LAST) /= YESTERDAY1 THEN
          FAILED("FAILURE IN SUBTRACTING 1 DAY FROM 'CURR_DAY1'");
     END IF;

     IF (CURR_DAY2 - DAY_DURATION'LAST) /= YESTERDAY2 THEN
          FAILED("FAILURE IN SUBTRACTING 1 DAY FROM 'CURR_DAY2'");
     END IF;

     IF (CURR_DAY3 - DAY_DURATION'LAST) /= YESTERDAY3 THEN
          FAILED("FAILURE IN SUBTRACTING 1 DAY FROM 'CURR_DAY3'");
     END IF;

     IF (CURR_DAY2 - DAY_DURATION'LAST) /= CURR_DAY1 THEN
          FAILED("'CURR_DAY2' - 1 /= 'CURR_DAY1'");
     END IF;
 
     RESULT;
END C96005F;
