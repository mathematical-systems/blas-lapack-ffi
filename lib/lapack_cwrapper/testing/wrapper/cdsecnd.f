        DOUBLE PRECISION FUNCTION cdsecnd()
c
c       lapack_dsecnd.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c

        EXTERNAL fdsecnd
        CALL fdsecnd(cdsecnd, )
        RETURN
        END
