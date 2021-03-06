        SUBROUTINE cchpgvd(itype,
     $   jobz,
     $   uplo,
     $   n,
     $   ap,
     $   bp,
     $   w,
     $   z,
     $   ldz,
     $   work,
     $   lwork,
     $   rwork,
     $   lrwork,
     $   iwork,
     $   liwork,
     $   info)
c
c       lapack_chpgvd.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  itype
        CHARACTER  jobz
        CHARACTER  uplo
        INTEGER  n
        COMPLEX  ap(*)
        COMPLEX  bp(*)
        REAL  w(*)
        COMPLEX  z(*)
        INTEGER  ldz
        COMPLEX  work(*)
        INTEGER  lwork
        REAL  rwork(*)
        INTEGER  lrwork
        INTEGER  iwork(*)
        INTEGER  liwork
        INTEGER  info

        CALL fchpgvd(itype,
     $   jobz,
     $   uplo,
     $   n,
     $   ap,
     $   bp,
     $   w,
     $   z,
     $   ldz,
     $   work,
     $   lwork,
     $   rwork,
     $   lrwork,
     $   iwork,
     $   liwork,
     $   info)
        RETURN
        END
