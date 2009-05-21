        SUBROUTINE cdlaswp(n,
     $   a,
     $   lda,
     $   k1,
     $   k2,
     $   ipiv,
     $   incx)
c
c       lapack_dlaswp.c
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
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        INTEGER  k1
        INTEGER  k2
        INTEGER  ipiv(*)
        INTEGER  incx

        CALL fdlaswp(n,
     $   a,
     $   lda,
     $   k1,
     $   k2,
     $   ipiv,
     $   incx)
        RETURN
        END
