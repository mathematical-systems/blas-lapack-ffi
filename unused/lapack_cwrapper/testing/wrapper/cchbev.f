        SUBROUTINE cchbev(jobz,
     $   uplo,
     $   n,
     $   kd,
     $   ab,
     $   ldab,
     $   w,
     $   z,
     $   ldz,
     $   work,
     $   rwork,
     $   info)
c
c       lapack_chbev.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  jobz
        CHARACTER  uplo
        INTEGER  n
        INTEGER  kd
        COMPLEX  ab(*)
        INTEGER  ldab
        REAL  w(*)
        COMPLEX  z(*)
        INTEGER  ldz
        COMPLEX  work(*)
        REAL  rwork(*)
        INTEGER  info

        CALL fchbev(jobz,
     $   uplo,
     $   n,
     $   kd,
     $   ab,
     $   ldab,
     $   w,
     $   z,
     $   ldz,
     $   work,
     $   rwork,
     $   info)
        RETURN
        END
