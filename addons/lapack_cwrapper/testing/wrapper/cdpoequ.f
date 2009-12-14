        SUBROUTINE cdpoequ(n,
     $   a,
     $   lda,
     $   s,
     $   scond,
     $   amax,
     $   info)
c
c       lapack_dpoequ.c
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
        DOUBLE PRECISION  s(*)
        DOUBLE PRECISION  scond
        DOUBLE PRECISION  amax
        INTEGER  info

        CALL fdpoequ(n,
     $   a,
     $   lda,
     $   s,
     $   scond,
     $   amax,
     $   info)
        RETURN
        END
