        SUBROUTINE csgetf2(m,
     $   n,
     $   a,
     $   lda,
     $   ipiv,
     $   info)
c
c       lapack_sgetf2.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  m
        INTEGER  n
        REAL  a(*)
        INTEGER  lda
        INTEGER  ipiv(*)
        INTEGER  info

        CALL fsgetf2(m,
     $   n,
     $   a,
     $   lda,
     $   ipiv,
     $   info)
        RETURN
        END
