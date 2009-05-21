        SUBROUTINE czupgtr(uplo,
     $   n,
     $   ap,
     $   tau,
     $   q,
     $   ldq,
     $   work,
     $   info)
c
c       lapack_zupgtr.c
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
        COMPLEX*16  ap(*)
        COMPLEX*16  tau(*)
        COMPLEX*16  q(*)
        INTEGER  ldq
        COMPLEX*16  work(*)
        INTEGER  info

        CALL fzupgtr(uplo,
     $   n,
     $   ap,
     $   tau,
     $   q,
     $   ldq,
     $   work,
     $   info)
        RETURN
        END
