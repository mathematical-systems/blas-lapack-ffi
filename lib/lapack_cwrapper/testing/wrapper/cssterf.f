        SUBROUTINE cssterf(n,
     $   d,
     $   e,
     $   info)
c
c       lapack_ssterf.c
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
        REAL  d(*)
        REAL  e(*)
        INTEGER  info

        CALL fssterf(n,
     $   d,
     $   e,
     $   info)
        RETURN
        END
