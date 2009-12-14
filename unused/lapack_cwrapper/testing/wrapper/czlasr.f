        SUBROUTINE czlasr(side,
     $   pivot,
     $   direct,
     $   m,
     $   n,
     $   c,
     $   s,
     $   a,
     $   lda)
c
c       lapack_zlasr.c
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
        CHARACTER  pivot
        CHARACTER  direct
        INTEGER  m
        INTEGER  n
        DOUBLE PRECISION  c(*)
        DOUBLE PRECISION  s(*)
        COMPLEX*16  a(*)
        INTEGER  lda

        CALL fzlasr(side,
     $   pivot,
     $   direct,
     $   m,
     $   n,
     $   c,
     $   s,
     $   a,
     $   lda)
        RETURN
        END
