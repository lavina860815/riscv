C Test Fortran 77 colon slash descriptor 
C      (ANSI X3.9-1978 Section 13.5.4)
C
C Origin: David Billinghurst <David.Billinghurst@riotinto.com>
C
C { dg-do run }
C { dg-output "^123(\n|\r\n|\r)45(\n|\r\n|\r)\$" }
      write(*,'(3(I1)/2(I1))')  (I,I=1,5)
      end
