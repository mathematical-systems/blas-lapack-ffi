        SUBROUTINE csormtr(side,
     $   uplo,
     $   trans,
     $   m,
     $   n,
     $   a,
     $   lda,
     $   tau,
     $   c,
     $   ldc,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_sormtr.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  side
        CHARACTER  uplo
        CHARACTER  trans
        INTEGER  m
        INTEGER  n
        REAL  a(*)
        INTEGER  lda
        REAL  tau(*)
        REAL  c(*)
        INTEGER  ldc
        REAL  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fsormtr(side,
     $   uplo,
     $   trans,
     $   m,
     $   n,
     $   a,
     $   lda,
     $   tau,
     $   c,
     $   ldc,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
