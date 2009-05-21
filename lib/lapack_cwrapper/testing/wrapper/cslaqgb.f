        SUBROUTINE cslaqgb(m,
     $   n,
     $   kl,
     $   ku,
     $   ab,
     $   ldab,
     $   r,
     $   c,
     $   rowcnd,
     $   colcnd,
     $   amax,
     $   equed)
c
c       lapack_slaqgb.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  m
        INTEGER  n
        INTEGER  kl
        INTEGER  ku
        REAL  ab(*)
        INTEGER  ldab
        REAL  r(*)
        REAL  c(*)
        REAL  rowcnd
        REAL  colcnd
        REAL  amax
        CHARACTER  equed

        CALL fslaqgb(m,
     $   n,
     $   kl,
     $   ku,
     $   ab,
     $   ldab,
     $   r,
     $   c,
     $   rowcnd,
     $   colcnd,
     $   amax,
     $   equed)
        RETURN
        END
