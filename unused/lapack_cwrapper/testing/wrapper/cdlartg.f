        SUBROUTINE cdlartg(f,
     $   g,
     $   cs,
     $   sn,
     $   r)
c
c       lapack_dlartg.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        DOUBLE PRECISION  f
        DOUBLE PRECISION  g
        DOUBLE PRECISION  cs
        DOUBLE PRECISION  sn
        DOUBLE PRECISION  r

        CALL fdlartg(f,
     $   g,
     $   cs,
     $   sn,
     $   r)
        RETURN
        END
