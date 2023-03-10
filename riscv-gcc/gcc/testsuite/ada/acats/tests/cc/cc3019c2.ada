-- CC3019C2M.ADA

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
--   CHECK INSTANTIATIONS OF UNITS WITHIN GENERIC UNITS, E.G.
--   TO SUPPORT ITERATORS.

--  THIS TEST SPECIFICALLY CHECKS THAT A
--  NESTING LEVEL OF 3 IS SUPPORTED FOR GENERICS:
--       INSTANTIATE CC3019C1_NESTED_GENERICS IN THE MAIN
--       PROCEDURE, THE INSTANTIATION OF CC3019C0_LIST_CLASS
--       IN GENERIC PACKAGE CC3019C1_NESTED_GENERICS, AND
--       THE INSTANTIATION OF NEW_LIST_CLASS.ITERATE IN
--       PROCEDURE ITERATE IN PACKAGE BODY STACK_CLASS.
--
--  *** THIS IS THE MAIN PROGRAM. IT MUST BE COMPILED AFTER THE
--  *** SOURCE CODE IN FILES CC3019C0.ADA AND CC3019C1.ADA HAVE
--  *** BEEN COMPILED.
--
-- HISTORY:
--         EDWARD V. BERARD, 31 AUGUST 1990

WITH REPORT ;
WITH CC3019C1_NESTED_GENERICS ;

PROCEDURE CC3019C2M IS

     TYPE MONTH_TYPE IS (JAN, FEB, MAR, APR, MAY, JUN, JUL, AUG,
                         SEP, OCT, NOV, DEC) ;
     TYPE DAY_TYPE IS RANGE 1 .. 31 ;
     TYPE YEAR_TYPE IS RANGE 1904 .. 2050 ;
     TYPE DATE IS RECORD
          MONTH : MONTH_TYPE ;
          DAY   : DAY_TYPE ;
          YEAR  : YEAR_TYPE ;
     END RECORD ;

     STORE_DATE   : DATE ;

     TODAY        : DATE := (MONTH => AUG,
                             DAY   => 31,
                             YEAR  => 1990) ;

     FIRST_DATE   : DATE := (MONTH => JUN,
                             DAY   => 4,
                             YEAR  => 1967) ;

     BIRTH_DATE   : DATE := (MONTH => OCT,
                             DAY   => 3,
                             YEAR  => 1949) ;

     WALL_DATE    : DATE := (MONTH => NOV,
                             DAY   => 9,
                             YEAR  => 1989) ;

     TYPE SEX IS (MALE, FEMALE) ;

     TYPE PERSON IS RECORD
          BIRTH_DATE : DATE ;
          GENDER     : SEX ;
          NAME       : STRING (1 .. 10) ;
     END RECORD ;

     FIRST_PERSON  : PERSON ;
     SECOND_PERSON : PERSON ;

     MYSELF      : PERSON := (BIRTH_DATE => BIRTH_DATE,
                              GENDER     => MALE,
                              NAME        => "ED        ") ;

     FRIEND      : PERSON := (BIRTH_DATE => DATE'(DEC, 27, 1949),
                              GENDER     => MALE,
                              NAME        => "DENNIS    ") ;

     FATHER      : PERSON := (BIRTH_DATE => DATE'(JUL, 5, 1925),
                              GENDER     => MALE,
                              NAME        => "EDWARD    ") ;

     DAUGHTER    : PERSON := (BIRTH_DATE => DATE'(DEC, 10, 1980),
                              GENDER     => FEMALE,
                              NAME       => "CHRISSY   ") ;

     PROCEDURE ASSIGN (THE_VALUE_OF_THIS_DATE    : IN OUT DATE ;
                       TO_THIS_DATE              : IN OUT DATE) ;

     FUNCTION IS_EQUAL (LEFT  : IN DATE ;
                        RIGHT : IN DATE) RETURN BOOLEAN ;

     PROCEDURE ASSIGN (THE_VALUE_OF_THIS_PERSON  : IN OUT PERSON ;
                       TO_THIS_PERSON            : IN OUT PERSON) ;

     FUNCTION IS_EQUAL (LEFT  : IN PERSON ;
                        RIGHT : IN PERSON) RETURN BOOLEAN ;

