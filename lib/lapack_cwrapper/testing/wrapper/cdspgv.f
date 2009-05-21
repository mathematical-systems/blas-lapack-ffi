        SUBROUTINE cdspgv(itype,
     $   jobz,
     $   uplo,
     $   n,
     $   ap,
     $   bp,
     $   w,
     $   z,
     $   ldz,
     $   work,
     $   info)
c
c       lapack_dspgv.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  itype
        CHARACTER  jobz
        CHARACTER  uplo
        INTEGER  n
        DOUBLE PRECISION  ap(*)
        DOUBLE PRECISION  bp(*)
        DOUBLE PRECISION  w(*)
        DOUBLE PRECISION  z(*)
        INTEGER  ldz
        DOUBLE PRECISION  work(*)
        INTEGER  info

        CALL fdspgv(itype,
     $   jobz,
     $   uplo,
     $   n,
     $   ap,
     $   bp,
     $   w,
     $   z,
     $   ldz,
     $   work,
     $   info)
        RETURN
        END
