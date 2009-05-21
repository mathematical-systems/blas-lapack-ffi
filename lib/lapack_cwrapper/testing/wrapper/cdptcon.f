        SUBROUTINE cdptcon(n,
     $   d,
     $   e,
     $   anorm,
     $   rcond,
     $   work,
     $   info)
c
c       lapack_dptcon.c
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
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        DOUBLE PRECISION  anorm
        DOUBLE PRECISION  rcond
        DOUBLE PRECISION  work(*)
        INTEGER  info

        CALL fdptcon(n,
     $   d,
     $   e,
     $   anorm,
     $   rcond,
     $   work,
     $   info)
        RETURN
        END
