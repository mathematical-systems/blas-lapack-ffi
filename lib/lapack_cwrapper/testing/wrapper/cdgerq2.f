        SUBROUTINE cdgerq2(m,
     $   n,
     $   a,
     $   lda,
     $   tau,
     $   work,
     $   info)
c
c       lapack_dgerq2.c
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
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  tau(*)
        DOUBLE PRECISION  work(*)
        INTEGER  info

        CALL fdgerq2(m,
     $   n,
     $   a,
     $   lda,
     $   tau,
     $   work,
     $   info)
        RETURN
        END
