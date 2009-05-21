        SUBROUTINE cdtzrqf(m,
     $   n,
     $   a,
     $   lda,
     $   tau,
     $   info)
c
c       lapack_dtzrqf.c
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
        INTEGER  info

        CALL fdtzrqf(m,
     $   n,
     $   a,
     $   lda,
     $   tau,
     $   info)
        RETURN
        END
