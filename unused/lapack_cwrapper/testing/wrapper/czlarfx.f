        SUBROUTINE czlarfx(side,
     $   m,
     $   n,
     $   v,
     $   tau,
     $   c,
     $   ldc,
     $   work)
c
c       lapack_zlarfx.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  side
        INTEGER  m
        INTEGER  n
        COMPLEX*16  v(*)
        COMPLEX*16  tau
        COMPLEX*16  c(*)
        INTEGER  ldc
        COMPLEX*16  work(*)

        CALL fzlarfx(side,
     $   m,
     $   n,
     $   v,
     $   tau,
     $   c,
     $   ldc,
     $   work)
        RETURN
        END
