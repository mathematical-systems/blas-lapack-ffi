        REAL FUNCTION cscsum1(n,
     $   cx,
     $   incx)
c
c       lapack_scsum1.c
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

        EXTERNAL fscsum1
        CALL fscsum1(cscsum1, n,
     $   cx,
     $   incx)
        RETURN
        END
