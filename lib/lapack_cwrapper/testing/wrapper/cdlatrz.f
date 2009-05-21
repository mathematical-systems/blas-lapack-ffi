        SUBROUTINE cdlatrz(m,
     $   n,
     $   l,
     $   a,
     $   lda,
     $   tau,
     $   work)
c
c       lapack_dlatrz.c
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
        INTEGER  l
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  tau(*)
        DOUBLE PRECISION  work(*)

        CALL fdlatrz(m,
     $   n,
     $   l,
     $   a,
     $   lda,
     $   tau,
     $   work)
        RETURN
        END
