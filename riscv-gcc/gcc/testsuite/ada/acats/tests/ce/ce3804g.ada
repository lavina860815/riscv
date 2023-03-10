-- CE3804G.ADA

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
--     CHECK THAT FLOAT_IO GET WHEN SUPPLIED WITH A WIDTH PARAMETER
--     GREATER THAN ZERO READS ONLY THAT MANY CHARACTERS.  ALSO CHECK
--     THAT INPUT TERMINATES WHEN A LINE TERMINATOR IS ENCOUNTERED AND
--     THAT DATA_ERROR IS RAISED WHEN THE DATA IS INVALID.

-- APPLICABILITY CRITERIA:
--     THIS TEST IS APPLICABLE ONLY TO IMPLEMENTATIONS WHICH
--     SUPPORT TEXT FILES.

-- HISTORY:
--     SPS 09/08/82
--     SPS 12/14/82
--     VKG 01/13/83
--     SPS 02/08/83
--     JBG 02/22/84  CHANGED TO .ADA TEST
--     RJW 11/04/86  REVISED TEST TO OUTPUT A NON_APPLICABLE
--                   RESULT WHEN FILES ARE NOT SUPPORTED.
--     DWC 09/14/87  SPLIT CASE FOR FIXED_IO INTO CE3804H.ADA AND
--                   CORRECTED EXCEPTION HANDLING.
--     LDC 06/01/88  CHANGED TEST VALUE FROM "3.525" TO "3.625".

WITH REPORT;
USE REPORT;
WITH TEXT_IO;
USE TEXT_IO;

PROCEDURE CE3804G IS
     INCOMPLETE : EXCEPTION;

BEGIN

     TEST ("CE3804G", "CHECK THAT FLOAT_IO GET WHEN SUPPLIED WITH " &
                      "A WIDTH PARAMETER GREATER THAN ZERO READS " &
                      "ONLY THAT MANY CHARACTERS.  ALSO CHECK THAT " &
                      "INPUT TERMINATES WHEN A LINE TERMINATOR IS " &
                      "ENCOUNTERED AND THAT DATA_ERROR IS RAISED " &
                      "WHEN THE DATA IS INVALID.");

     DECLARE
          FT : FILE_TYPE;
     BEGIN

          BEGIN
               CREATE (FT, OUT_FILE, LEGAL_FILE_NAME);
          EXCEPTION
               WHEN USE_ERROR =>
                    NOT_APPLICABLE ("USE_ERROR RAISED; TEXT CREATE " &
                                    "WITH OUT_FILE MODE");
                    RAISE INCOMPLETE;
               WHEN NAME_ERROR =>
                    NOT_APPLICABLE ("NAME_ERROR RAISED; TEXT CREATE " &
                                    "WITH OUT_FILE MODE");
                    RAISE INCOMPLETE;
          END;

          PUT(FT, "3.259.5 8.52");
          NEW_LINE (FT);
          PUT (FT, "  ");
          NEW_LINE (FT);
          PUT (FT, ASCII.HT & "9.0");
          NEW_LINE (FT);
          PUT (FT, "-3.625");
          NEW_LINE (FT);
          CLOSE (FT);

-- BEGIN TEST

          DECLARE
               TYPE FL IS DIGITS 4;
               PACKAGE FL_IO IS NEW FLOAT_IO (FL);
               USE FL_IO;
               X : FL;
          BEGIN

               BEGIN
                    OPEN (FT, IN_FILE, LEGAL_FILE_NAME);
               EXCEPTION
                    WHEN USE_ERROR =>
                         NOT_APPLICABLE ("USE_ERROR RAISED; TEXT" &
                                         "OPEN WITH IN_FILE MODE");
                         RAISE INCOMPLETE;
               END;

               GET (FT, X, 4);
               IF X /= 3.25 THEN
                    FAILED ("WIDTH CHARACTERS NOT READ - FLOAT");
               ELSE
                    GET (FT, X, 3);
                    IF X /= 9.5 THEN
                         FAILED ("WIDTH CHARACTERS NOT READ - " &
                                 "FLOAT 2");
                    ELSE
                         GET (FT, X, 4);
                         IF X /= 8.5 THEN
                              FAILED ("DIDN'T COUNT LEADING BLANKS " &
                                      "- FLOAT");
                         ELSE
                              SKIP_LINE(FT);
                              BEGIN
                                   GET (FT, X, 2);
                                   FAILED ("DATA_ERROR NOT RAISED - " &
                                           "FLOAT");
                              EXCEPTION
                                   WHEN DATA_ERROR =>
                                        NULL;
                                   WHEN OTHERS =>
                                        FAILED ("WRONG EXCEPTION RAISED"
                                             & " - FLOAT");
                              END;
                              SKIP_LINE(FT);
                              GET (FT, X, 4);
                              IF X /= 9.0 THEN
                                   FAILED ("GET WITH WIDTH " &
                                           "INCORRECT - 3");
                              END IF;

                              SKIP_LINE (FT);
                              GET (FT, X, 7);
                              IF X /= -3.625 THEN
                                   FAILED ("WIDTH CHARACTERS NOT " &
                                           "READ - FLOAT 3");
                              END IF;
                         END IF;
                    END IF;
               END IF;

               BEGIN
                   DELETE (FT);
               EXCEPTION
                   WHEN USE_ERROR =>
                        NULL;
               END;
          END;

     EXCEPTION
          WHEN INCOMPLETE =>
               NULL;
     END;

     RESULT;

END CE3804G;
