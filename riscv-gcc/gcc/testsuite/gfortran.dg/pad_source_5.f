c { dg-do run }
c { dg-options "-ffixed-line-length-0" }
      character(80) a
      a = 'abc
     +def'
      if (a .ne. 'abcdef') stop 1
      end
