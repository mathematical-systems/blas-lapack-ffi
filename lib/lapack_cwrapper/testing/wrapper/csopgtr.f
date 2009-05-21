        SUBROUTINE csopgtr(uplo,
     $   n,
     $   ap,
     $   tau,
     $   q,
     $   ldq,
     $   work,
     $   info)
c
c       lapack_sopgtr.c
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
        REAL  ap(*)
        REAL  tau(*)
        REAL  q(*)
        INTEGER  ldq
        REAL  work(*)
        INTEGER  info

        CALL fsopgtr(uplo,
     $   n,
     $   ap,
     $   tau,
     $   q,
     $   ldq,
     $   work,
     $   info)
        RETURN
        END
