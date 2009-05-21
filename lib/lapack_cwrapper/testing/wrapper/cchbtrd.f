        SUBROUTINE cchbtrd(vect,
     $   uplo,
     $   n,
     $   kd,
     $   ab,
     $   ldab,
     $   d,
     $   e,
     $   q,
     $   ldq,
     $   work,
     $   info)
c
c       lapack_chbtrd.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  vect
        CHARACTER  uplo
        INTEGER  n
        INTEGER  kd
        COMPLEX  ab(*)
        INTEGER  ldab
        REAL  d(*)
        REAL  e(*)
        COMPLEX  q(*)
        INTEGER  ldq
        COMPLEX  work(*)
        INTEGER  info

        CALL fchbtrd(vect,
     $   uplo,
     $   n,
     $   kd,
     $   ab,
     $   ldab,
     $   d,
     $   e,
     $   q,
     $   ldq,
     $   work,
     $   info)
        RETURN
        END
