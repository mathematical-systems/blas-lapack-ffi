        REAL FUNCTION cslangt(norm,
     $   n,
     $   dl,
     $   d,
     $   du)
c
c       lapack_slangt.c
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
        REAL  dl(*)
        REAL  d(*)
        REAL  du(*)

        EXTERNAL fslangt
        CALL fslangt(cslangt, norm,
     $   n,
     $   dl,
     $   d,
     $   du)
        RETURN
        END
