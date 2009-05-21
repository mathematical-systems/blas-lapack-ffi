        SUBROUTINE cspoequ(n,
     $   a,
     $   lda,
     $   s,
     $   scond,
     $   amax,
     $   info)
c
c       lapack_spoequ.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  n
        REAL  a(*)
        INTEGER  lda
        REAL  s(*)
        REAL  scond
        REAL  amax
        INTEGER  info

        CALL fspoequ(n,
     $   a,
     $   lda,
     $   s,
     $   scond,
     $   amax,
     $   info)
        RETURN
        END
