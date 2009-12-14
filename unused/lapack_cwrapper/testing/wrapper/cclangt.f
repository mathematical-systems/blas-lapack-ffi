        REAL FUNCTION cclangt(norm,
     $   n,
     $   dl,
     $   d,
     $   du)
c
c       lapack_clangt.c
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
        COMPLEX  dl(*)
        COMPLEX  d(*)
        COMPLEX  du(*)

        EXTERNAL fclangt
        CALL fclangt(cclangt, norm,
     $   n,
     $   dl,
     $   d,
     $   du)
        RETURN
        END
