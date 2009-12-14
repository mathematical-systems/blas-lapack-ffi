        SUBROUTINE cspbrfs(uplo,
     $   n,
     $   kd,
     $   nrhs,
     $   ab,
     $   ldab,
     $   afb,
     $   ldafb,
     $   b,
     $   ldb,
     $   x,
     $   ldx,
     $   ferr,
     $   berr,
     $   work,
     $   iwork,
     $   info)
c
c       lapack_spbrfs.c
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
        INTEGER  kd
        INTEGER  nrhs
        REAL  ab(*)
        INTEGER  ldab
        REAL  afb(*)
        INTEGER  ldafb
        REAL  b(*)
        INTEGER  ldb
        REAL  x(*)
        INTEGER  ldx
        REAL  ferr(*)
        REAL  berr(*)
        REAL  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fspbrfs(uplo,
     $   n,
     $   kd,
     $   nrhs,
     $   ab,
     $   ldab,
     $   afb,
     $   ldafb,
     $   b,
     $   ldb,
     $   x,
     $   ldx,
     $   ferr,
     $   berr,
     $   work,
     $   iwork,
     $   info)
        RETURN
        END
