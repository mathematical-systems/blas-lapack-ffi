        SUBROUTINE ccupgtr(uplo,
     $   n,
     $   ap,
     $   tau,
     $   q,
     $   ldq,
     $   work,
     $   info)
c
c       lapack_cupgtr.c
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
        COMPLEX  ap(*)
        COMPLEX  tau(*)
        COMPLEX  q(*)
        INTEGER  ldq
        COMPLEX  work(*)
        INTEGER  info

        CALL fcupgtr(uplo,
     $   n,
     $   ap,
     $   tau,
     $   q,
     $   ldq,
     $   work,
     $   info)
        RETURN
        END