--  INSTANTIATE OUTER GENERIC PACKAGE

     PACKAGE NEW_NESTED_GENERICS IS NEW
          CC3019C1_NESTED_GENERICS (ELEMENT => DATE,
                                    ASSIGN  => ASSIGN,
                                    "="     => IS_EQUAL) ;

     FIRST_NNG  : NEW_NESTED_GENERICS.NESTED_GENERICS_TYPE ;
     SECOND_NNG : NEW_NESTED_GENERICS.NESTED_GENERICS_TYPE ;

     FUNCTION "=" (LEFT  : IN NEW_NESTED_GENERICS.NESTED_GENERICS_TYPE ;
                   RIGHT : IN NEW_NESTED_GENERICS.NESTED_GENERICS_TYPE)
                   RETURN BOOLEAN RENAMES NEW_NESTED_GENERICS."=" ;

--  INSTANTIATE NESTED TASK PACKAGE

     PACKAGE NEW_GENERIC_TASK IS NEW
          NEW_NESTED_GENERICS.GENERIC_TASK (ELEMENT => PERSON,
                                            ASSIGN  => ASSIGN) ;

     FIRST_GENERIC_TASK  : NEW_GENERIC_TASK.PROTECTED_AREA ;
     SECOND_GENERIC_TASK : NEW_GENERIC_TASK.PROTECTED_AREA ;

--  INSTANTIATE NESTED STACK PACKAGE

     PACKAGE PERSON_STACK IS NEW
          NEW_NESTED_GENERICS.STACK_CLASS (ELEMENT => PERSON,
                                           ASSIGN  => ASSIGN,
                                           "="     => IS_EQUAL) ;

     FIRST_PERSON_STACK  : PERSON_STACK.STACK ;
     SECOND_PERSON_STACK : PERSON_STACK.STACK ;
     THIRD_PERSON_STACK  : PERSON_STACK.STACK ;

     FUNCTION "=" (LEFT  : IN PERSON_STACK.STACK ;
                   RIGHT : IN PERSON_STACK.STACK) RETURN BOOLEAN
              RENAMES PERSON_STACK."=" ;

     PROCEDURE ASSIGN (THE_VALUE_OF_THIS_DATE    : IN OUT DATE ;
                       TO_THIS_DATE              : IN OUT DATE) IS

     BEGIN -- ASSIGN

          TO_THIS_DATE := THE_VALUE_OF_THIS_DATE ;

     END ASSIGN ;

     FUNCTION IS_EQUAL (LEFT  : IN DATE ;
                        RIGHT : IN DATE) RETURN BOOLEAN IS

     BEGIN -- IS_EQUAL

          IF (LEFT.MONTH = RIGHT.MONTH) AND (LEFT.DAY = RIGHT.DAY)
             AND (LEFT.YEAR = RIGHT.YEAR) THEN
               RETURN TRUE ;
          ELSE
               RETURN FALSE ;
          END IF ;

     END IS_EQUAL ;

     PROCEDURE ASSIGN (THE_VALUE_OF_THIS_PERSON  : IN OUT PERSON ;
                       TO_THIS_PERSON            : IN OUT PERSON) IS

     BEGIN -- ASSIGN

          TO_THIS_PERSON := THE_VALUE_OF_THIS_PERSON ;

     END ASSIGN ;

     FUNCTION IS_EQUAL (LEFT  : IN PERSON ;
                        RIGHT : IN PERSON) RETURN BOOLEAN IS

     BEGIN -- IS_EQUAL

          IF (LEFT.BIRTH_DATE = RIGHT.BIRTH_DATE) AND
             (LEFT.GENDER = RIGHT.GENDER) AND
             (LEFT.NAME = RIGHT.NAME) THEN
               RETURN TRUE ;
          ELSE
               RETURN FALSE ;
          END IF ;

     END IS_EQUAL ;

BEGIN  -- CC3019C2M

     REPORT.TEST ("CC3019C2M",
                  "CHECK INSTANTIATIONS OF UNITS WITHIN GENERIC " &
                  "UNITS, E.G., TO SUPPORT ITERATORS. THIS TEST " &
                  "SPECIFICALLY CHECKS THAT A NESTING LEVEL OF 3 " &
                  "IS SUPPORTED FOR GENERICS.") ;

