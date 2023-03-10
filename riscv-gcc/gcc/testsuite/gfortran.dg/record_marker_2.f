! { dg-do run { target fd_truncate } }
! { dg-options "-frecord-marker=4" }
! This file is all about BACKSPACE
! Adapted from gfortran.dg/backspace.f

      integer i, n, nr
      real x(10), y(10)

! PR libfortran/20068
      open (20, status='scratch')
      write (20,*) 1
      write (20,*) 2
      write (20,*) 3
      rewind (20)
      read (20,*) i
      if (i .ne. 1) STOP 1
      backspace (20)
      read (20,*) i
      if (i .ne. 1) STOP 2
      close (20)

! PR libfortran/20125
      open (20, status='scratch')
      write (20,*) 7
      backspace (20)
      read (20,*) i
      if (i .ne. 7) STOP 3
      close (20)

      open (20, status='scratch', form='unformatted')
      write (20) 8
      backspace (20)
      read (20) i
      if (i .ne. 8) STOP 4
      close (20)

! PR libfortran/20471
      do n = 1, 10
        x(n) = sqrt(real(n))
      end do
      open (3, form='unformatted', status='scratch')
      write (3) (x(n),n=1,10)
      backspace (3)
      rewind (3)
      read (3) (y(n),n=1,10)

      do n = 1, 10
        if (abs(x(n)-y(n)) > 0.00001) STOP 5
      end do
      close (3)

! PR libfortran/20156
      open (3, form='unformatted', status='scratch')
      do i = 1, 5
        x(1) = i
        write (3) n, (x(n),n=1,10)
      end do
      nr = 0
      rewind (3)
  20  continue
      read (3,end=30,err=90) n, (x(n),n=1,10)
      nr = nr + 1
      goto 20
  30  continue
      if (nr .ne. 5) STOP 6

      do i = 1, nr+1
        backspace (3)
      end do

      do i = 1, nr
        read(3,end=70,err=90) n, (x(n),n=1,10)
        if (abs(x(1) - i) .gt. 0.001) STOP 7
      end do
      close (3)
      stop

  70  continue
      STOP 8
  90  continue
      STOP 9

      end
