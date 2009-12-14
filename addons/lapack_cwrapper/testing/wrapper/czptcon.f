        SUBROUTINE czptcon(n,
     $   d,
     $   e,
     $   anorm,
     $   rcond,
     $   rwork,
     $   info)
c
c       lapack_zptcon.c
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
        COMPLEX*16  e(*)
        DOUBLE PRECISION  anorm
        DOUBLE PRECISION  rcond
        DOUBLE PRECISION  rwork(*)
        INTEGER  info

        CALL fzptcon(n,
     $   d,
     $   e,
     $   anorm,
     $   rcond,
     $   rwork,
     $   info)
        RETURN
        END
