        SUBROUTINE czlaset(uplo,
     $   m,
     $   n,
     $   alpha,
     $   beta,
     $   a,
     $   lda)
c
c       lapack_zlaset.c
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
        COMPLEX*16  alpha
        COMPLEX*16  beta
        COMPLEX*16  a(*)
        INTEGER  lda

        CALL fzlaset(uplo,
     $   m,
     $   n,
     $   alpha,
     $   beta,
     $   a,
     $   lda)
        RETURN
        END
