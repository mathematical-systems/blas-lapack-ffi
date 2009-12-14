        SUBROUTINE cdgetri(n,
     $   a,
     $   lda,
     $   ipiv,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_dgetri.c
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
        INTEGER  ipiv(*)
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fdgetri(n,
     $   a,
     $   lda,
     $   ipiv,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
