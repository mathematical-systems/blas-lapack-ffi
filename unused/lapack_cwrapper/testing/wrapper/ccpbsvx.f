        SUBROUTINE ccpbsvx(fact,
     $   uplo,
     $   n,
     $   kd,
     $   nrhs,
     $   ab,
     $   ldab,
     $   afb,
     $   ldafb,
     $   equed,
     $   s,
     $   b,
     $   ldb,
     $   x,
     $   ldx,
     $   rcond,
     $   ferr,
     $   berr,
     $   work,
     $   rwork,
     $   info)
c
c       lapack_cpbsvx.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  fact
        CHARACTER  uplo
        INTEGER  n
        INTEGER  kd
        INTEGER  nrhs
        COMPLEX  ab(*)
        INTEGER  ldab
        COMPLEX  afb(*)
        INTEGER  ldafb
        CHARACTER  equed
        REAL  s(*)
        COMPLEX  b(*)
        INTEGER  ldb
        COMPLEX  x(*)
        INTEGER  ldx
        REAL  rcond
        REAL  ferr(*)
        REAL  berr(*)
        COMPLEX  work(*)
        REAL  rwork(*)
        INTEGER  info

        CALL fcpbsvx(fact,
     $   uplo,
     $   n,
     $   kd,
     $   nrhs,
     $   ab,
     $   ldab,
     $   afb,
     $   ldafb,
     $   equed,
     $   s,
     $   b,
     $   ldb,
     $   x,
     $   ldx,
     $   rcond,
     $   ferr,
     $   berr,
     $   work,
     $   rwork,
     $   info)
        RETURN
        END
