        SUBROUTINE cilaver(vers_major,
     $   vers_minor,
     $   vers_patch)
c
c       lapack_ilaver.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  vers_major
        INTEGER  vers_minor
        INTEGER  vers_patch

        CALL filaver(vers_major,
     $   vers_minor,
     $   vers_patch)
        RETURN
        END
