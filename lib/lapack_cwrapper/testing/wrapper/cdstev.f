        SUBROUTINE cdstev(jobz,
     $   n,
     $   d,
     $   e,
     $   z,
     $   ldz,
     $   work,
     $   info)
c
c       lapack_dstev.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  jobz
        INTEGER  n
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        DOUBLE PRECISION  z(*)
        INTEGER  ldz
        DOUBLE PRECISION  work(*)
        INTEGER  info

        CALL fdstev(jobz,
     $   n,
     $   d,
     $   e,
     $   z,
     $   ldz,
     $   work,
     $   info)
        RETURN
        END
