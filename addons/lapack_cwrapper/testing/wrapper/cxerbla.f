        SUBROUTINE cxerbla(srname,
     $   info)
c
c       lapack_xerbla.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER*(*) srname
        INTEGER  info

        CALL fxerbla(srname,
     $   info)
        RETURN
        END
