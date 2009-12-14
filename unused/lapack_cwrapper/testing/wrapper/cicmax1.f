        INTEGER FUNCTION cicmax1(n,
     $   cx,
     $   incx)
c
c       lapack_icmax1.c
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
        COMPLEX  cx(*)
        INTEGER  incx

        EXTERNAL ficmax1
        CALL ficmax1(cicmax1, n,
     $   cx,
     $   incx)
        RETURN
        END
