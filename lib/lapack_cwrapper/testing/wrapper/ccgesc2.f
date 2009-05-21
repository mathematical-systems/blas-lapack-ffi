        SUBROUTINE ccgesc2(n,
     $   a,
     $   lda,
     $   rhs,
     $   ipiv,
     $   jpiv,
     $   scale)
c
c       lapack_cgesc2.c
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
        COMPLEX  a(*)
        INTEGER  lda
        COMPLEX  rhs(*)
        INTEGER  ipiv(*)
        INTEGER  jpiv(*)
        REAL  scale

        CALL fcgesc2(n,
     $   a,
     $   lda,
     $   rhs,
     $   ipiv,
     $   jpiv,
     $   scale)
        RETURN
        END
