        SUBROUTINE ccptcon(n,
     $   d,
     $   e,
     $   anorm,
     $   rcond,
     $   rwork,
     $   info)
c
c       lapack_cptcon.c
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
        COMPLEX  e(*)
        REAL  anorm
        REAL  rcond
        REAL  rwork(*)
        INTEGER  info

        CALL fcptcon(n,
     $   d,
     $   e,
     $   anorm,
     $   rcond,
     $   rwork,
     $   info)
        RETURN
        END
