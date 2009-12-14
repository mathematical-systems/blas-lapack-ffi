        DOUBLE PRECISION FUNCTION cdlangt(norm,
     $   n,
     $   dl,
     $   d,
     $   du)
c
c       lapack_dlangt.c
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
        DOUBLE PRECISION  dl(*)
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  du(*)

        EXTERNAL fdlangt
        CALL fdlangt(cdlangt, norm,
     $   n,
     $   dl,
     $   d,
     $   du)
        RETURN
        END
