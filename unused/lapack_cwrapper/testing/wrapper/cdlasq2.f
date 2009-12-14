        SUBROUTINE cdlasq2(n,
     $   z,
     $   info)
c
c       lapack_dlasq2.c
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
        DOUBLE PRECISION  z(*)
        INTEGER  info

        CALL fdlasq2(n,
     $   z,
     $   info)
        RETURN
        END
