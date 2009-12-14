        SUBROUTINE czhbtrd(vect,
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
c       lapack_zhbtrd.c
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
        COMPLEX*16  ab(*)
        INTEGER  ldab
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        COMPLEX*16  q(*)
        INTEGER  ldq
        COMPLEX*16  work(*)
        INTEGER  info

        CALL fzhbtrd(vect,
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
