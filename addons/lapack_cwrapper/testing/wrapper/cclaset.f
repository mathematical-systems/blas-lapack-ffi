        SUBROUTINE cclaset(uplo,
     $   m,
     $   n,
     $   alpha,
     $   beta,
     $   a,
     $   lda)
c
c       lapack_claset.c
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
        COMPLEX  alpha
        COMPLEX  beta
        COMPLEX  a(*)
        INTEGER  lda

        CALL fclaset(uplo,
     $   m,
     $   n,
     $   alpha,
     $   beta,
     $   a,
     $   lda)
        RETURN
        END
