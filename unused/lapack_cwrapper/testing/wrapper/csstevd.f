        SUBROUTINE csstevd(jobz,
     $   n,
     $   d,
     $   e,
     $   z,
     $   ldz,
     $   work,
     $   lwork,
     $   iwork,
     $   liwork,
     $   info)
c
c       lapack_sstevd.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  jobz
        INTEGER  n
        REAL  d(*)
        REAL  e(*)
        REAL  z(*)
        INTEGER  ldz
        REAL  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  liwork
        INTEGER  info

        CALL fsstevd(jobz,
     $   n,
     $   d,
     $   e,
     $   z,
     $   ldz,
     $   work,
     $   lwork,
     $   iwork,
     $   liwork,
     $   info)
        RETURN
        END
