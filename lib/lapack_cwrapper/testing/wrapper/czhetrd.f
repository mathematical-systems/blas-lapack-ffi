        SUBROUTINE czhetrd(uplo,
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
c       lapack_zhetrd.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        COMPLEX*16  tau(*)
        COMPLEX*16  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fzhetrd(uplo,
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
