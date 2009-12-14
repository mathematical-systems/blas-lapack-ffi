        SUBROUTINE cdlassq(n,
     $   x,
     $   incx,
     $   scale,
     $   sumsq)
c
c       lapack_dlassq.c
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
        DOUBLE PRECISION  x(*)
        INTEGER  incx
        DOUBLE PRECISION  scale
        DOUBLE PRECISION  sumsq

        CALL fdlassq(n,
     $   x,
     $   incx,
     $   scale,
     $   sumsq)
        RETURN
        END
