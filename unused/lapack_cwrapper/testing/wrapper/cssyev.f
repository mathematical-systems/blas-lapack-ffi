        SUBROUTINE cssyev(jobz,
     $   uplo,
     $   n,
     $   a,
     $   lda,
     $   w,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_ssyev.c
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
        REAL  a(*)
        INTEGER  lda
        REAL  w(*)
        REAL  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fssyev(jobz,
     $   uplo,
     $   n,
     $   a,
     $   lda,
     $   w,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
