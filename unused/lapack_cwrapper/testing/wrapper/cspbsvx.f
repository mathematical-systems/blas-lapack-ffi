        SUBROUTINE cspbsvx(fact,
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
     $   iwork,
     $   info)
c
c       lapack_spbsvx.c
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
        REAL  ab(*)
        INTEGER  ldab
        REAL  afb(*)
        INTEGER  ldafb
        CHARACTER  equed
        REAL  s(*)
        REAL  b(*)
        INTEGER  ldb
        REAL  x(*)
        INTEGER  ldx
        REAL  rcond
        REAL  ferr(*)
        REAL  berr(*)
        REAL  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fspbsvx(fact,
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
     $   iwork,
     $   info)
        RETURN
        END
