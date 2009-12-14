        SUBROUTINE cslasrt(id,
     $   n,
     $   d,
     $   info)
c
c       lapack_slasrt.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  id
        INTEGER  n
        REAL  d(*)
        INTEGER  info

        CALL fslasrt(id,
     $   n,
     $   d,
     $   info)
        RETURN
        END
