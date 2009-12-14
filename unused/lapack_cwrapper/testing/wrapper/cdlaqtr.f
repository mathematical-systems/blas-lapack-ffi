        SUBROUTINE cdlaqtr(ltran,
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
c       lapack_dlaqtr.c
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
        DOUBLE PRECISION  t(*)
        INTEGER  ldt
        DOUBLE PRECISION  b(*)
        DOUBLE PRECISION  w
        DOUBLE PRECISION  scale
        DOUBLE PRECISION  x(*)
        DOUBLE PRECISION  work(*)
        INTEGER  info

        CALL fdlaqtr(ltran,
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