-- CHECK THE OUTERMOST GENERIC (NEW_NESTED_GENERICS)

     NEW_NESTED_GENERICS.SET_ELEMENT (
          FOR_THIS_NGT_OBJECT => FIRST_NNG,
          TO_THIS_ELEMENT     => TODAY) ;
     NEW_NESTED_GENERICS.SET_NUMBER (
          FOR_THIS_NGT_OBJECT => FIRST_NNG,
          TO_THIS_NUMBER      => 1) ;

     NEW_NESTED_GENERICS.SET_ELEMENT (
          FOR_THIS_NGT_OBJECT => SECOND_NNG,
          TO_THIS_ELEMENT     => FIRST_DATE) ;
     NEW_NESTED_GENERICS.SET_NUMBER  (
          FOR_THIS_NGT_OBJECT => SECOND_NNG,
          TO_THIS_NUMBER      => 2) ;

     IF FIRST_NNG = SECOND_NNG THEN
          REPORT.FAILED ("PROBLEMS WITH TESTING EQUALITY FOR " &
                         "OUTERMOST GENERIC") ;
     END IF ;

     IF (NEW_NESTED_GENERICS.ELEMENT_OF (THIS_NGT_OBJECT => FIRST_NNG)
             /= TODAY) OR
        (NEW_NESTED_GENERICS.ELEMENT_OF (
                THIS_NGT_OBJECT => SECOND_NNG)
             /= FIRST_DATE) THEN
             REPORT.FAILED ("PROBLEMS WITH EXTRACTING ELEMENTS IN " &
                            "OUTERMOST GENERIC") ;
     END IF ;

     IF (NEW_NESTED_GENERICS.NUMBER_OF (THIS_NGT_OBJECT => FIRST_NNG)
             /= 1) OR
        (NEW_NESTED_GENERICS.NUMBER_OF (THIS_NGT_OBJECT => SECOND_NNG)
             /= 2) THEN
             REPORT.FAILED ("PROBLEMS WITH EXTRACTING NUMBERS IN " &
                             "OUTERMOST GENERIC") ;
     END IF ;

     NEW_NESTED_GENERICS.COPY (SOURCE        => FIRST_NNG,
                               DESTINATION    => SECOND_NNG) ;

     IF FIRST_NNG /= SECOND_NNG THEN
          REPORT.FAILED ("PROBLEMS WITH COPYING OR TESTING EQUALITY " &
                         "IN OUTERMOST GENERIC") ;
     END IF ;

-- CHECK THE FIRST NESTED GENERIC (GENERIC_TASK)

     FIRST_GENERIC_TASK.STORE  (ITEM => MYSELF) ;
     SECOND_GENERIC_TASK.STORE (ITEM => FRIEND) ;

     FIRST_GENERIC_TASK.GET  (ITEM => FIRST_PERSON) ;
     SECOND_GENERIC_TASK.GET (ITEM => SECOND_PERSON) ;

     IF (FIRST_PERSON /= MYSELF) OR (SECOND_PERSON /= FRIEND) THEN
          REPORT.FAILED ("PROBLEMS WITH NESTED TASK GENERIC") ;
     END IF ;

