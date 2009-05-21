        LOGICAL FUNCTION clsame(ca,
     $   cb)
c
c       lapack_lsame.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  ca
        CHARACTER  cb

        EXTERNAL flsame
        CALL flsame(clsame, ca,
     $   cb)
        RETURN
        END
