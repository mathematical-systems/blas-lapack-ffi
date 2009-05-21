        INTEGER FUNCTION cieeeck(ispec,
     $   zero,
     $   one)
c
c       lapack_ieeeck.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  ispec
        REAL  zero
        REAL  one

        EXTERNAL fieeeck
        CALL fieeeck(cieeeck, ispec,
     $   zero,
     $   one)
        RETURN
        END
