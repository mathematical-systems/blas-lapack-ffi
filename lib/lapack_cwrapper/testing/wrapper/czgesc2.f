        SUBROUTINE czgesc2(n,
     $   a,
     $   lda,
     $   rhs,
     $   ipiv,
     $   jpiv,
     $   scale)
c
c       lapack_zgesc2.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  n
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  rhs(*)
        INTEGER  ipiv(*)
        INTEGER  jpiv(*)
        DOUBLE PRECISION  scale

        CALL fzgesc2(n,
     $   a,
     $   lda,
     $   rhs,
     $   ipiv,
     $   jpiv,
     $   scale)
        RETURN
        END
