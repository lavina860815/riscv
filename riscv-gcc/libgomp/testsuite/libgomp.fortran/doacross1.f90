! { dg-do run }

  integer, parameter :: N = 256
  integer, save :: a(N), b(N / 16, 8, 4), c(N / 32, 8, 8)
  integer, save, volatile :: d, e
  integer :: i, j, k, l, m
  integer :: m1, m2, m3, m4, m5, m6, m7, m8
  integer :: m9, m10, m11, m12, m13, m14, m15, m16
  d = 0
  e = 0
  !$omp parallel private (l) shared(k)
    !$omp do schedule(static, 1) ordered(1)
    do i = 1, N
      !$omp atomic write
      a(i) = 1
      !$omp ordered depend ( sink : i - 1 )
      if (i.gt.1) then
        !$omp atomic read
        l = a(i - 1)
        if (l.lt.2) stop 1
      end if
      !$omp atomic write
      a(i) = 2
      if (i.lt.N) then
        !$omp atomic read
        l = a(i + 1)
        if (l.eq.3) stop 2
      end if
      !$omp ordered depend(source)
      !$omp atomic write
      a(i) = 3
    end do
    !$omp end do nowait
    !$omp do schedule(static) ordered ( 3 )
    do i = 3, N / 16 - 1
      do j = 1, 8, 2
        do k = 2, 4
          !$omp atomic write
          b(i, j, k) = 1
          !$omp ordered depend(sink:i,j-2,k-1) &
          !$omp& depend(sink: i - 2, j - 2, k + 1)
          !$omp ordered depend(sink:i-3,j+2,k-2)
          if (j.gt.2.and.k.gt.2) then
            !$omp atomic read
            l = b(i,j-2,k-1)
            if (l.lt.2) stop 3
          end if
          !$omp atomic write
          b(i,j,k) = 2
          if (i.gt.4.and.j.gt.2.and.k.lt.4) then
            !$omp atomic read
            l = b(i-2,j-2, k+1)
            if (l.lt.2) stop 4
          end if
          if (i.gt.5.and.j.le.N/16-3.and.k.eq.4) then
            !$omp atomic read
            l = b( i - 3, j+2, k-2)
            if (l.lt.2) stop 5
          end if
          !$omp ordered depend(source)
          !$omp atomic write
          b(i, j, k) = 3
        end do
      end do
    end do
    !$omp end do nowait
    !$omp do schedule(dynamic, 15) collapse(2) ordered(13)
    do i = 1, N / 32
      do j = 8, 3, -1
        do k = 7, 1, -2
          do m1 = 4, 4
          do m2 = 4, 4
          do m3 = 4, 4
          do m4 = 4, 4
          do m5 = 4, 4
          do m6 = 4, 4
          do m7 = 4, 4
          do m8 = 4, 4
          do m9 = 4, 4
          do m10 = 4, 4
          do m11 = 4, 4
          do m12 = 4, 4
          do m13 = 4, 4
          do m14 = 4, 4
          do m15 = 4, 4
          do m16 = 4, 4
            !$omp atomic write
            c(i, j, k) = 1
            !$omp ordered depend(sink: i, j, k + 2, m1, m2, m3, m4, &
            !$omp & m5, m6, m7, m8, m9, m10) &
            !$omp depend(sink: i - 2, j + 1, k - 4, m1,m2,m3,m4,m5, &
            !$omp & m6,m7,m8,m9,m10) depend ( sink : i-1,j-2,k-2, &
            !$omp& m1,m2,m3,m4 , m5, m6,m7,m8,m9,m10 )
            if (k.le.5) then
              !$omp atomic read
              l = c(i, j, k + 2)
              if (l.lt.2) stop 6
            end if
            !$omp atomic write
            c(i, j, k) = 2
            if (i.ge.3.and.j.lt.8.and.k.ge.5) then
              !$omp atomic read
              l = c(i - 2, j + 1, k - 4)
              if (l.lt.2) stop 7
            end if
            if (i.ge.2.and.j.ge.5.and.k.ge.3) then
              !$omp atomic read
              l = c(i - 1, j - 2, k - 2)
              if (l.lt.2) stop 8
            end if
            !$omp ordered depend ( source )
            !$omp atomic write
            c(i,j,k)=3
          end do
          end do
          end do
          end do
          end do
          end do
          end do
          end do
          end do
          end do
          end do
          end do
          end do
          end do
          end do
          end do
        end do
      end do
    end do
    !$omp do collapse(2) ordered(4) lastprivate (i,j,k)
    do i = 0, d
      do j = d + 1, 0, -1
        do k = 0, d - 1
          do l = 0, d + 1
            !$omp ordered depend(source)
            !$omp ordered depend(sink: i-2,j+2,k-2,l)
            if (e.eq.0) stop 9
          end do
        end do
      end do
    end do
    !$omp single
    if (i.ne.1.or.j.ne.-1.or.k.ne.0) stop 10
    i = 8; j = 9; k = 10
    !$omp end single
    !$omp do ordered(4) collapse(2) lastprivate (i, j, k, m)
    do i = 0, d
      do j = d + 1, 0, -1
        do k = 0, d + 1
          do m = 0, d-1
            !$omp ordered depend(source)
            !$omp ordered depend(sink: i - 2, j + 2, k - 2, m)
            stop 11
          end do
        end do
      end do
    end do
    !$omp single
    if (i.ne.1.or.j.ne.-1.or.k.ne.2.or.m.ne.0) stop 12
    !$omp end single
    !$omp do collapse(2) ordered(4) lastprivate (i,j,k)
    do i = 0, d
      do j = d, 1, -1
        do k = 0, d + 1
          do l = 0, d + 3
            !$omp ordered depend(source)
            !$omp ordered depend(sink: i-2,j+2,k-2,l)
            if (e.eq.0) stop 13
          end do
        end do
      end do
    end do
    !$omp end do nowait
    !$omp do
    do i = 1, N
      if (a(i) .ne. 3) stop 14
    end do
    !$omp end do nowait
    !$omp do collapse(2) private(k)
    do i = 1, N / 16
      do j = 1, 8
        do k = 1, 4
          if (i.ge.3.and.i.lt.N/16.and.iand(j,1).ne.0.and.k.ge.2) then
            if (b(i,j,k).ne.3) stop 15
          else
            if (b(i,j,k).ne.0) stop 16
          end if
        end do
      end do
    end do
    !$omp end do nowait
    !$omp do collapse(3)
    do i = 1, N / 32
      do j = 1, 8
        do k = 1, 4
          if (j.ge.3.and.iand(k,1).ne.0) then
            if (c(i,j,k).ne.3) stop 17
          else
            if (c(i,j,k).ne.0) stop 18
          end if
        end do
      end do
    end do
    !$omp end do nowait
  !$omp end parallel
end
