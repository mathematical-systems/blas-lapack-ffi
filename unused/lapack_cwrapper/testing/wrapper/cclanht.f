        REAL FUNCTION cclanht(norm,
     $   n,
     $   d,
     $   e)
c
c       lapack_clanht.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  norm
        INTEGER  n
        REAL  d(*)
        COMPLEX  e(*)

        EXTERNAL fclanht
        CALL fclanht(cclanht, norm,
     $   n,
     $   d,
     $   e)
        RETURN
        END
