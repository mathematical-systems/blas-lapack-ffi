        SUBROUTINE csptcon(n,
     $   d,
     $   e,
     $   anorm,
     $   rcond,
     $   work,
     $   info)
c
c       lapack_sptcon.c
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
        REAL  anorm
        REAL  rcond
        REAL  work(*)
        INTEGER  info

        CALL fsptcon(n,
     $   d,
     $   e,
     $   anorm,
     $   rcond,
     $   work,
     $   info)
        RETURN
        END
