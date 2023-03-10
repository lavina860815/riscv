! { dg-do run }
! { dg-skip-if "" { *-*-* } { "*" } { "-DACC_MEM_SHARED=0" } }

program refcount_test
  use openacc
  integer, allocatable :: h(:)
  integer i, N

  N = 256
  allocate (h(N))

  do i = 1, N
     h(i) = i
  end do

  !$acc enter data create (h(1:N))
  !$acc enter data copyin (h(1:N))
  !$acc enter data copyin (h(1:N))
  !$acc enter data copyin (h(1:N))

  call acc_update_self (h)
  do i = 1, N
     if (h(i) .eq. i) c = c + 1
  end do
  ! h[] should be filled with uninitialized device values,
  ! 'stop' if it's not.
  if (c .eq. N) stop 1

  h(:) = 0

  !$acc parallel present (h(1:N))
  do i = 1, N
     h(i) = 111
  end do
  !$acc end parallel

  ! No actual copyout should happen.
  call acc_copyout (h)
  do i = 1, N
     if (h(i) .ne. 0) stop 2
  end do

  !$acc exit data delete (h(1:N))

  ! This should not actually be deleted yet.
  if (acc_is_present (h) .eqv. .FALSE.) stop 3

  !$acc exit data copyout (h(1:N)) finalize

  do i = 1, N
     if (h(i) .ne. 111) stop 4
  end do

  if (acc_is_present (h) .eqv. .TRUE.) stop 5

end program refcount_test
