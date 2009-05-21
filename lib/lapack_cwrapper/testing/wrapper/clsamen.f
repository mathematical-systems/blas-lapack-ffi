        LOGICAL FUNCTION clsamen(n,
     $   ca,
     $   cb)
c
c       lapack_lsamen.c
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
        CHARACTER*(*) ca
        CHARACTER*(*) cb

        EXTERNAL flsamen
        CALL flsamen(clsamen, n,
     $   ca,
     $   cb)
        RETURN
        END
