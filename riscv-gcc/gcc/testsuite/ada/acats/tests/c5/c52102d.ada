-- C52102D.ADA

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
-- CHECK THAT THE ASSIGNMENT OF OVERLAPPING SOURCE AND TARGET VARIABLES
--    (INCLUDING ARRAYS AND SLICES IN VARIOUS COMBINATIONS) SATISFIES
--    THE SEMANTICS OF "COPY" ASSIGNMENT WHEN INITIAL ASSIGNMENT VALUES
--    REQUIRE RUN-TIME EVALUATION.   (THIS TEST IS IN TWO PARTS,
--    COVERING RESPECTIVELY STATIC AND DYNAMIC BOUNDS.)

-- PART 2:  DYNAMIC BOUNDS


-- RM 02/27/80
-- SPS 2/18/83
-- JBG 3/15/84
-- JBG 6/9/84
-- BHS 6/26/84

WITH REPORT;
PROCEDURE  C52102D  IS

     USE  REPORT; 
     IDENT_INT_0 : INTEGER := IDENT_INT(0);
     IDENT_INT_1 : INTEGER := IDENT_INT (1);
     IDENT_INT_2 : INTEGER := IDENT_INT (2);
     IDENT_INT_3 : INTEGER := IDENT_INT (3);
     IDENT_INT_4 : INTEGER := IDENT_INT (4);
     IDENT_INT_5 : INTEGER := IDENT_INT (5);
     IDENT_INT_6 : INTEGER := IDENT_INT (6);
     IDENT_INT_8 : INTEGER := IDENT_INT (8);
     IDENT_INT_9 : INTEGER := IDENT_INT (9);

     FUNCTION ID_I (X : INTEGER) RETURN INTEGER RENAMES IDENT_INT;
     FUNCTION ID_B (X : BOOLEAN) RETURN BOOLEAN RENAMES IDENT_BOOL;

