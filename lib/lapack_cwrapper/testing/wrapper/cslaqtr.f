        SUBROUTINE cslaqtr(ltran,
     $   lreal,
     $   n,
     $   t,
     $   ldt,
     $   b,
     $   w,
     $   scale,
     $   x,
     $   work,
     $   info)
c
c       lapack_slaqtr.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        LOGICAL  ltran
        LOGICAL  lreal
        INTEGER  n
        REAL  t(*)
        INTEGER  ldt
        REAL  b(*)
        REAL  w
        REAL  scale
        REAL  x(*)
        REAL  work(*)
        INTEGER  info

        CALL fslaqtr(ltran,
     $   lreal,
     $   n,
     $   t,
     $   ldt,
     $   b,
     $   w,
     $   scale,
     $   x,
     $   work,
     $   info)
        RETURN
        END
