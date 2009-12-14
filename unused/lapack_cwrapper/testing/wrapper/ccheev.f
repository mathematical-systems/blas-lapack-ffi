        SUBROUTINE ccheev(jobz,
     $   uplo,
     $   n,
     $   a,
     $   lda,
     $   w,
     $   work,
     $   lwork,
     $   rwork,
     $   info)
c
c       lapack_cheev.c
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
        COMPLEX  a(*)
        INTEGER  lda
        REAL  w(*)
        COMPLEX  work(*)
        INTEGER  lwork
        REAL  rwork(*)
        INTEGER  info

        CALL fcheev(jobz,
     $   uplo,
     $   n,
     $   a,
     $   lda,
     $   w,
     $   work,
     $   lwork,
     $   rwork,
     $   info)
        RETURN
        END
