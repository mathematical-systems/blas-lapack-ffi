        SUBROUTINE cctpcon(norm,
     $   uplo,
     $   diag,
     $   n,
     $   ap,
     $   rcond,
     $   work,
     $   rwork,
     $   info)
c
c       lapack_ctpcon.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  norm
        CHARACTER  uplo
        CHARACTER  diag
        INTEGER  n
        COMPLEX  ap(*)
        REAL  rcond
        COMPLEX  work(*)
        REAL  rwork(*)
        INTEGER  info

        CALL fctpcon(norm,
     $   uplo,
     $   diag,
     $   n,
     $   ap,
     $   rcond,
     $   work,
     $   rwork,
     $   info)
        RETURN
        END
