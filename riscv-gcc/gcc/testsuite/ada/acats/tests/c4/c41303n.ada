-- C41303N.ADA

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
-- CHECK THAT THE NOTATION  L.ALL  IS ALLOWED IF  L  IS THE NAME OF AN
--     ACCESS OBJECT DESIGNATING A RECORD, AN ARRAY, A SCALAR, OR
--     ANOTHER ACCESS OBJECT.
-- CHECK THAT IF  A  IS AN IDENTIFIER DENOTING AN ACCESS OBJECT WHICH
--     IN TURN DESIGNATES AN ACCESS OBJECT, THE FORM  A.ALL.ALL  IS
--     ACCEPTED.


-- THIS OBJECTIVE IS COVERED IN SEVERAL TESTS. IN THE FOLLOWING DIAGRAM,
--     THE PORTION COVERED BY THE CURRENT TEST IS MARKED BY 'X' .


--                              ||   ASSIGNMT  |  PROC. PARAMETERS
--                              ||  ():=  :=() | IN   OUT    IN OUT
--      ========================||=============|====================
--                 ACC REC      ||             |
--                --------------||-------------|--------------------
--       1 '.ALL'  ACC ARR      ||             |     XXXXXXXXX
--                --------------||-------------|--------------------
--                 ACC SCLR     ||             |
--      ========================||=============|====================
--                 ACC ACC REC  ||             |
--                --------------||-------------|--------------------
--       1 '.ALL'  ACC ACC ARR  ||             |
--                --------------||-------------|--------------------
--                 ACC ACC SCLR ||             |
--      ========================||=============|====================
--                 ACC ACC REC  ||             |
--                --------------||-------------|--------------------
--       2 '.ALL'  ACC ACC ARR  ||             |
--                --------------||-------------|--------------------
--                 ACC ACC SCLR ||             |
--      ============================================================


-- RM  1/22/82
-- RM  1/26/82
-- SPS 12/2/82


WITH REPORT;
USE REPORT;
PROCEDURE C41303N IS


BEGIN

     TEST ( "C41303N" , "CHECK THAT  L.ALL  , WHERE  L  IS THE NAME OF"
                      & " AN ACCESS OBJECT DESIGNATING A RECORD, AN"
                      & " ARRAY, OR A SCALAR,  IS ALLOWED AS"
                      & " ACTUAL PARAMETER OF ANY MODE" );


     -------------------------------------------------------------------
     --------------------  ACCESS TO ARRAY  ----------------------------

     DECLARE

          TYPE  ARR  IS  ARRAY(1..2) OF BOOLEAN ;

          ARR_CONST    :  ARR  :=  ( TRUE , FALSE );
          ARR_VAR      :  ARR  :=    ARR_CONST  ;
          ARR_VAR0     :  ARR  :=    ARR_CONST  ;

          TYPE  ACC_ARR  IS  ACCESS ARR ;

          ACC_ARR_VAR  :  ACC_ARR  :=  NEW ARR'( FALSE , TRUE );
          ACC_ARR_VAR0 :  ACC_ARR  :=  NEW ARR'( FALSE , TRUE );


          PROCEDURE  R_ASSIGN( R_IN    : IN      ARR ;
                               R_INOUT : IN OUT  ARR )  IS
          BEGIN
               ARR_VAR   :=  R_IN    ;
               ARR_VAR0  :=  R_INOUT ;
          END ;


          PROCEDURE  L_ASSIGN( L_OUT   :    OUT  ARR ;
                               L_INOUT : IN OUT  ARR )  IS
          BEGIN
               L_OUT   :=  ARR_CONST ;
               L_INOUT :=  ARR_CONST ;
          END ;

     BEGIN


          R_ASSIGN( ACC_ARR_VAR.ALL , ACC_ARR_VAR0.ALL );

          IF  ARR_VAR /= ( FALSE , TRUE )                   
          THEN
               FAILED( "ACC. ARRAY, RIGHT SIDE (1), WRONG VAL." );
          END IF;

          IF  ARR_VAR0 /= ( FALSE , TRUE )
          THEN
               FAILED( "ACC. ARRAY, RIGHT SIDE (2), WRONG VAL." );
          END IF;


          L_ASSIGN( ACC_ARR_VAR.ALL , ACC_ARR_VAR0.ALL );

          IF  ACC_ARR_VAR.ALL /= ( TRUE , FALSE )
          THEN
               FAILED( "ACC. ARRAY, LEFT SIDE (1), WRONG VAL." );
          END IF;


          IF  ACC_ARR_VAR0.ALL /= ( TRUE , FALSE )
          THEN
               FAILED( "ACC. ARRAY, LEFT SIDE (2), WRONG VAL." );
          END IF;


     END ;

     -------------------------------------------------------------------

     RESULT;


END C41303N;
