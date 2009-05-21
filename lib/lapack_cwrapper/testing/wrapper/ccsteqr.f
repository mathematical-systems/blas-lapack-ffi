        SUBROUTINE ccsteqr(compz,
     $   n,
     $   d,
     $   e,
     $   z,
     $   ldz,
     $   work,
     $   info)
c
c       lapack_csteqr.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  compz
        INTEGER  n
        REAL  d(*)
        REAL  e(*)
        COMPLEX  z(*)
        INTEGER  ldz
        REAL  work(*)
        INTEGER  info

        CALL fcsteqr(compz,
     $   n,
     $   d,
     $   e,
     $   z,
     $   ldz,
     $   work,
     $   info)
        RETURN
        END