-- CHECK THE SECOND NESTED GENERIC (STACK_CLASS)

     PERSON_STACK.CLEAR (THIS_STACK => FIRST_PERSON_STACK) ;
     IF PERSON_STACK.NUMBER_OF_ELEMENTS
        (ON_THIS_STACK => FIRST_PERSON_STACK) /= 0 THEN
          REPORT.FAILED (
               "IMPROPER VALUE RETURNED FROM NUMBER_OF_ELEMENTS - 1") ;
     END IF ;

     PERSON_STACK.PUSH (THIS_ELEMENT     => MYSELF,
                            ON_TO_THIS_STACK => FIRST_PERSON_STACK) ;
     IF PERSON_STACK.NUMBER_OF_ELEMENTS
        (ON_THIS_STACK => FIRST_PERSON_STACK) /= 1 THEN
          REPORT.FAILED (
               "IMPROPER VALUE RETURNED FROM NUMBER_OF_ELEMENTS - 2") ;
     END IF ;

     PERSON_STACK.PUSH (THIS_ELEMENT     => FRIEND,
                            ON_TO_THIS_STACK => FIRST_PERSON_STACK) ;
     IF PERSON_STACK.NUMBER_OF_ELEMENTS
        (ON_THIS_STACK => FIRST_PERSON_STACK) /= 2 THEN
          REPORT.FAILED (
               "IMPROPER VALUE RETURNED FROM NUMBER_OF_ELEMENTS - 3") ;
     END IF ;

     PERSON_STACK.PUSH (THIS_ELEMENT     => FATHER,
                            ON_TO_THIS_STACK => FIRST_PERSON_STACK) ;
     IF PERSON_STACK.NUMBER_OF_ELEMENTS
        (ON_THIS_STACK => FIRST_PERSON_STACK) /= 3 THEN
          REPORT.FAILED (
               "IMPROPER VALUE RETURNED FROM NUMBER_OF_ELEMENTS - 4") ;
     END IF ;

     PERSON_STACK.POP (THIS_ELEMENT   => FIRST_PERSON,
                           OFF_THIS_STACK => FIRST_PERSON_STACK) ;
     IF PERSON_STACK.NUMBER_OF_ELEMENTS
        (ON_THIS_STACK => FIRST_PERSON_STACK) /= 2 THEN
          REPORT.FAILED (
               "IMPROPER VALUE RETURNED FROM NUMBER_OF_ELEMENTS - 5") ;
     END IF ;

     IF FIRST_PERSON /= FATHER THEN
          REPORT.FAILED (
               "IMPROPER VALUE REMOVED FROM STACK - 1") ;
     END IF ;

     PERSON_STACK.CLEAR (THIS_STACK => SECOND_PERSON_STACK) ;
     IF PERSON_STACK.NUMBER_OF_ELEMENTS
        (ON_THIS_STACK => SECOND_PERSON_STACK) /= 0 THEN
          REPORT.FAILED (
               "IMPROPER VALUE RETURNED FROM NUMBER_OF_ELEMENTS - 6") ;
     END IF ;

     PERSON_STACK.COPY (THIS_STACK    => FIRST_PERSON_STACK,
                            TO_THIS_STACK => SECOND_PERSON_STACK) ;

     IF FIRST_PERSON_STACK /= SECOND_PERSON_STACK THEN
          REPORT.FAILED (
               "PROBLEMS WITH COPY OR TEST FOR EQUALITY (STACK)") ;
     END IF ;

     PERSON_STACK.POP (THIS_ELEMENT   => FIRST_PERSON,
                       OFF_THIS_STACK => SECOND_PERSON_STACK) ;
     PERSON_STACK.PUSH (THIS_ELEMENT     => DAUGHTER,
                        ON_TO_THIS_STACK => SECOND_PERSON_STACK) ;
     IF FIRST_PERSON_STACK = SECOND_PERSON_STACK THEN
          REPORT.FAILED (
               "PROBLEMS WITH POP OR TEST FOR EQUALITY (STACK)") ;
     END IF ;

     UNDERFLOW_EXCEPTION_TEST:

     BEGIN  -- UNDERFLOW_EXCEPTION_TEST

          PERSON_STACK.CLEAR (THIS_STACK => THIRD_PERSON_STACK) ;
          PERSON_STACK.POP (THIS_ELEMENT    => FIRST_PERSON,
                            OFF_THIS_STACK  => THIRD_PERSON_STACK) ;
          REPORT.FAILED ("UNDERFLOW EXCEPTION NOT RAISED") ;

     EXCEPTION

          WHEN PERSON_STACK.UNDERFLOW => NULL ;  -- CORRECT EXCEPTION
                                                 -- RAISED
          WHEN OTHERS =>
               REPORT.FAILED ("INCORRECT EXCEPTION RAISED IN " &
                              "UNDERFLOW EXCEPTION TEST") ;

     END UNDERFLOW_EXCEPTION_TEST ;

     OVERFLOW_EXCEPTION_TEST:

     BEGIN  -- OVERFLOW_EXCEPTION_TEST

          PERSON_STACK.CLEAR (THIS_STACK => THIRD_PERSON_STACK) ;
          FOR INDEX IN 1 .. 10 LOOP
               PERSON_STACK.PUSH (
                    THIS_ELEMENT     => MYSELF,
                    ON_TO_THIS_STACK => THIRD_PERSON_STACK) ;
          END LOOP ;

          PERSON_STACK.PUSH (THIS_ELEMENT     => MYSELF,
                             ON_TO_THIS_STACK => THIRD_PERSON_STACK) ;
          REPORT.FAILED ("OVERFLOW EXCEPTION NOT RAISED") ;

     EXCEPTION

          WHEN PERSON_STACK.OVERFLOW => NULL ;  -- CORRECT EXCEPTION
                                                -- RAISED
          WHEN OTHERS =>
               REPORT.FAILED ("INCORRECT EXCEPTION RAISED IN " &
                              "OVERFLOW EXCEPTION TEST") ;

     END OVERFLOW_EXCEPTION_TEST ;

     LOCAL_BLOCK:

     DECLARE

          TYPE PERSON_TABLE IS ARRAY (POSITIVE RANGE 1 .. 10) OF PERSON;

          FIRST_PERSON_TABLE : PERSON_TABLE ;

          TABLE_INDEX : POSITIVE := 1 ;

          PROCEDURE GATHER_PEOPLE (THIS_PERSON : IN  PERSON ;
                                   CONTINUE    : OUT BOOLEAN) ;

          PROCEDURE SHOW_PEOPLE (THIS_PERSON  : IN  PERSON ;
                                 CONTINUE     : OUT BOOLEAN) ;

          PROCEDURE GATHER_PERSON_ITERATE IS NEW
               PERSON_STACK.ITERATE (PROCESS => GATHER_PEOPLE) ;

          PROCEDURE SHOW_PERSON_ITERATE IS NEW
               PERSON_STACK.ITERATE (PROCESS => SHOW_PEOPLE) ;

          PROCEDURE GATHER_PEOPLE (THIS_PERSON : IN  PERSON ;
                                   CONTINUE    : OUT BOOLEAN) IS
          BEGIN  -- GATHER_PEOPLE

               FIRST_PERSON_TABLE (TABLE_INDEX) := THIS_PERSON ;
               TABLE_INDEX := TABLE_INDEX + 1 ;

               CONTINUE := TRUE ;

          END GATHER_PEOPLE ;

          PROCEDURE SHOW_PEOPLE (THIS_PERSON  : IN  PERSON ;
                                 CONTINUE     : OUT BOOLEAN) IS

          BEGIN  -- SHOW_PEOPLE

               REPORT.COMMENT ("THE BIRTH MONTH IS " &
                    MONTH_TYPE'IMAGE (THIS_PERSON.BIRTH_DATE.MONTH)) ;
               REPORT.COMMENT ("THE BIRTH DAY IS " &
                    DAY_TYPE'IMAGE (THIS_PERSON.BIRTH_DATE.DAY)) ;
               REPORT.COMMENT ("THE BIRTH YEAR IS " &
                    YEAR_TYPE'IMAGE (THIS_PERSON.BIRTH_DATE.YEAR)) ;
               REPORT.COMMENT ("THE GENDER IS " &
                    SEX'IMAGE (THIS_PERSON.GENDER)) ;
               REPORT.COMMENT ("THE NAME IS " & THIS_PERSON.NAME) ;

               CONTINUE := TRUE ;

          END SHOW_PEOPLE ;

     BEGIN  -- LOCAL_BLOCK

          REPORT.COMMENT ("CONTENTS OF THE FIRST STACK") ;
          SHOW_PERSON_ITERATE (OVER_THIS_STACK => FIRST_PERSON_STACK) ;

          REPORT.COMMENT ("CONTENTS OF THE SECOND STACK") ;
          SHOW_PERSON_ITERATE (OVER_THIS_STACK => SECOND_PERSON_STACK) ;

          GATHER_PERSON_ITERATE (OVER_THIS_STACK => FIRST_PERSON_STACK);
          IF (FIRST_PERSON_TABLE (1) /= MYSELF) OR
             (FIRST_PERSON_TABLE (2) /= FRIEND) THEN
               REPORT.FAILED ("PROBLEMS WITH ITERATION - 1") ;
          END IF ;

          TABLE_INDEX := 1 ;
          GATHER_PERSON_ITERATE(OVER_THIS_STACK => SECOND_PERSON_STACK);
          IF (FIRST_PERSON_TABLE (1) /= MYSELF) OR
             (FIRST_PERSON_TABLE (2) /= DAUGHTER) THEN
               REPORT.FAILED ("PROBLEMS WITH ITERATION - 2") ;
          END IF ;

     END LOCAL_BLOCK ;

     REPORT.RESULT ;

END CC3019C2M ;
