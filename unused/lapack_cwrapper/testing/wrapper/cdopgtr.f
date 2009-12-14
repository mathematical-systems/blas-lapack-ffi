        SUBROUTINE cdopgtr(uplo,
     $   n,
     $   ap,
     $   tau,
     $   q,
     $   ldq,
     $   work,
     $   info)
c
c       lapack_dopgtr.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  uplo
        INTEGER  n
        DOUBLE PRECISION  ap(*)
        DOUBLE PRECISION  tau(*)
        DOUBLE PRECISION  q(*)
        INTEGER  ldq
        DOUBLE PRECISION  work(*)
        INTEGER  info

        CALL fdopgtr(uplo,
     $   n,
     $   ap,
     $   tau,
     $   q,
     $   ldq,
     $   work,
     $   info)
        RETURN
        END