BEGIN


     TEST( "C52102D" , "CHECK THAT THE ASSIGNMENT OF OVERLAPPING " &
                       "SOURCE AND TARGET VARIABLES (INCLUDING " &
                       "ARRAYS AND SLICES IN VARIOUS COMBINATIONS) " &
                       "SATISFIES THE SEMANTICS OF ""COPY"" " &
                       "ASSIGNMENT WHEN INITIAL ASSIGNMENT VALUES " &
                       "ARE DYNAMIC  (PART 2: DYNAMIC BOUNDS)" );

     -------------------------------------------------------------------
     --------------------  ARRAYS OF INTEGERS  -------------------------

     DECLARE
          A   :    ARRAY( 1..IDENT_INT_4 ) OF INTEGER; 

     BEGIN
          A   :=   ( ID_I(11),  ID_I(12),  ID_I(13),  ID_I(14) );
          A   :=   (  1   , A(IDENT_INT_1) , A(IDENT_INT_2) ,
                                              A(IDENT_INT_1) );
          IF  A /= (  1   ,  11  ,  12  ,  11  )  THEN
               FAILED( "WRONG VALUES  -  I1" );
          END IF;

          A   :=   (  ID_I(11),  ID_I(12),  ID_I(13),  ID_I(14) );
          A   :=   ( A(IDENT_INT_4) , A(IDENT_INT_3) ,
                                       A(IDENT_INT_4) ,  1   );
          IF  A /= (  14  ,  13  ,  14  ,  1   )  THEN
               FAILED( "WRONG VALUES  -  I2" );
          END IF;

     END; 


     DECLARE
          A   :    ARRAY( -4..IDENT_INT_4 ) OF INTEGER; 

     BEGIN
          A   :=  ( -ID_I(4), -ID_I(3), -ID_I(2), -ID_I(1),
                    ID_I(100), ID_I(1), ID_I(2), ID_I(3), ID_I(4));
          A(-4..IDENT_INT_0)  :=  A(IDENT_INT_0..4); 
          IF    A   /=  ( 100 , 1 , 2 , 3 , 4 , 1 , 2 , 3 , 4 )
          THEN
               FAILED( "WRONG VALUES  -  I3" );
          END IF;

          A   :=  ( -ID_I(4), -ID_I(3), -ID_I(2), -ID_I(1),
                    ID_I(100), ID_I(1), ID_I(2), ID_I(3), ID_I(4));
          A(IDENT_INT_0..4)   :=  A(-4..IDENT_INT_0); 
          IF    A   /=  ( -4 , -3 , -2 , -1 , -4  , -3 , -2 , -1 , 100 )
          THEN
               FAILED( "WRONG VALUES  -  I4" );
          END IF;

     END; 


     DECLARE
          TYPE INT_ARR IS ARRAY (INTEGER RANGE <>) OF INTEGER;
          A   :  INT_ARR (1..10);

     BEGIN
          A   :=  ( ID_I(1), ID_I(2), ID_I(3), ID_I(4), ID_I(5),
                    ID_I(6), ID_I(7), ID_I(8), ID_I(9), ID_I(10));
          A   :=  0  &  A(IDENT_INT_1..IDENT_INT_2)  &
                        A(IDENT_INT_1..IDENT_INT_2)  &
                        A(IDENT_INT_1..IDENT_INT_5); 
          IF     A  /=  ( 0 , 1 , 2 , 1 , 2 , 1 , 2 , 3 , 4 , 5  )
          THEN
               FAILED( "WRONG VALUES  -  I5" );
          END IF;

          A   :=  ( ID_I(1), ID_I(2), ID_I(3), ID_I(4), ID_I(5),
                    ID_I(6), ID_I(7), ID_I(8), ID_I(9), ID_I(10));
          A   :=  A(IDENT_INT_6..IDENT_INT_9)  &
                  A(IDENT_INT_8..IDENT_INT_9)  &
                  A(IDENT_INT_8..IDENT_INT_9)  &  0  &  0; 
          IF   A  /=  ( 6 , 7 , 8 , 9 , 8 , 9 , 8 , 9 , 0 , 0  )
          THEN
               FAILED( "WRONG VALUES  -  I6" );
          END IF;

     END; 


     -------------------------------------------------------------------
     --------------------  ARRAYS OF BOOLEANS  -------------------------

     DECLARE
          A   :    ARRAY( 1..4 ) OF BOOLEAN; 

     BEGIN
          A   :=   (ID_B(FALSE), ID_B(TRUE), ID_B(TRUE), ID_B(FALSE));
          A   :=   (  TRUE  , A(IDENT_INT_1) , A(IDENT_INT_2) ,
                                                A(IDENT_INT_1)  );
          IF  A /= (  TRUE  ,FALSE , TRUE , FALSE )
          THEN
               FAILED( "WRONG VALUES  -  B1" );
          END IF;

          A   :=   (ID_B(FALSE), ID_B(TRUE), ID_B(TRUE), ID_B(FALSE));
          A   :=   (  A(IDENT_INT_4)  , A(IDENT_INT_3) ,
                                         A(IDENT_INT_4) ,  TRUE );
          IF  A /= (  FALSE , TRUE , FALSE,  TRUE )
          THEN
               FAILED( "WRONG VALUES  -  B2" );
          END IF;

     END; 


     DECLARE
          A   :    ARRAY( -IDENT_INT_4..4 ) OF BOOLEAN; 

     BEGIN
          A  := (ID_B(FALSE), ID_B(FALSE), ID_B(FALSE), ID_B(FALSE),
                 ID_B(FALSE), ID_B(TRUE), ID_B(TRUE),
                 ID_B(TRUE), ID_B(TRUE));
          A(-IDENT_INT_4..IDENT_INT_0)  :=  A(IDENT_INT_0..4); 
          IF A /= (FALSE, TRUE, TRUE, TRUE, TRUE,TRUE, TRUE, TRUE,TRUE)
          THEN
               FAILED( "WRONG VALUES  -  B3" );
          END IF;

          A  := (ID_B(FALSE), ID_B(FALSE), ID_B(FALSE), ID_B(FALSE),
                 ID_B(TRUE), ID_B(TRUE), ID_B(TRUE),
                 ID_B(TRUE), ID_B(TRUE));
          A(IDENT_INT_0..4)   :=  A(-4..IDENT_INT_0); 
          IF A /= (FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE)
          THEN
               FAILED( "WRONG VALUES  -  B4" );
          END IF;

     END; 


     DECLARE
          TYPE B_ARR IS ARRAY (INTEGER RANGE <>) OF BOOLEAN;
          A  :  B_ARR (1..10); 

     BEGIN
          A := (ID_B(TRUE), ID_B(FALSE), ID_B(TRUE), ID_B(FALSE), 
                ID_B(TRUE), ID_B(FALSE), ID_B(TRUE), 
                ID_B(FALSE), ID_B(TRUE), ID_B(FALSE));
          A :=  FALSE  &  A(IDENT_INT_1..IDENT_INT_2)  &
                          A(IDENT_INT_1..IDENT_INT_2)  &
                          A(IDENT_INT_1..IDENT_INT_5); 
          IF A/=(FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE)
          THEN
               FAILED( "WRONG VALUES  -  B5" );
          END IF;

          A := (ID_B(TRUE), ID_B(FALSE), ID_B(TRUE), ID_B(FALSE),
                ID_B(TRUE), ID_B(FALSE), ID_B(TRUE),
                ID_B(FALSE), ID_B(TRUE), ID_B(FALSE));
          A :=  A(IDENT_INT_6..IDENT_INT_9)  &
                A(IDENT_INT_8..IDENT_INT_9)  &
                A(IDENT_INT_8..IDENT_INT_9)  &  FALSE  &  TRUE; 
          IF A/=(FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE)
          THEN
               FAILED( "WRONG VALUES  -  B6" );
          END IF;

     END; 


     -------------------------------------------------------------------
     --------------------  CHARACTER STRINGS  --------------------------

     DECLARE
          A   :    STRING( 1..4 ); 

     BEGIN
          IF EQUAL (3,3) THEN          
               A   :=   "ARGH"; 
          END IF;
          A   :=   (  'Q' , A(IDENT_INT_1) , A(IDENT_INT_2) ,
                                              A(IDENT_INT_1) );
          IF  A /= "QARA"  THEN
               FAILED( "WRONG VALUES  -  C1" );
          END IF;

          IF EQUAL (3,3) THEN
               A   :=   "ARGH"; 
          END IF;
          A   :=   ( A(IDENT_INT_4) , A(IDENT_INT_3) ,
                     A(IDENT_INT_4) , 'X' );
          IF  A /= "HGHX"  THEN
               FAILED( "WRONG VALUES  -  C2" );
          END IF;

     END; 


     DECLARE
          A   :    STRING( IDENT_INT(96)..104 );

     BEGIN
          IF EQUAL (3,3) THEN
               A  :=  "APHRODITE"; 
          END IF;
          A(IDENT_INT(96)..IDENT_INT(100))  :=  A(IDENT_INT(100)..
                                                  IDENT_INT(104)); 
          IF   A  /=  "ODITEDITE"   THEN
               FAILED( "WRONG VALUES  -  C3" );
          END IF;

          IF EQUAL (3,3) THEN
               A  :=  "APHRODITE"; 
          END IF;
          A(IDENT_INT(100)..IDENT_INT(104)) :=  A(IDENT_INT(96)..
                                                  IDENT_INT(100)) ; 
          IF   A  /=  "APHRAPHRO"   THEN
               FAILED( "WRONG VALUES  -  C4" );
          END IF;

     END; 


     DECLARE
          TYPE CH_ARR IS ARRAY (INTEGER RANGE <>) OF CHARACTER;
          A  :  CH_ARR (IDENT_INT_1..9); 

     BEGIN
          IF EQUAL (3,3) THEN
               A  :=  "CAMBRIDGE"; 
          END IF;
          A  :=  'S'  &  A(IDENT_INT_1..IDENT_INT_2)  &
                         A(IDENT_INT_1..IDENT_INT_2)  &
                         A(IDENT_INT_1..IDENT_INT_4); 
          IF  A  /=  "SCACACAMB"  THEN
               FAILED( "WRONG VALUES  -  C5" );
          END IF;

          IF EQUAL (3,3) THEN
               A  :=  "CAMBRIDGE"; 
          END IF;
          A  :=  A(IDENT_INT_8..IDENT_INT_8)  &
                 A(IDENT_INT_6..IDENT_INT_8)  &
                 A(IDENT_INT_6..IDENT_INT_8)  &  "EA"; 
          IF  A  /=  "GIDGIDGEA"  THEN
               FAILED( "WRONG VALUES  -  C6" );
          END IF;

     END; 


     RESULT; 


END C52102D; 
