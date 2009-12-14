        INTEGER FUNCTION cizmax1(n,
     $   cx,
     $   incx)
c
c       lapack_izmax1.c
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
        COMPLEX*16  cx(*)
        INTEGER  incx

        EXTERNAL fizmax1
        CALL fizmax1(cizmax1, n,
     $   cx,
     $   incx)
        RETURN
        END
