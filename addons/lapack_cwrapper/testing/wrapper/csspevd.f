        SUBROUTINE csspevd(jobz,
     $   uplo,
     $   n,
     $   ap,
     $   w,
     $   z,
     $   ldz,
     $   work,
     $   lwork,
     $   iwork,
     $   liwork,
     $   info)
c
c       lapack_sspevd.c
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
        CHARACTER  uplo
        INTEGER  n
        REAL  ap(*)
        REAL  w(*)
        REAL  z(*)
        INTEGER  ldz
        REAL  work(*)
        INTEGER  lwork
        INTEGER  iwork(*)
        INTEGER  liwork
        INTEGER  info

        CALL fsspevd(jobz,
     $   uplo,
     $   n,
     $   ap,
     $   w,
     $   z,
     $   ldz,
     $   work,
     $   lwork,
     $   iwork,
     $   liwork,
     $   info)
        RETURN
        END
