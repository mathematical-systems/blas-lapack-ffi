        SUBROUTINE cdlaset(uplo,
     $   m,
     $   n,
     $   alpha,
     $   beta,
     $   a,
     $   lda)
c
c       lapack_dlaset.c
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
        INTEGER  m
        INTEGER  n
        DOUBLE PRECISION  alpha
        DOUBLE PRECISION  beta
        DOUBLE PRECISION  a(*)
        INTEGER  lda

        CALL fdlaset(uplo,
     $   m,
     $   n,
     $   alpha,
     $   beta,
     $   a,
     $   lda)
        RETURN
        END
