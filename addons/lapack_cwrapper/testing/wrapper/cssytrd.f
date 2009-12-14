        SUBROUTINE cssytrd(uplo,
     $   n,
     $   a,
     $   lda,
     $   d,
     $   e,
     $   tau,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_ssytrd.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  uplo
        INTEGER  n
        REAL  a(*)
        INTEGER  lda
        REAL  d(*)
        REAL  e(*)
        REAL  tau(*)
        REAL  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fssytrd(uplo,
     $   n,
     $   a,
     $   lda,
     $   d,
     $   e,
     $   tau,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
