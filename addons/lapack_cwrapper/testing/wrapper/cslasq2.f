        SUBROUTINE cslasq2(n,
     $   z,
     $   info)
c
c       lapack_slasq2.c
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
        REAL  z(*)
        INTEGER  info

        CALL fslasq2(n,
     $   z,
     $   info)
        RETURN
        END
