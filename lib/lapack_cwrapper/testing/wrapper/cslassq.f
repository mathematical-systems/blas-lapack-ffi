        SUBROUTINE cslassq(n,
     $   x,
     $   incx,
     $   scale,
     $   sumsq)
c
c       lapack_slassq.c
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
        REAL  x(*)
        INTEGER  incx
        REAL  scale
        REAL  sumsq

        CALL fslassq(n,
     $   x,
     $   incx,
     $   scale,
     $   sumsq)
        RETURN
        END
